
    .weak

      rlFindCharacterByGenerationID             :?= address($848726)
      rlClearUnitWindowAndTerrainWindowProcs    :?= address($859B94)

    .endweak

    .section Code91A670Section

      rsUnknown91A670 ; 91/A670

        .al
        .autsiz
        .databank ?

        php
        jsl rlClearAllFadeProcs
        lda #(`procMainLoopChangeFade)<<8
        sta lR44+1
        lda #<>procMainLoopChangeFade
        sta lR44
        jsl rlProcEngineFindProc
        bcc +

          txa
          lsr a
          jsl rlProcEngineFreeProcByIndex

        +
        jsl rlClearUnitWindowAndTerrainWindowProcs
        jsl $85C0D5
        jsl rlUnknown9180BC
        jsl rlDialogueFreeHDMA
        plp
        rts

        .databank 0

      rsUnknown91A69D ; 91/A69D

        .al
        .autsiz
        .databank ?

        lda wJoy1New
        bit #JOY_Start
        beq _CLC

          ldy wActiveEventOffset,b
          cpy wActiveEventLength,b
          bcs _CLC

            jsr rsUnknown91A670
            jsl rlEventEngineFreeAllProcs
            stz $0302,b
            ldy wActiveEventLength,b
            sty wActiveEventOffset,b
            sec
            rts

        _CLC
        clc
        rts

        .databank 0

      rlUnknown91A6C0 ; 91/A6C0

        .al
        .autsiz
        .databank ?

        php
        rep #$30
        stz wUnknown00171A,b
        stz wUnknown00171C,b
        stz wUnknown00171E,b
        stz wActiveEventOffset,b
        jsl rlEventEngineFreeAllProcs
        jsl rlActiveSpriteEngineClearAllSprites
        jsl $818D7B
        plp
        rtl

        .databank 0

      rlClearAllFadeProcs ; 91/A6DD

        .al
        .autsiz
        .databank ?

        jsl rlClearAllFadeInProcs
        jsl rlClearAllFadeOutProcs
        rtl

        .databank 0

      rlClearAllFadeInProcs ; 91/A6E6

        .al
        .autsiz
        .databank ?

        php
        
        _Proc1
        lda #(`procFadeIn)<<8
        sta lR44+1
        lda #<>procFadeIn
        sta lR44
        jsl rlProcEngineFindProc
        bcc _Proc2

          txa
          lsr a
          jsl rlProcEngineFreeProcByIndex
          bra _Proc1
        
        _Proc2
        lda #(`procFadeInByScreenFadingTimer)<<8
        sta lR44+1
        lda #<>procFadeInByScreenFadingTimer
        sta lR44
        jsl rlProcEngineFindProc
        bcc _Proc3

          txa
          lsr a
          jsl rlProcEngineFreeProcByIndex
          bra _Proc2
        
        _Proc3
        lda #(`procEventFadeInByTimer)<<8
        sta lR44+1
        lda #<>procEventFadeInByTimer
        sta lR44
        jsl rlProcEngineFindProc
        bcc +

          txa
          lsr a
          jsl rlProcEngineFreeProcByIndex
          bra _Proc3

        +
        lda #$FFFF
        sta wScreenFadingFlag,b
        plp
        rtl

        .databank 0

      rlClearAllFadeOutProcs ; 91/A737

        .al
        .autsiz
        .databank ?

        php
        
        _Proc1
        lda #(`procFadeOut)<<8
        sta lR44+1
        lda #<>procFadeOut
        sta lR44
        jsl rlProcEngineFindProc
        bcc _Proc2

          txa
          lsr a
          jsl rlProcEngineFreeProcByIndex
          bra _Proc1

        _Proc2
        lda #(`procFadeOutByScreenFadingTimer)<<8
        sta lR44+1
        lda #<>procFadeOutByScreenFadingTimer
        sta lR44
        jsl rlProcEngineFindProc
        bcc _Proc3

          txa
          lsr a
          jsl rlProcEngineFreeProcByIndex
          bra _Proc2

        _Proc3
        lda #(`procEventFadeOutByTimer)<<8
        sta lR44+1
        lda #<>procEventFadeOutByTimer
        sta lR44
        jsl rlProcEngineFindProc
        bcc +

          txa
          lsr a
          jsl rlProcEngineFreeProcByIndex
          bra _Proc3

        +
        lda #$FFFF
        sta wScreenFadingFlag,b
        plp
        rtl

        .databank 0

      rlUnknown91A788 ; 91/A788

        .al
        .autsiz
        .databank ?

        phx
        ldx #$0018

        _Loop
        lda $7E93AA,x
        beq _Next

          sta lMapMenuRAMEntryPointer,b
          phx
          jsl $8785A4
          plx
          lda #0
          sta lMapMenuRAMEntryPointer,b,x

        _Next
        dec x
        dec x
        dec x
        bpl _Loop

        plx
        rtl

        .databank 0

      rlUnknown91A7A8 ; 91/A7A8

        .al
        .autsiz
        .databank ?

        phb
        phx

        ldx #24
        lda #0

          -
          sta $7E93AA,x
          dec x
          dec x
          dec x
          bpl -

        plx
        plb
        rtl

        .databank 0

        ; 91/A7BC

    .endsection Code91A670Section

    .section Code91AD0BSection

      rlGetDeathQuote ; 91/AD0B

        .al
        .autsiz
        .databank ?

        ; A = character ID

        php
        pha
        phx
        phy

        ldx wSelectedUnitDataRAMPointer,b
        phx

        jsl rlCheckUsingDefaultOverLoverDeathQuote
        bcc _End

          pha
          jsl rlGetUnitRAMDataPointerByID
          jsl rlGetSelectedUnitFactionSlot
          cmp #0
          bne +

            ldx #0
            bra ++

            +
            ldx #1

          +
          lda wCurrentChapter,b
          cmp #6
          bcc +

            inc x
            inc x

          +
          lda #(`aGen1PlayerDeathQuotes)<<8
          sta lR18+1
          txa
          asl a
          tax
          lda aDeathQuotePointers,x
          sta lR18
          pla
          jsr rsTryFindDeathQuotePointer

        _End
        plx
        stx wSelectedUnitDataRAMPointer,b

        ply
        plx
        pla
        plp
        rtl

        .databank 0

      aDeathQuotePointers ; 91/AD54

        .word <>aGen1PlayerDeathQuotes
        .word <>aGen1EnemyNPCDeathQuotes

        .word <>aGen2PlayerDeathQuotes
        .word <>aGen2EnemyNPCDeathQuotes

      rsTryFindDeathQuotePointer ; 91/AD5C

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = character ID

        ; Output:
        ; CLC if found, else SEC

        pha
        sta wR0

        ldy #-4

        -
        inc y
        inc y
        inc y
        inc y
        lda [lR18],y
        beq +

          cmp wR0
          bne -

            inc y
            inc y
            lda [lR18],y
            clc
            bra ++

        +
        lda #0
        sta lR18+1
        sec

        +
        sta lR18
        pla
        rts

        .databank 0

      rlUnknown91AD7F ; 91/AD7F

        .al
        .autsiz
        .databank ?

        php
        phx
        jsl $84EFA5
        jsl rlGetDeathQuote
        plx
        plp
        rtl

        .databank 0

      rlCheckUsingDefaultOverLoverDeathQuote ; 91/AD8C

        .al
        .autsiz
        .databank ?

        ; Output:
        ; SEC if using the default quote
        ; CLC if using the lover quote

        pha
        pha
        lda #(`aLoverDeathQuotes)<<8
        sta lR18+1
        lda #<>aLoverDeathQuotes
        sta lR18
        pla

        jsr rsTryFindDeathQuotePointer
        bcs _SEC

          jsl rlGetUnitRAMDataPointerByID
          jsl rlGetSelectedUnitLoverGenerationID
          and #$FFFF
          beq _SEC

            jsl rlFindCharacterByGenerationID
            bcs _SEC

              jsl rlGetSelectedUnitCharacterID
              sta aDialogue.wUnit1,b

              jsl rlGetSelectedUnitStates
              bit #UnitStateDead
              bne _SEC

                clc
                bra +

        _SEC
        sec

        +
        pla
        rtl

        .databank 0

      rlUnknown91ADC7 ; 91/ADC7

        .al
        .autsiz
        .databank ?

        php
        phx
        phy

        sta lR19

        lda wUnknown00171A,b
        bit #$0001
        bne _End

        txa
        lda lR19
        bne +

        jsr rsUnknown91ADE5
        bra _End
        
        +
        jsr rsUnknown91AE14
        
        _End
        ply
        plx
        plp
        rtl

        .databank 0

      rsUnknown91ADE5 ; 91/ADE5

        .al
        .autsiz
        .databank ?

        php

        sep #$20
        ldx #size(aUnknown91AE49)

          -
          lda aUnknown91AE49,x
          sta aEventScriptBuffer,x
          dec x
          bpl -

        rep #$20

        lda lR18
        sta aEventScriptBuffer + 4
        lda lR18+1
        sta aEventScriptBuffer + 4 +1

        lda #(`aEventScriptBuffer)<<8
        sta lR18+1
        lda #<>aEventScriptBuffer
        sta lR18
        jsl rlUnknown80C1FC
        plp
        rts

        .databank 0

      rsUnknown91AE14 ; 91/AE14

        .al
        .autsiz
        .databank ?

        php

        sep #$20
        ldx #size(aUnknown91AE58)

          -
          lda aUnknown91AE58,x
          sta aEventScriptBuffer,x
          dec x
          bpl -

        ; Song ID
        lda lR19
        sta aEventScriptBuffer + 8
        rep #$20

        ; Dialogue pointer
        lda lR18
        sta aEventScriptBuffer + 10
        lda lR18+1
        sta aEventScriptBuffer + 10+1

        lda #(`aEventScriptBuffer)<<8
        sta lR18+1
        lda #<>aEventScriptBuffer
        sta lR18
        jsl rlUnknown80C1FC

        plp
        rts

        .databank 0

      aUnknown91AE49 .block ; 91/AE49

        macroMapDialogue 0

        RUN_EVENT_CONDITION
          EC_73

        END_EVENT

        .bend

      aUnknown91AE58 .block ; 91/AE58

        PLAY_SFX_WORD $00E0
        PAUSE 35
        YIELD

        PLAY_SONG 0

        DIALOGUE 0
        YIELD

        RUN_ASM rlASMCCheckIfAnimationsOff

        JUMP_RELATIVE_FALSE +

          PLAY_SFX_WORD $00E0
          PAUSE 35
          YIELD

          RESTORE_PHASE_MUSIC
          YIELD

        +
        RUN_EVENT_CONDITION
          EC_73

        END_EVENT

        .bend

      rlASMCCheckIfAnimationsOff ; 91/AE7A

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        phy
        lda wSelectedUnitDataRAMPointer
        pha
        lda wR0
        pha

        lda wBattleStatus
        bit #$0040
        beq +

        lda #1
        sta wEventEngineTruthFlag
        bra ++
        
        +
        lda #0
        sta wEventEngineTruthFlag
        
        +
        pla
        sta wR0
        pla
        sta wSelectedUnitDataRAMPointer
        ply
        plx
        plp
        plb
        rtl

        .databank 0

      rlDialogueTryGetActiveChildCharacterID ; 91/AEAE

        .al
        .autsiz
        .databank ?

        ; If its chapter 6+ and the CharacterID belongs to a child unit,
        ; get the GenerationID based on it, and then load the ID
        ; that belongs to that unit if found. Else load the ID
        ; of the substitute.

        ; Input:
        ; A = CharacterID

        ; Output
        ; A = CharacterID of child or substitute

        php
        phx
        pha
        sta wR0

        lda wCurrentChapter,b
        cmp #6
        bcc _End

          ; Only run for chapter 6+

          ldx #-2

            -
            inc x
            inc x
            lda aDialogueChildrenCharacterIDs,x
            beq _End

              cmp wR0
              bne -

          txa
          lsr a
          lsr a
          tax
          lda aDialogueChildrenGenerationIDs,x
          and #$00FF
          phx
          jsl rlFindCharacterByGenerationID
          plx
          bcc _Found

            txa
            asl a
            asl a
            tax
            lda aDialogueChildrenCharacterIDs,x
            bra +

            _Found
            jsl rlGetSelectedUnitCharacterID

          +
          plx
          bra +

        _End
        pla

        +
        plx
        plp
        rtl

        .databank 0

      aDialogueChildrenCharacterIDs ; 91/AEF2

        .word PortraitDalvin
        .word PortraitScathach

        .word PortraitAsaello
        .word PortraitFebail

        .word PortraitCharlot
        .word PortraitCoirpre

        .word PortraitHawk
        .word PortraitCed

        .word PortraitTristan
        .word PortraitDiarmuid

        .word PortraitDeimne
        .word PortraitLester

        .word PortraitAmid
        .word PortraitArthur

        .word PortraitDaisy
        .word PortraitPatty

        .word PortraitCreidne
        .word PortraitLarcei

        .word PortraitMuirne
        .word PortraitLana

        .word PortraitHermina
        .word PortraitFee

        .word PortraitLinda
        .word PortraitTine

        .word PortraitLaylea
        .word PortraitLene

        .word PortraitJeanne
        .word PortraitNanna

        .word 0

      aDialogueChildrenGenerationIDs ; 91/AF2C

        .byte GEN_ID_Dalvin_Scathach
        .byte GEN_ID_Asaello_Febail
        .byte GEN_ID_Charlot_Coirpre
        .byte GEN_ID_Hawk_Ced
        .byte GEN_ID_Tristan_Diarmuid
        .byte GEN_ID_Deimne_Lester
        .byte GEN_ID_Amid_Arthur
        .byte GEN_ID_Daisy_Patty
        .byte GEN_ID_Creidne_Larcei
        .byte GEN_ID_Muirne_Lana
        .byte GEN_ID_Hermina_Fee
        .byte GEN_ID_Linda_Tine
        .byte GEN_ID_Laylea_Lene
        .byte GEN_ID_Jeanne_Nanna

      rlDialogueTryGetActiveChildSiblingCharacterID ; 91/AF3A

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = CharacterID

        ; Output:
        ; A = Siblings CharacterID

        php
        phx
        jsl rlDialogueTryGetActiveChildCharacterID
        pha
        sta wR0

        ldx #-2

          _Loop
          inc x
          inc x
          lda _SiblingPortraits,x
          beq _End

            cmp wR0
            bne _Loop

        txa
        eor #2
        tax
        lda _SiblingPortraits,x
        plx
        bra +

        _End
        pla

        +
        plx
        plp
        rtl

        .databank 0

        _SiblingPortraits ; 91/AF62

        .word Seliph,   Julia
        .word Leif,     Altena
        .word Scathach, Larcei
        .word Dalvin,   Creidne
        .word Febail,   Patty
        .word Asaello,  Daisy
        .word Coirpre,  Lene
        .word Charlot,  Laylea
        .word Ced,      Fee
        .word Hawk,     Hermina
        .word Diarmuid, Nanna
        .word Tristan,  Jeanne
        .word Lester,   Lana
        .word Deimne,   Muirne
        .word Arthur,   Tine
        .word Amid,     Linda
        .word 0

      rlASMCLoadTineOrSubUnit ; 91/AFA4

        .al
        .autsiz
        .databank ?

        php
        phx
        phy
        pha
        lda #PermanentFlagTineExists
        and #$00FF
        jsl rlCheckPermanentEventFlagSet

        lda #Tine
        bcs +

          lda #Linda

        +
        sta aDialogue.wUnit1,b
        pla
        ply
        plx
        plp
        rtl

        .databank 0

      rlUnknown91AFC2 ; 91/AFC2

        .al
        .autsiz
        .databank ?

        php
        rep #$30
        pha

        jsl rlGetBattleBannerPointer

        lda #(`$7E8E88)<<8
        sta lR19+1
        lda #<>$7E8E88
        sta lR19
        jsl rlAppendDecompList

        lda #(`$9CEAEE)<<8
        sta lR18+1
        lda #<>$9CEAEE
        sta lR18
        lda #(`$7E8C88)<<8
        sta lR19+1
        lda #<>$7E8C88
        sta lR19
        jsl rlAppendDecompList

        lda #(`$7E8C98)<<8
        sta lR18+1

        pla
        xba
        lsr a
        lsr a
        lsr a
        clc
        adc #<>$7E8C98
        sta lR18

        plp
        rtl

        .databank 0

      rlGetBattleBannerPointer ; 91/B002

        .al
        .autsiz
        .databank ?

        php
        rep #$30
        cmp #$001C
        bcc +

          lda #0

        +
        ldx #$9C00
        stx lR18+1
        asl a
        tax
        lda aUnknown91B01C,x
        sta lR18
        plp
        rtl

        .databank 0

      aUnknown91B01C ; 91/B01C

        .word <>$9CD95E
        .word <>$9CDA67
        .word <>$9CDBB8
        .word <>$9CDCEF
        .word <>$9CDE2B
        .word <>$9CDF6F
        .word <>$9CE0C0
        .word <>$9CE20F
        .word <>$9CE367
        .word <>$9CE494
        .word <>$9CE5D0
        .word <>$9CE706
        .word <>$9CE845
        .word <>$9CE98C

      rlUnknown91B038 ; 91/B038

        .al
        .autsiz
        .databank ?

        ; MOVE_TEMPORARY_BY_SCRIPT

        lda #0
        jml +

      rlUnknown91B03F ; 91/B03F

        .al
        .autsiz
        .databank ?

        ; MOVE_TEMPORARY_TO_COORDS

        lda #1
        jml +

      rlUnknown91B046 ; 91/B046

        .al
        .autsiz
        .databank ?

        ; LOAD_UNIT_BY_GROUP

        lda #2
        jml +

      rlUnknown91B04D ; 91/B04D

        .al
        .autsiz
        .databank ?

        ; LOAD_UNIT_DIRECT

        lda #3
        jml +

      rlUnknown91B054 ; 91/B054

        .al
        .autsiz
        .databank ?

        ; MOVE_TEMPORARY_TO_COORDS_FOLLOW

        lda #4
        jml +

      rlUnknown91B05B ; 91/B05B

        .al
        .autsiz
        .databank ?

        ; MOVE_TEMPORARY_TO_COORDS_CLASS

        lda #5
        jml +

        +
        phy
        sta wR0
        lda bDecompressionArrayFlag,b
        bne _SEC

          lda aMovingMapSprites.wState,b
          cmp #0
          bne _SEC

            ldx #6

            -
            lda aMovingMapSprites.wActiveSpriteOffset,b,x
            cmp #$FFFF
            beq +

              dec x
              dec x
              bpl -

        _SEC
        ply
        dec y
        sec
        bra _End

        +
        lda wR0
        jsr rsUnknown91C56C
        ply
        clc

        _End
        rtl

        .databank 0

      rlASMCLoadActiveUnitCoordinatesInEventUnitSlot1 ; 91/B08E

        .al
        .autsiz
        .databank ?

        lda #$FFFF
        sta wEventUnitSlot1XCoordinate
        sta wEventUnitSlot1YCoordinate

        lda wActiveFactionSlot,b
        bne +

          lda $000772
          tax
          lda aDeploymentTable._XTilePosition,x
          sta wEventUnitSlot1XCoordinate
          lda aDeploymentTable._YTilePosition,x
          sta wEventUnitSlot1YCoordinate

        +
        rtl

        .databank 0

      rlUnknown91B0B4 ; 91/B0B4

        .al
        .autsiz
        .databank ?

        lda #(`$8288E9)<<8
        sta lR44+1
        lda #<>$8288E9
        sta lR44
        jsl rlEventEngineCreateProc
        rtl

        .databank 0

      rlASMCChapterFinalEddaSeizedClaudsChildrenStart ; 91/B0C3

        .al
        .autsiz
        .databank ?

        stz aDialogue.wUnit1,b
        stz aDialogue.wUnit2,b

        lda wEventUnit1Pointer,b
        beq +

          sta wSelectedUnitDataRAMPointer,b
          jsl rlGetSelectedUnitCharacterID
          sta aDialogue.wUnit1,b

        +
        lda wEventUnit2Pointer,b
        beq +

          sta wSelectedUnitDataRAMPointer,b
          jsl rlGetSelectedUnitCharacterID
          sta aDialogue.wUnit2,b

        +
        lda wEventUnit2Pointer,b
        beq +

          lda wEventUnit1Pointer,b
          beq ++

            lda #(`dialogueChapterFinalEddaSeizedClaudsChildrenTogetherStart)<<8
            sta lR18+1
            lda #<>dialogueChapterFinalEddaSeizedClaudsChildrenTogetherStart
            sta lR18
            bra _B10D

        +
        lda aDialogue.wUnit1,b
        sta aDialogue.wUnit2,b

        +
        lda #(`dialogueChapterFinalEddaSeizedClaudsChildrenAloneStart)<<8
        sta lR18+1
        lda #<>dialogueChapterFinalEddaSeizedClaudsChildrenAloneStart
        sta lR18

        _B10D
        jsl rlDialoguePushToActivePointerStack
        rtl

        .databank 0

      dialogueChapterFinalEddaSeizedClaudsChildrenTogetherStart ; 91/B112

        .enc "DialoguePage0"

        DIALOGUE_UNIT1_NAME
        .text "と"

      dialogueChapterFinalEddaSeizedClaudsChildrenAloneStart .include "../TEXT/DIALOGUE/ChapterFinal/EddaSeizedClaudsChildrenAloneStart.dialogue.txt" ; 91/B115
      ; The 2nd one starts 3 bytes later to cut out the Unit1 call and one character. But the dialogue builder really dislikes files ending with a japanese
      ; character so I have to do it like this.

      ; 91b11c

    .endsection Code91AD0BSection
