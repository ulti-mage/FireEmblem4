
    .weak

      rlGetAndRunChapterMapEventConditions      :?= address($8682BC)
      rlSetPermanentEventFlag                   :?= address($8680BE)
      rlGetFactionGroupPointerByID              :?= address($86C55A)

    .endweak

    .section Code848000Section

      rlUnknown848000 ; 84/8000

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx

        ldx #35
        lda #0

          -
          sta wLoadedUnitCount,b,x
          dec x
          dec x
          bpl -

        ldx #$3295
        lda #0

          -
          sta $7E2000,x
          dec x
          dec x
          bpl -

        ldx #(len(aDeploymentTable._State) - 2)
        lda #$FFFF

          -
          sta aDeploymentTable._MapSpriteID,x
          dec x
          dec x
          bpl -

        lda #(`aUnitRAMPointers)<<8
        sta lR18+1
        lda #<>aUnitRAMPointers
        sta lR18
        lda #len(aUnitRAMPointers._Entry)
        sta wR0
        lda #size(aUnitRAMPointers._Entry[0])
        sta wR1
        jsl rlBuildRAMStructHeader

        lda #(`aUnitRAMArea)<<8
        sta lR18+1
        lda #<>aUnitRAMArea
        sta lR18
        lda #1
        sta wStructIndex,b
        lda #<>size(aUnitRAMArea)
        jsl rlBuildRAMAreaHeaderAndGuidingEntry

        lda #(`aStaticUnitRAMArea)<<8
        sta lR18+1
        lda #<>aStaticUnitRAMArea
        sta lR18
        lda #1
        sta wStructIndex,b
        lda #<>size(aStaticUnitRAMArea)
        jsl rlBuildRAMAreaHeaderAndGuidingEntry

        lda #(`aDynamicUnitRAMArea)<<8
        sta lR18+1
        lda #<>aDynamicUnitRAMArea
        sta lR18
        lda #1
        sta wStructIndex,b
        lda #<>size(aDynamicUnitRAMArea)
        jsl rlBuildRAMAreaHeaderAndGuidingEntry

        lda #(`aHolyAndEnemyRAMArea)<<8
        sta lR18+1
        lda #<>aHolyAndEnemyRAMArea
        sta lR18
        lda #1
        sta wStructIndex,b
        lda #<>size(aHolyAndEnemyRAMArea)
        jsl rlBuildRAMAreaHeaderAndGuidingEntry

        lda #(`aInventoryRAMArea)<<8
        sta lR18+1
        lda #<>aInventoryRAMArea
        sta lR18
        lda #1
        sta wStructIndex,b
        lda #<>size(aInventoryRAMArea)
        jsl rlBuildRAMAreaHeaderAndGuidingEntry

        lda #(`aLoverRAMArea)<<8
        sta lR18+1
        lda #<>aLoverRAMArea
        sta lR18
        lda #1
        sta wStructIndex,b
        lda #$014C
        jsl rlBuildRAMAreaHeaderAndGuidingEntry

        lda #(`aPlayerItemTable)<<8
        sta lRoutineVariable+1,b
        lda #<>aPlayerItemTable
        sta lRoutineVariable,b
        jsl rlInitiateItemRAMData

        jsl rlInitiateFactionRAMData

        jsl $8BCE71 ; clear some stuff

        plx
        plp
        plb
        rtl

        .databank 0

      rlUnknown8480EC ; 84/80EC

        .al
        .autsiz
        .databank ?

        ; Run on chapter start

        phb
        php
        phk
        plb
        phx
        lda wR0
        pha

        lda wLoadedFactionCount,b
        beq _810A

          lda #1
          sta wLoadedFactionCount,b
          ldx #6

            -
            txa
            jsl rlUnloadFactionSlot
            dec x
            bne -

        _810A
        lda #(`aUnitRAMPointers)<<8
        sta lStructPointer2+1,b
        lda #<>aUnitRAMPointers
        sta lStructPointer2,b
        jsl rlGetRAMStructCurrentStructCount
        ora #0
        beq _8163

          sta wR0

          -
          lda wR0
          sta wStructIndex,b
          jsl rlLoadRAMStructDataByIndex
          bcs _810A

            lda lStructPointer1,b
            sta wSelectedUnitDataRAMPointer,b
            lda #80
            sta wRoutineVariable1,b
            jsl rlHealSelectedUnitsHP
            lda #0
            jsl rlSetSelectedUnitStatusDuration
            lda #StatusHealthy
            jsl rlSetSelectedUnitStatus
            lda #0
            jsl rlSetSelectedUnitArenaLevel
            lda #None
            jsl rlSetSelectedUnitTalkTarget
            lda #(UnitStateGuardingCastle | UnitStateMoved | UnitStateFielded)
            jsl rlUnsetSelectedUnitStates
            dec wR0
            bne -

        _8163
        ldx #(len(aDeploymentTable._State) - 2)
        lda #$FFFF

          -
          sta aDeploymentTable._MapSpriteID,x
          dec x
          dec x
          bpl -

        ldx #(len(aDeploymentTable._State) - 2)

        -
        lda aDeploymentTable._UnitRAMPointer,x
        beq +

          sta wSelectedUnitDataRAMPointer,b
          jsl rlGetSelectedUnitMapSprite
          sta wR1
          jsl rlAddDeployedMapSprite
          sta aDeploymentTable._DeploymentOffsets,x
          lda aDeploymentTable._StateBuffer,x
          and #DeploymentAllegianceMask
          ora #DeploymentStateHidden
          sta aDeploymentTable._StateBuffer,x
          sta aDeploymentTable._State,x

        +
        dec x
        dec x
        bpl -

        lda wCurrentChapter,b
        cmp #6
        bne +

          jsl $82F866
          jsl rlDeleteParentsAndModifyChildrenData
          jsl $8BCE71

        +
        lda wCurrentChapter,b
        cmp #6
        bne _End

        jsl rlUnknown87E007
        ora #0
        beq _End

          ldx #1

          -
          txa
          jsl rlGetItemRAMStructEntryByPlayerItemIndex
          bcs _End

            jsl rlGetItemRAMStateAndOwner
            lda wR0
            cmp #ItemStateUnobtained
            beq _81E9

              cmp #ItemStateShop
              beq +

                cmp #ItemStatePawnbroker
                bne _81E9

              +
              jsl rlRevertItemAquirement
            
            _81E9
            inc x
            bra -

        _End
        jsl $87E93F
        jsl $87E952
        jsl $86C548

        pla
        sta wR0
        plx
        plp
        plb
        rtl

        .databank 0

      rlDeleteParentsAndModifyChildrenData ; 84/81FF

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        ldy #<>aModifyChildrenDataList

          _Loop
          lda $0000,b,y
          cmp #$FFFF
          beq _End

            jsl rlGetUnitRAMDataPointerByID
            bcs _Next

              lda $0002,b,y
              asl a
              tax
              jsr (aModifyChildrenDataRoutines,x)

            _Next
            tya
            clc
            adc #size(word) * 3
            tay
            bra _Loop

        _End
        jsl $81B15A
        plx
        plp
        plb
        rtl

        .databank 0

      aModifyChildrenDataRoutines .include "../TABLES/SYSTEM/ModifyChildrenDataRoutines.csv.asm" ; 84/822D

      aModifyChildrenDataList ; 84/8237

        .word Deirdre,  ID_LoadChildUnitAndDeleteParentUnitData, ID_LoadMaleChildUnit
        .word Ethlyn,   ID_LoadChildUnitAndDeleteParentUnitData, ID_LoadBothChildUnits
        .word Brigid,   ID_LoadChildUnitAndDeleteParentUnitData, ID_LoadBothChildUnits
        .word Edain,    ID_LoadChildUnitAndDeleteParentUnitData, ID_LoadBothChildUnits
        .word Silvia,   ID_LoadChildUnitAndDeleteParentUnitData, ID_LoadBothChildUnits
        .word Tailtiu,  ID_LoadChildUnitAndDeleteParentUnitData, ID_LoadBothChildUnits
        .word Erinys,   ID_LoadChildUnitAndDeleteParentUnitData, ID_LoadBothChildUnits
        .word Ayra,     ID_LoadChildUnitAndDeleteParentUnitData, ID_LoadBothChildUnits
        .word Lachesis, ID_LoadChildUnitAndDeleteParentUnitData, ID_LoadBothChildUnits
        .word Dew,      ID_DeleteParentUnitData, None
        .word Lex,      ID_DeleteParentUnitData, None
        .word Beowulf,  ID_DeleteParentUnitData, None
        .word Claud,    ID_DeleteParentUnitData, None
        .word Jamke,    ID_DeleteParentUnitData, None
        .word Azelle,   ID_DeleteParentUnitData, None
        .word Chulainn, ID_DeleteParentUnitData, None
        .word Lewyn,    ID_DeleteParentUnitData, None
        .word Midir,    ID_DeleteParentUnitData, None
        .word Quan,     ID_DeleteParentUnitData, None
        .word Finn,     ID_TransferUnitToGen2,   AdultFinn
        .word Arden,    ID_DeleteParentUnitData, None
        .word Alec,     ID_DeleteParentUnitData, None
        .word Naoise,   ID_DeleteParentUnitData, None
        .word Sigurd,   ID_DeleteParentUnitData, None
        .word Seliph,   ID_OverwriteSeliphUnitData, None
        .word Altena,   ID_OverwriteAltenaUnitData, None
        .sint -1

      rsDeleteParentUnitData ; 84/82D5

        .al
        .autsiz
        .databank ?

        jsl rlUndeployUnit
        jsl rlDeleteUnit
        rts

        .databank 0

      rsTransferUnitToGen2 ; 84/82DE

        .al
        .autsiz
        .databank ?

        ; Argument: new CharacterID

        phy
        jsl rlGetSelectedUnitMoney
        lsr a
        jsl rlSetSelectedUnitMoney

        lda $0004,b,y
        jsl rlGetCharacterDataROMPointer
        tay

        ldx wSelectedUnitDataRAMPointer,b
        lda #>`FinnCharacterDataOffsetsEntry
        sta $7E0000 + structCharacterDataRAM.ConstantData+1,x

        tya
        clc
        adc #structStaticCharacterROMEntry.CharacterID
        sta $7E0000 + structCharacterDataRAM.ConstantData,x

        phb
        jsl rlGetSelectedUnitPersonalDataPointer
        jsl rlGetSelectedUnitLoveDataIDByCharacterID
        sep #$20
        sta structPersonalCharacterDataRAM.LoveDataID,b,x
        lda #0
        sta structPersonalCharacterDataRAM.LoverGenerationID,b,x
        rep #$20
        plb

        ldx wSelectedUnitDataRAMPointer,b
        jsr rsUnknown849294
        jsl rlUndeployUnit
        ply
        rts

        .databank 0

      rsLoadChildUnitAndDeleteParentUnitData ; 84/8325

        .al
        .autsiz
        .databank ?

        lda $0004,b,y
        asl a
        tax
        jsr (aLoadChildUnitRoutines,x)
        jsr rsDeleteParentUnitData
        rts

        .databank 0

      aLoadChildUnitRoutines .include "../TABLES/SYSTEM/LoadChildUnitRoutines.csv.asm" ; 84/8331

      rsLoadBothChildUnits ; 84/8339

        .al
        .autsiz
        .databank ?

        lda #0
        sta wRoutineVariable1,b
        jsl rlLoadChildUnit
        bra rsLoadFemaleChildUnit

      rsLoadMaleOrFemaleChildUnit ; 84/8345

        .al
        .autsiz
        .databank ?

        lda #50
        jsl rlRollForChance
        bcs rsLoadFemaleChildUnit

      rsLoadMaleChildUnit ; 84/834E

        .al
        .autsiz
        .databank ?

        lda #0
        bra +

      rsLoadFemaleChildUnit ; 84/8353

        .al
        .autsiz
        .databank ?

        lda #1
        
        +
        sta wRoutineVariable1,b
        jsl rlLoadChildUnit
        rts

        .databank 0

      rsOverwriteSeliphUnitData ; 84/835E

        .al
        .autsiz
        .databank ?

        phb
        jsl rlGetSelectedUnitConstantDataPointer
        lda structCharacterConstantData.Skills1,b,x
        ora #UnitSkill1Dismount
        sta structCharacterConstantData.Skills1,b,x
        lda #(MajorBaldrBlood | MinorNagaBlood)
        sta structCharacterConstantData.HolyBlood1,b,x
        lda #0
        sta structCharacterConstantData.HolyBlood2,b,x
        jsl rlGetSelectedUnitExtendedPersonalDataPointer
        sep #$20
        lda #2
        sta structExtendedCharacterDataRAM.LeadershipStars,b,x
        rep #$20
        plb
        rts

        .databank 0

      rsOverwriteAltenaUnitData ; 84/8387

        .al
        .autsiz
        .databank ?

        phb
        jsl rlGetSelectedUnitExtendedPersonalDataPointer
        sep #$20
        lda #3
        sta structExtendedCharacterDataRAM.LeadershipStars,b,x
        rep #$20
        plb
        rts

        .databank 0

        ; 84/8397

    .endsection Code848000Section


    .section Code848397Section

      rlCreateUnit ; 84/8397

        .al
        .autsiz
        .databank ?

        phb

        phk
        plb

        jsl rlSwapToMainDataBank

        jsl rlGetCharacterDataROMPointer

        tay
        lda structCharacterROMEntry.Type,b,y
        and #$00FF
        asl a
        tax
        jsr (aUnitCreationRoutinesByType,x)
        plb
        rtl

        .databank 0

      aUnitCreationRoutinesByType ; 84/83B0

        .addr rsCreateStaticUnitRAMData
        .addr rsCreateDynamicUnitRAMData
        .addr rsCreateHolyUnitRAMData
        .addr rsCreateEnemyUnitRAMData

      rlDeleteUnit ; 84/83B8

        .al
        .autsiz
        .databank ?

        ; This removes a unit from the Unit RAM pointer table, clears their aDeploymentTable data,
        ; decrements the deployment count, unstets all unit states, flags all pointers in their structCharacterDataRAM
        ; as free and decrements the loaded unit count

        phb
        phk
        plb
        phx

        lda #(`aUnitRAMPointers)<<8
        sta lStructPointer2+1,b
        lda #<>aUnitRAMPointers
        sta lStructPointer2,b
        lda wSelectedUnitDataRAMPointer,b
        sta lStructPointer1,b
        jsl rlRemoveRAMStructEntry
        bcs _SEC

        jsl rlGetSelectedUnitDeploymentOffset
        bcs +

          jsl rlClearUnitDeploymentData

        +
        lda #$FFFF
        jsl rlUnsetSelectedUnitStates
        jsl rlClearSelectedUnitRAMAreaData
        dec wLoadedUnitCount,b
        clc

        -
        plx
        plb
        rtl

        _SEC
        sec
        bra -

        .databank 0

      rlUnknown8483F3 ; 84/83F3

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        lda wR1
        pha
        lda wR2
        pha

        sep #$20
        lda lRoutineVariable+2,b
        pha
        rep #$20
        plb

        lda wR10
        sec
        sbc #16
        sta wR10

        lda wR11
        sec
        sbc #16
        sta wR11

        lda lRoutineVariable
        tay
        ldx #$0400
        lda #$FFFF

        -
        sta $0000,b,y
        inc y
        inc y
        dec x
        dec x
        bne -

        ldx #(len(aDeploymentTable._State) - 2)

        -
        lda aDeploymentTable._State,x
        bit #DeploymentStateAlive
        beq _Next

          bit #DeploymentStateHidden
          bne _Next

            bit #DeploymentStateDefeated
            bne _Next

              lda aDeploymentTable._XTilePosition,x
              sec
              sbc wR10
              sta wR1

              cmp #32
              bcs _Next

                lda aDeploymentTable._YTilePosition,x
                sec
                sbc wR11
                sta wR2

                cmp #32
                bcs _Next

                  lda wR2
                  asl a
                  asl a
                  asl a
                  asl a
                  asl a
                  clc
                  adc wR1
                  clc
                  adc lRoutineVariable
                  tay
                  txa
                  sep #$20
                  sta $0000,b,y
                  rep #$20

        _Next
        dec x
        dec x
        bpl -

        pla
        sta wR2
        pla
        sta wR1
        plp
        plb
        rtl

        .databank 0

      rlGetCharacterDataROMPointer ; 84/8481

        .al
        .autsiz
        .databank ?

        ; A = CharacterID

        phb
        php
        phk
        plb
        phx
        dec a
        bmi +

          pha
          lda aMainDataOffsets.CharacterDataOffsets
          tax

          pla
          asl a
          cmp aMainDataOffsets,x
          bcs +

            clc
            adc aMainDataOffsets.CharacterDataOffsets
            tax
            lda aMainDataOffsets,x
            clc
            adc aMainDataOffsets.CharacterDataOffsets
            adc #<>aMainDataOffsets
            plx
            plp
            plb
            clc

            -
            rtl

        +
        plx
        plp
        plb
        sec
        bra -

        .databank 0

      rlGetUnitRAMDataPointerByID ; 84/84B4

        .al
        .autsiz
        .databank `aUnitRAMPointers

        ; Input:
        ; A = CharacterID

        ; Output:
        ; wSelectedUnitDataRAMPointer
        ; SEC if not found

        phb
        phx
        ldx wR34
        phx
        ldx wR35
        phx

        sta wR34

        sep #$20
        lda #`aUnitRAMPointers
        pha
        rep #$20
        plb

        lda aUnitRAMPointers._Header.CurrentStructCount
        and #$00FF
        asl a
        sta wR35

        ldx #0

          -
          lda aUnitRAMPointers._Entry[0],x
          sta wSelectedUnitDataRAMPointer,b
          jsl rlGetSelectedUnitCharacterID
          cmp wR34
          beq _CLC

            inc x
            inc x
            cpx wR35
            bcc -

        stz wSelectedUnitDataRAMPointer,b
        sec

        -
        pla
        sta wR35
        pla
        sta wR34
        plx
        plb
        rtl

        _CLC
        clc
        bra -

        .databank 0

      rlGetCharacterNamePointer ; 84/84F6

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx
        dec a
        bmi +

        asl a
        clc
        adc aMainDataOffsets.CharacterNameOffsets
        tax
        lda #(`aMainDataOffsets)<<8
        sta lRoutineVariable+1,b
        lda aMainDataOffsets,x
        clc
        adc aMainDataOffsets.CharacterNameOffsets
        adc #<>aMainDataOffsets
        sta lRoutineVariable,b

        -
        plx

        plp
        plb
        rtl

        +
        lda #(`aCharacterNameNone)<<8
        sta lRoutineVariable+1,b
        lda #<>aCharacterNameNone
        sta lRoutineVariable,b
        bra -

        .databank 0

      aCharacterNameNone ; 84/852C

        .enc "SJIS"
        .text "\n"

      rlGetCharacterClass ; 84/852E

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = CharacterID

        phb
        php
        phk
        plb
        phy
        cmp #size(aCharacterDataOffsets)/size(word) + 1
        bcs _Invalid

          ; Is within the character ID bounds

          jsl rlSwapToMainDataBank

          jsl rlGetCharacterDataROMPointer
          tay
          lda structCharacterROMEntry.Type,b,y
          and #$00FF
          cmp #UnitTypeEnemy
          beq _Enemy

          cmp #UnitTypeDynamic
          beq _Dynamic

          ; static or holy
          lda structStaticCharacterROMEntry.Class,b,y
          bra _End

          _Dynamic
          lda structDynamicCharacterROMEntry.Class,b,y
          bra _End
          
          _Enemy
          lda structEnemyCharacterROMEntry.Class,b,y

          _End
          and #$00FF
          ply
          plp
          plb
          rtl

        _Invalid
        lda #0
        bra _End

        .databank 0

      rlGetCharacterLevel ; 84/856A

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phy

        jsl rlSwapToMainDataBank
        jsl rlGetCharacterDataROMPointer

        tay
        lda structCharacterROMEntry.Type,b,y
        and #$00FF
        cmp #UnitTypeEnemy
        beq _Enemy

        cmp #UnitTypeDynamic
        beq _Dynamic

        ; Static/Holy
        lda structStaticCharacterROMEntry.Level,b,y
        bra +
        
        _Dynamic
        lda structDynamicCharacterROMEntry.Level,b,y
        bra +
        
        _Enemy
        lda structEnemyCharacterROMEntry.Level,b,y

        +
        and #$00FF
        ply
        plp
        plb
        rtl

        .databank 0

      rlGetCharacterMapSprite ; 84/859C

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = CharacterID

        ; Output:
        ; A = MapSpriteID

        phb
        php
        phk
        plb
        phx
        phy
        ldx wR0
        phx
        ldx wR1
        phx

        jsl rlSwapToMainDataBank

        sta wR1
        jsl rlGetCharacterDataROMPointer
        tay

        lda structCharacterROMEntry.Type,b,y
        and #$00FF
        cmp #UnitTypeDynamic
        beq _Dynamic

        cmp #UnitTypeEnemy
        beq _Enemy

        ; Static/Holy
        lda structStaticCharacterROMEntry.Gender,b,y
        and #$00FF
        sta wR0
        lda structStaticCharacterROMEntry.Class,b,y
        bra _85F2

        _Dynamic
        lda structDynamicCharacterROMEntry.Gender,b,y
        and #$00FF
        sta wR0
        lda structDynamicCharacterROMEntry.Class,b,y
        bra _85F2

        _Enemy
        lda structEnemyCharacterROMEntry.Gender,b,y
        bit #$0080
        bne +

        and #$007F
        bra ++

        +
        ora #$FF80

        +
        sta wR0
        lda structEnemyCharacterROMEntry.Class,b,y

        _85F2
        and #$00FF
        jsr rsGetClassMapSprite

        plx
        stx wR1
        plx
        stx wR0
        ply
        plx
        plp
        plb
        rtl

        .databank 0

      rlUnknown848603 ; 84/8603

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        ldx wR1
        phx

        jsl rlGetCharacterMapSprite
        sta wR1
        jsl rlAddDeployedMapSprite

        pla
        sta wR1
        plx
        plp
        plb
        rtl

        .databank 0

      rlGetCharacterPortraitDataID ; 84/861C

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = PortraitID

        ; Output:
        ; A = PortraitDataID

        phb
        php
        phk
        plb
        phx

        dec a
        asl a
        tax
        lda aPortraitDataIDs,x
        plx
        plp
        plb
        rtl

        .databank 0

      rlGetCharacterEquipSlotItemROMPointer ; 84/862C

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = CharacterID
        ; wR0 = Equipment slot: 1 or 2

        ; Output:
        ; wCurrentItemDataROMPointer

        phb
        php
        phk
        plb
        phx
        phy
        ldy wR0
        phy
        ldy wR1
        phy

        stz wCurrentItemDataROMPointer,b
        cpx #3
        bcs _End

          dec x
          stx wR0
          jsl rlSwapToMainDataBank
          jsl rlGetCharacterDataROMPointer
          tay
          lda structCharacterROMEntry.Type,b,y
          and #$00FF
          sta wR1
          asl a
          tax

          tya
          clc
          adc wR0
          clc
          adc aEquipmentOffsetsByUnitType,x
          tay

          lda wR1
          cmp #UnitTypeHoly
          bcc +

            lda $0000,b,y
            and #$00FF
            cmp #$00FF
            beq _End

              jsl rlGetItemDataROMPointer
              bra _End

          +
          lda $0000,b,y
          and #$00FF
          cmp #$00FF
          beq _End

            jsl rlGetItemRAMStructEntryByPlayerItemIndex
            bcs _End

              jsl rlGetEffectiveItemROMPointerByItemRAMStructEntry

        _End
        pla
        sta wR1
        pla
        sta wR0
        ply
        plx
        plp
        plb
        rtl

        .databank 0

      aEquipmentOffsetsByUnitType ; 84/8698

        .word structStaticCharacterROMEntry.Equipment1
        .word structDynamicCharacterROMEntry.Equipment1
        .word structStaticCharacterROMEntry.Equipment1
        .word structEnemyCharacterROMEntry.Equipment1

        ; 84/86A0


    .endsection Code848397Section














    .section Code848C31Section

      rlSetUnitsAsLoversByGenerationIDs ; 84/8C31

        .al
        .autsiz
        .databank ?

        ; Input:
        ; wRoutineVariable2 = male GenerationID
        ; wRoutineVariable3 = female GenerationID

        phb
        php
        phk
        plb
        lda wSelectedUnitDataRAMPointer,b
        pha

        lda wRoutineVariable2,b
        sta wRoutineVariable1,b

        lda #0
        jsl rlFindGenerationIDInFactionSlotData

        jsl rlGetSelectedUnitLoverGenerationID
        ora #0
        bne _End

          lda wRoutineVariable3,b
          cmp #$0010
          bcc _BRK

            jsl rlSetSelectedUnitLoverGenerationID
            jsl rlGetSelectedUnitCharacterID
            pha

            lda wRoutineVariable3,b
            sta wRoutineVariable1,b
            lda #0
            jsl rlFindGenerationIDInFactionSlotData
            lda wRoutineVariable2,b
            cmp #$0010
            bcs _BRK

              jsl rlSetSelectedUnitLoverGenerationID

              lda #$0011
              sta bEventActionIdentifier,b
              jsl rlGetSelectedUnitCharacterID
              sta wEventEngineArgument1,b

              pla
              sta wEventEngineArgument2,b

              ; Arg 1 holds male, arg 2 holds female
              jsl rlGetAndRunChapterMapEventConditions

        _End
        pla
        sta wSelectedUnitDataRAMPointer,b
        plp
        plb
        rtl

        _BRK
        brk

        .databank 0

      rlUnknown848C96 ; 84/8C96

        .al
        .autsiz
        .databank `aUnitRAMPointers

        phb
        php

        sep #$20
        lda #`aUnitRAMPointers
        pha
        rep #$20
        plb

        phx
        phy
        ldx wSelectedUnitDataRAMPointer,b
        phx
        ldx wR0
        phx

        ldx #(24 - 1) * size(word)
        lda #0
        
          -
          sta $2000,b,x
          dec x
          dec x
          bpl -

        lda aUnitRAMPointers._Header.CurrentStructCount
        and #$00FF
        asl a
        sta wR0

        ldx #0

        -
        lda aUnitRAMPointers._Entry[0],x
        sta wSelectedUnitDataRAMPointer,b
        jsl rlGetSelectedUnitCharacterID
        cmp #Gerrard
        bcs ++

          tay
          lda wCurrentChapter,b
          cmp #Chapter06
          bcc +

            cpy #Seliph
            bcc ++

          +
          jsl rlGetSelectedUnitGenerationID
          dec a
          asl a
          tay
          lda wSelectedUnitDataRAMPointer,b
          sta $2000,b,y

        +
        inc x
        inc x
        cpx wR0
        bcc -

        plx
        stx wR0
        plx
        stx wSelectedUnitDataRAMPointer,b

        ply
        plx
        plp
        plb
        rtl

        .databank 0

        ; 84/8CFE

    .endsection Code848C31Section



    .section Code848F17Section

      rsCreateStaticUnitRAMData ; 84/8F17

        .al
        .autsiz
        .databank ?

        phx
        lda #(`aStaticUnitRAMArea)<<8
        sta lR18+1
        lda #<>aStaticUnitRAMArea
        sta lR18
        jsl rlLoadRAMAreaPointer

        ldx wSelectedUnitDataRAMPointer,b
        sep #$20
        lda #UnitTypeStatic
        sta $7E0000+structCharacterDataRAM.Type,x
        rep #$20

        lda #size(structPersonalCharacterDataRAM) + size(structExtendedCharacterDataRAM)
        jsl rlAllocateRAMArea

        lda lR25+1
        sta $7E0000+structCharacterDataRAM.PersonalData+1,x
        lda lR25
        clc
        adc #0
        sta $7E0000+structCharacterDataRAM.PersonalData,x

        lda lR25+1
        sta $7E0000+structCharacterDataRAM.ExtendedPersonalData+1,x
        lda lR25
        clc
        adc #size(structPersonalCharacterDataRAM)
        sta $7E0000+structCharacterDataRAM.ExtendedPersonalData,x

        lda #>`aCharacterDataOffsets
        sta $7E0000+structCharacterDataRAM.ConstantData+1,x

        tya
        clc
        adc #structStaticCharacterROMEntry.CharacterID
        sta $7E0000+structCharacterDataRAM.ConstantData,x

        lda #0
        sta $7E0000+structCharacterDataRAM.EnemyROMData+1,x
        sta $7E0000+structCharacterDataRAM.EnemyROMData,x

        jsr rsFillUnitRAMExtendedPersonalData
        jsr rsFillUnitRAMPersonalData
        jsr rsFillUnitRAMInventoryData
        jsr rsUnknown849294
        plx
        rts

        .databank 0

      rsCreateDynamicUnitRAMData ; 84/8F83

        .al
        .autsiz
        .databank ?

        ; wR0 = father ram pointer
        ; wR1 = mother ram pointer

        phx
        ldx wSelectedUnitDataRAMPointer,b

        lda wR1
        sta wSelectedUnitDataRAMPointer,b
        lda #(`aUnit1DataBuffer._Extended)<<8
        sta lRAMBufferPointer+1,b
        lda #<>aUnit1DataBuffer._Extended
        sta lRAMBufferPointer,b
        jsl rlSaveExtendedCharacterDataToBuffer

        lda #(`aUnit1DataBuffer._ROM)<<8
        sta lRAMBufferPointer+1,b
        lda #<>aUnit1DataBuffer._ROM
        sta lRAMBufferPointer,b
        jsl rlSaveCharacterROMDataToBuffer

        lda wR0
        sta wSelectedUnitDataRAMPointer,b
        lda #(`aUnit2DataBuffer._Extended)<<8
        sta lRAMBufferPointer+1,b
        lda #<>aUnit2DataBuffer._Extended
        sta lRAMBufferPointer,b
        jsl rlSaveExtendedCharacterDataToBuffer

        lda #(`aUnit2DataBuffer._ROM)<<8
        sta lRAMBufferPointer+1,b
        lda #<>aUnit2DataBuffer._ROM
        sta lRAMBufferPointer,b
        jsl rlSaveCharacterROMDataToBuffer

        stx wSelectedUnitDataRAMPointer,b

        lda wR1
        pha
        lda wR0
        pha

        lda #(`aDynamicUnitRAMArea)<<8
        sta lR18+1
        lda #<>aDynamicUnitRAMArea
        sta lR18
        jsl rlLoadRAMAreaPointer

        sep #$20
        lda #UnitTypeDynamic
        sta $7E0000+structCharacterDataRAM.Type,x
        rep #$20

        lda #size(structPersonalCharacterDataRAM) + size(structExtendedCharacterDataRAM) + size(structCharacterConstantData)
        jsl rlAllocateRAMArea

        lda lR25+1
        sta $7E0000+structCharacterDataRAM.PersonalData+1,x
        lda lR25
        clc
        adc #0
        sta $7E0000+structCharacterDataRAM.PersonalData,x

        lda lR25+1
        sta $7E0000+structCharacterDataRAM.ExtendedPersonalData+1,x
        lda lR25
        clc
        adc #size(structPersonalCharacterDataRAM)
        sta $7E0000+structCharacterDataRAM.ExtendedPersonalData,x

        lda lR25+1
        sta $7E0000+structCharacterDataRAM.ConstantData+1,x
        lda lR25
        clc
        adc #size(structPersonalCharacterDataRAM) + size(structExtendedCharacterDataRAM)
        sta $7E0000+structCharacterDataRAM.ConstantData,x

        lda #0
        sta $7E0000+structCharacterDataRAM.EnemyROMData+1,x
        sta $7E0000+structCharacterDataRAM.EnemyROMData,x

        jsl rlFillChildsConstantData
        jsl rsFillChildExtendedPersonalData
        jsr rsFillUnitRAMPersonalData
        jsr rsFillUnitRAMInventoryData
        jsr rsUnknown849294

        pla
        sta wR0
        pla
        sta wR1

        lda structDynamicCharacterROMEntry.MajorInfluence,b,y
        and #$00FF
        bne +

          lda wR1
          sta wR2
          bra ++

          +
          lda wR0
          sta wR2

        +
        jsl rlInheritInventoryToChild

        plx
        rts

        .databank 0

      rsCreateHolyUnitRAMData ; 84/9063

        .al
        .autsiz
        .databank ?

        phx
        lda #(`aHolyAndEnemyRAMArea)<<8
        sta lR18+1
        lda #<>aHolyAndEnemyRAMArea
        sta lR18
        jsl rlLoadRAMAreaPointer

        ldx wSelectedUnitDataRAMPointer,b
        sep #$20
        lda #UnitTypeHoly
        sta $7E0000+structCharacterDataRAM.Type,x
        rep #$20

        lda #size(structPersonalCharacterDataRAM)
        jsl rlAllocateRAMArea

        lda lR25+1
        sta $7E0000+structCharacterDataRAM.PersonalData+1,x
        lda lR25
        clc
        adc #0
        sta $7E0000+structCharacterDataRAM.PersonalData,x

        lda #>`aCharacterDataOffsets
        sta $7E0000+structCharacterDataRAM.ExtendedPersonalData+1,x
        tya
        clc
        adc #structStaticCharacterROMEntry.HP
        sta $7E0000+structCharacterDataRAM.ExtendedPersonalData,x

        lda #>`aCharacterDataOffsets
        sta $7E0000+structCharacterDataRAM.ConstantData+1,x
        tya
        clc
        adc #structStaticCharacterROMEntry.CharacterID
        sta $7E0000+structCharacterDataRAM.ConstantData,x

        lda #0
        sta $7E0000+structCharacterDataRAM.EnemyROMData+1,x
        sta $7E0000+structCharacterDataRAM.EnemyROMData,x

        lda #0
        sta $7E0000+structCharacterDataRAM.LoverData+1,x
        sta $7E0000+structCharacterDataRAM.LoverData,x

        jsr rsFillUnitRAMPersonalData
        jsr rsFillUnitRAMInventoryData

        plx
        rts

        .databank 0

      rsCreateEnemyUnitRAMData ; 84/90D4

        .al
        .autsiz
        .databank ?

        phx
        lda wRoutineVariable1,b
        pha

        lda #(`aHolyAndEnemyRAMArea)<<8
        sta lR18+1
        lda #<>aHolyAndEnemyRAMArea
        sta lR18
        jsl rlLoadRAMAreaPointer

        ldx wSelectedUnitDataRAMPointer,b
        sep #$20
        lda #UnitTypeEnemy
        sta $7E0000+structCharacterDataRAM.Type,x
        rep #$20

        lda #size(structPersonalCharacterDataRAM)
        jsl rlAllocateRAMArea

        lda lR25+1
        sta $7E0000+structCharacterDataRAM.PersonalData+1,x
        lda lR25
        clc
        adc #0
        sta $7E0000+structCharacterDataRAM.PersonalData,x

        lda #0
        sta $7E0000+structCharacterDataRAM.ExtendedPersonalData+1,x
        sta $7E0000+structCharacterDataRAM.ExtendedPersonalData,x

        lda #0
        sta $7E0000+structCharacterDataRAM.ConstantData+1,x
        sta $7E0000+structCharacterDataRAM.ConstantData,x

        lda #>`aCharacterDataOffsets
        sta $7E0000+structCharacterDataRAM.EnemyROMData+1,x
        tya
        clc
        adc #structEnemyCharacterROMEntry.CharacterID
        sta $7E0000+structCharacterDataRAM.EnemyROMData,x

        lda #0
        sta $7E0000+structCharacterDataRAM.LoverData+1,x
        sta $7E0000+structCharacterDataRAM.LoverData,x

        jsr rsFillUnitRAMPersonalData
        jsr rsFillUnitRAMInventoryData

        pla
        sta wRoutineVariable1,b
        plx
        rts

        .databank 0

      rsFillUnitRAMPersonalData ; 84/9148

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx
        phy
        phy

        ldx wSelectedUnitDataRAMPointer,b
        sep #$20
        lda $7E0000+structCharacterDataRAM.PersonalData+2,x
        pha
        rep #$20
        plb

        lda $7E0000+structCharacterDataRAM.PersonalData,x
        tay
        plx

        lda #0
        sta structPersonalCharacterDataRAM.UnitStates,b,y
        sep #$20
        sta structPersonalCharacterDataRAM.LoverGenerationID,b,y
        sta structPersonalCharacterDataRAM.ResidingCastle,b,y
        sta structPersonalCharacterDataRAM.AI,b,y
        sta structPersonalCharacterDataRAM.CantoMovement,b,y
        sta structPersonalCharacterDataRAM.RingStatBonusBitfield,b,y
        sta structPersonalCharacterDataRAM.WeaponStatBonus,b,y
        sta structPersonalCharacterDataRAM.StatusDuration,b,y
        sta structPersonalCharacterDataRAM.Status,b,y

        lda #Factionless
        sta structPersonalCharacterDataRAM.FactionSlot,b,y
        lda #NoDeploymentOffset
        sta structPersonalCharacterDataRAM.DeploymentOffset,b,y
        rep #$20

        jsl rlGetSelectedUnitLoveDataIDByCharacterID

        sep #$20
        sta structPersonalCharacterDataRAM.LoveDataID,b,y
        rep #$20

        jsl rlGetSelectedUnitMaxHP

        sep #$20
        sta structPersonalCharacterDataRAM.CurrentHP,b,y
        rep #$20

        jsl rlGetSelectedUnitClassDataPointer
        jsl rlGetClassMoney

        sep #$20
        sta structPersonalCharacterDataRAM.ClassMoney,b,y
        rep #$20

        ply
        plx
        plp
        plb
        rts

        .databank 0

      rsFillUnitRAMExtendedPersonalData ; 84/91B8

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx
        phy

        phy

        ldx wSelectedUnitDataRAMPointer,b

        sep #$20
        lda $7E0000+structCharacterDataRAM.ExtendedPersonalData+2,x
        pha
        rep #$20
        plb

        lda $7E0000+structCharacterDataRAM.ExtendedPersonalData,x
        tay
        plx

        sep #$20
        lda $830000+structStaticCharacterROMEntry.HP,x
        sta structExtendedCharacterDataRAM.HP,b,y
        lda $830000+structStaticCharacterROMEntry.Strength,x
        sta structExtendedCharacterDataRAM.Strength,b,y
        lda $830000+structStaticCharacterROMEntry.Magic,x
        sta structExtendedCharacterDataRAM.Magic,b,y
        lda $830000+structStaticCharacterROMEntry.Skill,x
        sta structExtendedCharacterDataRAM.Skill,b,y
        lda $830000+structStaticCharacterROMEntry.Speed,x
        sta structExtendedCharacterDataRAM.Speed,b,y
        lda $830000+structStaticCharacterROMEntry.Defense,x
        sta structExtendedCharacterDataRAM.Defense,b,y
        lda $830000+structStaticCharacterROMEntry.Resistance,x
        sta structExtendedCharacterDataRAM.Resistance,b,y
        lda $830000+structStaticCharacterROMEntry.Luck,x
        sta structExtendedCharacterDataRAM.Luck,b,y
        lda $830000+structStaticCharacterROMEntry.Class,x
        sta structExtendedCharacterDataRAM.Class,b,y
        lda $830000+structStaticCharacterROMEntry.Level,x
        sta structExtendedCharacterDataRAM.Level,b,y
        lda $830000+structStaticCharacterROMEntry.LeadershipStars,x
        sta structExtendedCharacterDataRAM.LeadershipStars,b,y

        lda #0
        sta structExtendedCharacterDataRAM.TalkTarget,b,y
        sta structExtendedCharacterDataRAM.Experience,b,y
        rep #$20

        lda $830000+structStaticCharacterROMEntry.Money,x
        and #$00FF
        sta wR10

        lda #1000
        sta wR11

        jsl rlUnsignedMultiply16By16

        lda wR12
        sta structExtendedCharacterDataRAM.Money,b,y

        ply
        plx
        plp
        plb
        rts

        .databank 0

      rsFillUnitRAMInventoryData ; 84/9247

        .al
        .autsiz
        .databank ?

        ldx wSelectedUnitDataRAMPointer,b
        lda #(`aInventoryRAMArea)<<8
        sta lR18+1
        lda #<>aInventoryRAMArea
        sta lR18
        jsl rlLoadRAMAreaPointer

        lda #size(structInventoryDataRAM)
        jsl rlAllocateRAMArea

        lda lR25+1
        sta $7E0000+structCharacterDataRAM.InventoryData+1,x
        lda lR25
        sta $7E0000+structCharacterDataRAM.InventoryData,x

        lda $7E0000+structCharacterDataRAM.Type,x
        and #$00FF
        cmp #UnitTypeEnemy
        beq _Enemy

        cmp #UnitTypeDynamic
        beq _Dynamic

        ; static or holy
        tya
        clc
        adc #structStaticCharacterROMEntry.Equipment1
        bra _End

        _Enemy
        tya
        clc
        adc #structEnemyCharacterROMEntry.Equipment1
        bra _End

        _Dynamic
        tya
        clc
        adc #structDynamicCharacterROMEntry.Equipment1
        
        _End
        jsl rlLoadEquipmentDataIntoSpecifiedInventory
        rts

        .databank 0

      rsUnknown849294 ; 84/9294

        .al
        .autsiz
        .databank ?

        phy
        lda wR0
        pha
        lda wRoutineVariable1,b
        pha

        jsl rlUnknown848C96
        jsl rlGetSelectedUnitGenerationID
        bcs _9304

        cmp #Deirdre
        bcs +

          lda #0
          sta $7E0000 + structCharacterDataRAM.LoverData+1,x
          sta $7E0000 + structCharacterDataRAM.LoverData,x
          ldx #$002E
          lda #9
          sta wR0
          bra _92EC

        +
        ldx wSelectedUnitDataRAMPointer,b
        lda #(`aLoverRAMArea)<<8
        sta lR18+1
        lda #<>aLoverRAMArea
        sta lR18
        jsl rlLoadRAMAreaPointer

        lda #size(structLoverDataRAM)
        jsl rlAllocateRAMArea

        lda lR25+1
        sta $7E0000 + structCharacterDataRAM.LoverData+1,x
        lda lR25
        sta $7E0000 + structCharacterDataRAM.LoverData,x
        ldx #$001C
        lda #$0010
        sta wR0
        
        _92EC
        lda $7E2000,x
        beq +

          sta wRoutineVariable1
          jsl rlGetUnitLoveBaseWithTarget
          jsl rlSaveUnitLoveValueWithTarget

        +
        dec x
        dec x
        dec wR0
        bne _92EC

        -
        pla
        sta wRoutineVariable1,b
        pla
        sta wR0
        ply
        rts

        _9304
        lda #0
        sta $7E0000 + structCharacterDataRAM.LoverData+1,x
        sta $7E0000 + structCharacterDataRAM.LoverData,x
        bra -

        .databank 0

      rlLoadUnit ; 84/931A

        .al
        .autsiz
        .databank ?

        ; A = CharacterID

        ; for children:
        ; wR0 = father RAM pointer
        ; wR1 = mother RAM pointer

        phb
        php

        phk
        plb

        phx
        phy

        tay

        lda #(`aUnitRAMArea)<<8
        sta lR18+1
        lda #<>aUnitRAMArea
        sta lR18
        jsl rlBufferAndLoadNewRAMAreaPointer

        lda #size(structCharacterDataRAM)
        jsl rlAllocateRAMArea

        lda lR25
        sta wSelectedUnitDataRAMPointer,b

        lda #(`aUnitRAMPointers)<<8
        sta lStructPointer2+1,b
        lda #<>aUnitRAMPointers
        sta lStructPointer2,b

        lda lR25
        sta lStructPointer1,b

        jsl rlAppendNewStructEntry

        tya
        jsl rlCreateUnit

        inc wLoadedUnitCount,b
        jsl rlLoadBufferedRAMAreaPointer

        ply
        plx

        plp
        plb
        rtl

        .databank 0

      rlClearSelectedUnitRAMAreaData ; 84/9361

        .al
        .autsiz
        .databank ?

        ; Clears the selected units item data (if not an enemy),
        ; their personal, inventory, lover data and their unit RAM pointer.

        ; Input:
        ; filled wSelectedUnitDataRAMPointer

        phb
        php
        phk
        plb
        phx
        phy
        lda lR18
        pha
        lda lR18+1
        pha
        lda wR0
        pha
        lda wR1
        pha

        ldx wSelectedUnitDataRAMPointer,b
        lda $7E0000 + structCharacterDataRAM.Type,x
        and #$00FF
        cmp #UnitTypeHoly
        bcs _ItemsDone

          ; Enemies dont need their items messed with
          ldy #1

          _Loop
          tya

          jsl rlGetItemRAMStructEntryByPlayerItemIndex
          bcs _ItemsDone

          jsl rlGetItemRAMStateAndOwner
          lda wR1
          cmp wSelectedUnitDataRAMPointer,b
          bne _Next

            lda wR0
            cmp #ItemStateInventory
            beq +

              cmp #ItemStateSupply
              bne _Next

            +
            jsl rlRevertItemAquirement

          _Next
          inc y
          bra _Loop

        _ItemsDone
        ldx wSelectedUnitDataRAMPointer,b
        lda $7E0000 + structCharacterDataRAM.Type,x
        and #$00FF
        asl a
        tax
        lda #(`aStaticUnitRAMArea)<<8
        sta lR18+1
        lda aRemoveUnitRAMAreaPointers,x
        sta lR18
        jsl rlBufferAndLoadNewRAMAreaPointer

        ldx wSelectedUnitDataRAMPointer,b
        lda $7E0000 + structCharacterDataRAM.PersonalData+1,x
        sta lR25+1
        lda $7E0000 + structCharacterDataRAM.PersonalData,x
        sta lR25
        jsl rlRemoveRAMAreaEntry

        lda #(`aInventoryRAMArea)<<8
        sta lR18+1
        lda #<>aInventoryRAMArea
        sta lR18
        jsl rlLoadRAMAreaPointer

        lda $7E0000 + structCharacterDataRAM.InventoryData+1,x
        sta lR25+1
        lda $7E0000 + structCharacterDataRAM.InventoryData,x
        sta lR25
        jsl rlRemoveRAMAreaEntry

        lda $7E0000 + structCharacterDataRAM.LoverData+1,x
        ora $7E0000 + structCharacterDataRAM.LoverData,x
        beq +

          lda #(`aLoverRAMArea)<<8
          sta lR18+1
          lda #<>aLoverRAMArea
          sta lR18
          jsl rlLoadRAMAreaPointer

          lda $7E0000 + structCharacterDataRAM.LoverData+1,x
          sta lR25+1
          lda $7E0000 + structCharacterDataRAM.LoverData,x
          sta lR25
          jsl rlRemoveRAMAreaEntry

        +
        ldx wSelectedUnitDataRAMPointer,b
        lda #$FFFF
        sta $7E0000 + structCharacterDataRAM.Type,x

        lda #(`aUnitRAMArea)<<8
        sta lR18+1
        lda #<>aUnitRAMArea
        sta lR18
        jsl rlLoadRAMAreaPointer

        lda #(`aUnitRAMArea)<<8
        sta lR25+1
        lda wSelectedUnitDataRAMPointer,b
        sta lR25
        jsl rlRemoveRAMAreaEntry

        jsl rlLoadBufferedRAMAreaPointer

        pla
        sta wR1
        pla
        sta wR0
        pla
        sta lR18+1
        pla
        sta lR18
        ply
        plx
        plp
        plb
        rtl

        .databank 0

      aRemoveUnitRAMAreaPointers ; 84/9459

        .word <>aStaticUnitRAMArea
        .word <>aDynamicUnitRAMArea
        .word <>aHolyAndEnemyRAMArea
        .word <>aHolyAndEnemyRAMArea

      rlGetUnitType ; 84/9461

        .al
        .autsiz
        .databank ?

        ; 0 = static
        ; 1 = dynamic
        ; 2 = holy
        ; 3 = enemy

        phb
        php
        phk
        plb

        phx
        ldx wSelectedUnitDataRAMPointer,b
        lda $7E0000+structCharacterDataRAM.Type,x
        and #$00FF
        plx

        plp
        plb
        rtl

        .databank 0

      rlSaveUnitType ; 84/9474

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb

        phx
        ldx wSelectedUnitDataRAMPointer,b
        sep #$20
        sta $7E0000+structCharacterDataRAM.Type,x
        rep #$20
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetSelectedUnitPersonalDataPointer ; 84/9488

        .al
        .autsiz
        .databank ?

        ldx wSelectedUnitDataRAMPointer,b
        sep #$20
        lda $7E0000+structCharacterDataRAM.PersonalData+2,x
        pha
        rep #$20
        plb
        lda $7E0000+structCharacterDataRAM.PersonalData,x
        tax
        rtl

        .databank 0

      rlSavePersonalCharacterDataToBuffer ; 84/949B

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        phy

        lda lR18
        pha
        lda lR18+1
        pha

        jsl rlGetSelectedUnitPersonalDataPointer

        lda lRAMBufferPointer+1,b
        sta lR18+1
        lda lRAMBufferPointer,b
        sta lR18

        ldy #structPersonalCharacterDataBuffer.UnitStates
        lda structPersonalCharacterDataRAM.UnitStates,b,x
        sta [lR18],y

        ldy #structPersonalCharacterDataBuffer.LoverGenerationID
        lda structPersonalCharacterDataRAM.LoverGenerationID,b,x
        and #$00FF
        sta [lR18],y

        ldy #structPersonalCharacterDataBuffer.DeploymentOffset
        lda structPersonalCharacterDataRAM.DeploymentOffset,b,x
        and #$00FF
        sta [lR18],y

        ldy #structPersonalCharacterDataBuffer.ResidingCastle
        lda structPersonalCharacterDataRAM.ResidingCastle,b,x
        and #$00FF
        sta [lR18],y

        ldy #structPersonalCharacterDataBuffer.FactionSlot
        lda structPersonalCharacterDataRAM.FactionSlot,b,x
        and #$00FF
        sta [lR18],y

        ldy #structPersonalCharacterDataBuffer.AI
        lda structPersonalCharacterDataRAM.AI,b,x
        and #$00FF
        sta [lR18],y

        ldy #structPersonalCharacterDataBuffer.Status
        lda structPersonalCharacterDataRAM.Status,b,x
        and #$00FF
        sta [lR18],y

        ldy #structPersonalCharacterDataBuffer.CantoMovement
        lda structPersonalCharacterDataRAM.CantoMovement,b,x
        and #$00FF
        sta [lR18],y

        ldy #structPersonalCharacterDataBuffer.RingStatBonusBitfield
        lda structPersonalCharacterDataRAM.RingStatBonusBitfield,b,x
        and #$00FF
        sta [lR18],y

        ldy #structPersonalCharacterDataBuffer.WeaponStatBonus
        lda structPersonalCharacterDataRAM.WeaponStatBonus,b,x
        and #$00FF
        sta [lR18],y

        ldy #structPersonalCharacterDataBuffer.StatusDuration
        lda structPersonalCharacterDataRAM.StatusDuration,b,x
        and #$00FF
        sta [lR18],y

        ldy #structPersonalCharacterDataBuffer.CurrentHP
        lda structPersonalCharacterDataRAM.CurrentHP,b,x
        and #$00FF
        sta [lR18],y

        ldy #structPersonalCharacterDataBuffer.ClassMoney
        lda structPersonalCharacterDataRAM.ClassMoney,b,x
        and #$00FF
        sta [lR18],y

        pla
        sta lR18+1
        pla
        sta lR18

        ply
        plx
        plp
        plb
        rtl

        .databank 0

      rlLoadPersonalCharacterDataFromBuffer ; 84/954C

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        phy

        lda lR18
        pha
        lda lR18+1
        pha

        jsl rlGetSelectedUnitPersonalDataPointer

        lda lRAMBufferPointer+1,b
        sta lR18+1
        lda lRAMBufferPointer,b
        sta lR18

        ldy #structPersonalCharacterDataBuffer.UnitStates
        lda [lR18],y
        sta structPersonalCharacterDataRAM.UnitStates,b,x

        sep #$20
        ldy #structPersonalCharacterDataBuffer.LoveDataID
        lda [lR18],y
        sta structPersonalCharacterDataRAM.LoveDataID,b,x

        ldy #structPersonalCharacterDataBuffer.LoverGenerationID
        lda [lR18],y
        sta structPersonalCharacterDataRAM.LoverGenerationID,b,x

        ldy #structPersonalCharacterDataBuffer.ResidingCastle
        lda [lR18],y
        sta structPersonalCharacterDataRAM.ResidingCastle,b,x

        ldy #structPersonalCharacterDataBuffer.FactionSlot
        lda [lR18],y
        sta structPersonalCharacterDataRAM.FactionSlot,b,x

        ldy #structPersonalCharacterDataBuffer.AI
        lda [lR18],y
        sta structPersonalCharacterDataRAM.AI,b,x

        ldy #structPersonalCharacterDataBuffer.CantoMovement
        lda [lR18],y
        sta structPersonalCharacterDataRAM.CantoMovement,b,x

        ldy #structPersonalCharacterDataBuffer.RingStatBonusBitfield
        lda [lR18],y
        sta structPersonalCharacterDataRAM.RingStatBonusBitfield,b,x

        ldy #structPersonalCharacterDataBuffer.WeaponStatBonus
        lda [lR18],y
        sta structPersonalCharacterDataRAM.WeaponStatBonus,b,x

        ldy #structPersonalCharacterDataBuffer.StatusDuration
        lda [lR18],y
        sta structPersonalCharacterDataRAM.StatusDuration,b,x

        ldy #structPersonalCharacterDataBuffer.Status
        lda [lR18],y
        sta structPersonalCharacterDataRAM.Status,b,x

        ldy #structPersonalCharacterDataBuffer.DeploymentOffset
        lda [lR18],y
        sta structPersonalCharacterDataRAM.DeploymentOffset,b,x

        ldy #structPersonalCharacterDataBuffer.CurrentHP
        lda [lR18],y
        sta structPersonalCharacterDataRAM.CurrentHP,b,x

        ldy #structPersonalCharacterDataBuffer.ClassMoney
        lda [lR18],y
        sta structPersonalCharacterDataRAM.ClassMoney,b,x
        rep #$20

        pla
        sta lR18+1
        pla
        sta lR18

        ply
        plx
        plp
        plb
        rtl

        .databank 0
  
      rlGetSelectedUnitStates ; 84/95E5

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb

        phx
        jsl rlGetSelectedUnitPersonalDataPointer
        lda structPersonalCharacterDataRAM.UnitStates,b,x
        plx

        plp
        plb
        rtl

        .databank 0

      rlSetSelectedUnitStates ; 84/95F5

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx

        pha
        jsl rlGetSelectedUnitPersonalDataPointer
        pla

        ora structPersonalCharacterDataRAM.UnitStates,b,x
        sta structPersonalCharacterDataRAM.UnitStates,b,x

        plx
        plp
        plb
        rtl

        .databank 0

      rlUnsetSelectedUnitStates ; 84/960A

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx

        eor #$FFFF

        pha
        jsl rlGetSelectedUnitPersonalDataPointer
        pla

        and structPersonalCharacterDataRAM.UnitStates,b,x
        sta structPersonalCharacterDataRAM.UnitStates,b,x

        plx
        plp
        plb
        rtl

        .databank 0

      rlGetSelectedUnitLoveDataID ; 84/9622

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx

        jsl rlGetSelectedUnitPersonalDataPointer
        lda structPersonalCharacterDataRAM.LoveDataID,b,x
        and #$00FF

        plx
        plp
        plb
        rtl

        .databank 0

      rlGetSelectedUnitLoverGenerationID ; 84/9635

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx

        jsl rlGetSelectedUnitPersonalDataPointer
        lda structPersonalCharacterDataRAM.LoverGenerationID,b,x
        and #$00FF
        plx

        plp
        plb

        -
        rtl

        lda #0
        plx
        plp
        plb
        bra -

        .databank 0

      rlSetSelectedUnitLoverGenerationID ; 84/9650

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx

        pha
        jsl rlGetSelectedUnitPersonalDataPointer
        pla

        sep #$20
        cmp #$18 + 1
        bcs +

        sta structPersonalCharacterDataRAM.LoverGenerationID,b,x
        rep #$20

        plx
        plp
        plb
        rtl

        +
        .byte 0

        .databank 0

      rlGetSelectedUnitDeploymentOffset ; 84/966B

        .al
        .autsiz
        .databank ?

        ; Input:
        ; filled wSelectedUnitDataRAMPointer

        ; Output:
        ; A = deployment offset
        ; sec if not deployed

        phb
        php
        phk
        plb
        phx

        jsl rlGetSelectedUnitPersonalDataPointer
        lda structPersonalCharacterDataRAM.DeploymentOffset,b,x
        and #$00FF
        cmp #NoDeploymentOffset
        beq +

        plx
        plp
        plb
        clc

        -
        rtl

        +
        plx
        plp
        plb
        sec
        bra -

        .databank 0

      rlSetSelectedUnitDeploymentOffset ; 84/968A

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx

        pha
        jsl rlGetSelectedUnitPersonalDataPointer
        pla

        sep #$20
        sta structPersonalCharacterDataRAM.DeploymentOffset,b,x
        rep #$20

        plx
        plp
        plb
        rtl

        .databank 0

      rlGetSelectedUnitArenaLevel ; 84/96A0

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx

        jsl rlGetSelectedUnitPersonalDataPointer
        lda structPersonalCharacterDataRAM.UnitStates,b,x
        and #UnitStateArenaLevelMask

        plx
        plp
        plb
        rtl

        .databank 0

      rlSetSelectedUnitArenaLevel ; 84/96B3

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx

        ldx wRoutineVariable1,b
        phx

        and #UnitStateArenaLevelMask
        sta wRoutineVariable1,b

        jsl rlGetSelectedUnitPersonalDataPointer

        lda structPersonalCharacterDataRAM.UnitStates,b,x
        and #~UnitStateArenaLevelMask
        ora wRoutineVariable1,b
        sta structPersonalCharacterDataRAM.UnitStates,b,x

        pla
        sta wRoutineVariable1,b
        plx
        plp
        plb
        rtl

        .databank 0

      rlGetSelectedUnitHomeCastle ; 84/96DA

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx

        jsl rlGetSelectedUnitPersonalDataPointer
        lda structPersonalCharacterDataRAM.UnitStates,b,x
        bit #UnitStateFielded
        bne +

        lda structPersonalCharacterDataRAM.ResidingCastle,b,x
        and #$00FF

        plx
        plp
        plb
        clc
        
        -
        rtl

        +
        lda structPersonalCharacterDataRAM.ResidingCastle,b,x
        and #$00FF

        plx
        plp
        plb
        sec
        bra -

        .databank 0

      rlSetSelectedUnitResidingCastle ; 84/9702

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx

        pha
        jsl rlGetSelectedUnitPersonalDataPointer
        pla

        sep #$20
        sta structPersonalCharacterDataRAM.ResidingCastle,b,x

        plx
        plp
        plb
        rtl

        .databank 0

      rlGetSelectedUnitFactionSlot ; 84/9716

        .al
        .autsiz
        .databank ?

        ; Input:
        ; filled wSelectedUnitDataRAMPointer

        ; Output:
        ; A = FactionSlot

        phb
        php
        phk
        plb
        phx

        jsl rlGetSelectedUnitPersonalDataPointer
        lda structPersonalCharacterDataRAM.FactionSlot,b,x
        and #$00FF

        plx
        plp
        plb
        rtl

        .databank 0

      rlSetSelectedUnitFaction ; 84/9729

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx

        pha
        jsl rlGetSelectedUnitPersonalDataPointer
        pla

        sep #$20
        sta structPersonalCharacterDataRAM.FactionSlot,b,x
        rep #$20

        plx
        plp
        plb
        rtl

        .databank 0

      rlGetSelectedUnitAI ; 84/973F

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx

        jsl rlGetSelectedUnitPersonalDataPointer
        lda structPersonalCharacterDataRAM.AI,b,x
        and #$00FF
        plx

        plp
        plb
        rtl

        .databank 0

      rlSetSelectedUnitAI ; 84/9752

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx

        pha
        jsl rlGetSelectedUnitPersonalDataPointer
        pla

        sep #$20
        sta structPersonalCharacterDataRAM.AI,b,x
        rep #$20

        plx
        plp
        plb
        rtl

        .databank 0

      rlGetSelectedUnitStatus ; 84/9768

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx
        jsl rlGetSelectedUnitPersonalDataPointer
        lda structPersonalCharacterDataRAM.Status,b,x
        and #$00FF
        plx

        plp
        plb
        rtl

        .databank 0

      rlSetSelectedUnitStatus ; 84/977B

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx

        pha
        jsl rlGetSelectedUnitPersonalDataPointer
        pla

        sep #$20
        sta structPersonalCharacterDataRAM.Status,b,x
        rep #$20

        plx
        plp
        plb
        rtl

        .databank 0

      rlGetSelectedUnitCantoMovement ; 84/9791

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        jsl rlGetSelectedUnitPersonalDataPointer
        lda structPersonalCharacterDataRAM.CantoMovement,b,x
        and #$00FF
        plx
        plp
        plb
        rtl

        .databank 0

      rlSetSelectedUnitCantoMovement ; 84/97A4

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        pha
        jsl rlGetSelectedUnitPersonalDataPointer
        pla
        sep #$20
        sta structPersonalCharacterDataRAM.CantoMovement,b,x
        rep #$20
        plx
        plp
        plb
        rtl

        .databank 0

      rlGetActiveRingStatBonusBitfield ; 84/97BA

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx
        jsl rlGetSelectedUnitPersonalDataPointer
        lda structPersonalCharacterDataRAM.RingStatBonusBitfield,b,x
        and #$00FF
        plx

        plp
        plb
        rtl

        .databank 0

      rlAddRingStatBonusToSelectedUnit ; 84/97CD

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        and #$00FF
        pha

        jsl rlGetSelectedUnitPersonalDataPointer
        pla
        ora structPersonalCharacterDataRAM.RingStatBonusBitfield,b,x
        sta structPersonalCharacterDataRAM.RingStatBonusBitfield,b,x

        plx
        plp
        plb
        rtl

        .databank 0

      rlRemoveRingStatBonusFromSelectedUnit ; 84/97E5

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx
        and #$00FF
        eor #$FFFF
        pha
        jsl rlGetSelectedUnitPersonalDataPointer
        pla
        and structPersonalCharacterDataRAM.RingStatBonusBitfield,b,x
        sta structPersonalCharacterDataRAM.RingStatBonusBitfield,b,x
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetActiveWeaponStatBonus ; 84/9800

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx
        jsl rlGetSelectedUnitPersonalDataPointer
        lda structPersonalCharacterDataRAM.WeaponStatBonus,b,x
        and #$00FF
        plx

        plp
        plb
        rtl

        .databank 0

      rlSetActiveWeaponStatBonus ; 84/9813

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx

        pha
        jsl rlGetSelectedUnitPersonalDataPointer
        pla

        sep #$20
        sta structPersonalCharacterDataRAM.WeaponStatBonus,b,x
        rep #$20

        plx
        plp
        plb
        rtl

        .databank 0

      rlGetSelectedUnitStatusDuration ; 84/9829

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        jsl rlGetSelectedUnitPersonalDataPointer
        lda structPersonalCharacterDataRAM.StatusDuration,b,x
        and #$00FF
        plx
        plp
        plb
        rtl

        .databank 0

      rlSetSelectedUnitStatusDuration ; 84/983C

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx

        pha
        jsl rlGetSelectedUnitPersonalDataPointer
        pla

        sep #$20
        sta structPersonalCharacterDataRAM.StatusDuration,b,x
        rep #$20

        plx
        plp
        plb
        rtl

        .databank 0

      rlDecreaseStatusDuration ; 84/9852

        .al
        .autsiz
        .databank ?

        ; Output:
        ; CLC if unit doesnt have a duration or its still active
        ; SEC if just recovered from a status

        phb
        php
        phk
        plb
        phx

        jsl rlGetSelectedUnitPersonalDataPointer

        lda structPersonalCharacterDataRAM.StatusDuration,b,x
        and #$00FF
        beq _CLC

        dec a
        sep #$20
        sta structPersonalCharacterDataRAM.StatusDuration,b,x
        rep #$20
        bne _CLC

        lda structPersonalCharacterDataRAM.Status,b,x
        and #$00FF
        pha

        lda #StatusHealthy
        jsl rlSetSelectedUnitStatus

        pla
        cmp #StatusSleep
        bne +

          lda structPersonalCharacterDataRAM.DeploymentOffset,b,x
          and #$00FF
          tax
          lda aDeploymentTable._StateBuffer,x
          and #~DeploymentStateAsleep
          sta aDeploymentTable._StateBuffer,x

          lda #$0004
          tsb wUnknown000D79,b

        +
        plx
        plp
        plb
        sec
        bra +
        
        _CLC
        plx
        plp
        plb
        clc
        
        +
        rtl

        .databank 0

      rlUnknown8498A4 ; 84/98A4

        .al
        .autsiz
        .databank ?

        pha
        lda #UnitStateMapAnimation
        jsl rlUnsetSelectedUnitStates
        pla

        ora #0
        bne +

        lda #0
        bra ++

        +
        lda #UnitStateMapAnimation
        
        +
        jsl rlSetSelectedUnitStates

        lda #2
        jsl rlUnknown87BE7C
        rtl

        .databank 0

      rlGetSelectedUnitCurrentHP ; 84/98C6

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        jsl rlGetSelectedUnitPersonalDataPointer
        lda structPersonalCharacterDataRAM.CurrentHP,b,x
        and #$00FF
        plx
        plp
        plb
        rtl

        .databank 0

      rlSetSelectedUnitCurrentHP ; 84/98D9

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        pha
        jsl rlGetSelectedUnitPersonalDataPointer
        pla
        sep #$20
        sta structPersonalCharacterDataRAM.CurrentHP,b,x
        plx
        plp
        plb
        rtl

        .databank 0

      rlGetSelectedUnitExtendedPersonalDataPointer ; 84/98ED

        .al
        .autsiz
        .databank ?

        ldx wSelectedUnitDataRAMPointer,b
        sep #$20
        lda $7E0000+structCharacterDataRAM.ExtendedPersonalData+2,x
        pha
        rep #$20
        plb
        lda $7E0000+structCharacterDataRAM.ExtendedPersonalData,x
        tax
        rtl

        .databank 0

      rlSaveExtendedCharacterDataToBuffer ; 84/9900

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        phy
        lda lR18
        pha
        lda lR18+1
        pha

        jsl rlGetSelectedUnitClassDataPointer
        jsl rlGetSelectedUnitExtendedPersonalDataPointer

        lda lRAMBufferPointer+1,b
        sta lR18+1
        lda lRAMBufferPointer,b
        sta lR18

        ldy #0
        lda structExtendedCharacterDataRAM.HP,b,x
        and #$00FF
        sta [lR18],y

        ldy #2
        lda structExtendedCharacterDataRAM.Strength,b,x    
        and #$00FF
        sta [lR18],y

        ldy #4
        lda structExtendedCharacterDataRAM.Magic,b,x
        and #$00FF
        sta [lR18],y

        ldy #6
        lda structExtendedCharacterDataRAM.Skill,b,x
        and #$00FF
        sta [lR18],y

        ldy #8
        lda structExtendedCharacterDataRAM.Speed,b,x
        and #$00FF
        sta [lR18],y

        ldy #10
        lda structExtendedCharacterDataRAM.Defense,b,x
        and #$00FF
        sta [lR18],y

        ldy #12
        lda structExtendedCharacterDataRAM.Resistance,b,x
        and #$00FF
        sta [lR18],y

        ldy #$0E
        lda structExtendedCharacterDataRAM.Luck,b,x
        and #$00FF
        sta [lR18],y

        ldy #$10
        lda structExtendedCharacterDataRAM.Class,b,x
        and #$00FF
        sta [lR18],y

        ldy #$12
        lda structExtendedCharacterDataRAM.Level,b,x
        and #$00FF
        sta [lR18],y

        ldy #$16
        lda structExtendedCharacterDataRAM.Money,b,x
        sta [lR18],y

        ldy #$18
        lda structExtendedCharacterDataRAM.Experience,b,x
        and #$00FF
        sta [lR18],y

        ldy #$1A
        lda structExtendedCharacterDataRAM.TalkTarget,b,x
        and #$00FF
        sta [lR18],y

        pla
        sta lR18+1
        pla
        sta lR18
        ply
        plx
        plp
        plb
        rtl

        .databank 0

        ; 84/99B5

    .endsection Code848F17Section


    .section Code849AE5Section

      rlGetSelectedUnitMaxHP ; 84/9AE5

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        ldx wSelectedUnitDataRAMPointer,b
        lda $7E0000+structCharacterDataRAM.Type,x
        and #$00FF
        cmp #UnitTypeEnemy
        beq +

          jsl rlGetSelectedUnitExtendedPersonalDataPointer
          lda structExtendedCharacterDataRAM.HP,b,x
          and #$00FF
          cmp #81
          bcc _End

            lda #80

          _End
          plx
          plp
          plb
          rtl

        +
        jsl rlGetEnemyMaxHP
        bra _End

        .databank 0

      rlGetSelectedUnitTotalStrength ; 84/9B15

        .al
        .autsiz
        .databank ?

        jsl rlGetSelectedUnitTotalStrengthEffect
        clc
        adc wR34
        rtl

        .databank 0

      rlGetSelectedUnitTotalStrengthEffect ; 84/9B1D

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        lda #structHolyBloodDataEntry.StrBoost-structHolyBloodDataEntry.StrBoost+1
        jsl rlGetWeaponStatBoostForSpecifiedStat
        sta wR34

        jsl rlGetActiveRingStatBonusBitfield
        bit #$0080
        beq +

          lda wR34
          clc
          adc #5
          sta wR34
        
        +
        ldx wSelectedUnitDataRAMPointer,b
        lda $7E0000+structCharacterDataRAM.Type,x
        and #$00FF
        cmp #UnitTypeEnemy
        beq +

        jsl rlGetSelectedUnitClassDataPointer
        jsl rlGetSelectedUnitExtendedPersonalDataPointer
        jsl rlGetClassStrength
        clc
        adc structExtendedCharacterDataRAM.Strength,b,x
        and #$00FF
        cmp #31
        bcc _End

          lda #30

        _End
        plx
        plp
        plb
        rtl
        
        +
        jsl rlGetEnemyStrength
        bra _End

        .databank 0

      rlGetSelectedUnitTotalMagic ; 84/9B70

        .al
        .autsiz
        .databank ?

        jsl rlGetSelectedUnitTotalMagicEffect
        clc
        adc wR34
        rtl

        .databank 0

      rlGetSelectedUnitTotalMagicEffect ; 84/9B78

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        lda #structHolyBloodDataEntry.MagBoost-structHolyBloodDataEntry.StrBoost+1
        jsl rlGetWeaponStatBoostForSpecifiedStat
        sta wR34

        jsl rlGetActiveRingStatBonusBitfield
        bit #$0040
        beq +

          lda wR34
          clc
          adc #5
          sta wR34

        +
        ldx wSelectedUnitDataRAMPointer,b
        lda $7E0000+structCharacterDataRAM.Type,x
        and #$00FF
        cmp #UnitTypeEnemy
        beq +

        jsl rlGetSelectedUnitClassDataPointer
        jsl rlGetSelectedUnitExtendedPersonalDataPointer
        jsl rlGetClassMagic
        clc
        adc structExtendedCharacterDataRAM.Magic,b,x
        and #$00FF
        cmp #31
        bcc _End

          lda #30
        
        _End
        plx
        plp
        plb
        rtl
        
        +
        jsl rlGetEnemyMagic
        bra _End

        .databank 0

      rlGetSelectedUnitTotalSkill ; 84/9BCB

        .al
        .autsiz
        .databank ?

        jsl rlGetSelectedUnitTotalSkillEffect
        clc
        adc wR34
        rtl

        .databank 0

      rlGetSelectedUnitTotalSkillEffect ; 84/9BD3

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        lda #structHolyBloodDataEntry.SklBoost-structHolyBloodDataEntry.StrBoost+1
        jsl rlGetWeaponStatBoostForSpecifiedStat
        sta wR34

        jsl rlGetActiveRingStatBonusBitfield
        bit #$0020
        beq +

          lda wR34
          clc
          adc #5
          sta wR34

        +
        ldx wSelectedUnitDataRAMPointer,b
        lda $7E0000+structCharacterDataRAM.Type,x
        and #$00FF
        cmp #UnitTypeEnemy
        beq +

        jsl rlGetSelectedUnitClassDataPointer
        jsl rlGetSelectedUnitExtendedPersonalDataPointer
        jsl rlGetClassSkill
        clc
        adc structExtendedCharacterDataRAM.Skill,b,x
        and #$00FF
        cmp #31
        bcc _End

          lda #30
        
        _End
        plx
        plp
        plb
        rtl
        
        +
        jsl rlGetEnemySkill
        bra _End

        .databank 0

      rlGetSelectedUnitTotalSpeed ; 84/9C26

        .al
        .autsiz
        .databank ?

        jsl rlGetSelectedUnitTotalSpeedEffect
        clc
        adc wR34
        rtl

        .databank 0

      rlGetSelectedUnitTotalSpeedEffect ; 84/9C2E

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        lda #structHolyBloodDataEntry.SpdBoost-structHolyBloodDataEntry.StrBoost+1
        jsl rlGetWeaponStatBoostForSpecifiedStat
        sta wR34

        jsl rlGetActiveRingStatBonusBitfield
        bit #$0010
        beq +

          lda wR34
          clc
          adc #5
          sta wR34

        +
        ldx wSelectedUnitDataRAMPointer,b
        lda $7E0000+structCharacterDataRAM.Type,x
        and #$00FF
        cmp #UnitTypeEnemy
        beq +

          jsl rlGetSelectedUnitClassDataPointer
          jsl rlGetSelectedUnitExtendedPersonalDataPointer
          jsl rlGetClassSpeed
          clc
          adc structExtendedCharacterDataRAM.Speed,b,x
          and #$00FF
          cmp #31
          bcc _End

           lda #30

        _End
        plx
        plp
        plb
        rtl

        +
        jsl rlGetEnemySpeed
        bra _End

        .databank 0

      rlGetSelectedUnitTotalDefense ; 84/9C81

        .al
        .autsiz
        .databank ?

        jsl rlGetSelectedUnitTotalDefenseEffect
        clc
        adc wR34
        rtl

        .databank 0

      rlGetSelectedUnitTotalDefenseEffect ; 84/9C89

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        lda #structHolyBloodDataEntry.DefBoost-structHolyBloodDataEntry.StrBoost+1
        jsl rlGetWeaponStatBoostForSpecifiedStat
        sta wR34

        jsl rlGetActiveWeaponStatBonus
        cmp #SafeguardStatBoost
        bne +

          lda wR34
          clc
          adc #7
          sta wR34

        +
        jsl rlGetActiveRingStatBonusBitfield
        bit #$0008
        beq +

          lda wR34
          clc
          adc #5
          sta wR34

        +
        ldx wSelectedUnitDataRAMPointer,b
        lda $7E0000+structCharacterDataRAM.Type,x
        and #$00FF
        cmp #UnitTypeEnemy
        beq +

        jsl rlGetSelectedUnitClassDataPointer
        jsl rlGetSelectedUnitExtendedPersonalDataPointer
        jsl rlGetClassDefense
        clc
        adc structExtendedCharacterDataRAM.Defense,b,x
        and #$00FF
        cmp #31
        bcc _End

          lda #30

        _End
        plx
        plp
        plb
        rtl
        
        +
        jsl rlGetEnemyDefense
        bra _End

        .databank 0

      rlGetSelectedUnitTotalResistance ; 84/9CED

        .al
        .autsiz
        .databank ?

        jsl rlGetSelectedUnitTotalResistanceEffect
        clc
        adc wR34
        rtl

        .databank 0

      rlGetSelectedUnitTotalResistanceEffect ; 84/9CF5

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        lda #structHolyBloodDataEntry.ResBoost-structHolyBloodDataEntry.StrBoost+1
        jsl rlGetWeaponStatBoostForSpecifiedStat
        sta wR34

        jsl rlGetActiveWeaponStatBonus
        cmp #BarrierBladeStatBoost
        bne +

          lda wR34
          clc
          adc #7
          sta wR34
        
        +
        jsl rlGetActiveRingStatBonusBitfield
        bit #$0004
        beq +

          lda wR34
          clc
          adc #5
          sta wR34

        +
        ldx wSelectedUnitDataRAMPointer,b
        lda $7E0000+structCharacterDataRAM.Type,x
        and #$00FF
        cmp #UnitTypeEnemy
        beq +

        jsl rlGetSelectedUnitClassDataPointer
        jsl rlGetSelectedUnitExtendedPersonalDataPointer
        jsl rlGetClassResistance
        clc
        adc structExtendedCharacterDataRAM.Resistance,b,x
        and #$00FF
        cmp #31
        bcc _End

          lda #30

        _End
        plx
        plp
        plb
        rtl
        
        +
        jsl rlGetEnemyResistance
        bra _End

        .databank 0

      rlGetSelectedUnitTotalMovement ; 84/9D59

        .al
        .autsiz
        .databank ?

        jsl rlGetSelectedUnitTotalMovementEffect
        clc
        adc wR34
        rtl

        .databank 0

      rlGetSelectedUnitTotalFieldMovement ; 84/9D61

        .al
        .autsiz
        .databank ?

        ; Gets movement * 10 +1

        phb
        php
        phk
        plb
        phx
        jsl rlGetSelectedUnitStates
        bit #UnitStateCanto
        bne ++

          stz wR34

          jsl rlGetActiveRingStatBonusBitfield
          bit #$0002 ; move
          beq +

            lda #3
            sta wR34

          +
          jsl rlGetSelectedUnitClassDataPointer
          jsl rlGetClassMovement
          clc
          adc wR34
          tax
          lda _FieldMovementLookupTable,x
          and #$00FF
          bra ++

        +
        jsl rlGetSelectedUnitCantoMovement

        +
        plx
        plp
        plb
        rtl

        .databank 0

        _FieldMovementLookupTable ; 84/9D9C

          .byte ( 0 * 10) +1
          .byte ( 1 * 10) +1
          .byte ( 2 * 10) +1
          .byte ( 3 * 10) +1
          .byte ( 4 * 10) +1
          .byte ( 5 * 10) +1
          .byte ( 6 * 10) +1
          .byte ( 7 * 10) +1
          .byte ( 8 * 10) +1
          .byte ( 9 * 10) +1
          .byte (10 * 10) +1
          .byte (11 * 10) +1
          .byte (12 * 10) +1

      rlGetSelectedUnitTotalMovementEffect ; 84/9DA9

        .al
        .autsiz
        .databank ?

        ; returns class movement + filled wR34 with possible leg ring
        ; or canto movement as number

        phb
        php
        phk
        plb
        phx

        stz wR34

        jsl rlGetActiveRingStatBonusBitfield
        bit #$0002 ; leg ring
        beq +

          lda #3
          sta wR34

        +
        jsl rlGetSelectedUnitStates
        bit #UnitStateCanto
        bne +

          jsl rlGetSelectedUnitClassDataPointer
          jsl rlGetClassMovement
          bra ++

        +
        jsl rlGetSelectedUnitCantoMovement
        sta wR36
        lda #10
        sta wR37
        jsl rlUnsignedDivide16By16

        lda wR36
        stz wR34

        +
        plx
        plp
        plb
        rtl

        .databank 0

      rlGetSelectedUnitLuck ; 84/9DE8

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        ldx wSelectedUnitDataRAMPointer,b
        lda $7E0000+structCharacterDataRAM.Type,x
        and #$00FF
        cmp #UnitTypeEnemy
        beq +

        jsl rlGetSelectedUnitExtendedPersonalDataPointer
        lda structExtendedCharacterDataRAM.Luck,b,x
        and #$00FF
        
        -
        plx
        plp
        plb
        rtl

        +
        lda #$FFFF
        bra -

        .databank 0

      rlSetSelectedUnitAIUnused ; 84/9E0F

        .al
        .autsiz
        .databank ?

        ; I hope this routine isn't used

        phb
        php
        phk
        plb
        phx

        pha
        jsl rlGetSelectedUnitPersonalDataPointer
        pla

        sep #$20
        sta structPersonalCharacterDataRAM.AI,b,x

        plx
        plp
        plb
        rtl

        .databank 0

      rlGetSelectedUnitLevel ; 84/9E23

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx
        ldx wSelectedUnitDataRAMPointer,b
        lda $7E0000+structCharacterDataRAM.Type,x
        and #$00FF
        cmp #UnitTypeEnemy
        beq +

        jsl rlGetSelectedUnitExtendedPersonalDataPointer
        lda structExtendedCharacterDataRAM.Level,b,x
        and #$00FF

        -
        plx
        plp
        plb
        rtl
        
        +
        jsl rlGetEnemyUnitLevel
        bra -

        .databank 0

      rlGetSelectedUnitLeadershipStars ; 84/9E4B

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        ldx wSelectedUnitDataRAMPointer,b
        lda $7E0000+structCharacterDataRAM.Type,x
        and #$00FF
        cmp #UnitTypeEnemy
        beq +

        jsl rlGetSelectedUnitExtendedPersonalDataPointer
        lda structExtendedCharacterDataRAM.LeadershipStars,b,x
        and #$00FF
        
        -
        plx
        plp
        plb
        rtl
        
        +
        jsl rlGetEnemyUnitLeadershipStars
        bra -

        .databank 0

      rlGetSelectedUnitExperience ; 84/9E73

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        ldx wSelectedUnitDataRAMPointer,b
        lda $7E0000+structCharacterDataRAM.Type,x
        and #$00FF
        cmp #UnitTypeEnemy
        beq +

        jsl rlGetSelectedUnitFactionSlot
        ora #0
        bne +

          jsl rlGetSelectedUnitExtendedPersonalDataPointer
          lda structExtendedCharacterDataRAM.Experience,b,x
          and #$00FF

          -
          plx
          plp
          plb
          rtl
        
        +
        lda #$FFFF
        bra -

        .databank 0

      rlUnknown849EA3 ; 84/9EA3

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        lda wSelectedUnitDataRAMPointer,b
        pha
        lda wRoutineVariable1,b
        pha

        ldx wSelectedUnitDataRAMPointer,b
        lda $7E0000+structCharacterDataRAM.Type,x
        and #$00FF
        cmp #UnitTypeEnemy
        beq +

          jsl rlGetSelectedUnitExtendedPersonalDataPointer
          lda structExtendedCharacterDataRAM.TalkTarget,b,x
          and #$00FF
          sta wRoutineVariable1,b
          stz wR10

          lda #0
          jsl rlUnknown84BF25

          lda wSelectedUnitDataRAMPointer,b
          beq +

            jsl rlGetSelectedUnitStates
            bit #UnitStateDead
            bne +

              lda wRoutineVariable1,b

              -
              plx
              stx wRoutineVariable1,b
              plx
              stx wSelectedUnitDataRAMPointer,b
              plx
              plp
              plb
              rtl

        +
        lda #0
        bra -

        .databank 0

      rlSetSelectedUnitTalkTarget ; 84/9EF7

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx

        pha
        jsl rlGetSelectedUnitExtendedPersonalDataPointer
        pla

        sep #$20
        sta structExtendedCharacterDataRAM.TalkTarget,b,x
        rep #$20

        plx
        plp
        plb
        rtl

        .databank 0

      rlGetSelectedUnitMoney ; 84/9F0D

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        ldx wSelectedUnitDataRAMPointer,b
        lda $7E0000+structCharacterDataRAM.Type,x
        and #$00FF
        cmp #UnitTypeHoly
        bcs +

        jsl rlGetSelectedUnitExtendedPersonalDataPointer
        lda structExtendedCharacterDataRAM.Money,b,x
        
        -
        plx
        plp
        plb
        rtl
        
        +
        jsl rlGetEnemyClassMoney
        bra -

        .databank 0

      rlSetSelectedUnitMoney ; 84/9F32

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        pha
        ldx wSelectedUnitDataRAMPointer,b
        lda $7E0000+structCharacterDataRAM.Type,x
        and #$00FF
        cmp #UnitTypeHoly
        bcs +

        jsl rlGetSelectedUnitExtendedPersonalDataPointer
        pla
        sta structExtendedCharacterDataRAM.Money,b,x
        
        -
        plx
        plp
        plb
        rtl
        
        +
        pla
        jsl rlSetEnemyClassMoney
        bra -

        .databank 0

      rlAddSelectedUnitStat ; 84/9F5A

        .al
        .autsiz
        .databank ?

        ; Input:
        ; wR0 = stat increase
        ; wRoutineVariable1 = stat index

        ; Output:
        ; wR0 = actual stat increase, accounts for hitting caps

        phb
        php
        phk
        plb
        phx
        phy
        sta wR0
        lda wRoutineVariable1,b
        cmp #8
        bcs _End

          ldx wSelectedUnitDataRAMPointer,b
          lda $7E0000 + structCharacterDataRAM.Type,x
          and #$00FF
          cmp #UnitTypeHoly
          bcs _End

            jsl rlGetSelectedUnitExtendedPersonalDataPointer
            txa
            clc
            adc wRoutineVariable1,b
            tay

            ldx wRoutineVariable1,b
            sep #$20
            lda $0000,b,y
            clc
            adc wR0
            cmp _StatCaps,x
            bcc +

              lda _StatCaps,x
              sec
              sbc $0000,b,y
              sta wR0
              lda _StatCaps,x

            +
            sta $0000,b,y
            rep #$20

        _End
        lda wR0
        and #$00FF
        ply
        plx
        plp
        plb
        rtl

        .databank 0

        _StatCaps ; 84/9FB1
        .byte 80 ; HP
        .byte 15 ; Strength
        .byte 15 ; Magic
        .byte 15 ; Skill
        .byte 15 ; Speed
        .byte 15 ; Defense
        .byte 15 ; Resistance
        .byte 30 ; Luck

        ; 84/9FB9

    .endsection Code849AE5Section

    .section Code849FC4Section

      rlUnknown849FC4 ; 84/9FC4

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        lda wR0
        pha

        jsl rlGetSelectedUnitStates
        bit #UnitStateGroupLeader
        bne _A00E

        jsl rlGetSelectedUnitAI
        sta wR0

        jsl rlGetSelectedUnitFactionSlot
        cmp #0
        beq +

          jsl rlUnknown84C461
          bra _End

        +
        jsl rlGetSelectedUnitGenerationID
        cmp #1
        beq _A00E

        ldx wSelectedUnitDataRAMPointer,b
        phx

        lda #1
        sta wRoutineVariable1,b

        lda #0
        jsl rlFindGenerationIDInFactionSlotData
        jsl rlGetSelectedUnitCharacterID

        plx
        stx wSelectedUnitDataRAMPointer,b
        bra _End
        
        _A00E
        lda #0

        _End
        plx
        stx wR0
        plx
        plp
        plb
        rtl

        .databank 0

      rlUnknown84A018 ; 84/A018

        .al
        .autsiz
        .databank ?

        jsl rlUnknown849FC4
        ora #0
        beq +

        asl a
        ora #1
        bra ++  
        
        +
        jsl rlGetSelectedUnitCharacterID
        asl a
        
        +
        rtl

        .databank 0

      rlGetSelectedUnitClassID ; 84/A02D

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx
        ldx wSelectedUnitDataRAMPointer,b
        lda $7E0000+structCharacterDataRAM.Type,x
        and #$00FF
        cmp #UnitTypeEnemy
        beq +

        jsl rlGetSelectedUnitExtendedPersonalDataPointer

        lda structExtendedCharacterDataRAM.Class,b,x
        and #$00FF

        -
        plx

        plp 
        plb
        rtl
        
        +
        jsl rlGetEnemyUnitClassID
        bra -

        .databank 0

      rlGetClassWeakness ; 84/A055

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        jsl rlGetSelectedUnitClassID
        tax
        lda aClassWeaknessTable,x
        and #$00FF
        plx
        plp
        plb
        rtl

        .databank 0

      rlGetSelectedUnitFactionNamePointer ; 84/A06A

        .al
        .autsiz
        .databank ?

        jsl rlGetSelectedUnitFactionSlot
        jsl rlGetFactionSlotNamePointer
        rtl

        .databank 0

      rlGetSelectedUnitClassNamePointer ; 84/A073

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        jsl rlGetSelectedUnitClassID
        jsl rlGetClassNamePointer
        plx
        plp
        plb
        rtl

        .databank 0

      rlGetSelectedUnitClassDataPointer ; 84/A084

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx
        jsl rlGetSelectedUnitClassID
        jsl rlGetClassDataROMPointer
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetSelectedUnitWeaponRank ; 84/A095

        .al
        .autsiz
        .databank ?

        ; A = weapon type

        phb
        php
        phk
        plb
        phx
        phy

        ldx wR34
        phx
        ldx wR35
        phx

        sta wRoutineVariable1,b
        jsl rlGetSelectedUnitClassDataPointer

        lda wRoutineVariable1,b
        jsl rlGetClassWeaponRank
        cmp #WeaponRankNone
        bcs _End

        sta wR35

        ldy #(size(aHolyBloodGrowthBoostsOffsets)/2)-1

        -
        tya
        jsl rlCheckForSpecifiedHolyBlood
        ora #0
        beq _NextBlood

        sta wR34

        tya
        asl a
        tax
        lda aHolyBloodGrowthBoostsOffsets,x
        tax
        lda aHolyBloodGrowthBoostsOffsets,x
        and #$00FF
        cmp wRoutineVariable1,b
        bne _NextBlood

        lda wR34
        cmp #MajorHolyBlood
        bcs _StarRank

        lda wR35
        sec
        sbc wR34
        beq _End
        bpl +

          lda #WeaponRankA
          bra _End
        
        +
        sta wR35
        
        _NextBlood
        dec y
        bpl -

        lda wR35
        
        _End
        plx
        stx wR35
        plx
        stx wR34

        ply
        plx
        plp
        plb
        clc
        
        -
        rtl
        
        _StarRank
        lda #0

        plx
        stx wR35
        plx
        stx wR34
        ply
        plx
        plp
        plb
        sec
        bra -

        .databank 0

      rlGetSelectedUnitMovementCostPointer ; 84/A111

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx
        jsl rlGetSelectedUnitClassDataPointer
        jsl rlGetClassMovementType
        asl a
        clc
        adc aMainDataOffsets.MovementCostOffsets
        tax
        lda aMainDataOffsets,x
        clc
        adc aMainDataOffsets.MovementCostOffsets
        adc #<>aMainDataOffsets
        plx
        plp
        plb
        rtl

        .databank 0

      rlGetSelectedUnitTerrainAvoidPointer ; 84/A135

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        jsl rlGetSelectedUnitClassDataPointer
        jsl rlGetClassTerrainBonusType
        asl a
        clc
        adc aMainDataOffsets.TerrainAvoidOffsets
        tax
        lda aMainDataOffsets,x
        clc
        adc aMainDataOffsets.TerrainAvoidOffsets
        adc #<>aMainDataOffsets
        plx
        plp
        plb
        rtl

        .databank 0

      rlGetTileTerrainAvoid ; 84/A159

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        sta wRoutineVariable1,b

        lda #0
        asl a
        clc
        adc aMainDataOffsets.TerrainAvoidOffsets
        tax
        lda aMainDataOffsets,x
        clc
        adc aMainDataOffsets.TerrainAvoidOffsets
        adc #<>aMainDataOffsets
        clc
        adc wRoutineVariable1,b
        tax
        lda aMainDataOffsets & $FF0000,x
        bit #$0080
        bne +

        and #$007F
        bra ++
        
        +
        ora #$FF80
        
        +
        plx
        plp
        plb
        rtl

        .databank 0

      rlSetSelectedUnitClass ; 84/A191

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx

        pha
        jsl rlGetSelectedUnitExtendedPersonalDataPointer
        pla

        sep #$20
        sta structExtendedCharacterDataRAM.Class,b,x
        rep #$20

        plx
        plp
        plb
        rtl

        .databank 0

      rlGetSelectedUnitConstantDataPointer ; 84/A1A7

        .al
        .autsiz
        .databank ?

        ldx wSelectedUnitDataRAMPointer,b
        sep #$20
        lda $7E0000+structCharacterDataRAM.ConstantData+2,x
        pha
        rep #$20
        plb
        lda $7E0000+structCharacterDataRAM.ConstantData,x
        tax
        rtl

        .databank 0

      rlSaveCharacterROMDataToBuffer ; 84/A1BA

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        phy
        lda lR18
        pha
        lda lR18+1
        pha

        jsl rlGetSelectedUnitConstantDataPointer

        lda lRAMBufferPointer+1,b
        sta lR18+1
        lda lRAMBufferPointer,b
        sta lR18

        ldy #structCharacterROMDataBuffer.CharacterID
        jsl rlGetSelectedUnitCharacterID
        sta [lR18],y

        ldy #structCharacterROMDataBuffer.CharacterName
        jsl rlGetSelectedUnitNamePointer
        sta [lR18],y

        ldy #structCharacterROMDataBuffer.Gender
        lda structStaticCharacterROMEntry.Gender - structStaticCharacterROMEntry.CharacterID,b,x
        and #$00FF
        sta [lR18],y
        ldy #structCharacterROMDataBuffer.FatherID
        lda structStaticCharacterROMEntry.FatherID - structStaticCharacterROMEntry.CharacterID,b,x
        and #$00FF
        sta [lR18],y
        ldy #structCharacterROMDataBuffer.HPGrowth
        lda structStaticCharacterROMEntry.HPGrowth - structStaticCharacterROMEntry.CharacterID,b,x
        and #$00FF
        sta [lR18],y
        ldy #structCharacterROMDataBuffer.StrengthGrowth
        lda structStaticCharacterROMEntry.StrengthGrowth - structStaticCharacterROMEntry.CharacterID,b,x
        and #$00FF
        sta [lR18],y
        ldy #structCharacterROMDataBuffer.MagicGrowth
        lda structStaticCharacterROMEntry.MagicGrowth - structStaticCharacterROMEntry.CharacterID,b,x
        and #$00FF
        sta [lR18],y
        ldy #structCharacterROMDataBuffer.SkillGrowth
        lda structStaticCharacterROMEntry.SkillGrowth - structStaticCharacterROMEntry.CharacterID,b,x
        and #$00FF
        sta [lR18],y
        ldy #structCharacterROMDataBuffer.SpeedGrowth
        lda structStaticCharacterROMEntry.SpeedGrowth - structStaticCharacterROMEntry.CharacterID,b,x
        and #$00FF
        sta [lR18],y
        ldy #structCharacterROMDataBuffer.DefenseGrowth
        lda structStaticCharacterROMEntry.DefenseGrowth - structStaticCharacterROMEntry.CharacterID,b,x
        and #$00FF
        sta [lR18],y
        ldy #structCharacterROMDataBuffer.ResistanceGrowth
        lda structStaticCharacterROMEntry.ResistanceGrowth - structStaticCharacterROMEntry.CharacterID,b,x
        and #$00FF
        sta [lR18],y
        ldy #structCharacterROMDataBuffer.LuckGrowth
        lda structStaticCharacterROMEntry.LuckGrowth - structStaticCharacterROMEntry.CharacterID,b,x
        and #$00FF
        sta [lR18],y
        ldy #structCharacterROMDataBuffer.Skills1
        lda structStaticCharacterROMEntry.Skills1 - structStaticCharacterROMEntry.CharacterID,b,x
        sta [lR18],y
        ldy #structCharacterROMDataBuffer.Skills3
        lda structStaticCharacterROMEntry.Skills3 - structStaticCharacterROMEntry.CharacterID,b,x
        and #$00FF
        sta [lR18],y
        ldy #structCharacterROMDataBuffer.HolyBlood1
        lda structStaticCharacterROMEntry.HolyBlood1 - structStaticCharacterROMEntry.CharacterID,b,x
        sta [lR18],y
        ldy #structCharacterROMDataBuffer.HolyBlood2
        lda structStaticCharacterROMEntry.HolyBlood2 - structStaticCharacterROMEntry.CharacterID,b,x
        sta [lR18],y

        pla
        sta lR18+1
        pla
        sta lR18
        ply
        plx
        plp
        plb
        rtl

        .databank 0

        ; 84/A282

    .endsection Code849FC4Section


    .section Code84A333Section

      rlGetSelectedUnitCharacterID ; 84/A333

        .al
        .autsiz
        .databank ?

        ; Input:
        ; wSelectedUnitDataRAMPointer

        ; Output:
        ; A = CharacterID

        phb
        php

        phk
        plb

        phx
        ldx wSelectedUnitDataRAMPointer,b
        lda $7E0000+structCharacterDataRAM.Type,x
        and #$00FF
        cmp #UnitTypeEnemy
        beq +

        jsl rlGetSelectedUnitConstantDataPointer
        lda structStaticCharacterROMEntry.CharacterID - structStaticCharacterROMEntry.CharacterID,b,x 

        -
        plx

        plp
        plb
        rtl
        
        +
        jsl rlGetEnemyUnitCharacterID
        bra -

        .databank 0

      rlGetSelectedUnitGenerationID ; 84/A358

        .al
        .autsiz
        .databank ?

        ; Regular enemies: get number as is, and set carry
        ; Others: if flag $80 set, and #$7F and like above
        ; no flag $80, get unit dead =sec, if not clc

        phb
        php

        phk
        plb

        phx
        ldx wSelectedUnitDataRAMPointer,b
        lda $7E0000+structCharacterDataRAM.Type,x
        and #$00FF
        cmp #UnitTypeEnemy
        beq _Enemy

        jsl rlGetSelectedUnitConstantDataPointer
        lda structStaticCharacterROMEntry.GenerationID - structStaticCharacterROMEntry.CharacterID,b,x
        and #$00FF
        bit #$0080
        bne ++

        and #$007F
        tax

        jsl rlGetSelectedUnitStates
        bit #UnitStateDead
        bne +

        txa
        plx
        plp
        plb
        clc

        _End
        rtl

        _Enemy
        jsl rlGetEnemyUnitGenerationID
        plx
        plp
        plb
        sec
        bra _End

        +
        txa

        +
        and #$007F
        plx
        plp
        plb
        sec
        bra _End

        .databank 0

      rlGetSelectedUnitNamePointer ; 84/A3A2

        .al
        .autsiz
        .databank ?

        ; Input:  
        ; filled wSelectedUnitDataRAMPointer

        ; Output: 
        ; lRoutineVariable = name pointer

        phb
        php

        phk
        plb

        phx

        ldx wSelectedUnitDataRAMPointer,b
        lda $7E0000+structCharacterDataRAM.Type,x
        and #$00FF
        cmp #UnitTypeEnemy
        beq +

          jsl rlGetSelectedUnitConstantDataPointer
          lda structStaticCharacterROMEntry.CharacterName - structStaticCharacterROMEntry.CharacterID,b,x 

          -
          pha

          asl a
          clc
          adc aMainDataOffsets.CharacterNameOffsets
          tax
          lda #(`aMainDataOffsets)<<8
          sta lRoutineVariable+1,b
          lda aMainDataOffsets,x
          clc
          adc aMainDataOffsets.CharacterNameOffsets
          adc #<>aMainDataOffsets
          sta lRoutineVariable,b

          pla
          plx

          plp
          plb
          rtl

        +
        jsl rlGetEnemyUnitNameID
        bra -

        .databank 0

      rlGetSelectedUnitGender ; 84/A3E5

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx
        ldx wSelectedUnitDataRAMPointer,b
        lda $7E0000+structCharacterDataRAM.Type,x
        and #$00FF
        cmp #UnitTypeEnemy
        beq +

        jsl rlGetSelectedUnitConstantDataPointer
        lda structStaticCharacterROMEntry.Gender - structStaticCharacterROMEntry.CharacterID,b,x 
        and #$00FF

        -
        plx

        plp
        plb

        rtl

        +
        jsl rlGetEnemyUnitGender
        bra -

        .databank 0

      rlGetSelectedUnitMotherID ; 84/A40D

        .al
        .autsiz
        .databank ?

        phx
        phy
        jsl rlGetSelectedUnitCharacterID
        sta wRoutineVariable1,b

        lda aChildrenDataOffsets
        tax

        ldy #0
        
        -
        lda aChildrenDataOffsets,x
        cmp wRoutineVariable1,b
        beq _Child

        inc x
        inc x
        inc y
        cpy #size(aChildrenDataOffsets)
        bcc -

        lda #0

        -
        ply
        plx
        rtl

        _Child
        tya
        lsr a
        clc
        adc #Deirdre
        bra -

        .databank 0

      rlGetSelectedUnitFatherID ; 84/A43D

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx
        ldx wSelectedUnitDataRAMPointer,b
        lda $7E0000+structCharacterDataRAM.Type,x
        and #$00FF
        cmp #UnitTypeEnemy
        beq +

        jsl rlGetSelectedUnitConstantDataPointer
        lda structCharacterConstantData.FatherID,b,x
        and #$00FF

        -
        plx
        
        plp
        plb
        rtl

        +
        lda #0
        bra -

        .databank 0

      rlGetSelectedUnitTotalHPGrowth ; 84/A464

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx
        lda #0
        jsl rlGetCharacterHolyBloodGrowthBoost
        sta wRoutineVariable1,b

        jsl rlGetSelectedUnitConstantDataPointer

        lda structStaticCharacterROMEntry.HPGrowth - structStaticCharacterROMEntry.CharacterID,b,x 
        and #$00FF
        clc
        adc wRoutineVariable1,b
        jsr rsFloorGrowthAtZero
        plx

        plp
        plb
        rtl

        .databank 0

      rsFloorGrowthAtZero ; 84/A488

        .al
        .autsiz
        .databank ?

        bpl +

          lda #0

        +
        rts

        .databank 0

      rlGetSelectedUnitTotalStrGrowth ; 84/A48E

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx
        lda #1
        jsl rlGetCharacterHolyBloodGrowthBoost
        sta wRoutineVariable1,b

        jsl rlGetSelectedUnitConstantDataPointer

        lda structStaticCharacterROMEntry.StrengthGrowth - structStaticCharacterROMEntry.CharacterID,b,x
        and #$00FF
        clc
        adc wRoutineVariable1,b
        jsr rsFloorGrowthAtZero
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetSelectedUnitTotalMagGrowth ; 84/A4B2

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx
        lda #2
        jsl rlGetCharacterHolyBloodGrowthBoost
        sta wRoutineVariable1,b

        jsl rlGetSelectedUnitConstantDataPointer

        lda structStaticCharacterROMEntry.MagicGrowth - structStaticCharacterROMEntry.CharacterID,b,x
        and #$00FF
        clc
        adc wRoutineVariable1,b
        jsr rsFloorGrowthAtZero
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetSelectedUnitTotalSklGrowth ; 84/A4D6

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx
        lda #3
        jsl rlGetCharacterHolyBloodGrowthBoost
        sta wRoutineVariable1,b

        jsl rlGetSelectedUnitConstantDataPointer

        lda structStaticCharacterROMEntry.SkillGrowth - structStaticCharacterROMEntry.CharacterID,b,x
        and #$00FF
        clc
        adc wRoutineVariable1,b
        jsr rsFloorGrowthAtZero
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetSelectedUnitTotalSpdGrowth ; 84/A4FA

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx
        lda #4
        jsl rlGetCharacterHolyBloodGrowthBoost
        sta wRoutineVariable1,b

        jsl rlGetSelectedUnitConstantDataPointer

        lda structStaticCharacterROMEntry.SpeedGrowth - structStaticCharacterROMEntry.CharacterID,b,x
        and #$00FF
        clc
        adc wRoutineVariable1,b
        jsr rsFloorGrowthAtZero
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetSelectedUnitTotalDefGrowth ; 84/A51E

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx
        lda #5
        jsl rlGetCharacterHolyBloodGrowthBoost
        sta wRoutineVariable1,b

        jsl rlGetSelectedUnitConstantDataPointer

        lda structStaticCharacterROMEntry.DefenseGrowth - structStaticCharacterROMEntry.CharacterID,b,x
        and #$00FF
        clc
        adc wRoutineVariable1,b
        jsr rsFloorGrowthAtZero
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetSelectedUnitTotalResGrowth ; 84/A542

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx
        lda #6
        jsl rlGetCharacterHolyBloodGrowthBoost
        sta wRoutineVariable1,b

        jsl rlGetSelectedUnitConstantDataPointer

        lda structStaticCharacterROMEntry.ResistanceGrowth - structStaticCharacterROMEntry.CharacterID,b,x
        and #$00FF
        clc
        adc wRoutineVariable1,b
        jsr rsFloorGrowthAtZero
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetSelectedUnitTotalLuckGrowth ; 84/A566

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx
        lda #7
        jsl rlGetCharacterHolyBloodGrowthBoost
        sta wRoutineVariable1,b

        jsl rlGetSelectedUnitConstantDataPointer

        lda structStaticCharacterROMEntry.LuckGrowth - structStaticCharacterROMEntry.CharacterID,b,x
        and #$00FF
        clc
        adc wRoutineVariable1,b
        jsr rsFloorGrowthAtZero
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetSelectedUnitSkills ; 84/A58A

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx
        ldx wSelectedUnitDataRAMPointer,b
        lda $7E0000+structCharacterDataRAM.Type,x
        and #$00FF
        cmp #UnitTypeEnemy
        beq +

        jsl rlGetSelectedUnitConstantDataPointer
        lda structStaticCharacterROMEntry.Skills1 - structStaticCharacterROMEntry.CharacterID,b,x 
        sta lRoutineVariable,b
        lda structStaticCharacterROMEntry.Skills2 - structStaticCharacterROMEntry.CharacterID,b,x
        sta lRoutineVariable+1,b

        -
        plx
        plp
        plb
        rtl

        +
        lda #0
        sta lRoutineVariable+1,b
        lda #0
        sta lRoutineVariable,b
        bra -

        .databank 0

      rlCheckForSpecifiedHolyBlood ; 84/A5C0

        .al
        .autsiz
        .databank ?

        ; In:
        ; A     = holy blood index
        ; wSelectedUnitDataRAMPointer = unit pointer

        ; Out:
        ; A =
        ;     0 if no blood
        ;     1 if minor
        ;     2 if major

        phb
        php

        phk
        plb

        phx
        phy

        ldx wR0
        phx

        sta wR0
        ldx wSelectedUnitDataRAMPointer,b
        lda $7E0000+structCharacterDataRAM.Type,x
        and #$00FF
        cmp #UnitTypeEnemy
        beq _NotPlayable

        jsl rlGetSelectedUnitConstantDataPointer
        txy

        lda wR0
        asl a
        tax

        tya
        clc
        adc aCharacterStructHolyBloodOffsets,x
        tay

        lda aHolyBloodBitfieldTable,x
        lsr a
        ora aHolyBloodBitfieldTable,x
        and $0000,b,y
        beq _End

        cmp aHolyBloodBitfieldTable,x
        bcc +

          lda #2
          bra _End

        +
        lda #1
        bra _End
        
        _End
        plx
        stx wR0

        ply
        plx

        plp
        plb
        rtl

        _NotPlayable
        lda #0
        bra _End

        .databank 0

      aCharacterStructHolyBloodOffsets ; 84/A615

        .word $0012
        .word $0012
        .word $0012
        .word $0012
        .word $0012
        .word $0012
        .word $0012
        .word $0012
        .word $0014
        .word $0014
        .word $0014
        .word $0014
        .word $0014

      aHolyBloodBitfieldTable ; 84/A62F

        .word $0002
        .word $0008
        .word $0020
        .word $0080
        .word $0200
        .word $0800
        .word $2000
        .word $8000
        .word $0002
        .word $0008
        .word $0020
        .word $0080
        .word $0200

      rlGetCharacterHolyBloodGrowthBoost ; 84/A649

        .al
        .autsiz
        .databank ?

        ; In:
        ; A = stat offset, HP = 0, Str = 1, ...

        ; Out:
        ; A = total bonus granted by holy blood

        phb
        php

        phk
        plb

        phx
        phy

        ldx wR0
        phx
        ldx wR1
        phx

        sta wRoutineVariable1,b
        stz wR1
        ldy #(size(aHolyBloodGrowthBoostsOffsets)/2)-1
        
        -
        tya
        jsl rlCheckForSpecifiedHolyBlood
        ora #0
        beq _HolyBloodContinue

        sta wR0

        tya
        asl a
        tax
        lda aHolyBloodGrowthBoostsOffsets,x
        adc wRoutineVariable1,b
        tax
        lda aHolyBloodGrowthBoostsOffsets+2,x
        bit #$0080
        bne +

        and #$007F
        bra ++

        +
        ora #$FF80

        +
        dec wR0
        beq +

          ; Double bonus if major
          asl a
        
        +
        clc
        adc wR1
        sta wR1
        
        _HolyBloodContinue
        dec y
        bpl -

        lda wR1

        plx
        stx wR1
        plx 
        stx wR0

        ply
        plx

        plp
        plb
        rtl

        .databank 0

      rlUnknown84A69F ; 84/A69F

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx

        asl a
        tax
        lda aHolyBloodGrowthBoostsOffsets,x
        tax
        lda aHolyBloodGrowthBoostsOffsets+1,x
        and #$00FF

        plx
        plp
        plb
        rtl

        .databank 0

      rlGetWeaponStatBoostForSpecifiedStat ; 84/A6B6

        .al
        .autsiz
        .databank ?

        ; A = stat ID

        phb
        php
        phk
        plb
        phx
        ldx wRoutineVariable1,b
        phx

        dec a
        sta wRoutineVariable1,b

        jsl rlGetActiveWeaponStatBonus
        ora #0
        beq _End

        ; only boost IDs below $0E belong to holy weapons
        cmp #$000E
        bcs +

        dec a
        asl a
        tax
        lda aHolyBloodGrowthBoostsOffsets,x
        clc
        adc wRoutineVariable1,b
        tax
        lda aHolyBloodGrowthBoostsOffsets+structHolyBloodDataEntry.StrBoost,x
        and #$00FF

        _End
        plx
        stx wRoutineVariable1,b
        plx
        plp
        plb
        rtl
        
        +
        lda #0
        bra _End

        .databank 0

      rlGetEnemyUnitConstantDataPointer ; 84/A6F1

        .al
        .autsiz
        .databank ?

        ; Gets the rom pointer + structEnemyCharacterROMEntry.CharacterID

        ldx wSelectedUnitDataRAMPointer,b
        sep #$20
        lda $7E0000+10+2,x
        pha
        rep #$20
        plb
        lda $7E0000+10,x
        tax
        rtl

        .databank 0

      rlGetEnemyUnitCharacterID ; 84/A704

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx
        jsl rlGetEnemyUnitConstantDataPointer
        lda structEnemyCharacterROMEntry.CharacterID - structEnemyCharacterROMEntry.CharacterID,b,x 
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetEnemyUnitNameID ; 84/A714

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx
        jsl rlGetEnemyUnitConstantDataPointer
        lda structEnemyCharacterROMEntry.CharacterName - structEnemyCharacterROMEntry.CharacterID,b,x
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetEnemyUnitClassID ; 84/A724

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx
        jsl rlGetEnemyUnitConstantDataPointer
        lda structEnemyCharacterROMEntry.Class - structEnemyCharacterROMEntry.CharacterID,b,x
        and #$00FF
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetEnemyUnitGender ; 84/A737

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx

        jsl rlGetEnemyUnitConstantDataPointer
        lda structEnemyCharacterROMEntry.Gender - structEnemyCharacterROMEntry.CharacterID,b,x
        bit #$0080
        bne +

        and #$007F
        bra ++
        
        +
        ora #$FF80
        
        +
        plx

        plp
        plb

        rtl

        .databank 0

      rlGetEnemyUnitLevel ; 84/A754

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        jsl rlGetEnemyUnitConstantDataPointer
        lda structEnemyCharacterROMEntry.Level - structEnemyCharacterROMEntry.CharacterID,b,x
        and #$00FF
        plx
        plp
        plb
        rtl

        .databank 0

      rlGetEnemyUnitLeadershipStars ; 84/A767

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        jsl rlGetEnemyUnitConstantDataPointer
        lda structEnemyCharacterROMEntry.LeadershipStars - structEnemyCharacterROMEntry.CharacterID,b,x
        and #$00FF
        plx
        plp
        plb
        rtl

        .databank 0

      rlGetEnemyUnitGenerationID ; 84/A77A

        .al
        .autsiz
        .databank ?

        phb
        php

        phk
        plb

        phx
        jsl rlGetEnemyUnitConstantDataPointer
        lda structEnemyCharacterROMEntry.GenerationID - structEnemyCharacterROMEntry.CharacterID,b,x 
        and #$00FF
        plx

        plp
        plb
        rtl

        .databank 0

      rlGetEnemyClassHPGrowth ; 84/A78D

        .al
        .autsiz
        .databank ?

        jsl rlGetSelectedUnitClassDataPointer
        jsl rlGetClassHPGrowth
        rtl

        .databank 0

      rlGetEnemyClassStrGrowth ; 84/A796

        .al
        .autsiz
        .databank ?

        jsl rlGetSelectedUnitClassDataPointer
        jsl rlGetClassStrGrowth
        rtl

        .databank 0

      rlGetEnemyClassMagGrowth ; 84/A79F

        .al
        .autsiz
        .databank ?

        jsl rlGetSelectedUnitClassDataPointer
        jsl rlGetClassMagGrowth
        rtl

        .databank 0

      rlGetEnemyClassSklGrowth ; 84/A7A8

        .al
        .autsiz
        .databank ?

        jsl rlGetSelectedUnitClassDataPointer
        jsl rlGetClassSklGrowth
        rtl

        .databank 0

      rlGetEnemyClassSpdGrowth ; 84/A7B1

        .al
        .autsiz
        .databank ?

        jsl rlGetSelectedUnitClassDataPointer
        jsl rlGetClassSpdGrowth
        rtl

        .databank 0

      rlGetEnemyClassDefGrowth ; 84/A7BA

        .al
        .autsiz
        .databank ?

        jsl rlGetSelectedUnitClassDataPointer
        jsl rlGetClassDefGrowth
        rtl

        .databank 0

      rlGetEnemyClassResGrowth ; 84/A7C3

        .al
        .autsiz
        .databank ?

        jsl rlGetSelectedUnitClassDataPointer
        jsl rlGetClassResGrowth
        rtl

        .databank 0

      rlGetEnemyClassMoney ; 84/A7CC

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        jsl rlGetSelectedUnitPersonalDataPointer
        lda structPersonalCharacterDataRAM.ClassMoney,b,x
        and #$00FF
        phk
        plb
        sep #$20
        sta WRMPYA,b
        lda #100
        sta WRMPYB,b
        nop
        nop
        nop
        rep #$20
        lda RDMPY,b
        plx
        plp
        plb
        rtl

        .databank 0

      rlSetEnemyClassMoney ; 84/A7F3

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        sta WRDIVA,b
        sep #$20
        lda #100
        sta WRDIVB,b
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        rep #$20
        lda RDDIV,b

        pha
        jsl rlGetSelectedUnitPersonalDataPointer
        pla

        and #$003F
        sep #$20
        sta structPersonalCharacterDataRAM.ClassMoney,b,x
        rep #$20
        plx
        plp
        plb
        rtl

        .databank 0

      rlGetSelectedUnitMapSprite ; 84/A822

        .al
        .autsiz
        .databank ?

        ; Input:
        ; Filled wSelectedUnitDataRAMPointer

        ; Output:
        ; A = MapSpriteID

        phb
        php
        phk
        plb
        phx

        lda wR0
        pha
        lda wR1
        pha

        jsl rlGetSelectedUnitGender
        sta wR0
        jsl rlGetSelectedUnitCharacterID
        sta wR1
        jsl rlGetSelectedUnitClassID
        jsr rsGetClassMapSprite

        plx
        stx wR1
        plx
        stx wR0

        plx
        plp
        plb
        rtl

        .databank 0

      rsGetClassMapSprite ; 84/A84A

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = ClassID
        ; wR0 = gender
        ; wR1 = CharacterID

        ; Output:
        ; A = MapSpriteID

        phx
        asl a
        tax
        lda aClassMapSpriteAssignmentOffsets,x
        clc
        adc #<>aClassMapSpriteAssignmentOffsets
        tax
        
        -
        lda $830000 + structClassMapSpriteAssignment.Gender,x
        and #$00FF
        cmp #$00FF
        beq _End

          cmp wR0
          bne +

            lda $830000 + structClassMapSpriteAssignment.CharacterID,x
            beq _End

              cmp wR1
              beq _End

          +
          txa
          clc
          adc #size(structClassMapSpriteAssignment)
          tax
          bra -

        _End
        lda $830000 + structClassMapSpriteAssignment.SpriteID,x
        plx
        rts

        .databank 0

      rlUnknown84A87E ; 84/A87E

        .al
        .autsiz

        ; wRoutineVariable1 = inv slot

        phb
        phk
        plb
        phx
        jsl rlGetSelectedUnitFactionSlot
        ora #0
        bne _CLC

          jsl rlGetUnitType
          cmp #UnitTypeHoly
          bcs _CLC

            lda wRoutineVariable1,b
            beq _End

              jsl rlGetItemRAMStructEntryByInventorySlot
              bcs _CLC

                jsl rlReduceItemCurrentDurability
                bcc _End

                  jsl rlGetItemROMPointerByItemRAMStructEntry
                  jsl rlGetItemWeaponType
                  cmp #WeaponTypeFire
                  bcc +

                    lda #0
                    sta wRoutineVariable1,b
                    jsl rlSetEquippedInventorySlot

                  +
                  jsl rlSaveEquippedWeaponStatBonus
                  sec

            _End
            plx
            plb
            rtl
        
        _CLC
        clc
        bra _End

        .databank 0

      rlActionStructInflictDamage ; 84/A8C7

        .al
        .autsiz
        .databank ?

        ; A = attacker character ID
        ; wRoutineVariable1 = damage dealt

        ; sec if fatal

        phb
        phk
        plb
        phx
        phy
        ldx wR10
        phx
        ldx wR1
        phx

        sta wR10

        lda wRoutineVariable1,b
        beq _CLC

        cmp #80
        bcc +

        lda #80
        sta wRoutineVariable1,b

        +
        jsl rlGetSelectedUnitPersonalDataPointer

        sep #$20
        lda structPersonalCharacterDataRAM.CurrentHP,b,x
        cmp wRoutineVariable1
        bcs +

          sta wRoutineVariable1

        +
        lda structPersonalCharacterDataRAM.CurrentHP,b,x
        sec
        sbc wRoutineVariable1
        sta structPersonalCharacterDataRAM.CurrentHP,b,x
        rep #$20

        and #$00FF
        beq +

        cmp #11
        bcs _CLC

        lda #UnitStateMiracleActive
        jsl rlSetSelectedUnitStates
        
        _CLC
        clc
        
        -
        plx
        stx wR1
        plx
        stx wR10
        ply
        plx
        plb
        rtl

        +
        jsl rlActionStructHandleUnitDeath
        sec
        bra -

        .databank 0

      rlHealSelectedUnitsHP ; 84/A927

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        lda wRoutineVariable1,b
        pha

        lda wRoutineVariable1,b
        beq _CLC

        cmp #80
        bcc +

          lda #80
          sta wRoutineVariable1,b

        +
        jsl rlGetSelectedUnitPersonalDataPointer

        sep #$20
        lda structPersonalCharacterDataRAM.CurrentHP,b,x
        and #$FF
        clc
        adc wRoutineVariable1
        pha
        rep #$20

        jsl rlGetSelectedUnitMaxHP
        sta wRoutineVariable1,b

        sep #$20
        pla
        cmp wRoutineVariable1,b
        bcc +

          lda wRoutineVariable1,b
          sta structPersonalCharacterDataRAM.CurrentHP,b,x
          rep #$20

          pla
          sta wRoutineVariable1,b
          plx
          plp
          plb
          sec
          bra _End

        +
        sta structPersonalCharacterDataRAM.CurrentHP,b,x
        rep #$20
        
        _CLC
        pla
        sta wRoutineVariable1,b
        plx
        plp
        plb
        clc
        
        _End
        rtl

        .databank 0

      rlActionStructSetUnitDeath ; 84/A982

        .al
        .autsiz
        .databank ?

        ; Run when a unit doesnt have the escape skill or the PoW skill + its not ch11

        phb
        php
        phk
        plb
        lda wRoutineVariable1,b
        pha

        jsl rlGetSelectedUnitDeploymentOffset
        sta wDefeatedUnitDeploymentOffset,b

        tax
        lda aDeploymentTable._StateBuffer,x
        ora #DeploymentStateDefeated
        sta aDeploymentTable._StateBuffer,x
        lda aDeploymentTable._State,x
        ora #DeploymentStateDefeated
        sta aDeploymentTable._State,x

        lda #UnitStateDead
        jsl rlSetSelectedUnitStates

        pla
        sta wRoutineVariable1,b
        plp
        plb
        rtl

        .databank 0

      rlReviveSelectedCharacter ; 84/A9B6

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        jsl rlGetSelectedUnitFactionSlot
        jsl rlGetFactionSlotLocationID
        sta wRoutineVariable1,b

        jsl rlGetSelectedUnitDeploymentOffset
        tax

        lda wRoutineVariable1,b
        jsl rlSetUnitResidingInCastle
        lda aDeploymentTable._StateBuffer,x
        and #~(DeploymentStateAsleep | DeploymentStateDefeated | DeploymentStateGrayed)
        sta aDeploymentTable._StateBuffer,x
        sta aDeploymentTable._State,x

        lda #(UnitStateMoved | UnitStateDead)
        jsl rlUnsetSelectedUnitStates

        lda #StatusHealthy
        jsl rlSetSelectedUnitStatus
        lda #0
        jsl rlSetSelectedUnitStatusDuration

        jsl rlGetSelectedUnitMaxHP
        jsl rlSetSelectedUnitCurrentHP
        jsl rlGetSelectedUnitPersonalDataPointer
        jsl rlGetSelectedUnitClassDataPointer
        jsl rlGetClassMoney

        sep #$20
        sta structPersonalCharacterDataRAM.ClassMoney,b,x
        rep #$20
        plx
        plp
        plb
        rtl

        .databank 0

      rlActionStructLevelUp ; 84/AA15

        .al
        .autsiz
        .databank ?

        ; wRoutineVariable1 = gained exp

        phb
        php
        phk
        plb
        phx
        ldx wSelectedUnitDataRAMPointer,b
        lda $7E0000+structCharacterDataRAM.Type,x
        and #$00FF
        cmp #UnitTypeHoly
        bcc +

          jml _NoEXP

        +
        jsl rlGetSelectedUnitFactionSlot
        ora #0
        bne _NoEXP

        jsl rlGetSelectedUnitCurrentHP
        ora #0
        beq _NoEXP

        lda wRoutineVariable1,b
        beq +

          jsl rlGetSelectedUnitExtendedPersonalDataPointer
          lda structExtendedCharacterDataRAM.Level,b,x
          and #$00FF
          cmp #30
          bcs _NoEXP

            sep #$20
            lda structExtendedCharacterDataRAM.Experience,b,x
            clc
            adc wRoutineVariable1
            cmp #100
            bcs ++

              sta structExtendedCharacterDataRAM.Experience,b,x
              rep #$20

        +
        lda #0
        plx
        plp
        plb
        clc
        rtl
        
        .as

        +
        sec
        sbc #100
        sta structExtendedCharacterDataRAM.Experience,b,x
        rep #$20

        lda structExtendedCharacterDataRAM.Level,b,x
        and #$00FF
        inc a
        cmp #30
        bcc +

          sep #$20
          lda wRoutineVariable1
          sec
          sbc structExtendedCharacterDataRAM.Experience,b,x
          sta wRoutineVariable1
          lda #0
          sta structExtendedCharacterDataRAM.Experience,b,x
          rep #$20

        +
        lda wRoutineVariable1
        pha
        jsl rlGetLevelUpStats
        pla
        sta wRoutineVariable1

        lda #1
        plx
        plp
        plb
        clc
        
        -
        rtl

        _NoEXP
        lda #0
        sta wRoutineVariable1
        plx
        plp
        plb
        sec
        bra -

        .databank 0

      rlGetLevelUpStats ; 84/AABA

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        phy
        jsl rlGetSelectedUnitExtendedPersonalDataPointer
        lda structExtendedCharacterDataRAM.Level,b,x
        and #$00FF
        inc a
        cmp #31
        bcc +

          jml _End

        +
        sep #$20
        sta structExtendedCharacterDataRAM.Level,b,x
        rep #$20

        lda wTotalLevelUpCount
        inc a
        sta wTotalLevelUpCount

        sep #$20
        lda #$7E
        pha
        rep #$20
        plb

        ldy lRoutineVariable,b
        jsl rlGetSelectedUnitMaxHP
        sta structLevelUpStats.HP,b,y
        jsr rsApplyLevelUpHPGain
        sta structLevelUpStats.HPGain,b,y

        jsl rlGetSelectedUnitTotalStrengthEffect
        sta structLevelUpStats.Strength,b,y
        jsr rsApplyLevelUpStrengthGain
        sta structLevelUpStats.StrengthGain,b,y

        jsl rlGetSelectedUnitTotalMagicEffect
        sta structLevelUpStats.Magic,b,y
        jsr rsApplyLevelUpMagicGain
        sta structLevelUpStats.MagicGain,b,y

        jsl rlGetSelectedUnitTotalSkillEffect
        sta structLevelUpStats.Skill,b,y
        jsr rsApplyLevelUpSkillGain
        sta structLevelUpStats.SkillGain,b,y

        jsl rlGetSelectedUnitTotalSpeedEffect
        sta structLevelUpStats.Speed,b,y
        jsr rsApplyLevelUpSpeedGain
        sta structLevelUpStats.SpeedGain,b,y

        jsl rlGetSelectedUnitLuck
        sta structLevelUpStats.Luck,b,y
        jsr rsApplyLevelUpLuckGain
        sta structLevelUpStats.LuckGain,b,y

        jsl rlGetSelectedUnitTotalDefenseEffect
        sta structLevelUpStats.Defense,b,y
        jsr rsApplyLevelUpDefenseGain
        sta structLevelUpStats.DefenseGain,b,y

        jsl rlGetSelectedUnitTotalResistanceEffect
        sta structLevelUpStats.Resistance,b,y
        jsr rsApplyLevelUpResistanceGain
        sta structLevelUpStats.ResistanceGain,b,y
        
        _End
        ply
        plx
        plp
        plb
        rtl

        .databank 0

      rlUnknown84AB5C ; 84/AB5C

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        ldx wRoutineVariable1,b
        phx

        sta wRoutineVariable1,b
        jsl rlGetSelectedUnitFactionSlot
        ora #0
        bne _End

          lda wRoutineVariable1,b
          beq _End

            jsl rlGetItemRAMStructEntryByInventorySlot
            bcs _End

              lda #1
              jsl rlAddToItemRAMKillCount
              stz wRoutineVariable1,b

              lda wCurrentChapter,b
              cmp #6
              bcc +

                lda #24
                sta wRoutineVariable1,b

              +
              jsl rlGetSelectedUnitGenerationID
              dec a
              clc
              adc wRoutineVariable1,b
              asl a
              tax
              lda aUnitWinCounts,x
              inc a
              sta aUnitWinCounts,x

        _End
        pla
        sta wRoutineVariable1,b
        plx
        plp
        plb
        rtl

        .databank 0

        ; 84/ABB0

    .endsection Code84A333Section



    .section Code84ACE7Section

      rsRollForStatGrowth ; 84/ACE7

        .al
        .autsiz
        .databank ?

        stz wRoutineVariable1,b
        cmp #100
        bcc +

          inc wRoutineVariable1,b
          sec
          sbc #100

        +
        jsl rlRollForChance
        bcs +

          inc wRoutineVariable1,b

        +
        rts

        .databank 0

      rsApplyLevelUpHPGain ; 84/AD00

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        jsl rlGetSelectedUnitTotalHPGrowth
        jsr rsRollForStatGrowth
        jsl rlGetSelectedUnitExtendedPersonalDataPointer

        sep #$20
        lda structExtendedCharacterDataRAM.HP,b,x
        cmp #80
        bcs ++

          clc
          adc wRoutineVariable1,b
          cmp #80 +1
          bcc +

            lda #80

          +
          sta structExtendedCharacterDataRAM.HP,b,x
          rep #$20
          plx
          plp
          plb
          lda wRoutineVariable1,b
          rts

        +
        rep #$20
        plx
        plp
        plb
        lda #0
        rts

        .databank 0

      rsApplyLevelUpStrengthGain ; 84/AD38

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        jsl rlGetSelectedUnitTotalStrGrowth
        jsr rsRollForStatGrowth
        jsl rlGetSelectedUnitExtendedPersonalDataPointer

        sep #$20
        lda structExtendedCharacterDataRAM.Strength,b,x
        cmp #15
        bcs ++

          clc
          adc wRoutineVariable1,b
          cmp #15 +1
          bcc +

            lda #15

          +
          sta structExtendedCharacterDataRAM.Strength,b,x
          rep #$20
          plx
          plp
          plb
          lda wRoutineVariable1,b
          rts

        +
        rep #$20
        plx
        plp
        plb
        lda #0
        rts

        .databank 0

      rsApplyLevelUpMagicGain ; 84/AD70

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        jsl rlGetSelectedUnitTotalMagGrowth
        jsr rsRollForStatGrowth
        jsl rlGetSelectedUnitExtendedPersonalDataPointer

        sep #$20
        lda structExtendedCharacterDataRAM.Magic,b,x
        cmp #15
        bcs ++

          clc
          adc wRoutineVariable1,b
          cmp #15+1
          bcc +

            lda #15

          +
          sta structExtendedCharacterDataRAM.Magic,b,x
          rep #$20
          plx
          plp
          plb
          lda wRoutineVariable1,b
          rts

        +
        rep #$20
        plx
        plp
        plb
        lda #0
        rts

        .databank 0

      rsApplyLevelUpSkillGain ; 84/ADA8

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        jsl rlGetSelectedUnitTotalSklGrowth
        jsr rsRollForStatGrowth
        jsl rlGetSelectedUnitExtendedPersonalDataPointer

        sep #$20
        lda structExtendedCharacterDataRAM.Skill,b,x
        cmp #15
        bcs ++

          clc
          adc wRoutineVariable1,b
          cmp #15+1
          bcc +

            lda #15

          +
          sta structExtendedCharacterDataRAM.Skill,b,x
          rep #$20
          plx
          plp
          plb
          lda wRoutineVariable1,b
          rts

        +
        rep #$20
        plx
        plp
        plb
        lda #0
        rts

        .databank 0

      rsApplyLevelUpSpeedGain ; 84/ADE0

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        jsl rlGetSelectedUnitTotalSpdGrowth
        jsr rsRollForStatGrowth
        jsl rlGetSelectedUnitExtendedPersonalDataPointer

        sep #$20
        lda structExtendedCharacterDataRAM.Speed,b,x
        cmp #15
        bcs ++

          clc
          adc wRoutineVariable1,b
          cmp #15+1
          bcc +

            lda #15

          +
          sta structExtendedCharacterDataRAM.Speed,b,x
          rep #$20
          plx
          plp
          plb
          lda wRoutineVariable1,b
          rts

        +
        rep #$20
        plx
        plp
        plb
        lda #0
        rts

        .databank 0

      rsApplyLevelUpDefenseGain ; 84/AE18

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        jsl rlGetSelectedUnitTotalDefGrowth
        jsr rsRollForStatGrowth
        jsl rlGetSelectedUnitExtendedPersonalDataPointer

        sep #$20
        lda structExtendedCharacterDataRAM.Defense,b,x
        cmp #15
        bcs ++

          clc
          adc wRoutineVariable1,b
          cmp #15+1
          bcc +

            lda #15

          +
          sta structExtendedCharacterDataRAM.Defense,b,x
          rep #$20
          plx
          plp
          plb
          lda wRoutineVariable1,b
          rts

        +
        rep #$20
        plx
        plp
        plb
        lda #0
        rts

        .databank 0

      rsApplyLevelUpResistanceGain ; 84/AE50

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        jsl rlGetSelectedUnitTotalResGrowth
        jsr rsRollForStatGrowth
        jsl rlGetSelectedUnitExtendedPersonalDataPointer

        sep #$20
        lda structExtendedCharacterDataRAM.Resistance,b,x
        cmp #15
        bcs ++

          clc
          adc wRoutineVariable1,b
          cmp #15+1
          bcc +

            lda #15

          +
          sta structExtendedCharacterDataRAM.Resistance,b,x
          rep #$20
          plx
          plp
          plb
          lda wRoutineVariable1,b
          rts

        +
        rep #$20
        plx
        plp
        plb
        lda #0
        rts

        .databank 0

      rsApplyLevelUpLuckGain ; 84/AE88

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        jsl rlGetSelectedUnitTotalLuckGrowth
        jsr rsRollForStatGrowth
        jsl rlGetSelectedUnitExtendedPersonalDataPointer

        sep #$20
        lda structExtendedCharacterDataRAM.Luck,b,x
        cmp #30
        bcs ++

          clc
          adc wRoutineVariable1,b
          cmp #30+1
          bcc +

            lda #30

          +
          sta structExtendedCharacterDataRAM.Luck,b,x
          rep #$20
          plx
          plp
          plb
          lda wRoutineVariable1,b
          rts

        +
        rep #$20
        plx
        plp
        plb
        lda #0
        rts

        .databank 0

      rlUnknown84AEC0 ; 84/AEC0

        .al
        .autsiz
        .databank ?

        ; Input:
        ; filled wSelectedUnitDataRAMPointer

        phb
        php
        phk
        plb
        phx

        jsl rlGetSelectedUnitStates
        bit #UnitStateFielded
        bne +

          lda #UnitStateFielded
          jsl rlSetSelectedUnitStates

        +
        jsl rlGetSelectedUnitDeploymentOffset
        bcs +

          ; already deployed

          tax
          jsl rlGetSelectedUnitFactionSlot

          jsl rlChangeFactionSlotOfFieldedSelectedUnit
          jsl rlDeployedUnitSetAliveUnsetHidden
          jsl rlUnknown84C996
          stx wRoutineVariable1,b
          bra ++

          +
          jsl rlDeployUnitCheckIfAsleep

          sta wRoutineVariable1,b
          jsl rlSetSelectedUnitDeploymentOffset
        
        +
        plx
        plp
        plb
        rtl

        .databank 0

      rlSetUnitUnfieldedInCastle ; 84/AF00

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = castle ID

        phb
        php
        phk
        plb
        phx

        and #$001F
        jsl rlSetSelectedUnitResidingCastle
        lda #UnitStateFielded
        jsl rlUnsetSelectedUnitStates

        plx
        plp
        plb
        rtl

        .databank 0

        ; 84/AF17

    .endsection Code84ACE7Section


    .section Code84B1B8Section

      rlAssignUnitToNewFactionSlot ; 84/B1B8

        .al
        .autsiz
        .databank ?

        ; Input:
        ; wRoutineVariable1 = FactionSlot

        phb
        php
        phk
        plb
        phx

        lda wRoutineVariable1,b
        jsl rlAssignUnitToFactionSlot

        plx
        plp
        plb
        rtl

        .databank 0

      rlActionStructSetUnitDefeatedEscape ; 84/B1C8

        .al
        .autsiz
        .databank ?

        jsl rlGetSelectedUnitDeploymentOffset
        jsl rlDeployedUnitSetDefeated

        lda #1
        sta $0D81,b

        jsl rlGetSelectedUnitFactionSlot
        cmp #7
        bcs +

          jsl rlRemoveSelectedUnitFromFactionSlot

        +
        rtl

        .databank 0

      rlUndeployUnit ; 84/B1E4

        .al
        .autsiz
        .databank ?

        phx
        jsl rlGetSelectedUnitStates
        bit #UnitStateGuardingCastle
        beq +

          lda #UnitStateGuardingCastle
          jsl rlUnsetSelectedUnitStates

          jsl rlGetSelectedUnitHomeCastle
          bcc +

            jsl rlGetLocationEventDataEntry
            bcs +

              jsl rlUnsetCastleGuarded

        +
        jsl rlGetSelectedUnitDeploymentOffset
        jsl rlGetSelectedUnitFactionSlot
        cmp #7
        bcs _End

          jsl rlRemoveSelectedUnitFromFactionSlot

          lda #7
          jsl rlSetSelectedUnitFaction

          jsl rlGetSelectedUnitDeploymentOffset
          cmp #$00FF
          beq _End

            tax
            jsl rlClearUnitDeploymentData
            lda aDeploymentTable._StateBuffer,x
            sta aDeploymentTable._State,x

            lda #$00FF
            jsl rlSetSelectedUnitDeploymentOffset

        _End
        plx
        rtl

        .databank 0

      rlAddSelectedCharacterMoney ; 84/B23C

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        phy

        ldy #0

        jsl rlGetSelectedUnitExtendedPersonalDataPointer

        lda structExtendedCharacterDataRAM.Money,b,x
        clc
        adc wRoutineVariable1,b
        bcs +

        cmp #50000+1
        bcc ++
        
        +
        sec
        sbc #50000
        tay

        lda #50000

        +
        sta structExtendedCharacterDataRAM.Money,b,x
        tya
        ply
        plx
        plp
        plb
        rtl

        .databank 0

      rlSubtractSelectedCharacterMoney ; 84/B268

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx

        jsl rlGetSelectedUnitMoney
        sec
        sbc wRoutineVariable1,b
        bcs +

          lda #0
        
        +
        jsl rlSetSelectedUnitMoney

        plx
        plp
        plb
        rtl

        .databank 0

      rlUnknown84B282 ; 84/B282

        .al
        .autsiz
        .databank ?

        phb
        phk
        plb
        lda wR0
        pha

        lda wRoutineVariable1,b
        jsl rlGetItemRAMStructEntryByPlayerItemIndex
        jsl $87E1FD
        sta wR0

        lda #$001C
        jsl rlCheckIfUnitHasSpecifiedPersonalOrClassSkill
        bcs +

        lda #$001C
        jsl rlCheckIfInventoryItemsHaveSpecifiedSkill
        bcc ++
        
        +
        lsr wR0

        +
        jsl rlGetSelectedUnitMoney
        cmp wR0
        bcc _SEC

        jsl rlGivePlayerItemIDToSelectedUnit

        lda wR0
        sta wRoutineVariable1,b
        jsl rlSubtractSelectedCharacterMoney
        clc

        -
        pla
        sta wR0
        plb
        rtl

        _SEC
        sec
        bra -

        .databank 0

      rlUnknown84B2C7 ; 84/B2C7

        .al
        .autsiz
        .databank ?

        phb
        phk
        plb
        lda wR0
        pha

        lda wRoutineVariable1,b
        cmp #8
        bcs _End

        jsl $84F96E
        sta wR0
        jsl rlGetItemROMPointerByItemRAMStructEntry
        jsl rlGetItemWeaponRank
        cmp #$FFFF
        beq _SEC

        lda wRoutineVariable1,b
        jsl rlRemoveItemInSpecifiedInventorySlot
        lda wR0
        sta wRoutineVariable1,b
        jsl rlAddSelectedCharacterMoney
        clc

        _End
        pla
        sta wR0
        plb
        rtl

        _SEC
        sec
        bra _End

        .databank 0

      rlUnknown84B301 ; 84/B301

        .al
        .autsiz
        .databank ?

        phb
        phk
        plb

        lda $057E,b
        jsl $84F3B5
        jsl $87E422
        cmp #$FFFF
        beq _SEC

        lda $057E,b
        jsl rlRemoveItemInSpecifiedInventorySlot
        clc
        
        -
        plb
        rtl
        
        _SEC
        sec
        bra -

        .databank 0

      rlUnknown84B321 ; 84/B321

        .al
        .autsiz
        .databank ?

        lda wSelectedInventorySlot,b
        beq +

          jsl rlFlagEquippedInventorySlotAndGetStatBonus
        
        +
        rtl

        .databank 0

        ; 84/B32B

    .endsection Code84B1B8Section

    .section Code84B3E4Section

      rlDumpInventorySlotIntoSupplyIfFilled ; 84/B3E4

        .al
        .autsiz
        .databank ?

        phb
        phk
        plb
        lda wSelectedInventorySlot,b
        jsl rlGetItemRAMStructEntryByInventorySlot
        bcs +

          lda #2
          sta wR0
          lda wSelectedUnitDataRAMPointer,b
          sta wR1
          jsl rlSetItemRAMStateAndOwner

          lda wSelectedInventorySlot,b
          jsl rlRemoveItemInSpecifiedInventorySlot

        +
        plb
        rtl

        .databank 0

      rlChangeFactionSlotOfSelectedUnit ; 84/B407

        .al
        .autsiz
        .databank ?

        ; Input:
        ; filled wSelectedUnitDataRAMPointer
        ; wRoutineVariable1 = FactionSlot

        phb
        php
        phk
        plb

        jsl rlGetSelectedUnitFactionSlot
        cmp wRoutineVariable1,b
        beq +

          jsl rlRemoveSelectedUnitFromFactionSlot
          jsl rlAssignUnitToNewFactionSlot

          lda #UnitStateGroupLeader
          jsl rlUnsetSelectedUnitStates

        +
        plp
        plb
        rtl

        .databank 0

      rlUnknown84B426 ; 84/B426

        .al
        .autsiz
        .databank ?

        phb 
        php
        phk
        plb

        lda wR0
        pha
        lda wR1
        pha

        lda wRoutineVariable1,b
        jsl rlGetItemRAMStructEntryByInventorySlot
        bcs +

          lda #2
          sta wR0
          lda wSelectedUnitDataRAMPointer,b
          sta wR1
          jsl rlSetItemRAMStateAndOwner

          lda wRoutineVariable1,b
          jsl rlRemoveItemInSpecifiedInventorySlot

        +
        pla
        sta wR1
        pla
        sta wR0

        plp
        plb
        rtl

        .databank 0

      rlGiveItemToUnitCheckEncumbered ; 84/B457

        .al
        .autsiz
        .databank ?

        ; Input:
        ; wRoutineVariable1 = player item ID

        phb
        php
        phk
        plb
        phx
        jsl rlGiveItemToUnit
        jsl rlGetSelectedUnitInventorySize
        cmp #8
        bcc +

          jsl rlGetSelectedUnitDeploymentOffset
          sta $0D89,b

        +
        plx
        plp
        plb
        rtl

        .databank 0

      rlUnknown84B474 ; 84/B474

        .al
        .autsiz
        .databank ?

        lda #UnitState0400
        jsl rlSetSelectedUnitStates
        rtl

        .databank 0

      rlActionStructSetUnitDefeatedPoW ; 84/B47C

        .al
        .autsiz
        .databank ?

        jsl rlGetSelectedUnitDeploymentOffset
        jsl rlDeployedUnitSetDefeated

        lda #2
        sta $0D81,b

        lda #StatusCaptive
        jsl rlSetSelectedUnitStatus
        rtl

        .databank 0

      rlUnknown84B492 ; 84/B492

        .al
        .autsiz
        .databank ?

        ; Unit died in the arena

        phb
        php
        phk
        plb
        phx

        lda #1
        jsl rlSetSelectedUnitCurrentHP

        jsl rlGetSelectedUnitDeploymentOffset
        bcs +

          tax
          lda aDeploymentTable._StateBuffer,x
          ora #DeploymentStateDefeated
          sta aDeploymentTable._StateBuffer,x
          sta aDeploymentTable._State,x

          lda wUnknown000D79,b
          bit #$0020
          bne +

            stx wDefeatedUnitDeploymentOffset,b

        +
        plx
        plp
        plb
        rtl

        .databank 0

      rlUnknown84B4C3 ; 84/B4C3

        .al
        .autsiz
        .databank ?

        rtl

        .databank 0

      rlActionStructArenaWinResults ; 84/B4C4

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        lda wRoutineVariable1,b
        pha

        jsl rlGetSelectedUnitArenaLevel
        cmp #7
        bcs +

          pha
          asl a
          tax
          lda aArenaMoneyRewards,x
          sta wRoutineVariable1,b

          jsl rlAddSelectedCharacterMoney
          pla

          inc a
          jsl rlSetSelectedUnitArenaLevel
          lda wRoutineVariable1,b

          -
          plx
          stx wRoutineVariable1,b
          plx
          plp
          plb
          rtl

        +
        lda #0
        bra -

        .databank 0

      aArenaMoneyRewards ; 84/B4FA

        .word 1000
        .word 1500
        .word 2000
        .word 2500
        .word 3000
        .word 3500
        .word 4000

        ; 84/B508

    .endsection Code84B3E4Section


    .section Code84B8C1Section

      rlActionStructHandleUnitDeath ; 84/B8C1

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        phy
        ldx lR18
        phx
        ldx lR18+1
        phx

        jsl rlGetSelectedUnitStates
        bit #UnitStateGuardingCastle
        beq +

          lda #UnitStateGuardingCastle
          jsl rlUnsetSelectedUnitStates

          jsl rlGetSelectedUnitHomeCastle
          bcc +

            jsl rlGetLocationEventDataEntry
            bcs +

              jsl rlUnsetCastleGuarded

        +
        lda wUnknown000D79,b
        bit #$0010
        beq _B916

        lda wBattleType
        and #$00FF
        cmp #1
        bne _B916

          jsl rlGetSelectedUnitCurrentHP
          cmp #0
          beq +

            jml _BRK

          +
          jsl rlUnknown84B492
          jml _End

        _B916
        lda #UnitStateCanto
        jsl rlUnsetSelectedUnitStates

        lda #0
        jsl rlSetSelectedUnitCantoMovement

        lda #SkillIDEscape
        jsl rlCheckIfUnitHasSpecifiedPersonalOrClassSkill
        bcs _Escape

          lda #SkillIDPoW
          jsl rlCheckIfUnitHasSpecifiedPersonalOrClassSkill
          bcc _Regular

            lda wCurrentChapter,b
            cmp #11
            beq _Regular

              jsl rlActionStructSetUnitDefeatedPoW
              bra +

          _Regular
          jsl rlActionStructSetUnitDeath
          bra +

          _Escape
          jsl rlActionStructSetUnitDefeatedEscape
        
        +
        jsl rlGetSelectedUnitCharacterID
        jsl rlGetDeathQuote

        lda #1
        jsl rlSetBattleDeathQuotes

        jsl rlGetSelectedUnitFactionSlot
        ora #0
        bne _B981

          stz lR18

          lda wCurrentChapter,b
          cmp #6
          bcc +

            lda #24
            sta lR18

          +
          jsl rlGetSelectedUnitGenerationID
          dec a
          clc
          adc lR18
          jsl $91EB0F

        _B981
        lda #$18
        sta bEventActionIdentifier,b
        jsl rlGetSelectedUnitCharacterID
        sta wEventEngineArgument1,b
        lda wR10
        sta wEventEngineArgument2,b
        jsl rlGetAndRunChapterMapEventConditions

        _End
        pla
        sta lR18+1
        pla
        sta lR18
        ply
        plx
        plp
        plb
        rtl

        _BRK
        brk

        .databank 0

        ; 84/B9A3

    .endsection Code84B8C1Section



    .section Code84BAA1Section

      rlLoadChildUnit ; 84/BAA1

        .al
        .autsiz
        .databank ?

        ; Input:
        ; wRoutineVariable1 = 0 if male child, 1 if female

        phb
        php
        phk
        plb
        phx
        lda wSelectedUnitDataRAMPointer,b
        pha

        lda wRoutineVariable1,b
        sta wR2

        jsl rlGetSelectedUnitCharacterID
        cmp #Ethlyn
        beq +

          cmp #Deirdre
          beq +

            jsl rlGetSelectedUnitStates
            bit #UnitStateDead
            bne _End

        +
        ldx wSelectedUnitDataRAMPointer,b
        jsl rlGetSelectedUnitLoverGenerationID
        ora #0
        beq _End

          cmp #GEN_ID_Ethlyn
          bcs _End

            jsl rlGetUnitRAMDataPointerByID
            bcs _End

              ; father data?
              lda wSelectedUnitDataRAMPointer,b
              sta wR0

              ; mother data?
              stx wSelectedUnitDataRAMPointer,b
              lda wSelectedUnitDataRAMPointer,b
              sta wR1

              jsl rlGetSelectedUnitGenerationID
              cmp #GEN_ID_Deirdre
              bcc _End

                sec
                sbc #GEN_ID_Deirdre
                asl a
                tax

                lda wR2
                asl a
                clc
                adc aChildrenDataOffsets,x
                tax
                lda aChildrenDataOffsets,x
                beq _End

                  jsl rlLoadUnit

                  lda aChildrenPermanentFlags,x
                  bmi _End

                    jsl rlSetPermanentEventFlag

        _End
        pla
        sta wSelectedUnitDataRAMPointer,b
        plx
        plp
        plb
        rtl

        .databank 0

      aChildrenPermanentFlags ; 84/BB1E

        ; The first few entries are offsets, but it already gets indexed with an offset already.

        .sint 18
        .sint 22
        .sint 26
        .sint 30
        .sint 34
        .sint 38
        .sint 42
        .sint 46
        .sint 50

        .sint -1 ; Seliph
        .sint -1 ; None
        .sint -1 ; Leif
        .sint -1 ; Altena
        .sint PermanentFlagDiarmuidExists
        .sint PermanentFlagNannaExists
        .sint PermanentFlagScathachExists
        .sint PermanentFlagLarceiExists
        .sint PermanentFlagCedExists
        .sint PermanentFlagFeeExists
        .sint PermanentFlagArthurExists
        .sint PermanentFlagTineExists
        .sint PermanentFlagCoirpreExists
        .sint PermanentFlagLeneExists
        .sint PermanentFlagLesterExists
        .sint PermanentFlagLanaExists
        .sint PermanentFlagFebailExists
        .sint PermanentFlagPattyExists

        ; 84/BB54

    .endsection Code84BAA1Section




    .section Code84BB9ASection

      rlInitiateFactionRAMData ; 84/BB9A

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx

        lda #0
        sta aFactionArea

        ; IDs 0~6 get default data

        lda #(`aFactionArea)<<8
        sta lR18+1
        lda #<>aFactionArea
        sta lR18
        lda #(`aDefaultFactionData)<<8
        sta lR19+1
        lda #<>aDefaultFactionData
        sta lR19
        lda #size(aDefaultFactionData)
        sta wR0
        ldx #7

        -
        jsl rlAddOffsetTableEntry

        dec x
        bne -

        plx
        plp
        plb
        rtl

        .databank 0

      aDefaultFactionData .block ; 84/BBCD

          .structFactionHeader $80, $FF, 0, 0, 0

        .bend

      rlLoadFactionGroup ; 84/BBD2

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = faction
        ; wRoutineVariable1 = faction group ID

        phb
        php
        phk
        plb
        phx
        phy

        sta wR0

        jsr rsGetFactionSlotOffset
        bcc +

          jml _End

        +
        lda $7E0000,x
        and #$00FF
        cmp #$0080
        bne +

          ; faction entry is free

          lda wLoadedFactionCount,b
          cmp #7
          bcs +

            inc wLoadedFactionCount,b

        +
        lda wRoutineVariable1,b
        jsl rlGetFactionGroupPointerByID

        sep #$20
        lda wRoutineVariable1,b
        cmp $7E0000,x
        beq +

          sta $7E0000,x
          rep #$20

        +
        sep #$20
        lda #0
        sta $7E0002,x
        sta $7E0003,x
        rep #$20

        phy
        lda structFactionGroupData.LocationsPointer,b,y
        beq +

          tay
          lda $0000,b,y ; location ID
          sta $7E0000+1,x

          -
          lda $0000,b,y
          bmi +

            jsl rlGetLocationEventDataEntry

            lda wR0
            jsl rlSetLocationFactionSlotOwner
            inc y
            inc y
            bra -

        +
        ply
        phy
        lda structFactionGroupData.UnitsPointer,b,y
        beq _UnitsDone

          tay

          -
          lda $0000,b,y
          bmi _UnitsDone

          sta wRoutineVariable1,b
          jsl rlGetUnitRAMDataPointerByID
          bcs _NotLoaded

            jsl rlGetSelectedUnitFactionSlot
            cmp wR0
            bne +
            bra _Next

            _NotLoaded
            lda wRoutineVariable1,b
            jsl rlLoadUnit

            +
            lda wR0
            jsl rlAssignUnitToFactionSlot

            lda $7E0000 + 1,x
            jsl rlGetEventLocationEntryCoordinatesByID
            sta wRoutineVariable1,b

            jsl rlUnknown84AEC0

          _Next
          inc y
          inc y
          bra -

        _UnitsDone
        ply
        ldy #1
        
          -
          sty wRoutineVariable1,b
          lda wR0
          jsl rlGetUnitRAMDataPointerByFactionSlotEntryID

          lda wSelectedUnitDataRAMPointer,b
          beq _End

          phx
          lda $7E0000 + 1,x
          and #$001F

          pha
          jsl rlGetSelectedUnitDeploymentOffset
          tax
          pla

          jsl rlSetUnitResidingInCastle
          plx
          inc y
          bra -

        _End
        ply
        plx
        plp
        plb
        rtl

        .databank 0

      rlUnloadFactionSlot ; 84/BCAF

        .al
        .autsiz
        .databank ?

        ; Deletes all units in the specified faction slot, unless they are dynamic, then set them
        ; as factionless.
        ; Afterwards reset the faction header back to the default values.

        ; Input:
        ; A = FactionSlot

        phb
        php
        phk
        plb
        phx
        ldx wR1
        phx

        sta wR1
        jsl rlGetFactionSlotNameID
        cmp #$0080
        beq _End

          ldx #1

            _Loop
            stx wRoutineVariable1,b
            lda wR1
            jsl rlGetUnitRAMDataPointerByFactionSlotEntryID
            lda wSelectedUnitDataRAMPointer,b
            beq _Continue

              jsl rlGetUnitType
              cmp #UnitTypeDynamic
              beq +

                jsl rlDeleteUnit
                bra _Next

              +
              lda #Factionless
              jsl rlSetSelectedUnitFaction

              _Next
              inc x
              bra _Loop

          _Continue
          lda wR1
          bne +

            ; is player FactionSlot
            lda #1
            jsl $81B32C

          +
          lda #(`aFactionArea)<<8
          sta lR18+1
          lda #<>aFactionArea
          sta lR18
          lda #(`aEmptyFactionSlotHeader)<<8
          sta lR19+1
          lda #<>aEmptyFactionSlotHeader
          sta lR19
          lda #size(aEmptyFactionSlotHeader)
          sta wR0
          lda wR1
          inc a
          jsl rlUpdateOffsetTable

        _End
        plx
        stx wR1
        plx
        plp
        plb
        rtl

        .databank 0

        .byte 0

      aEmptyFactionSlotHeader .block ; 84/BD1F

          .structFactionHeader $80, $FF, 0, 0, 0

        .bend

      rsGetFactionSlotOffset ; 84/BD24

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = FactionSlot

        ; Output:
        ; X = Faction offset

        cmp #Factionless
        bcs +

          asl a
          tax
          lda aFactionArea,x
          clc
          adc #<>aFactionArea
          tax
          clc
          rts

        +
        rts

        .databank 0

      rlGetFactionSlotOffsetWrapper ; 84/BD37

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = FactionSlot

        ; Output:
        ; X = Faction offset

        jsr rsGetFactionSlotOffset
        rtl

        .databank 0

      rsGetFactionSlotGroupPointer ; 84/BD3B

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = FactionSlot

        ; Output:
        ; Y = Faction group pointer

        jsr rsGetFactionSlotOffset
        bcs _SEC

          lda $7E0000 + structFactionHeader.GroupID,x
          and #$00FF
          cmp #$0080
          beq _SEC

            cmp #$00FF
            beq _SEC

              jsl rlGetFactionGroupPointerByID

              clc
              rts

        _SEC
        sec
        rts

        .databank 0

      rlSetFactionSlotGroupID ; 84/BD59

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = FactionSlot
        ; wRoutineVariable1 = faction group ID

        phb
        php
        phk
        plb
        phx

        jsr rsGetFactionSlotOffset
        bcs +

          sep #$20
          lda wRoutineVariable1,b
          cmp $7E0000 + structFactionHeader.GroupID,x
          beq +

            sta $7E0000 + structFactionHeader.GroupID,x
            rep #$20

        +
        plx
        plp
        plb
        rtl

        .databank 0

      rlGetFactionSlotNameID ; 84/BD78

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = FactionSlot

        ; Output:
        ; A = Faction name ID

        phb
        php
        phk
        plb
        phx
        phy

        jsr rsGetFactionSlotGroupPointer
        bcs +

        lda structFactionGroupData.FactionNameID,b,y
        and #$00FF

        -
        ply
        plx
        plp
        plb
        rtl

        +
        lda #$FFFF
        bra -

        .databank 0

      rlGetFactionSlotNamePointer ; 84/BD93

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = FactionSlot

        ; Output:
        ; lRoutineVariable = Faction name pointer

        phb
        php
        phk
        plb
        phx
        phy

        jsr rsGetFactionSlotOffset
        bcs _None

          lda $7E0000 + structFactionHeader.GroupID,x
          and #$00FF
          cmp #$0080
          beq _None

            jsl rlGetFactionGroupPointerByID

            lda structFactionGroupData.FactionNameID,b,y
            and #$00FF
            cmp #$0080
            beq _None

              cmp #$00FF
              beq _NPC

                asl a
                clc
                adc aMainDataOffsets.FactionNameOffsets
                tax
                lda #(`aMainDataOffsets)<<8
                sta lRoutineVariable+1,b
                lda aMainDataOffsets,x
                clc
                adc aMainDataOffsets.FactionNameOffsets
                adc #<>aMainDataOffsets
                sta lRoutineVariable,b
                bra +

        _None
        lda #(`aFactionNameNone)<<8
        sta lRoutineVariable+1,b
        lda #<>aFactionNameNone
        sta lRoutineVariable,b
        bra +

        _NPC
        lda #(`aFactionNameNPC)<<8
        sta lRoutineVariable+1,b
        lda #<>aFactionNameNPC
        sta lRoutineVariable,b

        +
        ply
        plx
        plp
        plb
        rtl

        .databank 0

      aFactionNameNone ; 84/BDFB

        .enc "SJIS"
        .text "　\n"

      aFactionNameNPC ; 84/BDFF

        .text "ＮＰＣ\n"

      rlGetFactionBattleHUDColorID ; 84/BE07

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        phy

        jsr rsGetFactionSlotGroupPointer
        bcs +

        lda structFactionGroupData.BattleHUDColorID,b,y
        and #$00FF
        
        -
        ply
        plx
        plp
        plb
        rtl

        +
        lda #7
        bra -

        .databank 0

      rlGetFactionBattleBannerID ; 84/BE22

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        phy

        jsr rsGetFactionSlotGroupPointer
        bcs +

        lda structFactionGroupData.BattleBannerID,b,y
        and #$00FF
        
        -
        ply
        plx
        plp
        plb
        rtl
        
        +
        lda #13
        bra -

        .databank 0

      rlGetFactionSlotLocationID ; 84/BE3D

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = FactionSlot

        ; Output:
        ; A = LocationID that the faction slot owns

        phb
        php
        phk
        plb
        phx

        jsr rsGetFactionSlotOffset
        bcs +

          lda $7E0000 + structFactionHeader.LocationID,x
          and #$00FF

        +
        plx
        plp
        plb
        rtl

        .databank 0

      rlGetFactionSlotUnitCount ; 84/BE52

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = FactionSlot

        ; Output:
        ; A = UnitCount

        phb
        php
        phk
        plb
        phx
        jsr rsGetFactionSlotOffset
        bcs +

          lda $7E0000 + structFactionHeader.UnitCount,x
          and #$00FF
          plx
          plp
          plb

          -
          rtl

        +
        lda #0
        plx
        plp
        plb
        bra -

        .databank 0

      rlCountUnitsInFactionSlotAlive ; 84/BE6F

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = FactionSlot

        ; Output:
        ; A = number of alive units in that faction

        phb
        php
        phk
        plb
        phx
        phy
        ldx wSelectedUnitDataRAMPointer,b
        phx
        ldx wRoutineVariable1,b
        phx

        jsr rsGetFactionSlotOffset
        bcs _End

          stz wRoutineVariable1,b
          lda $7E0000 + structFactionHeader.UnitCount,x
          and #$00FF
          beq ++

            tay

              _Loop
              lda $7E0000 + size(structFactionHeader),x
              sta wSelectedUnitDataRAMPointer,b
              jsl rlGetSelectedUnitStates
              bit #UnitStateDead
              bne +

                inc wRoutineVariable1,b

              +
              inc x
              inc x
              dec y
              bne _Loop

          +
          lda wRoutineVariable1,b

        _End
        plx
        stx wRoutineVariable1,b
        plx
        stx wSelectedUnitDataRAMPointer,b
        ply
        plx
        plp
        plb
        rtl

        .databank 0

      rlUnknown84BEB7 ; 84/BEB7

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx 
        phy

        jsr rsGetFactionSlotOffset
        bcs _End

        stz wRoutineVariable1,b
        lda $7E0004,x
        and #$00FF
        beq ++

        tay
        
        _Loop
        lda $7E0005,x
        sta $056F,b
        jsl rlGetSelectedUnitStates
        bit #$0200
        bne +

        bit #$8000
        beq +

        inc wRoutineVariable1,b
        
        +
        inc x
        inc x
        dec y
        bne _Loop
        
        +
        lda wRoutineVariable1,b
        
        _End
        ply
        plx
        plp
        plb
        rtl

        .databank 0

      rlGetUnitRAMDataPointerByFactionSlotEntryID ; 84/BEF4

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = FactionSlot
        ; wRoutineVariable1 = Entry ID in the FactionSlot

        ; Output:
        ; filled wSelectedUnitDataRAMPointer

        phb
        php
        phk
        plb
        phx
        jsr rsGetFactionSlotOffset
        bcs +

        lda $7E0000 + structFactionHeader.UnitCount,x
        and #$00FF
        cmp wRoutineVariable1,b
        bcc +

        phx
        lda wRoutineVariable1,b
        dec a
        asl a
        clc
        adc #1,s
        plx
        tax
        lda $7E0000 + size(structFactionHeader),x
        sta wSelectedUnitDataRAMPointer,b

        -
        plx
        plp
        plb
        rtl

        +
        stz wSelectedUnitDataRAMPointer,b
        bra -

        .databank 0

      rlUnknown84BF25 ; 84/BF25

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        phy
        jsr rsGetFactionSlotOffset
        bcs _End

        lda $7E0004,x
        and #$00FF
        ora #0
        beq _BF5F

        tay
        
        -
        lda $7E0005,x
        sta wSelectedUnitDataRAMPointer,b
        jsl rlGetSelectedUnitCharacterID
        cmp wRoutineVariable1,b
        bne +

        lda wR10
        beq _End

        jsl rlGetSelectedUnitStates
        bit #UnitStateFielded
        beq _End
        
        +
        inc x
        inc x
        dec y
        bne -
        
        _BF5F
        stz wSelectedUnitDataRAMPointer,b
        
        _End
        ply
        plx
        plp
        plb
        rtl

        .databank 0

      rlFindGenerationIDInFactionSlotData ; 84/BF67

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = FactionSlot
        ; wRoutineVariable1 = GenerationID

        ; Output:
        ; wSelectedUnitDataRAMPointer

        phb
        php

        phk
        plb

        phx
        phy
        jsr rsGetFactionSlotOffset
        bcs _End

          lda $7E0000 + structFactionHeader.UnitCount,x
          and #$00FF
          beq +

            tay

            -
            lda $7E0000 + size(structFactionHeader),x
            sta wSelectedUnitDataRAMPointer,b
            jsl rlGetSelectedUnitGenerationID
            cmp wRoutineVariable1,b
            beq _End

              inc x
              inc x
              dec y
              bne -

          +
          stz wSelectedUnitDataRAMPointer,b
        
        _End
        ply
        plx

        plp
        plb
        rtl

        .databank 0

      rlAssignUnitToFactionSlot ; 84/BF99

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = FactionSlot

        phb
        php
        phk
        plb
        phx

        ldx wRoutineVariable1,b
        phx
        ldx wR0
        phx
        ldx lR18
        phx
        ldx lR18+1
        phx
        ldx lR19
        phx
        ldx lR19+1
        phx

        sta wRoutineVariable1,b
        jsr rsGetFactionSlotOffset
        bcs _End

          jsl rlGetSelectedUnitFactionSlot
          cmp wRoutineVariable1,b
          beq _End

            lda $7E0000 + structFactionHeader.UnitCount,x
            and #$00FF
            inc a
            sep #$20
            sta $7E0000 + structFactionHeader.UnitCount,x
            rep #$20

            asl a
            clc
            adc #size(structFactionHeader)
            sta wR0

            lda #(`aFactionArea)<<8
            sta lR18+1
            lda #<>aFactionArea
            sta lR18
            stz lR19+1
            stz lR19

            ; wRoutineVariable1 has FactionSlot

            lda wRoutineVariable1,b
            inc a
            jsl rlUpdateOffsetTable
            stx wR1

            lda $7E0000 + structFactionHeader.UnitCount,x
            and #$00FF
            asl a
            clc
            adc wR1
            tax

            lda wSelectedUnitDataRAMPointer,b
            sta $7E0000 + 3,x

            lda wRoutineVariable1,b
            jsl rlSetSelectedUnitFaction

            lda wRoutineVariable1,b
            bne _End

              ; Only for player units
              jsl rlAddToUnitJoinOrder

        _End
        pla
        sta lR19+1
        pla
        sta lR19
        pla
        sta lR18+1
        pla
        sta lR18
        pla
        sta wR0
        pla
        sta wRoutineVariable1,b

        plx
        plp
        plb
        rtl

        .databank 0

      rlRemoveSelectedUnitFromFactionSlot ; 84/C02B

        .al
        .autsiz
        .databank ?

        ; A = FactionSlot
        ; filled wSelectedUnitDataRAMPointer

        ; If faction slot is 0 aka player, also modify something based on GenerationID

        phb
        php
        phk
        plb
        phx
        phy

        ldx wRoutineVariable1,b
        phx
        ldx wR0
        phx
        ldx lR18
        phx
        ldx lR18+1
        phx

        sta wRoutineVariable1,b

        jsr rsGetFactionSlotOffset
        bcs _End

          sep #$20
          lda #`aFactionArea
          pha
          rep #$20
          plb

          lda structFactionHeader.UnitCount,b,x
          and #$00FF
          beq _End

            phx
            sta wR1
            txy
            
              -
              lda $0000 + size(structFactionHeader),b,x
              cmp wSelectedUnitDataRAMPointer,b
              bne +

                inc y
                inc y

              +
              lda $0000 + size(structFactionHeader),b,y
              sta $0000 + size(structFactionHeader),b,x
              inc y
              inc y
              inc x
              inc x
              dec wR1
              bne -

            plx
            phk
            plb

            lda $7E0000 + structFactionHeader.UnitCount,x
            and #$00FF
            dec a
            sep #$20
            sta $7E0000 + structFactionHeader.UnitCount,x
            rep #$20

            asl a
            clc
            adc #size(structFactionHeader)
            sta wR0

            lda #(`aFactionArea)<<8
            sta lR18+1
            lda #<>aFactionArea
            sta lR18
            stz lR19+1
            stz lR19

            lda wRoutineVariable1,b
            inc a
            jsl rlUpdateOffsetTable

            lda wRoutineVariable1,b
            bne _End

              jsl rlRemoveFromUnitJoinOrder

        _End
        pla
        sta lR18+1
        pla
        sta lR18
        pla
        sta wR0
        pla
        sta wRoutineVariable1,b

        ply
        plx
        plp
        plb
        rtl

        .databank 0

        ; 84/C0BD

    .endsection Code84BB9ASection



    .section Code84C15FSection

      rlGetFactionRelation ; 84/C15F

        .al
        .autsiz
        .databank `aFactionBitLookupTable

        ; Input:
        ; A = own FactionSlot
        ; X = target FactionSlot

        phb
        php
        phk
        plb
        phx
        phy
        cmp #3,s
        beq _OwnFaction

          txy

          jsr rsGetFactionSlotOffset
          bcs _Enemy

            lda aFactionBitLookupTable,y
            and #$00FF
            and $7E0000 + structFactionHeader.HostileFactions,x
            bne _Enemy

              lda aFactionBitLookupTable,y
              and #$00FF
              and $7E0000 + structFactionHeader.AlliedFactions,x
              bne _Neutral

                lda #AllegianceOther
                bra +

              _Neutral
              lda #AllegianceNeutral
              bra +

          _Enemy
          lda #AllegianceEnemy
          bra +

        _OwnFaction
        lda #AllegianceOwn

        +
        ply
        plx
        plp
        plb
        rtl

        .databank 0

      aFactionBitLookupTable ; 84/C19E

        .byte $01 ; 0
        .byte $02 ; 1
        .byte $04 ; 2
        .byte $08 ; 3
        .byte $10 ; 4
        .byte $20 ; 5
        .byte $40 ; 6

      rlSetFactionHostility ; 84/C1A5

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = word with a FactionSlot in high and low byte
        ; wRoutineVariable1 = routine index (1 = hostile, 2 = allies, 3 = neutral)

        phb
        php
        phk
        plb
        phx

        ldx wR0
        phx

        sta wR0

        lda wRoutineVariable1,b
        asl a
        tax

        lda wR0
        and #$00FF
        sta wRoutineVariable1,b

        lda wR0
        xba
        and #$00FF
        jsr (aSetFactionHostilitySettings,x)

        lda wR0
        xba
        and #$00FF
        sta wRoutineVariable1,b

        lda wR0
        and #$00FF
        jsr (aSetFactionHostilitySettings,x)

        pla
        sta wR0

        plx
        plp
        plb
        rtl

        .databank 0

      aSetFactionHostilitySettings ; 84/C1DD

        .word <>rsSetFactionHostilityBreak
        .word <>rsSetFactionSlotsHostilityEnemies
        .word <>rsSetFactionSlotsHostilityAllies
        .word <>rsSetFactionSlotsHostilityNeutral

      rsSetFactionHostilityBreak ; 84/C1E5

        .al
        .autsiz
        .databank ?

        brk

        .databank 0

      rsSetFactionSlotAllegiance ; 84/C1E6

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = FactionSlot
        ; wRoutineVariable1 = Allegiance

        phb
        php
        phk
        plb
        phx
        phy

        ldx wR0
        phx
        ldx wR1
        phx

        cmp #7
        bcs _End

          sta wR0

          lda wRoutineVariable1,b
          sta wR1

          ldy #1

            -
            sty wRoutineVariable1,b
            lda wR0
            jsl rlGetUnitRAMDataPointerByFactionSlotEntryID
            lda wSelectedUnitDataRAMPointer,b
            beq _End

            jsl rlGetSelectedUnitDeploymentOffset
            bcs +

              tax
              lda aDeploymentTable._StateBuffer,x
              and #~(DeploymentAllegianceMask)
              ora wR1
              sta aDeploymentTable._StateBuffer,x
              sta aDeploymentTable._State,x

            +
            inc y
            bra -

        _End
        pla
        sta wR1
        pla
        sta wR0

        ply
        plx
        plp
        plb
        rts

        .databank 0

      rsSetFactionSlotsHostilityEnemies ; 84/C235

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = first FactionSlot
        ; wRoutineVariable1 = second FactionSlot

        phb
        php
        phk
        plb
        phx
        phy

        ldx wR0
        phx

        sta wR0
        cmp #7

        ; Someone forgot a branch

        asl a
        tax
        lda aFactionArea,x
        clc
        adc #<>aFactionArea
        tay

        sep #$20
        lda #`aFactionArea
        pha
        rep #$20
        plb

        sep #$20
        ldx wRoutineVariable1,b
        lda aFactionBitLookupTable,x
        ora $0002,b,y
        sta $0002,b,y

        lda aFactionBitLookupTable,x
        eor #$FF
        and $0003,b,y
        sta $0003,b,y
        rep #$20

        lda wRoutineVariable1,b
        bne +

          lda #AllegianceEnemy
          sta wRoutineVariable1,b
          lda wR0
          jsr rsSetFactionSlotAllegiance

        +
        pla
        sta wR0

        ply
        plx
        plp
        plb
        rts

        .databank 0

      rsSetFactionSlotsHostilityAllies ; 84/C28B

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = first FactionSlot
        ; wRoutineVariable1 = second FactionSlot

        phb
        php
        phk
        plb
        phx
        phy

        ldx wR0
        phx

        sta wR0
        cmp #7
        bcs _End

          asl a
          tax
          lda aFactionArea,x
          clc
          adc #<>aFactionArea
          tay

          sep #$20
          lda #`aFactionArea
          pha
          rep #$20
          plb

          sep #$20
          ldx wRoutineVariable1,b
          lda aFactionBitLookupTable,x
          ora $0003,b,y
          sta $0003,b,y

          lda aFactionBitLookupTable,x
          eor #$FF
          and $0002,b,y
          sta $0002,b,y
          rep #$20

          lda wRoutineVariable1,b
          bne _End

            lda #AllegianceNeutral
            sta wRoutineVariable1,b
            lda wR0
            jsr rsSetFactionSlotAllegiance
        
        _End
        pla
        sta wR0

        ply
        plx
        plp
        plb
        rts

        .databank 0

      rsSetFactionSlotsHostilityNeutral ; 84/C2E3

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = first FactionSlot
        ; wRoutineVariable1 = second FactionSlot

        phb
        php
        phk
        plb
        phx
        phy

        ldx wR0
        phx

        sta wR0
        cmp #7
        bcs _End

          asl a
          tax
          lda aFactionArea,x
          clc
          adc #<>aFactionArea
          tay

          sep #$20
          lda #`aFactionArea
          pha
          rep #$20
          plb

          sep #$20
          ldx wRoutineVariable1,b
          lda aFactionBitLookupTable,x
          eor #$FF
          and $0002,b,y
          sta $0002,b,y

          lda aFactionBitLookupTable,x
          eor #$FF
          and $0003,b,y
          sta $0003,b,y
          rep #$20

          lda wRoutineVariable1,b
          bne _End

            lda #AllegianceOther
            sta wRoutineVariable1,b
            lda wR0
            jsr rsSetFactionSlotAllegiance

        _End
        pla
        sta wR0

        ply
        plx
        plp
        plb
        rts

        .databank 0

      rlUnknown84C33D ; 84/C33D

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx

        lda wCurrentTurn,b
        cmp #51
        bcs _End

          lda wActiveFactionSlot,b
          bne _End

            lda #0
            jsl $84C412

            ldx #(9 - 1) * size(word)

              -
              lda $7E201E,x
              beq +

                sta wSelectedUnitDataRAMPointer,b
                jsl rlGetSelectedUnitGenerationID
                bcs +

                  jsr $84C398

              +
              dec x
              dec x
              bpl -

            ldx #(len(aDeploymentTable._State) - 2)

              -
              lda aDeploymentTable._State,x
              bit #DeploymentStateAlive
              beq +

                lda aDeploymentTable._UnitRAMPointer,x
                sta wSelectedUnitDataRAMPointer,b
                jsl rlGetSelectedUnitGenerationID
                bcs +

                  cmp #$0010
                  bcc +

                    jsr $84C3C1

              +
              dec x
              dec x
              bpl -

        _End
        plx
        plp
        plb
        rtl

        .databank 0

        ; 84/C398

    .endsection Code84C15FSection




    .section Code84C461Section

      rlUnknown84C461 ; 84/C461

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        phy
        ldx wSelectedUnitDataRAMPointer,b
        phx

        tay
        ldx #1
        
        -
        stx wRoutineVariable1,b
        tya
        jsl rlGetUnitRAMDataPointerByFactionSlotEntryID

        lda wSelectedUnitDataRAMPointer,b
        beq _C496

        jsl rlGetSelectedUnitStates
        bit #UnitStateGroupLeader
        beq +

        jsl rlGetSelectedUnitAI
        cmp wR0
        bne +

        jsl rlGetSelectedUnitCharacterID
        bra ++

        +
        inc x
        bra -
        
        _C496
        lda #0

        +
        plx
        stx wSelectedUnitDataRAMPointer,b
        ply
        plx
        plp
        plb
        rtl

        .databank 0

      rlUnknown84C4A2 ; 84/C4A2

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        phy
        ldx wR0
        phx
        ldx wR1
        phx

        tay
        lda #$0048
        sta wR0
        stz wR1
        ldx #1
        
          _Loop
          stx wRoutineVariable1,b
          tya
          jsl rlGetUnitRAMDataPointerByFactionSlotEntryID
          lda wSelectedUnitDataRAMPointer,b
          beq _End

            jsl rlGetSelectedUnitStates
            bit #UnitStateDead
            bne _Next

              jsl rlGetSelectedUnitGenerationID
              ora #0
              beq _Next

                cmp wR0
                bcs _Next

                  sta wR0
                  lda wSelectedUnitDataRAMPointer,b
                  sta wR1

            _Next
            inc x
            bra _Loop
        
        _End
        lda wR1
        sta wSelectedUnitDataRAMPointer,b

        pla
        sta wR1
        pla
        sta wR0
        ply
        plx
        plp
        plb
        rtl

        .databank 0

      rlAddCastleMoneyToAllUnitsInFaction ; 84/C4F6

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = FactionSlot

        phb
        php
        phk
        plb
        phx
        phy
        ldx wSelectedUnitDataRAMPointer,b
        phx
        ldx wR0
        phx

        tay
        jsl rlCountAlliedCastles
        dec a
        dec a
        sta wR10

        lda #1000
        sta wR11
        jsl rlUnsignedMultiply16By16
        lda wR12
        sta wR0

        ldx #1

          _Loop
          stx wRoutineVariable1,b
          tya
          jsl rlGetUnitRAMDataPointerByFactionSlotEntryID
          lda wSelectedUnitDataRAMPointer,b
          beq _End

            phx
            jsl rlGetSelectedUnitStates
            bit #UnitStateDead
            bne _Next

              lda wR0
              sta wRoutineVariable1,b
              jsl rlAddSelectedCharacterMoney

            _Next
            plx
            inc x
            bra _Loop

        _End
        plx
        stx wR0
        plx
        stx wSelectedUnitDataRAMPointer,b
        ply
        plx
        plp
        plb
        rtl

        .databank 0

      rlReviveFactionsUnitsOfAISetting ; 84/C54C

        .al
        .autsiz
        .databank ?

        ; A = FactionSlot
        ; wRoutineVariable1 = AI

        phb
        php
        phk
        plb
        phx
        phy

        ldx wSelectedUnitDataRAMPointer,b
        phx
        ldx wR34
        phx

        tay
        lda wRoutineVariable1,b
        sta wR34
        ldx #1
        
          _Loop
          stx wRoutineVariable1,b
          tya
          jsl rlGetUnitRAMDataPointerByFactionSlotEntryID
          lda wSelectedUnitDataRAMPointer,b
          beq _End

            jsl rlGetSelectedUnitAI
            cmp wR34
            bne +

              jsl rlGetSelectedUnitStates
              bit #UnitStateDead
              beq +

                jsl rlReviveSelectedCharacter

          +
          inc x
          bra _Loop

        _End
        plx
        stx wR34
        plx
        stx wSelectedUnitDataRAMPointer,b

        ply
        plx
        plp
        plb
        rtl

        .databank 0

      rlDeleteFactionsUnitsOfAISetting ; 84/C593

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = FactionSlot
        ; wRoutineVariable1 = AI

        phb
        php
        phk
        plb
        phx
        phy
        ldx wSelectedUnitDataRAMPointer,b
        phx
        ldx wR0
        phx

        tay
        lda wRoutineVariable1,b
        sta wR0
        ldx #1
        
          _Loop
          stx wRoutineVariable1,b
          tya
          jsl rlGetUnitRAMDataPointerByFactionSlotEntryID
          lda wSelectedUnitDataRAMPointer,b
          beq _End

            jsl rlGetSelectedUnitAI
            cmp wR0
            bne _Next

              jsl rlUndeployUnit
              jsl rlDeleteUnit
              bra _Loop

            _Next
            inc x
            bra _Loop

        _End
        plx
        stx wR0
        plx
        stx wSelectedUnitDataRAMPointer,b
        ply
        plx
        plp
        plb
        rtl

        .databank 0

        ; 84/C5D7

    .endsection Code84C461Section



    .section Code84C65ESection

      rlDeployUnitCheckIfAsleep ; 84/C65E

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx

        ldx wR0
        phx
        ldx wR1
        phx

        lda wDeployedUnitsCount,b
        cmp #$058B
        bcs _SEC

        jsl rlGetSelectedUnitFactionSlot
        ldx #0
        jsl rlGetFactionRelation
        sta wR0
        jsl rlGetSelectedUnitMapSprite
        sta wR1
        jsr rsAddUnitToDeploymentTable
        bcs _SEC

        tax
        jsl rlGetSelectedUnitStatus
        cmp #StatusSleep
        bne +

          lda aDeploymentTable._StateBuffer,x
          ora #DeploymentStateAsleep
          sta aDeploymentTable._StateBuffer,x
          sta aDeploymentTable._State,x

        +
        txa
        plx
        stx wR1
        plx
        stx wR0

        plx
        plp
        plb
        clc
        
        -
        rtl

        _SEC
        plx
        stx wR1
        plx
        stx wR0

        plx
        plp
        plb
        sec
        bra -

        .databank 0

      rsAddUnitToDeploymentTable ; 84/C6BA

        .al
        .autsiz
        .databank ?

        ; Input:
        ; wR0 = allegiance towards player faction
        ; wR1 = map sprite ID
        ; wRoutineVariable1 = deployment coordinates

        phx
        ldx #(len(aDeploymentTable._State) - 2)

          -
          lda aDeploymentTable._UnitRAMPointer,x
          beq +

            dec x
            dec x
            bpl -

          plx
          sec
          bra _End

        +
        lda wSelectedUnitDataRAMPointer,b
        sta aDeploymentTable._UnitRAMPointer,x

        lda wRoutineVariable1,b
        and #$00FF
        sta aDeploymentTable._XTilePosition,x
        asl a
        asl a
        asl a
        asl a
        sta aDeploymentTable._XPixelPosition,x

        lda wRoutineVariable1,b
        xba
        and #$00FF
        sta aDeploymentTable._YTilePosition,x
        asl a
        asl a
        asl a
        asl a
        sta aDeploymentTable._YPixelPosition,x

        jsl rlAddDeployedMapSprite
        sta aDeploymentTable._DeploymentOffsets,x

        jsl rlGetSelectedUnitFactionSlot
        sta aDeploymentTable._FactionSlot,x

        lda wR0
        and #DeploymentAllegianceMask
        ora #DeploymentStateAlive
        sta aDeploymentTable._State,x
        sta aDeploymentTable._StateBuffer,x

        inc wDeployedUnitsCount,b

        txa
        plx
        clc

        _End
        rts

        .databank 0

      rlDeployUnit ; 84/C71F

        .al
        .autsiz
        .databank ?

        phb
        phk
        plb
        phx

        ldx wR0
        phx
        ldx wR1
        phx

        ldx wDeployedUnitsCount,b
        cpx #$058B
        bcs _SEC

        sta wR1
        lda wSelectedUnitDataRAMPointer,b
        pha

        lda wR1
        jsl rlGetUnitRAMDataPointerByID
        bcs +

          jsl rlGetSelectedUnitMapSprite
          bra ++

        +
        lda wR1
        jsl rlGetCharacterMapSprite

        +
        sta wR1
        pla
        sta wSelectedUnitDataRAMPointer,b

        lda wR0
        ldx #0
        jsl rlGetFactionRelation
        sta wR0
        jsr rsAddUnitToDeploymentTable
        bcs _SEC

        clc
        
        -
        plx
        stx wR1
        plx
        stx wR0

        plx
        plb
        rtl
        
        _SEC
        sec
        bra -

        .databank 0

      rlAddDeployedMapSprite ; 84/C76E

        .al
        .autsiz
        .databank ?

        ; Input:
        ; wR1 = Map sprite ID

        ; Output:
        ; A = map sprite offset (from the start of aDeploymentTable._MapSpriteID)

        phb
        php
        phk
        plb
        phx

        lda wR1
        bmi _Tall

          ldx #47 * 2

          -
          lda aDeploymentTable._MapSpriteID,x
          cmp wR1
          beq _End

          cmp #$FFFF
          bne +

          lda wR1
          sta aDeploymentTable._MapSpriteID,x
          bra _End

          +
          dec x
          dec x
          bpl -
          bra _Break

        _Tall
        ldx #(len(aDeploymentTable._MapSpriteID) - 2)
        
        -
        lda aDeploymentTable._MapSpriteID,x
        cmp wR1
        beq _End

        cmp #$FFFF
        bne +

        lda wR1
        sta aDeploymentTable._MapSpriteID,x
        bra _End

        +
        dec x
        dec x
        bpl -
        bra _Break

        _End
        txa
        plx
        plp
        plb
        rtl

        _Break
        brk

        .databank 0

      rlFindCharactersDeploymentOffset ; 84/C7B9

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = CharacterID to find

        ; Output:
        ; A = deployment offset if found, else $FFFF

        phb
        php
        phk
        plb
        phx
        sta wRoutineVariable1,b

        ldx #(len(aDeploymentTable._State) - 2)

          -
          lda aDeploymentTable._UnitRAMPointer,x
          sta wSelectedUnitDataRAMPointer,b
          jsl rlGetSelectedUnitCharacterID
          cmp wRoutineVariable1,b
          beq +

          dec x
          dec x
          bpl -

        lda #$FFFF
        plx
        plp
        plb
        rtl

        +
        txa
        plx
        plp
        plb
        rtl

        .databank 0

      rlLoadUNITAsHidden ; 84/C7E4

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = UNIT group ID
        ; wRoutineVariable1 = entry of UNIT group

        ; Output:
        ; X = deployment offset
        ; wR0 = CharacterID
        ; wR1 = coordinates
        ; wR2 = allegiance

        phb
        php
        phk
        plb
        phx
        phy

        pha
        lda #(`aUNITGroupPointers)<<8
        sta lR18+1
        lda #<>aUNITGroupPointers
        sta lR18
        pla

        inc a
        jsl rlGetUNITGroupPointer
        sta lR18

        lda wRoutineVariable1,b
        sta wR1

        dec a
        asl a
        asl a
        asl a
        clc
        adc lR18
        sta lR18

        ldy lR18

        sep #$20
        lda lR18+2
        pha
        rep #$20
        plb

        lda structUNITEntry.DestinationCoords,b,y
        sta wRoutineVariable1,b

        lda structUNITEntry.FactionSlot,b,y
        and #$00FF
        sta wR0

        lda structUNITEntry.CharacterID,b,y
        jsl rlGetUnitRAMDataPointerByID
        bcs +

          ; Already loaded in RAM
          jsl rlGetUnitType
          cmp #UnitTypeEnemy
          beq +

            jsl rlGetSelectedUnitDeploymentOffset
            bcs +

              tax
              jsl rlUnknown84C996
              jsl rlDeployedUnitSetAliveUnsetHidden
              bra ++

        +
        lda wR1
        sta wSelectedUnitDataRAMPointer,b
        lda structUNITEntry.CharacterID,b,y
        jsl rlDeployUnit
        bcs _SEC

        tax

        +
        jsl rlDeployedUnitSetHidden

        lda structUNITEntry.CharacterID,b,y
        sta wR0
        lda structUNITEntry.DestinationCoords,b,y
        sta wR1
        lda aDeploymentTable._State,x
        and #DeploymentAllegianceMask
        sta wR2

        txa
        ply
        plx
        plp
        plb
        clc

        -
        rtl
        
        _SEC
        ply
        plx
        plp
        plb
        sec
        bra -

        .databank 0

      rlUnknown84C87A ; 84/C87A

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = CharacterID
        ; X = FactionSlot
        ; wRoutineVariable1 = DestinationCoords

        ; Output:
        ; wR2 = allegiance
        ; Always CLC ?

        phb
        php
        phk
        plb
        phx

        sta wR0
        stx wR2

        lda wRoutineVariable1,b
        sta wR1

        lda wR0
        jsl rlGetUnitRAMDataPointerByID
        bcs _NotLoaded

        jsl rlGetSelectedUnitDeploymentOffset
        bcs _NotDeployed
        bra +

          _NotLoaded
          lda wR0
          jsl rlLoadUnit

          _NotDeployed
          lda wR2
          jsl rlAssignUnitToFactionSlot

        +
        jsl rlUnknown84AEC0

        ldx wRoutineVariable1,b
        jsl rlDeployedUnitSetHidden
        txa
        jsl rlGetTerrainTypeByDeploymentOffset
        cmp #TerrainCastle
        beq +

          jsl rlGetSelectedUnitStates
          bit #UnitStateGuardingCastle
          beq ++

            jsl $84BA6F
            bra ++

        ; is on castle terrain
        +
        jsl rlUnknown84CFBF
        
        +
        lda aDeploymentTable._State,x
        and #DeploymentAllegianceMask
        sta wR2

        txa
        plx
        plp
        plb
        clc
        
        -
        rtl

        plx
        plp
        plb
        sec
        bra -

        .databank 0

      rlGetTerrainTypeByDeploymentOffset ; 84/C8E1

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx

        tax
        lda aDeploymentTable._YTilePosition,x
        xba
        lsr a
        lsr a
        clc
        adc aDeploymentTable._XTilePosition,x
        asl a
        tax
        lda $7F2400,x
        and #$03FF
        tax
        lda $7F2000,x
        and #$00FF
        cmp #$001A
        bcc +

          lda #0

        +
        plx
        plp
        plb
        rtl

        .databank 0

      rlUnknown84C910 ; 84/C910

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        tax

        lda $7E441B,x
        sta wR0
        lda $7E44AB,x
        sta wR1
        jsl $88BF37
        tax
        lda $7F2400,x
        and #$FC00
        xba
        lsr a
        lsr a

        plx
        plp
        plb
        rtl

        .databank 0

      rlGetFormationIDByDeploymentOffset ; 84/C935

        .al
        .autsiz
        .databank ?

        lda aDeploymentTable._State+1,x
        and #DeploymentFormationID
        rtl

        .databank 0

      rlSetFormationIDByDeploymentOffset ; 84/C93D

        .al
        .autsiz
        .databank ?

        sep #$20
        and #DeploymentFormationID
        sta aDeploymentTable._State+1,x
        sta aDeploymentTable._StateBuffer+1,x
        rep #$20
        rtl

        .databank 0

      rlUnknown84C94C ; 84/C94C

        .al
        .autsiz
        .databank ?

        ; Input:
        ; X = deployment offset
        ; $00 = X coordinate
        ; $02 = Y coordinate

        phb
        php
        phk
        plb

        lda wEventLocationEntry,b
        pha

        lda aDeploymentTable._XTilePosition,x
        sta $7E492B
        lda aDeploymentTable._YTilePosition,x
        sta $7E492D

        lda wR0
        sta aDeploymentTable._XTilePosition,x
        asl a
        asl a
        asl a
        asl a
        sta aDeploymentTable._XPixelPosition,x

        lda wR1
        sta aDeploymentTable._YTilePosition,x
        asl a
        asl a
        asl a
        asl a
        sta aDeploymentTable._YPixelPosition,x

        stz $0580,b

        jsl rlCheckIfCoordsNotEventLocationTile
        bcs +

          lda wEventLocationEntry,b
          sta $0580,b

        +
        pla
        sta wEventLocationEntry,b

        plp
        plb
        rtl

        .databank 0

      rlUnknown84C996 ; 84/C996

        .al
        .autsiz
        .databank ?

        ; Updates units position in the deployment tables?

        ; Input:
        ; wRoutineVariable1 = destination coordinates

        phb
        php
        phk
        plb

        lda wR0
        pha
        lda wR1
        pha

        lda wRoutineVariable1,b
        bmi +

          and #$00FF
          sta wR0
          lda wRoutineVariable1+1,b
          and #$00FF
          sta wR1
          jsl rlUnknown84C94C

        +
        pla
        sta wR1
        pla
        sta wR0

        plp
        plb
        rtl

        .databank 0

      rlUnknown84C9BF ; 84/C9BF

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb

        lda wR0
        pha
        lda wR1
        pha

        lda wRoutineVariable1,b
        bmi +

          sta $0D83,b
          stx wUnknownDeploymentOffset000D7F,b
          lda #0
          sta $0D81,b

        +
        pla
        sta wR1
        pla
        sta wR0

        plp
        plb
        rtl

        .databank 0

      rlUnknown84C9E3 ; 84/C9E3

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        lda aDeploymentTable._State,x
        bit #DeploymentStateAlive
        beq ++

        lda aDeploymentTable._State,x
        bit #(DeploymentStateAsleep | DeploymentStateDefeated | DeploymentStateCanto)
        bne ++

        lda aDeploymentTable._StateBuffer,x
        bit #DeploymentStateAsleep
        bne ++

        lda #SkillIDCanto
        jsl rlCheckIfUnitHasSpecifiedPersonalOrClassSkill
        bcs +

        lda #SkillIDCanto
        jsl rlCheckIfInventoryItemsHaveSpecifiedSkill
        bcc ++

        +
        jsr rsUnknown84CA22
        bcc +

        plp
        plb
        sec
        
        -
        rtl
        
        +
        plp
        plb
        clc
        bra -

        .databank 0

      rsUnknown84CA22 ; 84/CA22

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        lda wR2
        pha

        lda aDeploymentTable._UnitRAMPointer,x
        sta wSelectedUnitDataRAMPointer,b

        phx
        lda aDeploymentTable._XTilePosition,x
        sec
        sbc $7E492B
        clc
        adc #32
        sta wR2

        lda aDeploymentTable._YTilePosition,x
        sec
        sbc $7E492D
        clc
        adc #32
        asl a
        asl a
        asl a
        asl a
        asl a
        asl a
        clc
        adc wR2
        tax
        lda aMovementMap,x
        plx
        and #$00FF
        beq +

          jsl rlSetSelectedUnitCantoMovement

          lda #UnitStateCanto
          jsl rlSetSelectedUnitStates

          lda aDeploymentTable._StateBuffer,x
          ora #DeploymentStateCanto
          sta aDeploymentTable._StateBuffer,x

          lda aDeploymentTable._State,x
          ora #DeploymentStateCanto
          sta aDeploymentTable._State,x

          lda #$0004
          tsb wUnknown000D79,b

          pla
          sta wR2
          plp
          plb
          sec

          -
          rts

        +
        pla
        sta wR2
        plp
        plb
        clc
        bra -

        .databank 0

      rlUnknown84CA97 ; 84/CA97

        .al
        .autsiz
        .databank ?

        lda aDeploymentTable._StateBuffer,x
        and #~DeploymentStateGrayed
        sta aDeploymentTable._StateBuffer,x

        lda #$0004
        tsb wUnknown000D79,b
        rtl

        .databank 0

      rlUnknown84CAA9 ; 84/CAA9

        .al
        .autsiz
        .databank ?

        lda wSelectedUnitDataRAMPointer,b
        pha
        lda wRoutineVariable1,b
        pha

        lda aDeploymentTable._UnitRAMPointer,x
        bne +

          jml _End
        
        +
        lda aDeploymentTable._State,x
        bit #DeploymentStateDefeated
        beq +

          jml _End

        +
        txa
        jsl rlGetTerrainTypeByDeploymentOffset
        cmp #TerrainCastle
        bne +

          jsl rlUnknown84CFBF
          bra _CB24

        +
        lda wUnknown000D79,b
        bit #$0040
        bne _CB18

          lda $0580,b
          beq _CB24

          sta wEventLocationEntry,b

          lda aDeploymentTable._State,x
          bit #DeploymentStateAlive
          beq _CB24

          jsl rlGetEventLocationEntryID
          sta wRoutineVariable1,b

          lda aDeploymentTable._FactionSlot,x
          jsl rlGetFactionSlotLocationID
          cmp wRoutineVariable1,b
          bne _CB24

          jsl $84D4A2
          bcs +

            jml _End

          +
          lda wRoutineVariable1,b
          jsl rlSetUnitResidingInCastle
          bra _CB24
        
        _CB18
        lda aDeploymentTable._FactionSlot,x
        jsl rlGetFactionSlotLocationID
        jsl $84CD8A

        _CB24
        lda aDeploymentTable._StateBuffer,x
        ora #DeploymentStateGrayed
        bit #DeploymentStateAlive
        beq +

          and #~DeploymentStateHidden

        +
        sta aDeploymentTable._StateBuffer,x

        lda #$0004
        tsb wUnknown000D79,b

        jsl $85E897

        lda aDeploymentTable._UnitRAMPointer,x
        sta wSelectedUnitDataRAMPointer,b

        lda #UnitStateMoved
        jsl rlSetSelectedUnitStates

        lda #$1000
        tsb wUnknown000D79,b

        lda aDeploymentTable._State,x
        bit #DeploymentStateCanto
        beq +

          lda #0
          jsl rlSetSelectedUnitCantoMovement

          lda #UnitStateCanto
          jsl rlUnsetSelectedUnitStates

          lda aDeploymentTable._StateBuffer,x
          and #~DeploymentStateCanto
          sta aDeploymentTable._StateBuffer,x

        +
        stx $0D8B,b
        
        _End
        pla
        sta wRoutineVariable1,b
        pla
        sta wSelectedUnitDataRAMPointer,b
        rtl

        .databank 0

      rlDeployedUnitUnsetHiddenIfAlive ; 84/CB83

        .al
        .autsiz
        .databank ?

        ; X = deployment offset

        lda wUnknown000D79,b
        bit #$0004
        bne +

          lda aDeploymentTable._StateBuffer,x
          bit #DeploymentStateAlive
          beq ++

            and #~DeploymentStateHidden
            sta aDeploymentTable._StateBuffer,x
            sta aDeploymentTable._State,x
            rtl

        +
        lda aDeploymentTable._State,x
        bit #DeploymentStateAlive
        beq +

          and #~DeploymentStateHidden
          sta aDeploymentTable._State,x
          lda aDeploymentTable._StateBuffer,x
          and #~DeploymentStateHidden
          sta aDeploymentTable._StateBuffer,x

        +
        rtl

        .databank 0

      rlDeployedUnitSetHidden ; 84/CBBC

        .al
        .autsiz
        .databank ?

        ; X = deployment offset

        lda wUnknown000D79,b
        bit #$0004
        bne +

          lda aDeploymentTable._StateBuffer,x
          ora #DeploymentStateHidden
          sta aDeploymentTable._StateBuffer,x
          sta aDeploymentTable._State,x
          rtl

        +
        lda aDeploymentTable._State,x
        ora #DeploymentStateHidden
        sta aDeploymentTable._State,x
        lda aDeploymentTable._StateBuffer,x
        ora #DeploymentStateHidden
        sta aDeploymentTable._StateBuffer,x
        rtl

        .databank 0

      rlDeployedUnitSetAliveUnsetHidden ; 84/CBEB

        .al
        .autsiz
        .databank ?

        ; X = deployment offset

        lda aDeploymentTable._StateBuffer,x
        ora #DeploymentStateAlive
        and #~DeploymentStateHidden
        sta aDeploymentTable._StateBuffer,x
        sta aDeploymentTable._State,x
        rtl

        .databank 0

      rlDeployedUnitSetHiddenUnsetAlive ; 84/CBFE

        .al
        .autsiz
        .databank ?

        ; X = deployment offset

        lda aDeploymentTable._StateBuffer,x
        and #~DeploymentStateAlive
        ora #DeploymentStateHidden
        sta aDeploymentTable._StateBuffer,x
        sta aDeploymentTable._State,x
        rtl

        .databank 0

      rlDeployedUnitSetDefeated ; 84/CC11

        .al
        .autsiz
        .databank ?

        ; A = deployment offset

        phx
        sta wUnknownDeploymentOffset000D7F,b
        tax
        lda aDeploymentTable._StateBuffer,x
        ora #DeploymentStateDefeated
        sta aDeploymentTable._StateBuffer,x
        sta aDeploymentTable._State,x
        plx
        rtl

        .databank 0

      rlClearUnitDeploymentData ; 84/CC27

        .al
        .autsiz
        .databank ?

        ; Input:
        ; X = deployment offset

        phb
        php
        phk
        plb
        phx
        tax
        lda #0
        sta aDeploymentTable._StateBuffer,x
        sta aDeploymentTable._XTilePosition,x
        sta aDeploymentTable._YTilePosition,x
        sta aDeploymentTable._XPixelPosition,x
        sta aDeploymentTable._YPixelPosition,x
        sta aDeploymentTable._DeploymentOffsets,x
        sta aDeploymentTable._UnitRAMPointer,x
        sta aDeploymentTable._FactionSlot,x
        dec wDeployedUnitsCount,b
        lda #$0004
        tsb wUnknown000D79,b
        plx
        plp
        plb
        rtl

        .databank 0

        ; 84/CC5D

    .endsection Code84C65ESection


    .section Code84CCB4Section

      rlSetUnitResidingInCastle ; 84/CCB4

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = castle ID
        ; X = deployment offset

        phy
        ldy wRoutineVariable1,b
        phy

        tay
        lda aDeploymentTable._UnitRAMPointer,x
        sta wSelectedUnitDataRAMPointer,b
        tya

        jsl rlSetUnitUnfieldedInCastle

        lda aDeploymentTable._StateBuffer,x
        and #~DeploymentStateAlive
        ora #DeploymentStateHidden
        sta aDeploymentTable._StateBuffer,x
        sta aDeploymentTable._State,x
        tya

        jsl rlGetLocationEventDataEntry
        jsl rlGetEventLocationEntryEffectiveXCoordinate
        and #$00FF
        sta wRoutineVariable1,b

        jsl rlGetEventLocationEntryEffectiveYCoordinate
        and #$00FF
        xba
        ora wRoutineVariable1,b
        sta wRoutineVariable1,b

        ; Effective event coord in wRoutineVariable1

        lda aDeploymentTable._XTilePosition,x
        sta $7E492B
        lda aDeploymentTable._YTilePosition,x
        sta $7E492D

        lda wRoutineVariable1,b
        and #$00FF
        sta aDeploymentTable._XTilePosition,x
        asl a
        asl a
        asl a
        asl a
        sta aDeploymentTable._XPixelPosition,x

        lda wRoutineVariable1+1,b
        and #$00FF
        sta aDeploymentTable._YTilePosition,x
        asl a
        asl a
        asl a
        asl a
        sta aDeploymentTable._YPixelPosition,x

        lda wEventLocationEntry,b
        sta $0580,b

        ply
        sty wRoutineVariable1,b
        ply
        rtl

        .databank 0

        ; 84/CD35

    .endsection Code84CCB4Section


    .section Code84CFBFSection

      rlUnknown84CFBF ; 84/CFBF

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        lda wR0
        pha
        lda wR1
        pha

        lda aDeploymentTable._XTilePosition,x
        sta wR0
        lda aDeploymentTable._YTilePosition,x
        sta wR1
        jsl $87EA09
        bcs +

          jsl rlCheckIfCastleGuarded
          bcs +

            jsl rlGetLocationFactionSlotOwner
            sta wR0

            lda aDeploymentTable._UnitRAMPointer,x
            sta wSelectedUnitDataRAMPointer,b

            phx
            ldx wR0
            jsl rlGetSelectedUnitFactionSlot
            jsl rlGetFactionRelation
            plx

            cmp #AllegianceEnemy
            beq +

              cmp #AllegianceOther
              beq +

                jsr rsUnknown84D010

        +
        pla
        sta wR1
        pla
        sta wR0
        plp
        plb
        rtl

        .databank 0

      rsUnknown84D010 ; 84/D010

        .al
        .autsiz
        .databank ?

        lda aDeploymentTable._StateBuffer,x
        ora #DeploymentStateGuardingCastle
        sta aDeploymentTable._StateBuffer,x
        sta aDeploymentTable._State,x

        lda #UnitStateGuardingCastle
        jsl rlSetSelectedUnitStates
        jsl rlGetEventLocationEntryID
        jsl rlSetSelectedUnitResidingCastle
        jsl rlSetCastleGuarded
        jsl rlGetEventLocationEntryCoordinates
        sta wRoutineVariable1,b
        jsl rlUnknown84C996
        rts

        .databank 0

        ; 84/D03E

    .endsection Code84CFBFSection



    .section Code84D271Section

      rlChangeFactionSlotOfFieldedSelectedUnit ; 84/D271

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = FactionSlot
        ; X = deployment offset

        phb
        php
        phk
        plb
        phy

        ldy wRoutineVariable1,b
        phy

        sta wRoutineVariable1,b

        lda aDeploymentTable._UnitRAMPointer,x
        sta wSelectedUnitDataRAMPointer,b

        jsl rlChangeFactionSlotOfSelectedUnit

        lda wRoutineVariable1,b
        sta aDeploymentTable._FactionSlot,x

        lda aDeploymentTable._StateBuffer,x
        and #~DeploymentAllegianceMask
        sta aDeploymentTable._StateBuffer,x

        phx
        lda #0
        ldx wRoutineVariable1,b
        jsl rlGetFactionRelation
        plx

        ora aDeploymentTable._StateBuffer,x
        sta aDeploymentTable._StateBuffer,x
        sta aDeploymentTable._State,x

        ply
        sty wRoutineVariable1,b

        ply
        plp
        plb
        rtl

        .databank 0

        ; 84/D2BA

    .endsection Code84D271Section


    .section Code84D4C7Section

      rlGetUnitsDistance ; 84/D4C7

        .al
        .autsiz
        .databank ?

        ; Input:
        ; wR0 = Unit 1 deployment offset
        ; wR1 = Unit 2 deployment offset

        ; Output:
        ; A = distance

        phx
        ldx wR0
        lda aDeploymentTable._XTilePosition,x
        ldx wR1
        sec
        sbc aDeploymentTable._XTilePosition,x
        bpl +

          eor #$FFFF
          inc a

        +
        sta wR17

        ldx wR0
        lda aDeploymentTable._YTilePosition,x
        ldx wR1
        sec
        sbc aDeploymentTable._YTilePosition,x
        bpl +
        
          eor #$FFFF
          inc a

        +
        clc
        adc wR17
        plx
        rtl

        .databank 0

      rlCheckIfTargetBelongsToOwnFaction ; 84/D4F5

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = deployment offset

        phx
        tax
        lda aDeploymentTable._FactionSlot,x
        tax
        jsl rlGetSelectedUnitFactionSlot
        jsl rlGetFactionRelation
        cmp #AllegianceOwn
        bne +

          plx
          sec
          rtl

        +
        plx
        clc
        rtl

        .databank 0

      rlCheckIfTargetFoeOfOwnFaction ; 84/D50F

        .al
        .autsiz
        .databank ?

        phx
        tax
        lda aDeploymentTable._FactionSlot,x
        tax
        jsl rlGetSelectedUnitFactionSlot
        jsl rlGetFactionRelation
        cmp #AllegianceEnemy
        beq +

          cmp #AllegianceOther
          beq +

            plx
            sec
            rtl

        +
        plx
        clc
        rtl

        .databank 0

      rlUnknown84D52E ; 84/D52E

        .al
        .autsiz
        .databank ?

        phx
        tax
        lda $7E477B,x
        tax
        jsl rlGetSelectedUnitFactionSlot
        jsl rlGetFactionRelation
        cmp #1
        bne _CLC

        plx
        sec
        rtl
        
        _CLC
        plx
        clc
        rtl

        .databank 0


      rlActionStructGetBattleStats ; 84/D548

        .al
        .autsiz
        .databank `wActionStructAttackerDeploymentNumber

        phb
        php

        sep #$20
        lda #`wActionStructAttackerDeploymentNumber
        pha
        rep #$20
        plb

        phx
        phy
        lda wR0
        sta @l wActionStructAttackerDeploymentNumber
        lda wR1
        sta @l wActionStructDefenderDeploymentNumber
        lda wR2
        sta @l $7ECCCE
        lda wR3
        sta @l $7ECCD0

        ldx #$017B
        sep #$20
        lda #0
        
          -
          sta wBattleType,x
          dec x
          bpl -

        rep #$20

        lda #$FFFF
        sta aActionStructUnit2.ObtainedItem
        sta aActionStructUnit1.ObtainedItem

        ldx wActionStructAttackerDeploymentNumber
        lda aDeploymentTable._State,x
        and #DeploymentAllegianceMask
        cmp #AllegianceOwn
        beq +

        cmp #AllegianceNeutral
        beq +

        ldx wActionStructDefenderDeploymentNumber
        bmi +

        lda aDeploymentTable._State,x
        and #DeploymentAllegianceMask
        cmp #AllegianceEnemy
        beq +

        cmp #AllegianceOther
        beq +

        .databank ?

        lda wActionStructDefenderDeploymentNumber
        sta wActionStructUnit1DeploymentNumber
        lda wActionStructAttackerDeploymentNumber
        sta wActionStructUnit2DeploymentNumber
        lda #2+1
        bra ++

        +
        lda wActionStructAttackerDeploymentNumber
        sta wActionStructUnit1DeploymentNumber
        lda wActionStructDefenderDeploymentNumber
        sta wActionStructUnit2DeploymentNumber
        lda #0

        +
        sep #$20
        sta wBattleStatus
        rep #$20

        ldx #<>aActionStructUnit1
        lda wActionStructUnit1DeploymentNumber
        jsl rsActionStructGetBattleCoordinates

        ldx #<>aActionStructUnit2
        lda wActionStructUnit2DeploymentNumber
        jsl rsActionStructGetBattleCoordinates

        jsl rlGetBattleDistance

        lda wBattleStatus
        and #$0001
        sta wR0
        ldx #<>aActionStructUnit1
        jsl rlActionStructGetBasicBattleData

        lda wBattleStatus
        and #$0001
        eor #$0001
        sta wR0
        ldx #<>aActionStructUnit2
        jsl rlActionStructGetBasicBattleData

        jsr rsActionStructGetBattleTriggerableSkillFlags
        jsr rsBattleHandleEffectiveness
        jsl rlGetBattleSong

        lda wActionStructUnit1DeploymentNumber
        bmi +

        lda wActionStructUnit2DeploymentNumber
        bmi +

          lda wBattleStatus
          and #$0001
          sta wR0
          ldx #<>aActionStructUnit1
          ldy #<>aActionStructUnit2
          jsl rlApplyWeaponTriangleBonus

          lda wBattleStatus
          and #$0001
          eor #$0001
          sta wR0
          ldx #<>aActionStructUnit2
          ldy #<>aActionStructUnit1
          jsl rlApplyWeaponTriangleBonus

          ldy #<>aActionStructUnit1
          jsl rlApplyCharmAndLeadershipHitAvoidBonus
          ldy #<>aActionStructUnit2
          jsl rlApplyCharmAndLeadershipHitAvoidBonus

        +
        lda wBattleStatus
        and #$0001
        sta wR0
        ldx #<>aActionStructUnit1
        ldy #<>aActionStructUnit2
        jsl rlActionStructAdjustFinalStats

        lda wBattleStatus
        and #$0001
        eor #$0001
        sta wR0
        ldx #<>aActionStructUnit2
        ldy #<>aActionStructUnit1
        jsl rlActionStructAdjustFinalStats

        ply
        plx
        plp
        plb
        rtl

        .databank 0

      rlGetBattleSong ; 84/D694

        .al
        .autsiz
        .databank `wActionStructAttackerDeploymentNumber

        jsr rsCheckForSeliphJuliaVSJuliusFight
        bcs _Julius

        ldx wActionStructUnit2DeploymentNumber
        jsr rsCheckIfFightingJulia
        bcs _Julia

        jsr rsCheckIfFightingArvis
        bcs _Arvis

        jsr rsCheckIfFightingMajorBoss
        bcs _MajorBoss

        jsr rsCheckIfFightingRecruitableEnemy
        bcs _RecruitableEnemy

        jsr rsCheckIfFightingBoss
        bcs _Boss

        ldx wActionStructAttackerDeploymentNumber
        lda aDeploymentTable._State,x
        and #DeploymentAllegianceMask
        cmp #AllegianceEnemy
        beq _EnemyAttack

        cmp #AllegianceOther
        beq _EnemyAttack

        ; Player attack
        lda #$0031
        bra _End
        
        _EnemyAttack
        lda #$0032
        bra _End
        
        _RecruitableEnemy
        lda #$003E
        bra _End

        _Boss
        lda #$0033
        bra _End
        
        _MajorBoss
        lda #$0036
        bra _End
        
        _Arvis
        lda #$0034
        bra _End

        _Julia
        lda #$0050
        bra _End
        
        _Julius
        lda #$0035

        _End
        sta wBattleSong
        rtl

        .databank 0

      rsCheckIfFightingRecruitableEnemy ; 84/D6F2

        .al
        .autsiz
        .databank `aDeploymentTable

        lda aDeploymentTable._State,x
        and #DeploymentAllegianceMask
        cmp #1
        bne rsCheckIfFightingBoss._CLC

        lda aDeploymentTable._UnitRAMPointer,x
        sta wSelectedUnitDataRAMPointer,b
        jsl rlGetUnitType
        cmp #UnitTypeHoly
        bcs rsCheckIfFightingBoss._CLC

        jsl rlGetSelectedUnitGenerationID
        sta wRoutineVariable1,b

        lda #0
        jsl rlFindGenerationIDInFactionSlotData
        lda wSelectedUnitDataRAMPointer,b
        bne rsCheckIfFightingBoss._CLC
        bra rsCheckIfFightingBoss._SEC

        .databank 0

      rsCheckIfFightingBoss ; 84/D721

        .al
        .autsiz
        .databank `aDeploymentTable

        lda aDeploymentTable._State,x
        and #DeploymentAllegianceMask
        cmp #1
        bne _CLC

          lda @l aActionStructUnit2.CharacterID
          jsl rlGetCharacterPortraitDataID
          cmp #$00F3
          bne _SEC

        _CLC
        clc
        rts
        
        _SEC
        sec
        rts

        .databank 0

      rsCheckIfFightingMajorBoss ; 84/D73D

        .al
        .autsiz
        .databank ?

        lda aActionStructUnit2.CharacterID
        cmp #ChagallCh02
        beq rsCheckIfFightingBoss._SEC

        cmp #EldiganCh03
        beq rsCheckIfFightingBoss._SEC

        cmp #ChagallCh03
        beq rsCheckIfFightingBoss._SEC

        cmp #LombardCh05
        beq rsCheckIfFightingBoss._SEC

        cmp #TravantCh05
        beq rsCheckIfFightingBoss._SEC

        cmp #ReptorCh05
        beq rsCheckIfFightingBoss._SEC

        cmp #Danann
        beq rsCheckIfFightingBoss._SEC

        cmp #BloomCh07
        beq rsCheckIfFightingBoss._SEC

        cmp #IshtarCh08
        beq rsCheckIfFightingBoss._SEC

        cmp #BloomCh08
        beq rsCheckIfFightingBoss._SEC

        cmp #TravantCh09
        beq rsCheckIfFightingBoss._SEC

        cmp #ArionCh09
        beq rsCheckIfFightingBoss._SEC

        cmp #HildaCh10
        beq rsCheckIfFightingBoss._SEC

        cmp #IshtarCh10
        beq rsCheckIfFightingBoss._SEC

        cmp #Brian
        beq rsCheckIfFightingBoss._SEC

        cmp #HildaChFinal
        beq rsCheckIfFightingBoss._SEC

        cmp #Manfroy
        beq rsCheckIfFightingBoss._SEC

        cmp #ArionChFinal
        beq rsCheckIfFightingBoss._SEC

        cmp #IshtarChFinal
        beq rsCheckIfFightingBoss._SEC

        cmp #JuliusChFinal
        beq rsCheckIfFightingBoss._SEC
        bra rsCheckIfFightingBoss._CLC

        .databank 0

      rsCheckIfFightingArvis ; 84/D7A7

        .al
        .autsiz
        .databank ?

        lda aActionStructUnit2.CharacterID
        cmp #ArvisCh10
        beq rsCheckIfFightingBoss._SEC
        bra rsCheckIfFightingBoss._CLC

        .databank 0

      rsCheckIfFightingJulia ; 84/D7B2

        .al
        .autsiz
        .databank ?

        lda aActionStructUnit2.CharacterID
        cmp #Julia
        beq rsCheckIfFightingBoss._SEC
        jml rsCheckIfFightingBoss._CLC

        .databank 0

      rsCheckForSeliphJuliaVSJuliusFight ; 84/D7BF

        .al
        .autsiz
        .databank ?

        lda aActionStructUnit1.CharacterID
        cmp #Seliph
        beq +

        cmp #Julia
        bne _CLC

        +
        lda aActionStructUnit2.CharacterID
        cmp #JuliusCh10
        beq _SEC

        cmp #JuliusChFinal
        beq _SEC

        _CLC
        clc
        rts
        
        _SEC
        sec
        rts

        .databank 0

      rsActionStructGetBattleCoordinates ; 84/D7DF

        .al
        .autsiz
        .databank `aDeploymentTable

        sta structActionStructEntry.DeploymentNumber,b,x
        bmi _End

        tay
        lda aDeploymentTable._UnitRAMPointer,y
        sta structActionStructEntry.UnitRAMPointer,b,x
        sta wSelectedUnitDataRAMPointer,b

        lda aDeploymentTable._XTilePosition,y
        sta structActionStructEntry.XPosition,b,x
        lda aDeploymentTable._YTilePosition,y
        sta structActionStructEntry.YPosition,b,x

        jsl rlGetSelectedUnitStates
        bit #UnitState0400
        beq _End

        bit #UnitStateGuardingCastle
        bne +

        ; attacker gets shifted up a tile
        dec structActionStructEntry.YPosition,b,x
        bra ++

        ; defender one down
        +
        inc structActionStructEntry.YPosition,b,x
        lda #8
        tsb wBattleStatus
        
        +
        lda #4
        tsb wBattleStatus

        _End
        rtl

        .databank 0

      rlActionStructGetBasicBattleData ; 84/D81D

        .al
        .autsiz
        .databank ?

        lda structActionStructEntry.DeploymentNumber,b,x
        bpl +

          jml _End
        
        +
        tay
        lda structActionStructEntry.UnitRAMPointer,b,x
        sta wSelectedUnitDataRAMPointer,b

        jsl rlGetSelectedUnitCharacterID
        sta structActionStructEntry.CharacterID,b,x

        jsl rlGetSelectedUnitClassID
        sta structActionStructEntry.ClassID,b,x

        jsl rlGetSelectedUnitGender
        sta structActionStructEntry.Gender,b,x

        tya
        jsl rlGetTerrainTypeByDeploymentOffset
        sta structActionStructEntry.TerrainType,b,x

        jsl rlGetSelectedUnitCurrentHP
        sta structActionStructEntry.CurrentHP,b,x

        jsl rlGetSelectedUnitMaxHP
        sta structActionStructEntry.MaxHP,b,x

        jsl rlGetSelectedUnitLevel
        sta structActionStructEntry.Level,b,x

        lda #0
        sta structActionStructEntry.GainedLevels,b,x

        jsl rlGetSelectedUnitExperience
        sta structActionStructEntry.StartingExperience,b,x

        lda #0
        sta structActionStructEntry.GainedExperience,b,x

        lda wR0
        beq +

        jsr rsActionStructGetEnemyAutoCounterWeapon
        bra ++
        
        +
        lda wSelectedInventorySlot,b

        +
        sta structActionStructEntry.WeaponInventorySlot,b,x

        cmp #0
        bne +

          lda #$FFFF
          sta structActionStructEntry.WeaponID,b,x
          stz wCurrentItemDataROMPointer,b
          bra ++

        +
        jsl rlGetItemIDByInventorySlot
        sta structActionStructEntry.WeaponID,b,x

        jsr rsGetBattleRangedAlternateWeapon

        jsl rlGetItemMinimumRange
        sta structActionStructEntry.WeaponMinRange,b,x

        jsl rlGetItemMaximumRange
        sta structActionStructEntry.WeaponMaxRange,b,x

        jsl rlGetItemWeaponType
        sta structActionStructEntry.WeaponType,b,x

        +
        jsl rlGetSelectedUnitBattleAttackSpeed
        sta structActionStructEntry.BattleAttackSpeed,b,x

        jsl rlGetSelectedUnitBattleHit
        sta structActionStructEntry.BattleHit,b,x

        lda structActionStructEntry.TerrainType,b,x
        jsl rlGetSelectedUnitBattleAvoid
        sta structActionStructEntry.BattleAvoid,b,x

        jsl rlGetSelectedUnitBattleCrit
        sta structActionStructEntry.BattleCrit,b,x

        _End
        rtl

        .databank 0

      rsActionStructGetEnemyAutoCounterWeapon ; 84/D8D0

        .al
        .autsiz
        .databank ?

        jsl rlGetSelectedUnitFactionSlot
        ora #0
        bne +

          jsl rlGetFirstEquippableWeaponInInventory
          rts
        
        +
        lda wBattleDistance
        jsl rlGetCounterableWeaponSlot
        rts

        .databank 0

      rlGetBattleDistance ; 84/D8E7

        .al
        .autsiz
        .databank `aActionStructUnit1

        lda aActionStructUnit1.DeploymentNumber
        bmi _D917

        lda aActionStructUnit2.DeploymentNumber
        bmi _D917

        lda aActionStructUnit1.XPosition
        sec
        sbc aActionStructUnit2.XPosition
        bpl +

          eor #$FFFF
          inc a

        +
        sta wBattleDistance

        lda aActionStructUnit1.YPosition
        sec
        sbc aActionStructUnit2.YPosition
        bpl +

          eor #$FFFF
          inc a

        +
        clc
        adc @l wBattleDistance
        sta wBattleDistance
        rtl

        _D917
        lda #1
        sta wBattleDistance
        rtl

        .databank 0

      rlApplyWeaponTriangleBonus ; 84/D91E

        .al
        .autsiz
        .databank ?

        lda structActionStructEntry.WeaponID,b,x
        bmi +

        lda structActionStructEntry.WeaponType,b,x
        sta wRoutineVariable1,b

        lda structActionStructEntry.WeaponID,b,y
        bmi +

        lda structActionStructEntry.WeaponType,b,y
        xba
        ora wRoutineVariable1,b
        jsl rlGetWeaponTriangleBonus

        ora #0
        beq +

          sta wRoutineVariable1,b

          lda structActionStructEntry.BattleHit,b,x
          clc
          adc wRoutineVariable1,b
          sta structActionStructEntry.BattleHit,b,x

          lda structActionStructEntry.BattleAvoid,b,x
          clc
          adc wRoutineVariable1,b
          sta structActionStructEntry.BattleAvoid,b,x

        +
        rtl

        .databank 0

      rlApplyCharmAndLeadershipHitAvoidBonus ; 84/D956

        .al
        .autsiz
        .databank ?

        ldx structActionStructEntry.DeploymentNumber,b,y
        jsl rlGetTotalCharmAndLeadershipBonus
        sta $7ECCE4

        jsr rsUnknown84D97B

        lda $7ECCE4
        clc
        adc structActionStructEntry.BattleHit,b,y
        sta structActionStructEntry.BattleHit,b,y

        lda $7ECCE4
        clc
        adc structActionStructEntry.BattleAvoid,b,y
        sta structActionStructEntry.BattleAvoid,b,y
        rtl

        .databank 0

      rsUnknown84D97B ; 84/D97B

        .al
        .autsiz
        .databank ?

        phx
        lda structActionStructEntry.UnitRAMPointer,b,y
        sta wSelectedUnitDataRAMPointer,b
        jsl rlGetSelectedUnitCharacterID
        cmp #Sigurd
        beq +

        cmp #Seliph
        beq +

        jsl rlGetSelectedUnitStates
        bit #UnitStateGroupLeader
        beq ++

        +
        jsl rlGetSelectedUnitLeadershipStars
        tax
        lda aLeaderShipBonusTable,x
        and #$00FF
        clc
        adc $7ECCE4
        sta $7ECCE4
        
        +
        plx
        rts

        .databank 0

      aLeaderShipBonusTable ; 84/D9B0

        .byte  0
        .byte  0
        .byte 10
        .byte 20
        .byte 30
        .byte 40

      rlActionStructAdjustFinalStats ; 84/D9B6

        .al
        .autsiz
        .databank $7E

        lda wR0
        beq _D9FF

        lda structActionStructEntry.WeaponInventorySlot,b,y
        beq +

        lda structActionStructEntry.WeaponID,b,y
        jsl rlGetItemDataROMPointer
        jsl rlGetItemEquipmentType
        cmp #EquipTypeWeapon
        bne +

        jsl rlGetItemWeaponTraits
        cmp #WeaponTraitUncounterable
        bne _D9FF

        lda #0
        sta structActionStructEntry.WeaponInventorySlot,b,x
        bra _DA0B

        +
        lda #0
        sta structActionStructEntry.WeaponInventorySlot,b,x
        lda #$00FF
        sta structActionStructEntry.BattleMight,b,x
        sta structActionStructEntry.BattleDefense,b,x
        sta structActionStructEntry.BattleAdjustedHit,b,x
        sta structActionStructEntry.BattleMight,b,y
        sta structActionStructEntry.BattleDefense,b,y
        sta structActionStructEntry.BattleAdjustedHit,b,y
        jml _End

        _D9FF
        lda structActionStructEntry.BattleMight,b,x
        cmp #$00FF
        bne _DA0B

          jml _End
        
        _DA0B
        lda structActionStructEntry.UnitRAMPointer,b,x
        bne +

          jml _End

        +
        sta wSelectedUnitDataRAMPointer,b

        lda structActionStructEntry.WeaponID,b,x
        jsr rsGetBattleRangedAlternateWeapon
        jsl rlGetSelectedUnitBattleMight
        sta structActionStructEntry.BattleMight,b,x

        jsr rsSetHalvedBattleMight

        lda structActionStructEntry.WeaponID,b,y
        bmi +

        jsr rsGetBattleRangedAlternateWeapon
        jsl rlGetItemWeaponType
        cmp #WeaponTypeStaff
        bcs ++
        
        +
        lda structActionStructEntry.WeaponID,b,x
        jsl rlGetItemDataROMPointer
        jsl rlGetSelectedUnitBattleDefense
        bra ++
        
        +
        lda structActionStructEntry.WeaponID,b,x
        jsl rlGetItemDataROMPointer
        jsl rlGetSelectedUnitBattleResistance

        +
        sta structActionStructEntry.BattleDefense,b,x

        lda structActionStructEntry.BattleHit,b,x
        sec
        sbc structActionStructEntry.BattleAvoid,b,y
        cmp #0
        bmi _FloorHit

        cmp #101
        bpl _CapHit
        bra +
        
        _FloorHit
        lda #0
        bra +
        
        _CapHit
        lda #100

        +
        sta structActionStructEntry.BattleAdjustedHit,b,x

        lda @l wActionStructAttackerDeploymentNumber
        cmp structActionStructEntry.DeploymentNumber,b,x
        bne _End

        sta wR10
        lda @l wActionStructDefenderDeploymentNumber
        sta wR11
        jsl rlActionStructGetScriptedCritPossibility
        sta wBattleCriticalType
        ora #0
        beq _End

          phx
          dec a
          tax
          lda aUnknown84DAE8,x
          and #$00FF
          sta $4F77,b

          lda $7F442A
          jsr rsGetUnitCoordinatesByDeploymentNumber
          lda wR10
          sta $4F79,b
          lda wR11
          sta $4F7B,b

          lda $7F442C
          cmp #$00FF
          beq +

            jsr rsGetUnitCoordinatesByDeploymentNumber
            lda wR10
            sta $4F7D,b
            lda wR11
            sta $4F7F,b

          +
          lda aScriptedCritChanceBoosts,x
          and #$00FF
          plx

          clc
          adc structActionStructEntry.BattleCrit,b,x
          cmp #101
          bcc +

            lda #100

          +
          sta structActionStructEntry.BattleCrit,b,x
        
        _End
        rtl

        .databank 0

      rsGetUnitCoordinatesByDeploymentNumber ; 84/DADA

        .al
        .autsiz
        .databank `aDeploymentTable

        phx
        tax
        lda aDeploymentTable._XTilePosition,x
        sta wR10
        lda aDeploymentTable._YTilePosition,x
        sta wR11
        plx
        rts

        .databank 0

      aUnknown84DAE8 ; 84/DAE8

        ; scripted crit types?

        .byte $01 ; sibling
        .byte $01 ; lover
        .byte $02 ; triangle attack
        .byte $02 ; ?

      aScriptedCritChanceBoosts ; 84/DAEC

        .byte 20
        .byte 20
        .byte 100
        .byte 100

      rsSetHalvedBattleMight ; 84/DAF0

        .al
        .autsiz
        .databank ?

        lda structActionStructEntry.WeaponID,b,x
        bmi _End

        jsl rlGetItemDataROMPointer
        jsl rlGetItemWeaponTraits
        cmp #WeaponTraitNegateHalveAttack
        bne +

        jsl rlGetItemAdditionalInfo
        cmp structActionStructEntry.WeaponID,b,y
        beq _End
        
        +
        lda structActionStructEntry.WeaponID,b,y
        bmi _End

        jsl rlGetItemDataROMPointer
        jsl rlGetItemWeaponTraits
        cmp #WeaponTraitHalveAttack
        bne _End

        lda structActionStructEntry.BattleMight,b,x
        lsr a
        sta structActionStructEntry.BattleMight,b,x
        
        _End
        rts

        .databank 0

      rsGetBattleRangedAlternateWeapon ; 84/DB25

        .al
        .autsiz
        .databank `wBattleDistance

        ; A = item ID

        cmp #0
        bmi _DB4D

        jsl rlGetItemDataROMPointer
        jsl rlGetItemWeaponTraits
        cmp #WeaponTraitRangedMagicSword
        beq +

        cmp #WeaponTraitPermanentMagicSword
        bne _End
        
        +
        lda wBattleDistance
        cmp #2
        bcc _End

        jsl rlGetItemAdditionalInfo
        jsl rlGetItemDataROMPointer
        
        _End
        rts
        
        _DB4D
        stz wCurrentItemDataROMPointer,b
        bra _End

        .databank 0

      rlGetTotalCharmAndLeadershipBonus ; 84/DB52

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        phy
        lda wR0
        pha
        lda wR1
        pha

        stx wR0
        lda aDeploymentTable._UnitRAMPointer,x
        sta wSelectedUnitDataRAMPointer,b
        jsl rlGetSelectedUnitLoverGenerationID
        sta wR3
        jsl rlUnknown849FC4
        sta wR4

        lda aDeploymentTable._FactionSlot,x
        sta wR5
        stz wR2
        ldx #(len(aDeploymentTable._State) - 2)
        
        -
        lda aDeploymentTable._State,x
        bit #DeploymentStateAlive
        beq +

          stx wR1
          jsl rlGetUnitsDistance
          cmp #0
          beq +

            cmp #4
            bcs +

              ; get unit within 3 tiles
              phx
              lda aDeploymentTable._FactionSlot,x
              tax
              lda wR5
              jsl rlGetFactionRelation
              plx
              cmp #AllegianceEnemy
              beq +

                lda aDeploymentTable._UnitRAMPointer,x
                sta wSelectedUnitDataRAMPointer,b

                jsr rsGetCharmBonus
                jsr rsGetUnit1LeadershipBonus
                jsr rsGetUnit2LeadershipBonus

        +
        dec x
        dec x
        bpl -

        lda wR2

        plx
        stx wR0
        plx
        stx wR1
        ply
        plx
        plp
        plb
        rtl

        .databank 0

      rsGetCharmBonus ; 84/DBCA

        .al
        .autsiz
        .databank ?

        lda #SkillIDCharm
        jsl rlCheckIfUnitHasSpecifiedPersonalOrClassSkill
        bcs +

        lda #SkillIDCharm
        jsl rlCheckIfInventoryItemsHaveSpecifiedSkill
        bcc rsGetUnit2LeadershipBonus._SEC
        
        +
        lda #10
        bra rsGetUnit2LeadershipBonus._CLC

        .databank 0

      rsGetUnit1LeadershipBonus ; 84/DBE1

        .al
        .autsiz
        .databank ?

        lda wR3
        beq rsGetUnit2LeadershipBonus._SEC

        jsl rlGetSelectedUnitGenerationID
        bcs rsGetUnit2LeadershipBonus._SEC

        cmp wR3
        bne rsGetUnit2LeadershipBonus._SEC

        lda #10
        bra rsGetUnit2LeadershipBonus._CLC

        .databank 0

      rsGetUnit2LeadershipBonus ; 84/DBF4

        .al
        .autsiz
        .databank `_LeadershipBonus

        lda wR4
        beq _SEC

        jsl rlGetSelectedUnitCharacterID
        cmp wR4
        bne _SEC

        jsl rlGetSelectedUnitLeadershipStars
        tay
        lda _LeadershipBonus,y
        and #$00FF
        bra _CLC

          _LeadershipBonus
          .byte 0
          .byte 0
          .byte 10
          .byte 20
          .byte 30
          .byte 40

        _CLC
        clc
        adc wR2
        sta wR2
        clc
        rts
        
        _SEC
        sec
        rts

        .databank 0

      rlUnknown84DC1C ; 84/DC1C

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        lda $00
        pha
        lda $02
        pha

        lda $057C,b
        asl a
        tax
        jsr (aUnknown84DC3F,x)

        lda #0
        sta $057C,b

        pla
        sta $02
        pla
        sta $00
        plx
        plp
        plb
        rtl

        .databank 0

      aUnknown84DC3F ; 84/DC3F

        .word <>rlUnknown84E06C
        .word <>rlUnknown84E06C
        .word <>rsUnknown84DC82
        .word $DC8D
        .word <>rsUnknown84DC9A

      rlUnknown84E06C ; 84/DC49

        .al
        .autsiz
        .databank ?

        jsl rlActionStructGetBattleStats

        lda wUnknown000D79,b
        bit #$0020

        sep #$20
        bne +

        lda #0
        sta wBattleType
        bra ++
        
        +
        lda #3
        sta wBattleType
        
        +
        rep #$20
        
        lda wActionStructAttackerDeploymentNumber
        tax
        lda aDeploymentTable._FactionSlot,x
        bne +

          lda aDeploymentTable._UnitRAMPointer,x
          sta wSelectedUnitDataRAMPointer,b
          jsl rlUnknown84B321

        +
        jsl rlUnknown84DCA3
        rts

        .databank 0

      rsUnknown84DC82 ; 84/DC82

        .al
        .autsiz
        .databank ?

        ldx $00
        jsl $88AF7B
        jsl $84D2BA
        rts

        .databank 0

      rsUnknown84DC8D ; 84/DC8D

        .al
        .autsiz
        .databank ?

        jsl $88AF7B
        jsl $84D334
        jsl $9EDAE7
        rts

        .databank 0

      rsUnknown84DC9A ; 84/DC9A

        .al
        .autsiz
        .databank ?

        jsl $88AF7B
        jsl $84D16B
        rts

        .databank 0

      rlUnknown84DCA3 ; 84/DCA3

        .al
        .autsiz
        .databank `aBattleRoundsData

        phb
        php

        sep #$20
        lda #`aBattleRoundsData
        pha
        rep #$20
        plb

        phx
        phy
        lda #(`aBattleRoundsData)<<8
        sta lR18+1
        lda #<>aBattleRoundsData
        sta lR18
        lda #len(aBattleRoundsData._Entry)
        sta wR0
        lda #size(aBattleRoundsData._Entry[0])
        sta wR1
        jsl rlBuildRAMStructHeader

        stz $CCE0,b

        ; Get initiator. 0=player 1=opponent
        lda @l wBattleStatus
        and #$0001
        sta @l wBattleAttackerIndex

        jsr rsActionStructGetBattleInitiatorIfArena

        lda wUnknown000D79,b
        bit #$0010
        bne _Loop

          lda #$0010
          tsb wUnknown000D79,b

          jsr rsActionStructGetBattleTriggerableSkillFlags
          jsr rsActionStructAdjustVantageRoundOrder
          jsr rsActionStructCheckForDance
          jsr rsActionStructClearMagicEquipmentIfSilenced
          stz $CCE2,b

        _Loop
        lda #2
        sta @l $7ECCD2
        
        -
        lda @l wBattleAttackerIndex
        jsr rsUnknown84DEEB
        bcs _DD37

        lda @l wBattleAttackerIndex
        eor #$0001
        sta @l wBattleAttackerIndex

        dec $CCD2,b
        bne -

        jsr rsActionStructCheckIfCombatantsCanDouble
        bcc +

        jsr rsUnknown84DEEB
        bcs _DD37

        +
        inc $CCE2,b

        lda @l wBattleType
        and #$00FF
        cmp #1
        bne +

          ; Arena
          jml _DDFD

        +
        jsr rsActionStructCheckForAccostBattleRound
        bcs _Loop

        _DD37
        lda #$FFFF
        sta lStructPointer1,b
        lda #(`aBattleRoundsData)<<8
        sta lStructPointer2+1,b
        lda #<>aBattleRoundsData
        sta lStructPointer2,b
        jsl rlAppendNewStructEntry

        ldx #<>aActionStructUnit1
        jsr rsActionstructGetLevelUpAndDroppedItemData
        ldx #<>aActionStructUnit2
        jsr rsActionstructGetLevelUpAndDroppedItemData

        lda #$0010
        trb wUnknown000D79,b

        lda @l wBattleType
        and #$00FF
        cmp #0
        bne +

          ; normal battle
          ldx $0772,b
          lda aDeploymentTable._UnitRAMPointer,x
          sta wSelectedUnitDataRAMPointer,b
          lda #UnitState0400
          jsl rlUnsetSelectedUnitStates
          jsl rlUnknown84C9E3
          bcs +

            jsl rlUnknown84CAA9

        +
        jsr rsSetBattleStatusAnimation
        
        lda wBattleCriticalType
        bit #$7FFF
        beq _NoSpecialCrit

          bit #$8000
          beq _NoSpecialCrit

            ; If unit performed a special crit, run the event engine and see if any
            ; events try to catch this.

            and #$7FFF
            sta wEventEngineArgument1,b

            lda wBattleStatus
            bit #$0001
            bne +

            lda aActionStructUnit1.CharacterID
            bra ++

            +
            lda aActionStructUnit2.CharacterID
            
            +
            sta wEventEngineArgument2,b

            sep #$20
            lda #$1D
            sta bEventActionIdentifier,b
            rep #$20

            jsl rlGetAndRunChapterMapEventConditions

        _NoSpecialCrit
        lda aActionStructUnit1.WeaponType
        cmp #WeaponTypeStaff
        beq _DDF7

          lda #$0014
          sta bEventActionIdentifier,b

          lda aActionStructUnit1.UnitRAMPointer
          sta wSelectedUnitDataRAMPointer,b
          jsl rlGetSelectedUnitFactionSlot
          sta wEventEngineArgument1,b
          jsl rlGetSelectedUnitCharacterID
          sta wEventEngineArgument2,b

          lda aActionStructUnit2.UnitRAMPointer
          sta wSelectedUnitDataRAMPointer,b
          jsl rlGetSelectedUnitFactionSlot
          sta wEventEngineArgument3,b
          jsl rlGetSelectedUnitCharacterID
          sta wEventEngineArgument4,b

          jsl rlGetAndRunChapterMapEventConditions
          bcs _End

        _DDF7
        jsl rlUnknown84DE36
        bra _End

        _DDFD
        lda #$FEFF
        sta lStructPointer1,b
        lda #(`aBattleRoundsData)<<8
        sta lStructPointer2+1,b
        lda #<>aBattleRoundsData
        sta lStructPointer2,b
        jsl rlAppendNewStructEntry

        _End
        ply
        plx
        plp
        plb
        rtl

        .databank 0

      rlClearBattleData ; 84/DE18

        .al
        .autsiz
        .databank ?

        phx
        ldx #(wAITargetCounter - wBattleType) -1
        sep #$20
        lda #0

          -
          sta wBattleType,x
          dec x
          bpl -

        rep #$20
        lda #$FFFF
        sta aActionStructUnit2.ObtainedItem
        sta aActionStructUnit1.ObtainedItem
        plx
        rtl

        .databank 0

      rlUnknown84DE36 ; 84/DE36

        .al
        .autsiz
        .databank $7E

        phb
        php

        sep #$20
        lda #$7E
        pha
        rep #$20
        plb

        lda wBattleType
        and #$00FF
        cmp #1
        beq _End

          lda aActionStructUnit1.WeaponID
          cmp #ValkyrieStaff
          beq _DE91

          cmp #Naga
          beq _DE91

          lda aActionStructUnit2.WeaponID
          cmp #Loptous
          beq _DE91

          lda wBattleType
          and #$00FF
          cmp #0
          beq +

          cmp #3
          bne _DE91

          +
          lda aActionStructUnit1.WeaponType
          cmp #WeaponTypeStaff
          beq +

            lda wBattleCriticalType
            bit #$7FFF
            beq +

            bit #$8000
            bne _DE97

          +
          lda aActionStructUnit1.UnitRAMPointer
          sta wSelectedUnitDataRAMPointer,b
          jsl $84BB54
          bra _End

          _DE91
          jsl $81B368
          bra _End

          _DE97
          and #$7FFF
          sta wBattleCriticalType
          jsl $9EDF7F
          bra _End
        
        _End
        plp
        plb
        rtl

        .databank 0

      rsSetBattleStatusAnimation ; 84/DEA6

        .al
        .autsiz
        .databank $7E

        lda wBattleType
        and #$00FF
        cmp #1
        beq _End

          lda aActionStructUnit1.WeaponID
          cmp #ValkyrieStaff
          beq _End

          cmp #Naga
          beq _End

          lda aActionStructUnit2.WeaponID
          cmp #Loptous
          beq _End

          lda wBattleType
          and #$00FF
          cmp #0
          beq +

            cmp #3
            bne _End

          +
          lda aActionStructUnit1.UnitRAMPointer
          sta wSelectedUnitDataRAMPointer,b
          jsl $84BB65
          bcc _End

            lda #$0040
            tsb wBattleStatus
            bra _End
        
        _End
        rts

        .databank 0

      rsUnknown84DEEB ; 84/DEEB

        .al
        .autsiz
        .databank ?

        ; acting unit in A
        ; 0 = player
        ; 1 = enemy

        asl a
        tax
        lda aUnknown84DF35,x
        sta wActionStructAttacker
        lda aUnknown84DF35+2,x
        sta wActionStructDefender

        jsr rsActionStructTryProcSwordSkills
        jsr rsActionStructGetNumberOfStrikes
        sta $7ECCD4
        
          -
          lda #0
          jsr rsUnknown84E433
          bcs _CLC

            lda #(`aBattleRoundsData)<<8
            sta lStructPointer2+1,b
            lda #<>aBattleRoundsData
            sta lStructPointer2,b
            lda bBattleRoundFlags
            sta lStructPointer1,b
            jsl rlAppendNewStructEntry

            lda $7ECCE0
            bne _SEC

            dec $CCD4,b
            bne -

        _CLC
        clc
        rts

        _SEC
        sec
        rts

        .databank 0

      aUnknown84DF35 ; 84/DF35

        .word <>aActionStructUnit1
        .word <>aActionStructUnit2
        .word <>aActionStructUnit1

      rsCheckIfUnitHasWeaponEquipped ; 84/DF3B

        .al
        .autsiz
        .databank ?

        lda structActionStructEntry.DeploymentNumber,b,x
        bmi +

          jsr rsCheckForWeaponInventorySlot
          bcc +

            lda structActionStructEntry.UnitRAMPointer,b,x
            sta wSelectedUnitDataRAMPointer,b
            jsl rlGetSelectedUnitStatus
            cmp #StatusSleep
            beq +

              lda structActionStructEntry.WeaponID,b,x
              bmi +

                jsl rlGetItemDataROMPointer
                jsl rlGetItemEquipmentType
                cmp #EquipTypeWeapon
                bne +

                  sec
                  rts

        +
        clc
        rts

        .databank 0

      rsCheckForWeaponInventorySlot ; 84/DF6A

        .al
        .autsiz
        .databank `wBattleType

        lda wBattleType
        and #$00FF
        cmp #1
        beq +

          ; normal battle
          lda structActionStructEntry.WeaponInventorySlot,b,x
          beq _CLC
          bmi _CLC
          bra _SEC
        
        +
        lda structActionStructEntry.WeaponInventorySlot,b,x
        beq _CLC
        
        _SEC
        sec
        rts
        
        _CLC
        clc
        rts

        .databank 0

      rlUnknown84DF87 ; 84/DF87

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aBattleRoundsData
        pha
        rep #$20
        plb

        phx
        phy
        lda lR18
        pha
        lda lR18+1
        pha

        lda #(`aBattleRoundsData)<<8
        sta lR18+1
        lda #<>aBattleRoundsData
        sta lR18
        lda #$0020
        sta wR0
        lda #2
        sta wR1
        jsl rlBuildRAMStructHeader

        pla
        sta lR18+1
        pla
        sta lR18

        lda #$0010
        tsb wUnknown000D79,b
        ldy #0

          _Loop
          lda [lR18],y
          cmp #$FFFF
          beq _E007

            and #$0001
            sta wBattleAttackerIndex
            asl a
            tax
            lda aUnknown84E033,x
            sta wActionStructAttacker
            lda aUnknown84E033+2,x
            sta wActionStructDefender

            lda [lR18],y
            and #$00FF
            ora #SB_ApplyGuarantees
            jsr rsUnknown84E433
            bcs +

              lda #(`aBattleRoundsData)<<8
              sta lStructPointer2+1,b
              lda #<>aBattleRoundsData
              sta lStructPointer2,b
              lda bBattleRoundFlags
              sta lStructPointer1,b
              jsl rlAppendNewStructEntry

            +
            inc y
            bra _Loop

        _E007
        lda #$FFFF
        sta lStructPointer1,b
        lda #(`aBattleRoundsData)<<8
        sta lStructPointer2+1,b
        lda #<>aBattleRoundsData
        sta lStructPointer2,b
        jsl rlAppendNewStructEntry

        lda #$0010
        trb wUnknown000D79,b
        lda #$0033
        sta wBattleSong
        jsl $81B368

        ply
        plx
        plp
        plb
        rtl

        .databank 0

      aUnknown84E033 ; 84/E033

        .word <>aActionStructUnit1
        .word <>aActionStructUnit2
        .word <>aActionStructUnit1

      rlSetBattleDeathQuotes ; 84/E039

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = if 0: set battle quote, else set death quote
        ; lR18 = dialogue pointer

        phb
        php
        phk
        plb
        ora #0
        bne +

        lda lR18+1
        sta wBattleQuotePointer+1
        lda lR18
        sta wBattleQuotePointer
        bra ++

        +
        lda lR18+1
        sta wDeathQuotePointer+1
        lda lR18
        sta wDeathQuotePointer
        
        +
        plp
        plb
        rtl

        .databank 0

      rsActionStructGetBattleTriggerableSkillFlags ; 84/E05F

        .al
        .autsiz
        .databank ?

        ldy #<>aActionStructUnit1
        jsr rsGetUnitsBattleTriggerableSkillFlags
        ldy #<>aActionStructUnit2
        jsr rsGetUnitsBattleTriggerableSkillFlags
        rts

        .databank 0

      rsGetUnitsBattleTriggerableSkillFlags ; 84/E06C

        .al
        .autsiz
        .databank ?

        lda #0
        sta structActionStructEntry.TriggerableSkills,b,y

        lda structActionStructEntry.UnitRAMPointer,b,y
        beq _End

        sta wSelectedUnitDataRAMPointer,b
        ldx #size(aCombatSkillsTable)-2

        -
        lda aCombatSkillsTable,x
        jsl rlCheckIfUnitHasSpecifiedPersonalOrClassSkill
        bcs +

        lda aCombatSkillsTable,x
        jsl rlCheckIfInventoryItemsHaveSpecifiedSkill
        bcc ++

        +
        lda structActionStructEntry.TriggerableSkills,b,y
        ora aCombatSkillsFlags,x
        sta structActionStructEntry.TriggerableSkills,b,y

        +
        dec x
        dec x
        bpl -

        _End
        rts

        .databank 0

      aCombatSkillsTable .block ; 84/E0A0

        .word SkillIDWrath
        .word SkillIDPursuit
        .word SkillIDAdept
        .word SkillIDNihil
        .word SkillIDMiracle
        .word SkillIDVantage
        .word SkillIDAccost
        .word SkillIDPavise
        .word SkillIDSteal
        .word SkillIDAstra
        .word SkillIDLuna
        .word SkillIDSol
        .word SkillIDHoly
        .word SkillIDDarkness
        .word SkillIDDance

      .bend

      aCombatSkillsFlags ; 84/E0BE

        .word CombatSkillFlagWrath
        .word CombatSkillFlagPursuit
        .word CombatSkillFlagAdept
        .word CombatSkillFlagNihil
        .word CombatSkillFlagMiracle
        .word CombatSkillFlagVantage
        .word CombatSkillFlagAccost
        .word CombatSkillFlagPavise
        .word CombatSkillFlagSteal
        .word CombatSkillFlagAstra
        .word CombatSkillFlagLuna
        .word CombatSkillFlagSol
        .word CombatSkillFlagHoly
        .word CombatSkillFlagDarkness
        .word CombatSkillFlagDance
        .word CombatSkillFlagStayOnMap

      rsActionStructTryProcSwordSkills ; 84/E0DE

        .al
        .autsiz
        .databank ?

        lda #0
        sta wBattleActivatedSkill
        lda #0
        sta $7ECCE8

        ldx #<>aActionStructUnit1
        ldy #<>aActionStructUnit2
        jsr rsActionStructTryProcSwordSkillsEffect

        lda #1
        sta $7ECCE8

        ldx #<>aActionStructUnit2
        ldy #<>aActionStructUnit1
        jsr rsActionStructTryProcSwordSkillsEffect
        rts

        .databank 0

      rsActionStructTryProcSwordSkillsEffect ; 84/E106

        .al
        .autsiz
        .databank `wBattleAttackerIndex

        lda #0
        sta structActionStructEntry.BattleBonusAtkDef,b,x

        lda structActionStructEntry.DeploymentNumber,b,x
        bpl +

          jml _End

        +
        lda $0022,b,x
        cmp #8
        beq _End

          jsr rsCheckIfUnitHasWeaponEquipped
          bcc _End

            jsr rsCheckIfBattleDistanceInWeaponRange
            bcc _End

              lda structActionStructEntry.UnitRAMPointer,b,y
              sta wSelectedUnitDataRAMPointer,b
              lda #SkillIDNihil
              jsl rlCheckIfUnitHasSpecifiedPersonalOrClassSkill
              bcs _End

                lda structActionStructEntry.WeaponID,b,x
                jsl rlGetItemDataROMPointer
                jsl rlGetItemWeaponType
                cmp #WeaponTypeSword
                bne _End

                  lda structActionStructEntry.UnitRAMPointer,b,x
                  sta wSelectedUnitDataRAMPointer,b

                  ldy #SkillIDAstra

                    -
                    tya
                    jsl rlCheckIfUnitHasSpecifiedPersonalOrClassSkill
                    bcc + 

                    jsl rlGetSelectedUnitTotalSkill
                    jsl rlRollForChance
                    bcc ++

                    +
                    inc y
                    cpy #SkillIDRenewal
                    bcc -

                  _End
                  rts
        
        +
        cpy #SkillIDHoly
        beq +

          cpy #SkillIDDarkness
          beq +

            lda @l $7ECCE8
            cmp @l wBattleAttackerIndex
            bne _End

              sty wBattleActivatedSkill
              bra ++

        +
        lda #20
        sta structActionStructEntry.BattleBonusAtkDef,b,x

        +
        tya
        xba
        ora #$00FE
        sta lStructPointer1,b

        lda #(`aBattleRoundsData)<<8
        sta lStructPointer2+1,b
        lda #<>aBattleRoundsData
        sta lStructPointer2,b
        jsl rlAppendNewStructEntry
        rts

        .databank 0

      rsActionStructCheckForDance ; 84/E19F

        .al
        .autsiz
        .databank `wBattleStatus

        ldx #<>aActionStructUnit1
        ldy #<>aActionStructUnit2
        lda structActionStructEntry.TriggerableSkills,b,x
        bit #CombatSkillFlagDance
        beq _End

          lda wBattleStatus
          and #$0001
          bne +

          ; If song would be player attack, overwrite it with dancer attack
          lda wBattleSong
          cmp #$0031
          bne +

            lda #$0038
            sta wBattleSong

          +
          lda structActionStructEntry.DeploymentNumber,b,y
          bpl _End

            jsr rsCheckIfUnitHasWeaponEquipped
            bcs _End

              lda #8
              sta $0022,b,x
              lda #1
              sta structActionStructEntry.WeaponMinRange,b,x
              sta structActionStructEntry.WeaponMaxRange,b,x

        _End
        rts

        .databank 0

      rsActionStructClearMagicEquipmentIfSilenced ; 84/E1DD

        .al
        .autsiz
        .databank ?

        ldx #<>aActionStructUnit1
        jsr rsActionStructClearMagicEquipmentIfSilencedEffect
        ldx #<>aActionStructUnit2
        jsr rsActionStructClearMagicEquipmentIfSilencedEffect
        rts

        .databank 0

      rsActionStructClearMagicEquipmentIfSilencedEffect ; 84/E1EA

        .al
        .autsiz
        .databank ?

        lda structActionStructEntry.WeaponID,b,x
        jsl rlGetItemDataROMPointer
        jsl rlGetItemWeaponType
        cmp #WeaponTypeStaff
        bcc +

          lda structActionStructEntry.UnitRAMPointer,b,x
          sta wSelectedUnitDataRAMPointer,b
          jsl rlGetSelectedUnitStatus
          cmp #StatusSilence
          bne +

            lda #0
            sta structActionStructEntry.WeaponInventorySlot,b,x

        +
        rts

        .databank 0

      rsActionStructAdjustVantageRoundOrder ; 84/E210

        .al
        .autsiz
        .databank ?

        ldx #<>aActionStructUnit1
        jsr rsActionStructCheckForVantageActivation
        bcc +

        lda #0
        sta wBattleAttackerIndex
        bra _End
        
        +
        ldx #<>aActionStructUnit2
        jsr rsActionStructCheckForVantageActivation
        bcc _End

        lda #1
        sta wBattleAttackerIndex
        
        _End
        rts

        .databank 0

      rsActionStructCheckForVantageActivation ; 84/E231

        .al
        .autsiz
        .databank ?

        jsr rsCheckIfUnitHasWeaponEquipped
        bcc _CLC

        lda #SkillIDVantage
        jsl rlCheckIfUnitHasSpecifiedPersonalOrClassSkill
        bcc _CLC

        lda structActionStructEntry.MaxHP,b,x
        lsr a
        cmp structActionStructEntry.CurrentHP,b,x
        bcc _CLC

        sec
        rts
        
        _CLC
        clc
        rts

        .databank 0

      rsActionStructGetBattleInitiatorIfArena ; 84/E24C

        .al
        .autsiz
        .databank `aActionStructUnit1

        ; Check if arena fight

        lda wBattleType
        and #$00FF
        cmp #1
        bne _End

          lda aActionStructUnit1.BattleAttackSpeed
          cmp aActionStructUnit2.BattleAttackSpeed
          bmi +

          lda #0
          bra ++

          +
          lda #1

          +
          sta @l wBattleAttackerIndex
        
        _End
        rts

        .databank 0

      rsBattleHandleEffectiveness ; 84/E26C

        .al
        .autsiz
        .databank ?

        ldx #<>aActionStructUnit1
        ldy #<>aActionStructUnit2
        jsr rsSetBattleCritIfEffective

        ldx #<>aActionStructUnit2
        ldy #<>aActionStructUnit1
        jsr rsSetBattleCritIfEffective
        rts

        .databank 0

      rsSetBattleCritIfEffective ; 84/E27F

        .al
        .autsiz
        .databank ?

        jsr rsCheckIfUnitHasWeaponEquipped
        bcc +

          lda structActionStructEntry.UnitRAMPointer,b,y
          beq +

            sta wSelectedUnitDataRAMPointer,b
            jsl rlGetClassWeakness
            sta $7ECCE8

            lda structActionStructEntry.WeaponID,b,x
            jsl rlGetItemDataROMPointer
            jsl rlGetItemEffectiveness
            bit $CCE8,b
            beq +

              lda #100
              sta structActionStructEntry.BattleCrit,b,x

        +
        rts

        .databank 0

      rsActionStructGetNumberOfStrikes ; 84/E2AB

        .al
        .autsiz
        .databank `wActionStructAttacker

        ldx wActionStructAttacker

        lda #1
        sta @l $7ECCE8

        jsr rsCheckIfUnitHasWeaponEquipped
        bcc _End
        
        -
        lda @l wBattleActivatedSkill
        cmp #SkillIDAstra
        bne +

          lda #5
          sta @l $7ECCE8
          bra _E2ED

        +
        lda structActionStructEntry.TriggerableSkills,b,x
        bit #CombatSkillFlagAdept
        beq _E2ED

        lda structActionStructEntry.BattleAttackSpeed,b,x
        clc
        adc #20
        bmi -

        cmp #100
        bcs +

          jsl rlRollForChance
          bcs _E2ED
        
        +
        asl $CCE8,b
        bra _End

        _E2ED
        lda structActionStructEntry.WeaponID,b,x
        jsl rlGetItemDataROMPointer
        jsl rlGetItemWeaponTraits
        cmp #WeaponTraitBrave
        bne _End

          asl $CCE8,b

        _End
        lda @l $7ECCE8
        rts

        .databank 0

      rsActionStructCheckIfCombatantsCanDouble ; 84/E305

        .al
        .autsiz
        .databank `wActionStructAttacker

        ; sec if true

        lda @l wBattleStatus
        and #$0001
        sta @l $7ECCE8
        asl a
        tax
        lda aUnknown84E35E,x
        sta @l wActionStructAttacker
        lda aUnknown84E35E+2,x
        sta @l wActionStructDefender

        lda @l wBattleStatus
        and #$0001
        sta @l $7ECCE8

        ldx wActionStructAttacker
        ldy wActionStructDefender
        jsr rsActionStructCheckIfDoubling
        bcs +

        lda @l wBattleStatus
        and #$0001
        eor #$0001
        sta @l $7ECCE8

        ldx wActionStructDefender
        ldy wActionStructAttacker
        jsr rsActionStructCheckIfDoubling
        bcs +

        clc

        -
        rts

        +
        lda @l $7ECCE8
        sta @l wBattleAttackerIndex
        sec
        bra -

        .databank 0

      aUnknown84E35E ; 84/E35E

        .word <>aActionStructUnit1
        .word <>aActionStructUnit2
        .word <>aActionStructUnit1

      rsActionStructCheckIfDoubling ; 84/E364

        .al
        .autsiz
        .databank ?

        ; sec if doubling
        ; clc if not

        jsr rsCheckIfUnitHasWeaponEquipped
        bcc +

          lda structActionStructEntry.TriggerableSkills,b,x
          bit #CombatSkillFlagPursuit
          beq +

            lda structActionStructEntry.BattleAttackSpeed,b,y
            cmp structActionStructEntry.BattleAttackSpeed,b,x
            bpl +

              sec
              rts

        +
        clc
        rts

        .databank 0

      rsActionStructCheckForAccostBattleRound ; 84/E37D

        .al
        .autsiz
        .databank `wActionStructAttacker

        lda #(`aBattleRoundsData)<<8
        sta lStructPointer2+1,b
        lda #<>aBattleRoundsData
        sta lStructPointer2,b
        jsl rlGetRAMStructCurrentStructCount
        cmp #40
        bcs _CLC

          lda @l wBattleStatus
          and #$0001
          sta @l $7ECCE8
          asl a
          tax
          lda aUnknown84E3F2,x
          sta @l wActionStructAttacker
          lda aUnknown84E3F2+2,x
          sta @l wActionStructDefender
          
          lda @l wBattleStatus
          and #$0001
          sta @l $7ECCE8

          ldx wActionStructAttacker
          ldy wActionStructDefender
          jsr rsActionStructCheckForAccost
          bcs _SEC

          lda @l wBattleStatus
          and #$0001
          eor #$0001
          sta @l $7ECCE8

          ldx wActionStructDefender
          ldy wActionStructAttacker
          jsr rsActionStructCheckForAccost
          bcs _SEC

          _CLC
          clc
        
        -
        rts
        
        _SEC
        lda #2
        sta @l $7ECCD2
        lda @l $7ECCE8
        sta @l wBattleAttackerIndex
        sec
        bra -

        .databank 0

      aUnknown84E3F2 ; 84/E3F2

        .word <>aActionStructUnit1
        .word <>aActionStructUnit2
        .word <>aActionStructUnit1

      rsActionStructCheckForAccost ; 84/E3F8

        .al
        .autsiz
        .databank ?

        ; if hp =>25
        ; hp/2 + as - enemy as% chance 

        jsr rsCheckIfUnitHasWeaponEquipped
        bcc _CLC

          jsr rsCheckIfBattleDistanceInWeaponRange
          bcc _CLC

            lda structActionStructEntry.TriggerableSkills,b,x
            bit #CombatSkillFlagAccost
            beq _CLC

              lda structActionStructEntry.UnitRAMPointer,b,x
              sta wSelectedUnitDataRAMPointer,b
              jsl rlGetSelectedUnitCurrentHP
              cmp #25
              bcc _CLC

                lsr a
                clc
                adc structActionStructEntry.BattleAttackSpeed,b,x
                sec
                sbc structActionStructEntry.BattleAttackSpeed,b,y
                bmi _CLC

                  cmp #100
                  bcs +

                  jsl rlRollForChance
                  bcc +
        
        _CLC
        clc
        rts
        
        +
        sec
        rts

        .databank 0

      rsUnknown84E433 ; 84/E433

        .al
        .autsiz
        .databank `wActionStructAttacker

        phx
        phy
        sta @l wScriptedCombatFlags
        stz bBattleRoundFlags

        ldx wActionStructAttacker
        ldy wActionStructDefender
        jsr rsCheckIfBattleDistanceInWeaponRange
        bcc _SEC

        lda structActionStructEntry.UnitRAMPointer,b,x
        sta wSelectedUnitDataRAMPointer,b

        jsl rlGetSelectedUnitStatus
        cmp #StatusSleep
        beq _SEC

        lda @l wBattleAttackerIndex
        tsb bBattleRoundFlags

        lda structActionStructEntry.UnitRAMPointer,b,x
        sta wSelectedUnitDataRAMPointer,b

        lda structActionStructEntry.Unknown,b,x
        cmp #8
        bne +

          jsr rsUnknown84EA37
          bra _End

        +
        jsr rsCheckForWeaponInventorySlot
        bcc _SEC

        lda structActionStructEntry.WeaponID,b,x
        jsl rlGetItemDataROMPointer
        jsl rlGetItemEquipmentType
        cmp #EquipTypeWeapon
        bne +

          jsl rlGetItemWeaponTraits
          asl a
          tax
          jsr (aActionStructWeaponTraitEffects,x)
          bra _End

        +
        jsl rlGetItemStaffEffect
        asl a
        tax
        jsr (aActionStructStaffEffects,x)

        _End
        ply
        plx
        rts
        
        _SEC
        sec
        bra _End

        .databank 0

      aActionStructWeaponTraitEffects ; 84/E49F

        .addr rsActionStructWeaponTraitNormal       ; none
        .addr rsActionStructWeaponTraitRangedMagic  ; WeaponTraitRangedMagicSword   
        .addr rsActionStructWeaponTraitLifeSteal    ; WeaponTraitPermanentMagicSword
        .addr rsActionStructWeaponTraitLifeSteal    ; WeaponTraitLifeSteal          
        .addr rsActionStructWeaponTraitNormal       ; WeaponTraitBrave              
        .addr rsActionStructWeaponTraitNormal       ; WeaponTraitUncounterable      
        .addr rsActionStructWeaponTraitStatusSword  ; WeaponTraitStatusSword        
        .addr rsActionStructWeaponTraitNormal       ; WeaponTraitHalveAttack        
        .addr rsActionStructWeaponTraitNormal       ; WeaponTraitNegateHalveAttack  
        .addr rsActionStructWeaponTraitHel          ; WeaponTraitHelEffect          
        .addr rsActionStructWeaponTraitNormal       ; WeaponTraitFemaleOnly         

      aActionStructStaffEffects ; 84/E4B5

        .addr rsActionStructStaffEffectNone
        .addr rsActionStructStaffEffectHeal ; heal
        .addr rsActionStructStaffEffectHeal ; mend
        .addr rsActionStructStaffEffectHeal ; recover
        .addr rsActionStructStaffEffectHeal ; physic
        .addr rsActionStructStaffEffectFortify ; fortify
        .addr rsActionStructStaffEffectReturn ; return
        .addr $84EBD5 ; warp
        .addr rsActionStructStaffEffectRescue ; rescue
        .addr $84EB6F ; charm
        .addr $84EB6F ; restore
        .addr rsActionStructStaffEffectValkyrie ; valkyrie
        .addr rsActionStructStaffEffectStatus ; silence
        .addr rsActionStructStaffEffectStatus ; sleep
        .addr rsActionStructStaffEffectStatus ; berserk
        .addr rsActionStructStaffEffectThief ; thief

      rsActionStructStaffEffectNone ; 84/E4D5

        .al
        .autsiz
        .databank ?

        clc
        rts

        .databank 0

      rsCheckIfBattleDistanceInWeaponRange ; 84/E4D7

        .al
        .autsiz
        .databank ?

        sec
        lda wBattleDistance
        beq +

        cmp structActionStructEntry.WeaponMinRange,b,x
        bcc +

        lda structActionStructEntry.WeaponMaxRange,b,x
        cmp wBattleDistance
        bcc +
        
        +
        rts

        .databank 0

      rsActionStructWeaponTraitNormal ; 84/E4ED

        .al
        .autsiz
        .databank `wActionStructAttacker

        ldx wActionStructAttacker
        ldy wActionStructDefender
        jsr rsUnknown84E51D
        jsr rsUnknown84E535
        jsr rsActionStructRoundCheckIfHit
        bcc +

          jsr rsActionStructRoundTryProcPavise
          bcc +

            jsr rsUnknown84E62C
            lda structActionStructEntry.BattleBonusAtkDef,b,x
            sta wRoutineVariable1,b
            jsr rsActionStructRoundTryProcWrath
            jsr rsActionStructRoundTryProcCrit
            jsr rsActionStructRoundGetDamage
            jsr rsActionStructCheckForSolHealing
            jsr rsUnknown84E6F6

        +
        clc
        rts

        .databank 0

      rsUnknown84E51D ; 84/E51D

        .al
        .autsiz
        .databank ?

        lda wBattleDistance
        cmp #2
        bcc +

          sep #$20
          lda bBattleRoundFlags
          ora #$20
          sta bBattleRoundFlags
          rep #$20

        +
        rts

        .databank 0

      rsUnknown84E535 ; 84/E535

        .al
        .autsiz
        .databank ?

        lda structActionStructEntry.WeaponID,b,x
        jsl rlGetItemDataROMPointer
        jsl rlGetItemWeaponType
        cmp #WeaponTypeStaff
        bcc +

          sep #$20
          lda bBattleRoundFlags
          ora #$40
          sta bBattleRoundFlags
          rep #$20

        +
        rts

        .databank 0

      rsActionStructRoundCheckIfHit ; 84/E554

        .al
        .autsiz
        .databank `bBattleRoundFlags

        lda @l wScriptedCombatFlags
        bit #SB_ApplyGuarantees
        beq +

        bit #SB_GuaranteedHit
        bne _SEC
        bra _E5CF

        +
        lda @l wBattleActivatedSkill
        cmp #SkillIDLuna
        beq _SEC

        cmp #SkillIDSol
        beq _SEC

        stz wRoutineVariable1,b

        lda structActionStructEntry.TriggerableSkills,b,y
        bit #CombatSkillFlagMiracle
        beq +

          lda structActionStructEntry.UnitRAMPointer,b,y
          sta wSelectedUnitDataRAMPointer,b
          jsl rlGetSelectedUnitStates
          bit #UnitStateMiracleActive
          beq +

            jsl rlGetSelectedUnitCurrentHP
            cmp #11
            bcs +

              eor #$FFFF
              inc a
              clc
              adc #10
              phx

              tax
              lda aActionStructMiracleAvoidBoostTable,x
              and #$00FF
              sta wRoutineVariable1,b
              plx

        +
        lda structActionStructEntry.BattleHit,b,x
        sec
        sbc structActionStructEntry.BattleAvoid,b,y
        sec
        sbc wRoutineVariable1,b
        cmp #0
        bmi _FloorHit

        cmp #101
        bpl _CapHit
        bra +
        
        _FloorHit
        lda #0
        bra +
        
        _CapHit
        lda #100
        
        +
        jsl rlRollForChance
        bcc _SEC
        
        _E5CF
        sep #$20
        lda #8
        tsb bBattleRoundFlags
        lda #0
        sta @l $7ECCDF
        rep #$20

        clc
        
        -
        rts
        
        _SEC
        sec
        bra -

        .databank 0

      aActionStructMiracleAvoidBoostTable ; 84/E5E3

        .byte 10
        .byte 20
        .byte 30
        .byte 40
        .byte 50
        .byte 60
        .byte 70
        .byte 80
        .byte 90
        .byte 100

      rsActionStructRoundTryProcPavise ; 84/E5ED

        .al
        .autsiz
        .databank ?

        lda wScriptedCombatFlags
        bit #SB_ApplyGuarantees
        bne _SEC

          lda structActionStructEntry.TriggerableSkills,b,y
          bit #CombatSkillFlagPavise
          beq _SEC

            lda structActionStructEntry.Level,b,y
            jsl rlRollForChance
            bcs _SEC

              lda #$02FE
              sta lStructPointer1,b
              lda #(`aBattleRoundsData)<<8
              sta lStructPointer2+1,b
              lda #<>aBattleRoundsData
              sta lStructPointer2,b
              jsl rlAppendNewStructEntry

              sep #$20
              lda #0
              sta $7ECCDF
              rep #$20

              clc

              -
              rts

        _SEC
        sec
        bra -

        .databank 0

      rsUnknown84E62C ; 84/E62C

        .al
        .autsiz
        .databank ?

        lda structActionStructEntry.UnitRAMPointer,b,x
        sta wSelectedUnitDataRAMPointer,b
        lda structActionStructEntry.WeaponInventorySlot,b,x
        sta wRoutineVariable1,b
        jsl rlUnknown84A87E
        bcc +

          lda structActionStructEntry.WeaponInventorySlot,b,x
          ora #$8000
          sta structActionStructEntry.WeaponInventorySlot,b,x

        +
        lda structActionStructEntry.WeaponID,b,x
        jsl rlGetItemDataROMPointer
        jsl rlGetItemEquipmentType
        cmp #EquipTypeStaff
        beq +

          lda structActionStructEntry.TriggerableSkills,b,x
          bit #CombatSkillFlagSteal
          beq +

            jsr rsUnknown84EAD9

        +
        rts

        .databank 0

      rsActionStructRoundTryProcWrath ; 84/E663

        .al
        .autsiz
        .databank ?

        lda #SkillIDWrath
        jsl rlCheckIfUnitHasSpecifiedPersonalOrClassSkill
        bcc +

          jsl rlGetSelectedUnitCurrentHP
          sta $7ECCE8
          lda structActionStructEntry.MaxHP,b,x
          lsr a
          inc a
          cmp $7ECCE8
          bcc +

            lda #100
            sta structActionStructEntry.BattleCrit,b,x

        +
        rts

        .databank 0

      rsActionStructRoundTryProcCrit ; 84/E686

        .al
        .autsiz
        .databank `bBattleRoundFlags

        lda @l wScriptedCombatFlags
        bit #SB_ApplyGuarantees
        beq +

        bit #SB_GuaranteedCrit
        bne ++
        bra _End
        
        +
        lda structActionStructEntry.TriggerableSkills,b,y
        bit #CombatSkillFlagNihil
        bne _End

        lda structActionStructEntry.BattleCrit,b,x
        beq _End

        jsl rlRollForChance
        bcs _End

        +
        lda wBattleCriticalType
        ora #$8000
        sta wBattleCriticalType

        lda #4
        tsb bBattleRoundFlags

        lda wRoutineVariable1,b
        asl a
        clc
        adc structActionStructEntry.BattleMight,b,x
        sta wRoutineVariable1,b
        
        _End
        rts

        .databank 0

      rsActionStructRoundGetDamage ; 84/E6C4

        .al
        .autsiz
        .databank ?

        lda structActionStructEntry.BattleMight,b,x
        clc
        adc wRoutineVariable1,b
        sta wRoutineVariable1,b

        lda wBattleActivatedSkill
        cmp #SkillIDLuna
        beq +

          lda wRoutineVariable1,b
          sec
          sbc structActionStructEntry.BattleDefense,b,y
          sec
          sbc structActionStructEntry.BattleBonusAtkDef,b,y
          cmp #1
          bpl ++

          lda #1
          bra ++

        +
        lda wRoutineVariable1,b

        +
        and #$00FF
        sta wRoutineVariable1,b

        rts

        .databank 0

      rsUnknown84E6F6 ; 84/E6F6

        .al
        .autsiz
        .databank `bBattleRoundFlags

        lda @l wScriptedCombatFlags
        bit #SB_ApplyGuarantees
        beq ++

        bit #SB_Unknown02
        bne +

          jml _E82C

        +
        lda #$0010
        tsb bBattleRoundFlags

        lda #80
        sta wRoutineVariable1,b

        +
        lda structActionStructEntry.UnitRAMPointer,b,y
        sta wSelectedUnitDataRAMPointer,b
        lda structActionStructEntry.CharacterID,b,x
        jsl rlActionStructInflictDamage
        bcs +

          jml _E803

        ; fatal hit
        +
        jsl rlGetSelectedUnitStatus
        cmp #StatusCaptive
        bne +

          jsr rsUnknown84EF13

        +
        lda @l wBattleType
        and #$00FF
        cmp #1
        beq +

        lda @l aActionStructUnit2.CharacterID
        cmp #JuliusChFinal
        beq +

        lda structActionStructEntry.TriggerableSkills,b,y
        bit #CombatSkillFlagStayOnMap
        bne ++

        ; Is arena, vs julius or not captive
        +
        lda #$0010
        tsb bBattleRoundFlags

        +
        lda #1
        sta @l $7ECCE0

        lda @l wBattleStatus
        ora #$0010
        sta @l wBattleStatus

        lda @l wBattleAttackerIndex
        bne +

          lda @l wBattleStatus
          ora #$0020
          sta @l wBattleStatus

        +
        lda @l wBattleAttackerIndex
        beq +

          lda #0
          sta structActionStructEntry.ObtainedStealMoney,b,y

        +
        sta structActionStructEntry.GainedExperience,b,y

        lda wRoutineVariable1,b
        pha

        lda structActionStructEntry.UnitRAMPointer,b,y
        sta wSelectedUnitDataRAMPointer,b
        jsl rlGetUniqueEquipmentOrDrops
        cmp #$00FF
        beq _E7CC

          sta wRoutineVariable1,b

          lda structActionStructEntry.UnitRAMPointer,b,x
          sta wSelectedUnitDataRAMPointer,b

          jsl rlGetSelectedUnitFactionSlot
          ora #0
          bne _E7CC

            lda wRoutineVariable1,b
            jsl rlGetItemRAMStructEntryByPlayerItemIndex
            jsl rlGetItemRAMStateAndOwner
            lda structActionStructEntry.UnitRAMPointer,b,y
            cmp wR1
            beq +

              lda wR0
              cmp #ItemStateUnobtained
              bne _E7CC

            +
            lda wRoutineVariable1,b
            sta structActionStructEntry.ObtainedItem,b,x

        _E7CC
        pla
        sta wRoutineVariable1,b

        lda structActionStructEntry.UnitRAMPointer,b,x
        sta wSelectedUnitDataRAMPointer,b

        lda @l wBattleType
        and #$00FF
        cmp #1
        beq +

        lda structActionStructEntry.WeaponInventorySlot,b,x
        and #$00FF
        jsl rlUnknown84AB5C
        bra ++

        ; Arena
        +
        jsl rlActionStructArenaWinResults
        sta structActionStructEntry.ObtainedArenaMoney,b,x

        +
        lda structActionStructEntry.Level,b,y
        sec
        sbc structActionStructEntry.Level,b,x
        asl a
        clc
        adc #30
        bra +

        _E803
        lda @l wBattleType
        and #$00FF
        cmp #1
        beq _E82C

        lda structActionStructEntry.Level,b,y
        sec
        sbc structActionStructEntry.Level,b,x
        clc
        adc #10
        
        +
        bmi +

        cmp #101
        bmi ++

        lda #100
        bra ++
        
        +
        lda #0

        +
        sta structActionStructEntry.GainedExperience,b,x

        _E82C
        lda wRoutineVariable1,b

        sep #$20
        sta @l $7ECCDF
        rep #$20

        rts

        .databank 0

      rsActionStructWeaponTraitRangedMagic ; 84/E838

        .al
        .autsiz
        .databank `wActionStructAttacker

        ldx wActionStructAttacker
        ldy wActionStructDefender
        jsr rsUnknown84E51D

        sep #$20
        lda @l bBattleRoundFlags
        ora #$40
        sta @l bBattleRoundFlags
        rep #$20

        jsr rsActionStructRoundCheckIfHit
        bcc +

          jsr rsActionStructRoundTryProcPavise
          bcc +

            jsr rsUnknown84E62C
            lda structActionStructEntry.BattleBonusAtkDef,b,x
            sta wRoutineVariable1,b
            jsr rsActionStructRoundTryProcWrath
            jsr rsActionStructRoundTryProcCrit
            jsr rsActionStructRoundGetDamage
            jsr rsActionStructCheckForSolHealing
            jsr rsUnknown84E6F6
        
        +
        clc
        rts

        .databank 0

      rsActionStructWeaponTraitStatusSword ; 84/E873

        .al
        .autsiz
        .databank `wActionStructAttacker

        ldx wActionStructAttacker
        ldy wActionStructDefender
        jsr rsUnknown84E51D
        jsr rsUnknown84E535
        jsr rsActionStructRoundCheckIfHit
        bcc _End

          jsr rsActionStructRoundTryProcPavise
          bcc _End
          
            jsr rsUnknown84E62C
            lda structActionStructEntry.BattleBonusAtkDef,b,x
            sta wRoutineVariable1,b
            jsr rsActionStructRoundTryProcWrath
            jsr rsActionStructRoundTryProcCrit
            jsr rsActionStructRoundGetDamage
            jsr rsActionStructCheckForSolHealing
            jsr rsUnknown84E6F6

            lda structActionStructEntry.UnitRAMPointer,b,y
            sta wSelectedUnitDataRAMPointer,b
            jsl rlGetSelectedUnitStatus
            sta @l $7ECCE8

            lda structActionStructEntry.WeaponID,b,x
            jsl rlGetItemDataROMPointer
            jsl rlGetItemAdditionalInfo
            cmp @l $7ECCE8
            beq _End

              jsl rlGetSelectedUnitTotalResistance
              sta wRoutineVariable1,b
              lda #30
              sec
              sbc wRoutineVariable1,b
              jsl rlRollForChance
              bcs _End

                jsr rsUnknown84EEB1

                lda #(`aBattleRoundsData)<<8
                sta lStructPointer2+1,b
                lda #<>aBattleRoundsData
                sta lStructPointer2,b
                lda @l bBattleRoundFlags
                and #~($10)
                sta lStructPointer1,b
                jsl rlAppendNewStructEntry

                lda #0
                sep #$20
                sta @l $7ECCDF
                rep #$20

                lda #$0040
                tsb bBattleRoundFlags

        _End
        clc
        rts

        .databank 0

      rsActionStructWeaponTraitHel ; 84/E904

        .al
        .autsiz
        .databank `wActionStructAttacker

        ldx wActionStructAttacker
        ldy wActionStructDefender
        jsr rsUnknown84E51D
        jsr rsUnknown84E535
        jsr rsActionStructRoundCheckIfHit
        bcc +

          jsr rsUnknown84E62C
          lda structActionStructEntry.UnitRAMPointer,b,y
          sta wSelectedUnitDataRAMPointer,b
          lda structActionStructEntry.CurrentHP,b,y
          dec a
          sta wRoutineVariable1,b

          lda #1
          jsl rlSetSelectedUnitCurrentHP

          lda wRoutineVariable1,b
          sep #$20
          sta @l $7ECCDF
          rep #$20
        
        +
        clc
        rts

        .databank 0

      rsActionStructStaffEffectHeal ; 84/E939

        .al
        .autsiz
        .databank `wActionStructAttacker

        ldx wActionStructAttacker
        ldy wActionStructDefender

        lda #2
        tsb bBattleRoundFlags
        
        jsr rsUnknown84E62C

        lda structActionStructEntry.UnitRAMPointer,b,x
        sta wSelectedUnitDataRAMPointer,b
        lda structActionStructEntry.WeaponInventorySlot,b,x
        and #$00FF
        jsl rlGetItemROMDataByInventorySlot
        jsl $87E86A
        sta wRoutineVariable1,b

        lda structActionStructEntry.UnitRAMPointer,b,y
        sta wSelectedUnitDataRAMPointer,b

        lda structActionStructEntry.MaxHP,b,y
        sec
        sbc structActionStructEntry.CurrentHP,b,y
        cmp wRoutineVariable1,b
        bcs +

          sta wRoutineVariable1,b
        
        +
        jsl rlHealSelectedUnitsHP

        lda structActionStructEntry.UnitRAMPointer,b,x
        sta wSelectedUnitDataRAMPointer,b
        lda structActionStructEntry.WeaponInventorySlot,b,x
        and #$00FF
        jsl $84F99D
        sta structActionStructEntry.GainedExperience,b,x

        lda wRoutineVariable1,b
        sep #$20
        sta @l $7ECCDF
        rep #$20

        lda #$003A
        sta wBattleSong
        clc
        rts

        .databank 0

      rsActionStructStaffEffectFortify ; 84/E99E

        .al
        .autsiz
        .databank `wActionStructAttacker

        ldx wActionStructAttacker

        lda #2
        tsb bBattleRoundFlags

        lda structActionStructEntry.UnitRAMPointer,b,x
        sta wSelectedUnitDataRAMPointer,b
        lda structActionStructEntry.WeaponInventorySlot,b,x
        and #$00FF
        jsl rlGetItemROMDataByInventorySlot
        jsl $87E89A
        jsr rsUnknown84E62C

        lda structActionStructEntry.UnitRAMPointer,b,x
        sta wSelectedUnitDataRAMPointer,b
        lda structActionStructEntry.WeaponInventorySlot,b,x
        and #$00FF
        jsl $84F99D
        sta structActionStructEntry.GainedExperience,b,x

        sep #$20
        lda #0
        sta @l $7ECCDF
        rep #$20

        lda #$003A
        sta wBattleSong
        clc
        rts

        .databank 0

      rsActionStructStaffEffectReturn ; 84/E9E3

        .al
        .autsiz
        .databank `wActionStructAttacker

        ldx wActionStructAttacker
        ldy wActionStructDefender

        lda #2
        tsb bBattleRoundFlags
        
        jsr rsUnknown84E62C

        phx
        lda $0580,b
        pha

        lda structActionStructEntry.UnitRAMPointer,b,y
        sta wSelectedUnitDataRAMPointer,b
        lda structActionStructEntry.DeploymentNumber,b,y
        tax
        jsl rlGetSelectedUnitFactionSlot
        jsl rlGetFactionSlotLocationID
        jsl $84CD8A

        pla
        sta $0580,b
        plx

        lda structActionStructEntry.UnitRAMPointer,b,x
        sta wSelectedUnitDataRAMPointer,b
        lda structActionStructEntry.WeaponInventorySlot,b,x
        and #$00FF
        jsl $84F99D
        sta structActionStructEntry.GainedExperience,b,x

        sep #$20
        lda #0
        sta @l $7ECCDF
        rep #$20

        lda #$003A
        sta wBattleSong
        clc
        rts

        .databank 0

      rsUnknown84EA37 ; 84/EA37

        .al
        .autsiz
        .databank `wActionStructAttacker

        ldx wActionStructAttacker
        ldy wActionStructDefender

        lda #2
        tsb bBattleRoundFlags

        lda wUnknown000D79,b
        bit #$0020
        bne _EA76

        phx
        ldx #$03FF
        
        -
        lda $7F854A,x
        and #$00FF
        cmp #$00FF
        beq +

        phx
        tax
        jsl rlUnknown84CA97
        lda @l aDeploymentTable._UnitRAMPointer,x
        sta wSelectedUnitDataRAMPointer,b
        lda #UnitStateMoved
        jsl rlUnsetSelectedUnitStates
        plx

        +
        dec x
        bpl -

        plx
        bra _EAC0

        _EA76
        phx
        lda structActionStructEntry.DeploymentNumber,b,x
        sta @l $7ECCE8
        lda structActionStructEntry.UnitRAMPointer,b,x
        sta wSelectedUnitDataRAMPointer,b
        jsl rlGetSelectedUnitHomeCastle
        jsl rlGetLocationEventDataEntry
        jsl rlBuildDeadPlayerCharacterList
        ldx #0

        -
        lda aDeadPlayerCharacterList,x
        bmi _EABF

        cmp @l $7ECCE8
        beq +

        phx
        tax
        jsl rlUnknown84CA97
        lda @l aDeploymentTable._StateBuffer,x
        sta @l aDeploymentTable._State,x
        lda @l aDeploymentTable._UnitRAMPointer,x
        sta wSelectedUnitDataRAMPointer,b

        lda #UnitStateMoved
        jsl rlUnsetSelectedUnitStates
        plx
        
        +
        inc x
        inc x
        bra -
        
        _EABF
        plx

        _EAC0
        lda #10
        sta structActionStructEntry.GainedExperience,b,x

        sep #$20
        lda #0
        sta @l $7ECCDF
        rep #$20

        lda #$0037
        sta wBattleSong
        clc
        rts

        .databank 0

      rsUnknown84EAD8 ; 84/EAD8

        .al
        .autsiz
        .databank ?

        rts

        .databank 0

      rsUnknown84EAD9 ; 84/EAD9

        .al
        .autsiz
        .databank ?

        ; check if its an arena fight

        lda wBattleType
        and #$00FF
        cmp #1
        beq _End

          ; check if unit already has capped money
          lda structActionStructEntry.UnitRAMPointer,b,x
          sta wSelectedUnitDataRAMPointer,b
          jsl rlGetSelectedUnitMoney
          cmp #50000
          bcs _End

            ; check if target is broke
            lda structActionStructEntry.UnitRAMPointer,b,y
            sta wSelectedUnitDataRAMPointer,b
            jsl rlGetSelectedUnitMoney
            ora #0
            beq _End

              sta $7ECCE8
              sta wRoutineVariable1,b
              jsl rlSubtractSelectedCharacterMoney

              lda structActionStructEntry.UnitRAMPointer,b,x
              sta wSelectedUnitDataRAMPointer,b
              jsl rlAddSelectedCharacterMoney

              lda structActionStructEntry.ObtainedStealMoney,b,x
              clc
              adc $7ECCE8
              sta structActionStructEntry.ObtainedStealMoney,b,x

        _End
        rts

        .databank 0

        ; 84/EB24

    .endsection Code84D4C7Section



    .section Code84EC80Section

      rsActionStructWeaponTraitLifeSteal ; 84/EC80

        .al
        .autsiz
        .databank `wActionStructAttacker

        ldx wActionStructAttacker
        ldy wActionStructDefender
        jsr rsUnknown84E51D

        sep #$20
        lda @l bBattleRoundFlags
        ora #$40
        sta @l bBattleRoundFlags
        rep #$20

        jsr rsActionStructRoundCheckIfHit
        bcc +

          jsr rsUnknown84E62C
          lda structActionStructEntry.BattleBonusAtkDef,b,x
          sta wRoutineVariable1,b
          jsr rsActionStructRoundTryProcWrath
          jsr rsActionStructRoundTryProcCrit
          jsr rsActionStructRoundGetDamage
          jsr rsUnknown84E6F6
          lda structActionStructEntry.UnitRAMPointer,b,x
          sta wSelectedUnitDataRAMPointer,b
          jsl rlHealSelectedUnitsHP
        
        +
        clc
        rts

        .databank 0

      rsActionStructStaffEffectRescue ; 84/ECBD

        .al
        .autsiz
        .databank `wActionStructAttacker

        ldx wActionStructAttacker
        ldy wActionStructDefender

        lda #2
        tsb bBattleRoundFlags
        
        jsr rsUnknown84E62C

        lda wUnknown000D79,b
        bit #$0040
        bne _ED3A

        lda structActionStructEntry.UnitRAMPointer,b,x
        sta wSelectedUnitDataRAMPointer,b
        lda structActionStructEntry.XPosition,b,x
        sta @l $7EC490
        lda structActionStructEntry.YPosition,b,x
        sta @l $7EC492
        jsl rlGetSelectedUnitStates
        bit #UnitStateGuardingCastle
        beq +

          inc $C492,b
          inc $C492,b

        +
        lda structActionStructEntry.UnitRAMPointer,b,y
        sta wSelectedUnitDataRAMPointer,b
        jsl $87AF46
        bcc +

          jml _End
        
        +
        lda @l $7EC49C
        xba
        ora @l $7EC49A
        sta wRoutineVariable1,b

        phx
        lda structActionStructEntry.DeploymentNumber,b,y
        tax
        jsl $84C9BF
        plx
        jsr rsUnknown84EDAE

        lda @l $7EC49A
        sta @l $7E4F77
        lda @l $7EC49C
        sta @l $7E4F79
        phb
        phy
        jsl $88C9A6
        ply
        plb
        bra +

        _ED3A
        jsr rsUnknown84EDAE
        lda structActionStructEntry.DeploymentNumber,b,x
        sta wUnknownDeploymentOffset000D7F,b
        lda #9
        sta $0D81,b
        lda #0
        jsl rlGetFactionSlotLocationID
        sta $0D83,b
        jsl rlGetLocationEventDataEntry
        jsl rlGetEventLocationEntryEffectiveXCoordinate
        sta @l $7E4F77
        jsl rlGetEventLocationEntryEffectiveYCoordinate
        sta @l $7E4F79
        
        +
        phx
        lda @l $7E4F79
        xba
        lsr a
        lsr a
        clc
        adc @l $7E4F77
        asl a
        tax

        lda $7F2400,x
        and #$03FF
        tax
        lda $7F2000,x
        and #$00FF
        sta structActionStructEntry.TerrainType,b,y
        plx

        lda structActionStructEntry.UnitRAMPointer,b,x
        sta wSelectedUnitDataRAMPointer,b
        lda structActionStructEntry.WeaponInventorySlot,b,x
        and #$00FF
        jsl $84F99D
        sta structActionStructEntry.GainedExperience,b,x

        sep #$20
        lda #0
        sta @l $7ECCDF
        rep #$20

        lda #$003A
        sta wBattleSong
        clc
        
        _End
        rts

        .databank 0

      rsUnknown84EDAE ; 84/EDAE

        .al
        .autsiz
        .databank ?

        jsl rlGetSelectedUnitStates
        bit #UnitStateGuardingCastle
        beq +

          jsl $84BA6F

        +
        rts

        .databank 0

      rsActionStructStaffEffectThief ; 84/EDBC

        .al
        .autsiz
        .databank `wActionStructAttacker

        ldx wActionStructAttacker
        ldy wActionStructDefender

        lda structActionStructEntry.UnitRAMPointer,b,y
        sta wSelectedUnitDataRAMPointer,b
        jsr rsUnknown84EAD9

        lda structActionStructEntry.UnitRAMPointer,b,x
        sta wSelectedUnitDataRAMPointer,b
        lda structActionStructEntry.WeaponInventorySlot,b,x
        and #$00FF
        jsl $84F99D
        sta structActionStructEntry.GainedExperience,b,x
        
        sep #$20
        lda #0
        sta @l $7ECCDF
        rep #$20

        jsr rsUnknown84EE8F

        clc
        rts

        .databank 0

      rsActionStructStaffEffectValkyrie ; 84/EDED

        .al
        .autsiz
        .databank `wActionStructAttacker

        ldx wActionStructAttacker
        ldy wActionStructDefender

        lda #2
        tsb bBattleRoundFlags

        lda structActionStructEntry.UnitRAMPointer,b,x
        sta wSelectedUnitDataRAMPointer,b
        jsr rsUnknown84E62C

        lda structActionStructEntry.UnitRAMPointer,b,y
        sta wSelectedUnitDataRAMPointer,b
        jsl rlReviveSelectedCharacter

        lda structActionStructEntry.UnitRAMPointer,b,x
        sta wSelectedUnitDataRAMPointer,b
        lda structActionStructEntry.WeaponInventorySlot,b,x
        and #$00FF
        jsl $84F99D
        sta structActionStructEntry.GainedExperience,b,x

        lda structActionStructEntry.MaxHP,b,y
        sep #$20
        sta @l $7ECCDF
        rep #$20

        lda #$003D
        sta wBattleSong
        clc
        rts

        .databank 0

      rsActionStructStaffEffectStatus ; 84/EE32

        .al
        .autsiz
        .databank `wActionStructAttacker

        ldx wActionStructAttacker
        ldy wActionStructDefender

        lda #2
        tsb bBattleRoundFlags

        lda structActionStructEntry.UnitRAMPointer,b,y
        sta wSelectedUnitDataRAMPointer,b
        jsl rlGetSelectedUnitTotalResistance
        sta wRoutineVariable1,b

        lda structActionStructEntry.UnitRAMPointer,b,x
        sta wSelectedUnitDataRAMPointer,b
        jsl rlGetSelectedUnitTotalMagic
        cmp wRoutineVariable1,b
        beq +
        bcs ++
        
        +
        sep #$20
        lda #8
        tsb bBattleRoundFlags
        rep #$20
        bra ++
        
        +
        jsr rsUnknown84E62C
        jsr rsUnknown84EEB1

        lda structActionStructEntry.UnitRAMPointer,b,x
        sta wSelectedUnitDataRAMPointer,b
        lda structActionStructEntry.WeaponInventorySlot,b,x
        and #$00FF
        jsl $84F99D
        sta structActionStructEntry.GainedExperience,b,x
        
        +
        sep #$20
        lda #0
        sta @l $7ECCDF
        rep #$20

        jsr rsUnknown84EE8F

        clc
        rts

        .databank 0

      rsUnknown84EE8F ; 84/EE8F

        .al
        .autsiz
        .databank `aDeploymentTable

        phx
        lda structActionStructEntry.DeploymentNumber,b,x
        tax
        lda aDeploymentTable._State,x
        and #DeploymentAllegianceMask
        cmp #1
        beq +

        cmp #3
        beq +

        lda #$0031
        bra ++
        
        +
        lda #$0032
        
        +
        sta wBattleSong
        plx
        rts

        .databank 0

      rsUnknown84EEB1 ; 84/EEB1

        .al
        .autsiz
        .databank `aDeploymentTable

        lda structActionStructEntry.WeaponID,b,x
        jsl rlGetItemDataROMPointer

        lda structActionStructEntry.UnitRAMPointer,b,y
        sta wSelectedUnitDataRAMPointer,b

        phx
        lda structActionStructEntry.DeploymentNumber,b,y
        tax
        jsl rlGetItemAdditionalInfo
        cmp #StatusSleep
        bne +

          lda aDeploymentTable._StateBuffer,x
          ora #DeploymentStateAsleep
          sta aDeploymentTable._StateBuffer,x
          bra ++

          +
          lda aDeploymentTable._StateBuffer,x
          and #~DeploymentStateAsleep
          sta aDeploymentTable._StateBuffer,x

        +
        lda #$0004
        tsb wUnknown000D79,b
        plx

        jsl rlGetItemAdditionalInfo
        jsl rlSetSelectedUnitStatus

        lda #2 +1
        jsl rlGetRandomNumber100
        clc
        adc #4
        jsl rlSetSelectedUnitStatusDuration
        rts

        .databank 0

      rsActionStructCheckForSolHealing ; 84/EEFF

        .al
        .autsiz
        .databank ?

        lda wBattleActivatedSkill
        cmp #SkillIDSol
        bne +

          lda structActionStructEntry.UnitRAMPointer,b,x
          sta wSelectedUnitDataRAMPointer,b
          jsl rlHealSelectedUnitsHP

        +
        rts

        .databank 0

      rsUnknown84EF13 ; 84/EF13

        .al
        .autsiz
        .databank ?

        phx
        jsl rlUnknown87EB24
        jsl rlGetEventLocationEntryID
        sta $0D83,b
        lda $0000,b,y
        sta wUnknownDeploymentOffset000D7F,b

        lda #2
        sta $0D81,b
        plx
        rts

        .databank 0

      rsActionstructGetLevelUpAndDroppedItemData ; 84/EF2D

        .al
        .autsiz
        .databank ?

        lda structActionStructEntry.UnitRAMPointer,b,x
        beq _End

        sta wSelectedUnitDataRAMPointer,b
        lda #SkillIDParagon
        jsl rlCheckIfUnitHasSpecifiedPersonalOrClassSkill
        bcs +

        lda #SkillIDParagon
        jsl rlCheckIfInventoryItemsHaveSpecifiedSkill
        bcc ++
        
        +
        asl structActionStructEntry.GainedExperience,b,x

        +
        lda structActionStructEntry.GainedExperience,b,x
        bmi +

        cmp #101
        bmi ++

        lda #100
        bra ++
        
        +
        lda #0
        
        +
        sta wRoutineVariable1,b

        txa
        clc
        adc #structActionStructEntry.LevelUpData
        sta lRoutineVariable,b

        jsl rlActionStructLevelUp
        bcs +

          sta structActionStructEntry.GainedLevels,b,x
          lda wRoutineVariable1,b
          sta structActionStructEntry.GainedExperience,b,x
          bra ++
          
          +
          lda #0
          sta structActionStructEntry.GainedExperience,b,x
          sta structActionStructEntry.GainedLevels,b,x

        +
        lda structActionStructEntry.ObtainedItem,b,x
        bmi _End

          sta wRoutineVariable1,b
          jsl rlGiveItemToUnitCheckEncumbered

          lda structActionStructEntry.ObtainedItem,b,x
          jsl rlGetItemRAMStructEntryByPlayerItemIndex
          jsl rlGetEffectiveItemIDByItemRAMStructEntry
          sta structActionStructEntry.ObtainedItem,b,x

        _End
        rts

        .databank 0

      rlRollForChance ; 84/EF9C

        .al
        .autsiz
        .databank ?

        pha
        jsl rlGetRandomNumber
        cmp #1,s
        pla
        rtl

        .databank 0

      rlUnknown84EFA5 ; 84/EFA5

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #$7E
        pha
        rep #$20
        plb

        lda $7E4EAA
        bit #$0010
        beq _EFCF

        lda $7E4EAA
        bit #$0020
        bne +

        ldx #$4EB5
        bra ++
        
        +
        ldx #$4F15
        
        +
        lda $0008,b,x
        
        -
        plp
        plb
        rtl
        
        _EFCF
        lda #0
        bra -

        .databank 0

      rlGetSelectedUnitInventoryRAMPointer ; 84/EFD4

        .al
        .autsiz
        .databank ?

        ldx wSelectedUnitDataRAMPointer,b
        sep #$20
        lda $7E0000+structCharacterDataRAM.InventoryData+2,x
        pha
        rep #$20
        plb
        lda $7E0000+structCharacterDataRAM.InventoryData,x
        tax
        rtl

        .databank 0

      rlSaveCharacterInventoryToBuffer ; 84/EFE7

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        phy
        lda lR18
        pha
        lda lR18+1
        pha
        lda wR0
        pha

        lda lRAMBufferPointer+1,b
        sta lR18+1
        lda lRAMBufferPointer,b
        sta lR18

        jsl rlGetSelectedUnitInventoryRAMPointer

        ldy #structInventoryDataBuffer.EquippedWeaponBitfield
        lda structInventoryDataRAM.EquippedWeaponBitfield,b,x
        and #$00FF
        sta [lR18],y

        ldy #structInventoryDataBuffer.ItemCount
        lda structInventoryDataRAM.CurrentStructCount,b,x
        and #$00FF
        sta [lR18],y
        sta wR0
        beq _End

          ldy #structInventoryDataBuffer.Items

            -
            lda structInventoryDataRAM.Slot,b,x
            and #$00FF
            sta [lR18],y
            inc x
            inc y
            inc y
            dec wR0
            bne -

        _End
        pla
        sta wR0
        pla
        sta lR18+1
        pla
        sta lR18
        ply
        plx
        plp
        plb
        rtl

        .databank 0

      rlLoadEquipmentDataIntoSpecifiedInventory ; 84/F03E

        .al
        .autsiz
        .databank ?

        ; A = character rom pointer + equip offset

        phb
        php

        phk
        plb

        phx
        phy

        ldx wR0
        phx
        ldx wR1
        phx
        ldx wRoutineVariable1,b
        phx

        tay

        ldx wSelectedUnitDataRAMPointer,b
        lda $7E0000+structCharacterDataRAM.InventoryData+1,x
        sta lStructPointer2+1,b
        sta lR18+1
        lda $7E0000+structCharacterDataRAM.InventoryData,x
        clc
        adc #structInventoryDataRAM.CurrentStructCount
        sta lStructPointer2,b
        sta lR18
        lda #size(structInventoryDataRAM.Slot)
        sta wR0
        lda #1
        sta wR1
        jsl rlBuildRAMStructHeader

        ldx #size(structCharacterEquipmentROMEntry)

        lda #0
        sta wRoutineVariable1,b
        jsl rlSetEquippedInventorySlot

        sep #$20
        lda #`aCharacterData
        pha
        rep #$20
        plb

        ; Get equipment data
        -
        lda structCharacterEquipmentROMEntry.Equipment1,b,y
        and #$00FF
        cmp #$00FF
        beq +

          sta wRoutineVariable1,b
          jsl rlGiveItemToUnit

        +
        inc y
        dec x
        bne -

        jsl rlGetUnitType
        cmp #UnitTypeDynamic
        beq _End

          ; Handle unique equipment
          lda $0000,b,y
          and #$00FF
          cmp #$00FF
          beq _End

            jsl rlCheckForValidUniqueItemOrDrops
            ora #0
            bne _End

            ; Nobody has it yet.
            jsl rlGetUnitType
            ora #UnitTypeStatic
            bne +
            bcs _End

              lda $0000,b,y
              and #$00FF
              sta wRoutineVariable1,b

            +
            jsl rlGiveItemToUnit

        _End
        jsl rlEquipFirstWeaponInInventory

        pla
        sta wRoutineVariable1,b
        pla
        sta wR1
        pla
        sta wR0

        ply
        plx
        plp
        plb
        rtl

        .databank 0

      rlGiveItemToUnit ; 84/F0E9

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx

        jsl rlGetUnitType
        asl a
        tax
        jsr (aUnitTypeItemGivingPointers,x)

        plx
        plp
        plb
        rtl

        .databank 0

      aUnitTypeItemGivingPointers ; 84/F0FB

        .addr rsGivePlayerItemIDToSelectedUnit
        .addr rsGivePlayerItemIDToSelectedUnit
        .addr rsGiveItemToSelectedEnemyUnit
        .addr rsGiveItemToSelectedEnemyUnit

      rsGivePlayerItemIDToSelectedUnit ; 84/F103

        .al
        .autsiz
        .databank ?

        jsl rlGivePlayerItemIDToSelectedUnit
        rts

        .databank 0

      rsUnknown84F108 ; 84/F108

        .al
        .autsiz
        .databank ?

        lda wRoutineVariable1,b
        jsl rlGetItemRAMStructEntryByPlayerItemIndex
        jsl rlGetEffectiveItemIDByItemRAMStructEntry
        sta lStructPointer1,b
        bra +

      rsGiveItemToSelectedEnemyUnit ; 84/F118

        .al
        .autsiz
        .databank ?

        lda wRoutineVariable1,b
        sta lStructPointer1,b

        +
        ldx wSelectedUnitDataRAMPointer,b
        lda $7E0000+structCharacterDataRAM.InventoryData+1,x
        sta lStructPointer2+1,b
        lda $7E0000+structCharacterDataRAM.InventoryData,x
        clc
        adc #structInventoryDataRAM.CurrentStructCount
        sta lStructPointer2,b

        jsl rlAppendNewStructEntry

        lda wRoutineVariable1,b
        jsl rlGetItemDataROMPointer
        jsr rsAddItemStatBonusIfRingByItemROMPointer
        rts

        .databank 0

      rlGivePlayerItemIDToSelectedUnit ; 84/F142

        .al
        .autsiz
        .databank ?

        ; wRoutineVariable1 = player item ID

        phb
        php
        phk
        plb
        phx

        lda wR0
        pha
        lda wR1
        pha
        lda wRoutineVariable1,b
        pha

        lda wRoutineVariable1,b
        jsl rlGetItemRAMStructEntryByPlayerItemIndex

        lda wRoutineVariable1,b
        sta lStructPointer1,b

        ldx wSelectedUnitDataRAMPointer,b
        lda $7E0000+structCharacterDataRAM.InventoryData+1,x
        sta lStructPointer2+1,b
        lda $7E0000+structCharacterDataRAM.InventoryData,x
        clc
        adc #structInventoryDataRAM.CurrentStructCount
        sta lStructPointer2,b
        jsl rlAppendNewStructEntry
        bcs +

          ; successful
          lda #1 ; item state?
          sta wR0
          lda wSelectedUnitDataRAMPointer,b
          sta wR1
          jsl rlSetItemRAMStateAndOwner
          jsr rsAddItemStatBonusIfRingByItemRAMStructEntry
          jsl rlGetSelectedUnitInventoryRAMPointer

          lda structInventoryDataRAM.EquippedWeaponBitfield,b,x
          and #$00FF
          bne +

            jsl rlEquipFirstWeaponInInventory

        +
        pla
        sta wRoutineVariable1,b
        pla
        sta wR1
        pla
        sta wR0

        plx
        plp
        plb
        rtl

        .databank 0

      rsAddItemStatBonusIfRingByItemRAMStructEntry ; 84/F1A8

        .al
        .autsiz
        .databank ?

        jsl rlGetEffectiveItemROMPointerByItemRAMStructEntry

      rsAddItemStatBonusIfRingByItemROMPointer ; 84/F1AC

        .al
        .autsiz
        .databank ?

        jsl rlGetItemEquipmentType
        cmp #EquipTypeRing
        bne +

          jsl rlGetItemStatBonus
          ora #0
          beq +

            tax
            lda aRingStatBonusTable,x
            jsl rlAddRingStatBonusToSelectedUnit

        +
        rts

        .databank 0

      rsRemoveItemStatBonusIfRing ; 84/F1C8

        .al
        .autsiz
        .databank ?

        jsl rlGetEffectiveItemROMPointerByItemRAMStructEntry
        jsl rlGetItemEquipmentType
        cmp #EquipTypeRing
        bne +

          jsl rlGetItemStatBonus
          ora #0
          beq +

            tax
            lda aRingStatBonusTable,x
            jsl rlRemoveRingStatBonusFromSelectedUnit

        +
        rts

        .databank 0

      aRingStatBonusTable ; 84/F1E8

        .byte $00
        .byte $10
        .byte $40
        .byte $80
        .byte $08
        .byte $04
        .byte $02
        .byte $20

      rlGivePlayerItemIDToSelectedUnitsFirstItemSlot ; 84/F1F0

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx

        lda wR0
        pha
        lda wR1
        pha

        lda wRoutineVariable1,b
        jsl rlGetItemRAMStructEntryByPlayerItemIndex

        lda wRoutineVariable1,b
        sta lStructPointer1,b

        ldx wSelectedUnitDataRAMPointer,b
        lda $7E0000+structCharacterDataRAM.InventoryData+1,x
        sta lStructPointer2+1,b
        lda $7E0000+structCharacterDataRAM.InventoryData,x
        clc
        adc #structInventoryDataRAM.CurrentStructCount
        sta lStructPointer2,b
        jsl rlWriteToFirstStructEntry
        bcs +

          lda #1
          sta wR0
          lda wSelectedUnitDataRAMPointer,b
          sta wR1
          jsl rlSetItemRAMStateAndOwner
          jsr rsAddItemStatBonusIfRingByItemRAMStructEntry

        +
        pla
        sta wR1
        pla
        sta wR0
        plx
        plp
        plb
        rtl

        .databank 0

      rlRemoveItemInSpecifiedInventorySlot ; 84/F23E

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = inv slot

        phb
        phk
        plb
        phx
        ldx wRoutineVariable1,b
        phx

        sta wStructIndex,b
        sta wRoutineVariable1,b

        ldx wSelectedUnitDataRAMPointer,b
        lda $7E0000+structCharacterDataRAM.InventoryData+1,x
        sta lStructPointer2+1,b
        lda $7E0000+structCharacterDataRAM.InventoryData,x
        clc
        adc #structInventoryDataRAM.CurrentStructCount
        sta lStructPointer2,b

        jsl rlLoadRAMStructDataByIndex
        bcs +

        jsl rlRemoveRAMStructEntryByID
        bcs +

        lda lStructPointer1,b
        and #$00FF
        jsl rlGetItemRAMStructEntryByPlayerItemIndex
        jsr rsRemoveItemStatBonusIfRing
        jsr rsUpdateEquippedWeaponBitfieldIfSlotChanged
        clc

        -
        plx
        stx wRoutineVariable1,b
        plx
        plb
        rtl
        
        +
        sec
        bra -

        .databank 0

      rsUpdateEquippedWeaponBitfieldIfSlotChanged ; 84/F288

        .al
        .autsiz
        .databank ?

        ; Input:
        ; wRoutineVariable1 = inventory slot

        phb
        phx
        ldx wRoutineVariable1,b
        dec x
        lda _EquippedWeaponBitfield,x
        and #$00FF
        sta wRoutineVariable1,b

        jsl rlGetSelectedUnitInventoryRAMPointer
        lda structInventoryDataRAM.EquippedWeaponBitfield,b,x
        and #$00FF
        cmp wRoutineVariable1,b
        beq +
        bcs _End

          asl a
          sep #$20
          sta structInventoryDataRAM.EquippedWeaponBitfield,b,x
          rep #$20
          bra _End

        +
        jsl rlEquipFirstWeaponInInventory
        jsl rlSaveEquippedWeaponStatBonus
        
        _End
        plx
        plb
        rts

        .databank 0

        _EquippedWeaponBitfield ; 84/F2BE
        .byte $80 
        .byte $40 
        .byte $20 
        .byte $10 
        .byte $08 
        .byte $04 
        .byte $02 
        .byte $01 

      rlUnknown84F2C6 ; 84/F2C6

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx

        sta lStructPointer1,b
        ldx wSelectedUnitDataRAMPointer,b
        lda $7E000E,x
        sta lStructPointer2+1,b
        lda $7E000D,x
        clc
        adc #1
        sta lStructPointer2,b
        jsl rlFindRAMStructEntry

        plx
        plp
        plb
        rtl

        .databank 0

      rlGetSelectedUnitFirstInventoryItem ; 84/F2EB

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx

        jsl rlGetSelectedUnitInventoryRAMPointer

        lda $0000,b,x
        and #$00FF

        plx
        plp
        plb
        rtl

        .databank 0

      rlSetEquippedInventorySlot ; 84/F2FE

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        jsl rlGetSelectedUnitInventoryRAMPointer

        sep #$20
        lda wRoutineVariable1
        sta structInventoryDataRAM.EquippedWeaponBitfield,b,x
        rep #$20

        plx
        plp
        plb
        rtl

        .databank 0

      rlGetSelectedUnitInventorySize ; 84/F316

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        ldx wSelectedUnitDataRAMPointer,b
        lda $7E0000+structCharacterDataRAM.InventoryData+1,x
        sta lStructPointer2+1,b
        lda $7E0000+structCharacterDataRAM.InventoryData,x
        clc
        adc #structInventoryDataRAM.CurrentStructCount
        sta lStructPointer2,b
        jsl rlGetRAMStructCurrentStructCount
        plx
        plp
        plb
        rtl

        .databank 0

      rlGetPlayerItemIndexByInventorySlot ; 84/F338

        .al
        .autsiz
        .databank ?

        phb

        phk
        plb

        phx

        ora #0
        beq +

          sta wStructIndex,b

          jsl rlGetUnitType
          cmp #UnitTypeHoly
          bcs +

            ldx wSelectedUnitDataRAMPointer,b
            lda $7E0000+structCharacterDataRAM.InventoryData+1,x
            sta lStructPointer2+1,b
            lda $7E0000+structCharacterDataRAM.InventoryData,x
            clc
            adc #structInventoryDataRAM.CurrentStructCount
            sta lStructPointer2,b
            jsl rlLoadRAMStructDataByIndex
            bcs +

              lda lStructPointer1,b
              and #$00FF
              clc

              -
              plx
              plb
              rtl

        +
        lda #0
        sec
        bra -

        .databank 0

      rlGetItemRAMStructEntryByInventorySlot ; 84/F378

        .al
        .autsiz
        .databank ?

        phb

        phk
        plb

        stz wCurrentItemDataRAMPointer,b

        jsl rlGetPlayerItemIndexByInventorySlot
        bcs +

          jsl rlGetItemRAMStructEntryByPlayerItemIndex
          clc
        
        +
        plb
        rtl

        .databank 0

      rlGetItemIDByInventorySlot ; 84/F38B

        .al
        .autsiz
        .databank ?

        phb

        phk
        plb

        sta $0585,b

        jsl rlGetUnitType
        cmp #UnitTypeHoly
        bcs +

        lda $0585,b
        jsl rlGetItemRAMStructEntryByInventorySlot
        bcs _End

        jsl rlGetEffectiveItemIDByItemRAMStructEntry

        _End
        plb
        rtl

        +
        stz wCurrentItemDataRAMPointer,b
        lda $0585,b
        jsl rlGetEnemyItemIndexByInventorySlot
        bra _End

        .databank 0

      rlGetItemROMDataByInventorySlot ; 84/F3B5

        .al
        .autsiz
        .databank ?

        ; In:
        ; A = inventory slot, 1 indexed

        ; Returns the item ROM pointer in A and wCurrentItemDataRAMPointer

        phb
        php

        phk
        plb

        sta $0585,b

        jsl rlGetUnitType
        cmp #UnitTypeHoly
        bcs _NotPlayer

        lda $0585,b
        jsl rlGetItemRAMStructEntryByInventorySlot
        bcs +

          jsl rlGetEffectiveItemROMPointerByItemRAMStructEntry

          -
          plp
          plb
          rtl

        +
        stz wCurrentItemDataROMPointer,b
        bra -

        _NotPlayer
        stz wCurrentItemDataRAMPointer,b
        lda $0585,b
        jsl rlGetEnemyItemDataByInventorySlot
        bra -
  
      rlGetEnemyItemIndexByInventorySlot ; 84/F3E6

        .al
        .autsiz
        .databank ?
        
        phb

        phk
        plb

        phx
        sta wStructIndex,b

        ldx wSelectedUnitDataRAMPointer,b
        lda $7E0000+structCharacterDataRAM.InventoryData+1,x
        sta lStructPointer2+1,b
        lda $7E0000+structCharacterDataRAM.InventoryData,x
        clc
        adc #structInventoryDataRAM.CurrentStructCount
        sta lStructPointer2,b
        jsl rlLoadRAMStructDataByIndex
        bcs _End

          lda lStructPointer1,b
          and #$00FF
          cmp #$00FF
          beq +

            clc
        
        _End
        plx
        plb
        rtl

        +
        sec
        bra _End

        .databank 0

      rlGetEnemyItemDataByInventorySlot ; 84/F41A

        .al
        .autsiz
        .databank ?

        jsl rlGetEnemyItemIndexByInventorySlot
        bcs +

          jsl rlGetItemDataROMPointer

          -
          rtl

        +
        stz wCurrentItemDataROMPointer,b
        bra -

        .databank 0

      rlCheckIfWeaponEquipped ; 84/F42A

        .al
        .autsiz
        .databank `aEquippedWeaponBitfield

        phb

        phk
        plb

        phx
        phy

        ldx wR0
        phx

        dec a
        tay
        lda aEquippedWeaponBitfield,y
        and #$00FF
        sta wR0

        jsl rlGetSelectedUnitInventoryRAMPointer

        lda structInventoryDataRAM.EquippedWeaponBitfield,b,x
        and #$00FF
        bit wR0
        beq +

        sec

        -
        plx
        stx wR0
        ply
        plx
        plb
        rtl
        
        +
        clc
        bra -

        .databank 0

      aEquippedWeaponBitfield ; 84/F455

        .byte $80
        .byte $40
        .byte $20
        .byte $10
        .byte $08
        .byte $04
        .byte $02
        .byte $01

      rlFlagEquippedInventorySlotAndGetStatBonus ; 84/F45D

        .al
        .autsiz
        .databank ?

        ; A = inventory slot

        phb
        phk
        plb
        phx
        phy

        tay
        jsl rlCheckWeaponInInventorySlotEquippable
        bcc _SEC

        lda #0
        sta wRoutineVariable1,b
        jsl rlSetEquippedInventorySlot

        jsl rlGetSelectedUnitInventoryRAMPointer

        sep #$20
        lda #$80
        
        -
        dec y
        beq +

        lsr a
        bra -

        +
        ora structInventoryDataRAM.EquippedWeaponBitfield,b,x
        sta structInventoryDataRAM.EquippedWeaponBitfield,b,x
        rep #$20

        jsl rlSaveEquippedWeaponStatBonus

        clc

        -
        ply
        plx
        plb
        rtl
        
        _SEC
        sec
        bra -

        .databank 0

      rlGetItemDurabilityOfInventorySlot ; 84/F495

        .al
        .autsiz
        .databank ?

        jsl rlGetItemRAMStructEntryByInventorySlot
        bcs +

        jsl rlGetItemCurrentDurability
        
        -
        rtl

        +
        lda #$FFFF
        bra -

        .databank 0

      rlGetFirstEquippableWeaponInInventory ; 84/F4A5

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        lda wRoutineVariable1,b
        pha
        lda wRoutineVariable2,b
        pha

        stz wCurrentItemDataROMPointer,b

        jsl rlGetSelectedUnitInventorySize
        inc a
        sta wRoutineVariable2,b
        jsl rlGetSelectedUnitInventoryRAMPointer

        lda $0000,b,x
        xba
        sta wRoutineVariable1,b

        ldx #1

        -
        asl wRoutineVariable1,b
        bcc +

          ; slot is filled
          txa
          jsl rlGetItemROMDataByInventorySlot
          jsl rlGetItemEquipmentType
          cmp #EquipTypeWeapon
          beq ++

            stz wCurrentItemDataROMPointer,b

        +
        inc x
        cpx wRoutineVariable2,b
        bcc -

        ldx #0

        +
        pla
        sta wRoutineVariable2,b
        pla
        sta wRoutineVariable1,b
        txa
        plx
        plp
        plb
        rtl

        .databank 0

      rlUnknown84F4F7 ; 84/F4F7

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        lda wSelectedInventorySlot,b
        jsl rlGetItemROMDataByInventorySlot

        lda wCurrentItemDataROMPointer,b
        beq +

          jsl rlGetItemMinimumRange
          sta wR10
          jsl rlGetItemMaximumRange
          sta wR11
          jsl rlGetSelectedUnitStates
          bit #UnitState0400
          beq +

            inc wR11

        +
        plp
        plb
        rtl

        .databank 0

      rlGetInventoryWeaponsRangeFlags ; 84/F521

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        lda wR10
        pha
        lda wR2
        pha

        stz wR10
        stz wR2
        ldx #1

        _Loop
        txa
        jsl rlGetItemROMDataByInventorySlot

        lda wCurrentItemDataROMPointer,b
        beq _End

          jsl rlCheckItemObtainable
          bcc _Next

            jsl rlGetItemEquipmentType
            cmp #EquipTypeRing
            bcs _Next

              cmp #EquipTypeStaff
              beq +

                jsl rlCheckWeaponEquippable
                bcc _Next

                  jsl rlGetItemMinimumRange
                  jsr rsGetWeaponRangeFlags
                  tsb wR10
                  jsl rlGetItemMaximumRange
                  jsr rsGetWeaponRangeFlags
                  tsb wR10
                  bra _Next

              +
              jsl rlGetSelectedUnitStatus
              cmp #StatusSilence
              beq _Next

                jsl rlGetItemStaffEffect
                cmp #$000C
                bcc _Next

                  ; everything but silence, sleep, berserk and thief
                  jsl rlGetItemMinimumRange
                  jsr rsGetWeaponRangeFlags
                  tsb wR2
                  jsl rlGetItemMaximumRange
                  jsr rsGetWeaponRangeFlags
                  tsb wR2

          _Next
          inc x
          cpx #7+1+1
          bcc _Loop

        _End
        lda wR10
        ldy wR2

        plx
        stx wR2
        plx
        stx wR10
        plx
        plp
        plb
        rtl

        .databank 0

      rsGetWeaponRangeFlags ; 84/F5A3

        .al
        .autsiz
        .databank `aWeaponRangeFlags

        asl a
        tay
        lda aWeaponRangeFlags,y
        rts

        .databank 0

      aWeaponRangeFlags ; 84/F5A9

        .word $0000
        .word $0001
        .word $0002
        .word $0000
        .word $0000
        .word $0000
        .word $0000
        .word $0000
        .word $0000
        .word $0000
        .word $0004

      rlGetCounterableWeaponSlot ; 84/F5BF

        .al
        .autsiz
        .databank ?

        ; In:
        ; A = range

        ; Out:
        ; X = inv slot

        phb
        php
        phk
        plb
        phx
        ldx wRoutineVariable1,b
        phx

        sta wRoutineVariable1,b
        ldx #1
        
        -
        txa
        jsl rlGetItemROMDataByInventorySlot

        lda wCurrentItemDataROMPointer,b
        beq _Next

          jsl rlGetItemEquipmentType
          cmp #EquipTypeWeapon
          bne _Next

            jsl rlGetItemMinimumRange
            dec a
            cmp wRoutineVariable1,b
            bcs _Next

              jsl rlGetItemMaximumRange
              cmp wRoutineVariable1,b
              bcs +

                stz wCurrentItemDataROMPointer,b

        _Next
        inc x
        cpx #size(structInventoryDataRAM.Slot)+1
        bcc -

        jsl rlGetFirstEquippableWeaponInInventory
        bra ++
        
        +
        txa
        
        +
        plx
        stx wRoutineVariable1,b
        plx
        plp
        plb
        rtl

        .databank 0

      rlCheckWeaponEquippable ; 84/F60C

        .al
        .autsiz
        .databank ?

        phb
        phk
        plb
        phx

        lda wCurrentItemDataROMPointer,b
        beq _CLC

        jsl rlGetItemEquipmentType
        cmp #EquipTypeWeapon
        bne _CLC

        jsl rlGetItemWeaponTraits
        cmp #WeaponTraitFemaleOnly
        bne +

          jsl rlGetSelectedUnitGender
          cmp #GenderFemale
          bne _CLC

        +
        jsl rlGetItemWeaponType
        tax
        cmp #WeaponTypeStaff
        bcc +

          ; Is magical weapon
          jsl rlGetItemMaxDurability2
          ora #0
          beq _CLC

          jsl rlGetSelectedUnitStatus
          cmp #StatusSilence
          beq _CLC

        +
        txa
        jsl rlGetSelectedUnitWeaponRank
        cmp #WeaponRankNone
        bcs _CLC

        sta wRoutineVariable1,b
        jsl rlGetItemWeaponRank
        ora #0
        bmi _HolyWeapon

        cmp wRoutineVariable1,b
        bmi _CLC

        ; Equippable
        sec
        
        -
        plx
        plb
        rtl
        
        _CLC
        clc
        bra -

        _HolyWeapon
        sep #$20
        lda #`aItemData
        pha
        rep #$20
        plb

        jsl rlGetItemMaxDurability1
        ora #0
        beq _SEC

        ldx #(size(aHolyBloodGrowthBoostsOffsets)/2)-1

        -
        txa
        jsl rlUnknown84A69F
        ora #0
        beq +

          jsr rsGetItemDataROMPointer
          cmp wCurrentItemDataROMPointer,b
          bne +

            txa
            jsl rlCheckForSpecifiedHolyBlood
            cmp #MajorHolyBlood
            bcs _SEC
        
        +
        dec x
        bpl -

        clc
        bra +
        
        _SEC
        sec
        
        +
        plx
        plb
        rtl

        .databank 0

      rsGetItemDataROMPointer ; 84/F6A8

        .al
        .autsiz
        .databank ?

        phx
        asl a
        clc
        adc aMainDataOffsets.ItemDataOffsets
        tax
        lda aMainDataOffsets,x
        clc
        adc aMainDataOffsets.ItemDataOffsets
        adc #<>aMainDataOffsets
        plx
        rts

        .databank 0

      rlCheckStaffEquippable ; 84/F6BE

        .al
        .autsiz
        .databank ?

        phb
        phk
        plb
        phx

        lda wCurrentItemDataROMPointer,b
        beq _CLC

          jsl rlGetSelectedUnitStatus
          cmp #StatusSilence
          beq _CLC

            jsl rlGetItemEquipmentType
            cmp #EquipTypeStaff
            bne _CLC

              jsl rlGetItemMaxDurability2
              ora #0
              beq _CLC

                lda #WeaponTypeStaff
                jsl rlGetSelectedUnitWeaponRank
                cmp #WeaponRankNone
                bcs _CLC

                  sta wRoutineVariable1,b
                  jsl rlGetItemWeaponRank
                  ora #0
                  bpl +

                    jml rlCheckWeaponEquippable._HolyWeapon

                  +
                  cmp wRoutineVariable1,b
                  bmi _CLC

                    sec

                    -
                    plx
                    plb
                    rtl

        _CLC
        clc
        bra -

        .databank 0

      rlCheckItemObtainable ; 84/F70A

        .al
        .autsiz
        .databank ?

        phb
        phk
        plb
        phx
        lda wCurrentItemDataROMPointer,b
        beq _CLC

        jsl rlGetItemEquipmentType
        cmp #EquipTypeRing
        bcs _SEC

        cmp #EquipTypeWeapon
        bne +

        jsl rlGetItemWeaponTraits
        cmp #WeaponTraitFemaleOnly
        bne +
        
        jsl rlGetSelectedUnitGender
        cmp #GenderFemale
        bne _CLC

        +
        jsl rlGetItemWeaponType
        jsl rlGetSelectedUnitWeaponRank
        sta wRoutineVariable1,b

        jsl rlGetItemWeaponRank
        ora #0
        bmi _SEC

        cmp wRoutineVariable1,b
        bmi _CLC

        _SEC
        sec

        -
        plx
        plb
        rtl

        _CLC
        clc
        bra -

        .databank 0

      rlCheckWeaponInInventorySlotEquippable ; 84/F753

        .al
        .autsiz
        .databank ?

        ; sec if true

        jsl rlGetItemROMDataByInventorySlot
        jsl rlCheckWeaponEquippable
        rtl

        .databank 0

        ; 84/F75C

    .endsection Code84EC80Section



    .section Code84F939Section

      rlEquipFirstWeaponInInventory ; 84/F939

        .al
        .autsiz
        .databank ?

        phb
        phk
        plb
        phy
        lda wCurrentItemDataROMPointer,b
        pha
        lda wCurrentItemDataRAMPointer,b
        pha

        lda #0
        sta wRoutineVariable1,b
        jsl rlSetEquippedInventorySlot

        ldy #1

        -
        tya
        jsl rlFlagEquippedInventorySlotAndGetStatBonus
        bcc +

        inc y
        cpy #size(structInventoryDataRAM.Slot)+1
        bcc -

        sec
        
        -
        pla
        sta wCurrentItemDataRAMPointer,b
        pla
        sta wCurrentItemDataROMPointer,b
        ply
        plb
        rtl
        
        +
        clc
        bra -

        .databank 0

      rlUnknown84F96E ; 84/F96E

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb

        lda wRoutineVariable1,b
        jsl rlGetItemRAMStructEntryByInventorySlot
        bcs +

        jsl $87E230
        
        -
        plp
        plb
        rtl
        
        +
        lda #0
        bra -

        .databank 0

      rlUnknown84F987 ; 84/F987

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb

        jsl rlGetItemRAMStructEntryByInventorySlot
        bcs +

        jsl $87E25D
        
        -
        plp
        plb
        rtl

        +
        lda #0
        bra -

        .databank 0

      rlUnknown84F99D ; 84/F99D

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        ldx wRoutineVariable1,b
        phx

        cmp #0
        beq _F9E3

        jsl rlGetItemRAMStructEntryByInventorySlot
        jsl $87E0C9
        jsl $87E3D6
        sta $1A
        jsl $87E3BE
        sta $1C
        jsl $80A1AB
        lda #$0014
        sta $1C
        jsl $80A1AB

        lda $1A
        clc
        adc #10
        bmi +

        cmp #101
        bmi _End

        lda #100
        bra _End
        
        +
        lda #0
        bra _End
        
        _F9E3
        lda #10
        
        _End
        plx
        stx wRoutineVariable1,b
        plx
        plp
        plb
        rtl

        .databank 0

      rlUnknown84F9EE ; 84/F9EE

        .al
        .autsiz
        .databank ?

        jsr $84F1A8
        rtl

        .databank 0

      rlSaveEquippedWeaponStatBonus ; 84/F9F2

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        lda wCurrentItemDataROMPointer,b
        pha
        lda wCurrentItemDataRAMPointer,b
        pha

        jsl rlGetFirstEquippableWeaponInInventory

        lda wCurrentItemDataROMPointer,b
        beq +

        jsl rlGetItemStatBonus
        jsl rlSetActiveWeaponStatBonus
        
        -
        pla
        sta wCurrentItemDataRAMPointer,b
        pla
        sta wCurrentItemDataROMPointer,b
        plp
        plb
        rtl

        +
        lda #0
        jsl rlSetActiveWeaponStatBonus
        bra -

        .databank 0 

      rlGetUniqueEquipmentOrDrops ; 84/FA23

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phy

        jsl rlGetSelectedUnitFactionSlot
        ora #0
        beq _FA5D

        jsl rlGetSelectedUnitCharacterID
        jsl rlSwapToMainDataBank
        jsl rlGetCharacterDataROMPointer
        tay
        lda structCharacterROMEntry.Type,b,y
        and #$00FF
        cmp #UnitTypeEnemy
        beq +

        cmp #UnitTypeDynamic
        beq _FA5D

        lda structStaticCharacterROMEntry.UniqueEquipment,b,y
        bra _End

        +
        lda structEnemyCharacterROMEntry.Drops,b,y

        _End
        and #$00FF
        ply
        plp
        plb
        rtl

        _FA5D
        lda #$00FF
        bra _End

        .databank 0

      rlCheckForValidUniqueItemOrDrops ; 84/FA62

        .al
        .autsiz
        .databank ?

        phb
        phk
        plb
        phx
        phy
        ldx wR0
        phx
        ldx wR1
        phx

        ldx #0
        jsl rlGetUniqueEquipmentOrDrops
        cmp #$00FF
        beq _FAB1

        jsl rlGetItemRAMStructEntryByPlayerItemIndex
        jsl rlGetEffectiveItemIDByItemRAMStructEntry
        sta wRoutineVariable1,b

        ldy wCurrentItemDataRAMPointer,b
        ldx #1

        -
        txa
        jsl rlGetItemIDByInventorySlot
        bcs +

        ; Inventory slot is filled
        cmp wRoutineVariable1,b
        beq ++

        inc x
        bra -

        +
        ldx #0

        +
        sty wCurrentItemDataRAMPointer,b
        jsl rlGetItemRAMStateAndOwner

        lda wR1
        cmp wSelectedUnitDataRAMPointer,b
        beq _FAB1

        lda wR0
        cmp #ItemStateUnobtained
        bne +

        _FAB1
        txa     
        clc

        -
        plx
        stx wR1
        plx
        stx wR0
        ply
        plx
        plb
        rtl

        +
        txa
        sec
        bra -

        .databank 0

      rlUnknown84FAC1 ; 84/FAC1

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        lda #$000F
        jsl $87A19D
        bcs +

        lda #$000F
        jsl $87A2EF
        bcc _FAFA
        
        +
        jsl $8498C6
        cmp #$000B
        bcs _FAFA

        eor #$FFFF
        inc a
        clc
        adc #$000B
        sta $4C

        lda #$000A
        sta $4E
        jsl $80A096
        lda $50
        
        -
        plx
        plp
        plb
        rtl
        
        _FAFA
        lda #0
        bra -

        .databank 0

      rlGetWeaponTriangleBonus ; 84/FAFF

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = weapon type of defender in high byte, attacker in low byte

        phb
        php
        phk
        plb
        phx
        pha
        xba
        and #$00FF
        asl a
        tax
        lda aWeaponDisadvantageOffsets,x
        tax

        pla
        and #$00FF
        sta wRoutineVariable1,b

        -
        lda aWeaponDisadvantageOffsets,x
        and #$00FF
        cmp #$00FF
        beq +

        cmp wRoutineVariable1,b
        beq ++

        inc x
        bra -

        +
        lda #0

        -
        plx
        plp
        plb
        rtl

        +
        lda #20
        bra -

        .databank 0

      aWeaponDisadvantageOffsets ; 84/FB37

        .word <>aSwordWeaponDisdvantage   - aWeaponDisadvantageOffsets
        .word <>aLanceWeaponDisdvantage   - aWeaponDisadvantageOffsets
        .word <>aAxeWeaponDisdvantage     - aWeaponDisadvantageOffsets
        .word <>aBowWeaponDisdvantage     - aWeaponDisadvantageOffsets
        .word <>aStaffWeaponDisdvantage   - aWeaponDisadvantageOffsets
        .word <>aFireWeaponDisdvantage    - aWeaponDisadvantageOffsets
        .word <>aThunderWeaponDisdvantage - aWeaponDisadvantageOffsets
        .word <>aWindWeaponDisdvantage    - aWeaponDisadvantageOffsets
        .word <>aLightWeaponDisdvantage   - aWeaponDisadvantageOffsets
        .word <>aDarkWeaponDisdvantage    - aWeaponDisadvantageOffsets

      aSwordWeaponDisdvantage   .char WeaponTypeLance, -1
      aLanceWeaponDisdvantage   .char WeaponTypeAxe, -1
      aAxeWeaponDisdvantage     .char WeaponTypeSword, -1
      aBowWeaponDisdvantage     .char -1
      aStaffWeaponDisdvantage   .char -1
      aFireWeaponDisdvantage    .char WeaponTypeThunder, WeaponTypeLight, WeaponTypeDark, -1
      aThunderWeaponDisdvantage .char WeaponTypeWind, WeaponTypeLight, WeaponTypeDark, -1
      aWindWeaponDisdvantage    .char WeaponTypeFire, WeaponTypeLight, WeaponTypeDark, -1
      aLightWeaponDisdvantage   .char -1
      aDarkWeaponDisdvantage    .char -1

      rsGetEnemyTotalSpecifiedStat ; 84/FB61

        .al
        .autsiz
        .databank ?

        phx
        lda wR36
        pha
        lda wR37
        pha
        lda wR35
        pha

        lda wR34
        sta wR34
        jsl rlGetEnemyUnitConstantDataPointer
        lda $0006,b,x
        and #$00FF
        sta wR35
        jsl rlUnsignedMultiply16By16High
        lda #100
        sta wR37
        jsl rlUnsignedDivide16By16

        pla
        sta wR35

        lda wR36
        clc
        adc wR35

        plx
        stx wR37
        plx 
        stx wR36
        plx
        rts

        .databank 0

      rlGetEnemyMaxHP ; 84/FB98

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        lda wR34
        pha
        lda wR35
        pha

        jsl rlGetEnemyClassHPGrowth
        sta wR34

        jsl rlGetSelectedUnitClassDataPointer
        jsl rlGetClassBaseHP
        sta wR35

        jsr rsGetEnemyTotalSpecifiedStat

        plx
        stx wR35
        plx
        stx wR34
        plx
        plp
        plb
        rtl

        .databank 0

      rlGetEnemyStrength ; 84/FBC0

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        lda wR34
        pha
        lda wR35
        pha

        jsl rlGetEnemyClassStrGrowth
        sta wR34
        jsl rlGetSelectedUnitClassDataPointer
        jsl rlGetClassStrength
        sta wR35
        jsr rsGetEnemyTotalSpecifiedStat

        plx
        stx wR35
        plx
        stx wR34
        plx
        plp
        plb
        rtl

        .databank 0

      rlGetEnemyMagic ; 84/FBE8

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        lda wR34
        pha
        lda wR35
        pha

        jsl rlGetEnemyClassMagGrowth
        sta wR34
        jsl rlGetSelectedUnitClassDataPointer
        jsl rlGetClassMagic
        sta wR35
        jsr rsGetEnemyTotalSpecifiedStat

        plx
        stx wR35
        plx
        stx wR34
        plx
        plp
        plb
        rtl

        .databank 0

      rlGetEnemySkill ; 84/FC10

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        lda wR34
        pha
        lda wR35
        pha

        jsl rlGetEnemyClassSklGrowth
        sta wR34
        jsl rlGetSelectedUnitClassDataPointer
        jsl rlGetClassSkill
        sta wR35
        jsr rsGetEnemyTotalSpecifiedStat

        plx
        stx wR35
        plx
        stx wR34
        plx
        plp
        plb
        rtl

        .databank 0

      rlGetEnemySpeed ; 84/FC38

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        lda wR34
        pha
        lda wR35
        pha

        jsl rlGetEnemyClassSpdGrowth
        sta wR34
        jsl rlGetSelectedUnitClassDataPointer
        jsl rlGetClassSpeed
        sta wR35
        jsr rsGetEnemyTotalSpecifiedStat

        plx
        stx wR35
        plx
        stx wR34
        plx
        plp
        plb
        rtl

        .databank 0

      rlGetEnemyDefense ; 84/FC60

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        lda wR34
        pha
        lda wR35
        pha

        jsl rlGetEnemyClassDefGrowth
        sta wR34
        jsl rlGetSelectedUnitClassDataPointer
        jsl rlGetClassDefense
        sta wR35
        jsr rsGetEnemyTotalSpecifiedStat

        plx
        stx wR35
        plx
        stx wR34
        plx
        plp
        plb
        rtl

        .databank 0

      rlGetEnemyResistance ; 84/FC88

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        lda wR34
        pha
        lda wR35
        pha

        jsl rlGetEnemyClassResGrowth
        sta wR34
        jsl rlGetSelectedUnitClassDataPointer
        jsl rlGetClassResistance
        sta wR35
        jsr rsGetEnemyTotalSpecifiedStat

        plx
        stx wR35
        plx
        stx wR34
        plx
        plp
        plb
        rtl

        .databank 0

      rlGetSelectedUnitBattleMight ; 84/FCB0

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        lda wCurrentItemDataROMPointer,b
        beq _End

        jsl rlGetItemEquipmentType
        cmp #EquipTypeWeapon
        bne _NoWeapon

        jsl rlGetItemMight
        sta wRoutineVariable1,b

        jsl rlGetActiveWeaponStatBonus
        pha

        jsl rlGetItemStatBonus
        jsl rlSetActiveWeaponStatBonus
        jsl rlGetItemWeaponType
        cmp #WeaponTypeFire
        bcs _MagicWeapon

        jsl rlGetSelectedUnitTotalStrength
        bra +

        _MagicWeapon
        jsl rlGetSelectedUnitTotalMagic
        
        +
        clc
        adc wRoutineVariable1,b
        sta wRoutineVariable1,b

        pla
        jsl rlSetActiveWeaponStatBonus

        lda wRoutineVariable1,b
        
        _End
        plp
        plb
        rtl
        
        _NoWeapon
        lda #0
        bra _End

        .databank 0

      rlGetSelectedUnitBattleHit ; 84/FD00

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        lda wCurrentItemDataROMPointer,b
        beq _End

        jsl rlGetItemEquipmentType
        cmp #EquipTypeWeapon
        bne _FD47

        jsl rlGetActiveWeaponStatBonus
        pha

        jsl rlGetItemStatBonus
        jsl rlSetActiveWeaponStatBonus
        jsl rlGetItemAccuracy
        sta wRoutineVariable1,b

        jsl rlGetSelectedUnitTotalSkill
        asl a
        clc
        adc wRoutineVariable1,b
        cmp #0
        bmi +
        bra ++

        +
        lda #0

        +
        sta wRoutineVariable1,b

        pla
        jsl rlSetActiveWeaponStatBonus
        lda wRoutineVariable1,b
        
        _End
        plp
        plb
        rtl
        
        _FD47
        lda #$00FF
        bra _End

        .databank 0

      rlGetSelectedUnitBattleAvoid ; 84/FD4C

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx

        sta wRoutineVariable1,b
        ora #0
        bpl +

          stz wRoutineVariable1,b
          bra _FD7B

        +
        jsl rlGetSelectedUnitTerrainAvoidPointer
        clc
        adc wRoutineVariable1,b
        tax
        lda $830000,x
        bit #$0080
        bne +

        and #$007F
        bra ++

        +
        ora #$FF80

        +
        sta wRoutineVariable1,b

        _FD7B
        jsl rlGetSelectedUnitLuck
        ora #0
        bmi +

          clc
          adc wRoutineVariable1,b
          sta wRoutineVariable1,b

        +
        jsl rlGetSelectedUnitBattleAttackSpeed
        asl a
        clc
        adc wRoutineVariable1,b

        plx
        plp
        plb
        rtl

        .databank 0

      rlGetSelectedUnitBattleCrit ; 84/FD98

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        lda wCurrentItemDataROMPointer,b
        beq _End

        jsl rlGetUnitType
        cmp #UnitTypeHoly
        bcs +

          jsl rlGetItemRAMKillCountAndCritAbility
          bcc +

            sec
            sbc #50
            sta wRoutineVariable1,b
            bra _FDD4

        +
        stz wRoutineVariable1,b
        lda #SkillIDCritical
        jsl rlCheckIfUnitHasSpecifiedPersonalOrClassSkill
        bcs _FDD4

        jsl rlGetItemSkills
        bit #ItemSkillCritical
        bne _FDD4

        jsl rlUnknown87E513
        beq _End

        _FDD4
        jsl rlGetActiveWeaponStatBonus
        pha

        jsl rlGetItemStatBonus
        jsl rlSetActiveWeaponStatBonus
        jsl rlGetSelectedUnitTotalSkill
        clc
        adc wRoutineVariable1,b
        sta wRoutineVariable1,b

        pla
        jsl rlSetActiveWeaponStatBonus
        lda wRoutineVariable1,b
        
        _End
        plp
        plb
        rtl

        _FDF7
        lda #0
        bra _End

        .databank 0

      rlGetSelectedUnitBattleAttackSpeed ; 84/FDFC

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        lda wR35
        pha

        lda wCurrentItemDataROMPointer,b
        beq +

          jsl rlGetItemWeight

        +
        sta wR35

        jsl rlGetActiveWeaponStatBonus
        pha

        jsl rlGetItemStatBonus
        jsl rlSetActiveWeaponStatBonus
        jsl rlGetSelectedUnitTotalSpeed
        sec
        sbc wR35
        sta wR35

        pla
        jsl rlSetActiveWeaponStatBonus
        lda wR35

        plx
        stx wR35
        plx
        plp
        plb
        rtl

        .databank 0

      rlGetSelectedUnitBattleDefense ; 84/FE33

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        lda wCurrentItemDataROMPointer,b
        bne +

        jsl rlGetSelectedUnitTotalDefense
        bra ++
        
        +
        jsl rlGetActiveWeaponStatBonus
        pha

        jsl rlGetItemStatBonus
        jsl rlSetActiveWeaponStatBonus
        jsl rlGetSelectedUnitTotalDefense
        sta wRoutineVariable1,b

        pla
        jsl rlSetActiveWeaponStatBonus

        lda wRoutineVariable1,b
        
        +
        plp
        plb
        rtl

        .databank 0

      rlGetSelectedUnitBattleResistance ; 84/FE61

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        lda wCurrentItemDataROMPointer,b
        bne +

        jsl rlGetSelectedUnitTotalResistance
        bra ++
        
        +
        jsl rlGetActiveWeaponStatBonus
        pha

        jsl rlGetItemStatBonus
        jsl rlSetActiveWeaponStatBonus
        jsl rlGetSelectedUnitTotalResistance
        sta wRoutineVariable1,b

        pla
        jsl rlSetActiveWeaponStatBonus

        lda wRoutineVariable1,b

        +
        plp
        plb
        rtl

        .databank 0

      rlGetFirstWeaponBattleMight ; 84/FE8F

        .al
        .autsiz
        .databank ?

        jsl rlGetFirstEquippableWeaponInInventory
        jsl rlGetSelectedUnitBattleMight
        rtl

        .databank 0

        ; 84/FE98

    .endsection Code84F939Section

