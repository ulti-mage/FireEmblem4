
  .weak

    rlDMAByStruct                                 :?= address($80A4BD)
    rlDrawMenuTextLine                            :?= address($879354)
    rlDrawMenuTextNumber                          :?= address($89A18C)

  .endweak


    * = $09C6F9
    .logical $89C6F9

      rlDrawDebugMenu ; 89/C6F9

        .al
        .xl
        .autsiz
        .databank ?

        ldx #$00C0
        lda #$0032
        ldy #$0020
        jsl rlClearTilemapRect

        lda $7F8402 ; menu page index
        inc a

        ; Draw the page number in the top right
        ldx #$2120
        stx wR5
        ldx #2
        stx wR6
        ldx #$0034
        jsl rlDrawMenuTextNumber

        lda $0304,b ; menu tab index
        asl a
        asl a
        asl a
        clc
        adc $7F8402
        sta $7F8410

        lda $7F8410
        cmp #size(aDebugMenuPagePointers)/2
        bmi +
        
          -
          bra -

        +
        asl a
        tax
        jsr (aDebugMenuPagePointers,x)
        rts

        .databank 0

      aDebugMenuPagePointers .block; 89/C73C

        .addr rsDebugMenuTab1Page1
        .addr rsDebugMenuTab1Page2
        .addr rsDebugMenuTab1Page3
        .addr rsDebugMenuTab1Page4
        .addr rsDebugMenuTab1Page5
        .addr rsDebugMenuTab1Page6
        .addr rsDebugMenuTab1Page7
        .addr rsDebugMenuTab1Page8

        .addr rsDebugMenuTab2
        .addr rsDebugMenuTab2
        .addr rsDebugMenuTab2
        .addr rsDebugMenuTab2
        .addr rsDebugMenuTab2
        .addr rsDebugMenuTab2
        .addr rsDebugMenuTab2
        .addr rsDebugMenuTab2
        
        .addr rsDebugMenuTab3Page1
        .addr rsDebugMenuTab3Page2
        .addr rsDebugMenuTab3Page3
        .addr rsDebugMenuTab3Page4
        .addr rsDebugMenuTab3Page5
        .addr rsDebugMenuTab3Page6
        .addr rsDebugMenuTab3Page7
        .addr rsDebugMenuTab3Page8
        
        .addr rsDebugMenuTab4
        .addr rsDebugMenuTab4
        .addr rsDebugMenuTab4
        .addr rsDebugMenuTab4
        .addr rsDebugMenuTab4
        .addr rsDebugMenuTab4
        .addr rsDebugMenuTab4
        .addr rsDebugMenuTab4

        .bend

      rsDebugMenuTab1Page1 ; 89/C77C

        .al
        .autsiz
        .databank ?

        lda #$2000
        sta aCurrentTilemapInfo.wBaseTile,b 
        jsl rlGetSelectedUnitNamePointer

        lda lRoutineVariable,b
        sta lR18
        lda lRoutineVariable+1,b
        sta lR18+1
        ldx #pack([1, 0])
        jsl rlDrawMenuTextLine

        jsl rlGetUnitType
        cmp #UnitTypeEnemy
        bpl +

          jsr rsDebugDrawPlayableUnitGrowths
          bra ++

          +
          jsr rsDebugDrawEnemyUnitGrowths

        +
        rts

        .databank 0

      rsDebugMenuTab1Page2 ; 89/C7A9

        .al
        .autsiz
        .databank ?

        jsr rsDebugMenuTab1Page2Effect
        rts

        .databank 0

      rsDebugMenuTab1Page3 ; 89/C7AD

        .al
        .autsiz
        .databank ?

        lda #$3C00
        sta aCurrentTilemapInfo.wBaseTile,b

        lda #(`aDebugGenerationID)<<8
        sta lR18+1
        lda #<>aDebugGenerationID
        sta lR18
        ldx #pack([13, 16])
        jsl rlDrawMenuTextLine

        jsl rlGetSelectedUnitGenerationID
        ldx #$3920
        stx wR5
        ldx #0
        stx wR6
        ldx #C2I((19, 16), 32) * size(word)
        jsl rlDrawMenuTextNumber

        lda #(`aDebugDeploymentOffset)<<8
        sta lR18+1
        lda #<>aDebugDeploymentOffset
        sta lR18
        ldx #pack([11, 20])
        jsl rlDrawMenuTextLine

        lda #(`aDebugUnitXPosition)<<8
        sta lR18+1
        lda #<>aDebugUnitXPosition
        sta lR18
        ldx #pack([11, 22])
        jsl rlDrawMenuTextLine

        lda #(`aDebugUnitYPosition)<<8
        sta lR18+1
        lda #<>aDebugUnitYPosition
        sta lR18
        ldx #pack([11, 24])
        jsl rlDrawMenuTextLine

        jsl rlGetSelectedUnitDeploymentOffset

        pha
        ldx #$3920
        stx wR5
        ldx #0
        stx wR6
        ldx #C2I((19, 20), 32) * size(word)
        jsl rlDrawMenuTextNumber
        plx

        phx
        lda aDeploymentTable._XTilePosition,x
        ldx #$3920
        stx wR5
        ldx #0
        stx wR6
        ldx #C2I((19, 22), 32) * size(word)
        jsl rlDrawMenuTextNumber
        plx

        lda aDeploymentTable._YTilePosition,x
        ldx #$3920
        stx wR5
        ldx #0
        stx wR6
        ldx #C2I((19, 24), 32) * size(word)
        jsl rlDrawMenuTextNumber
        rts

        .databank 0

      aDebugGenerationID ; 89/C850

        .enc "SJIS"
        .text "ＢＯＸ\n"

      aDebugDeploymentOffset ; 89/C858

        .text "インデクス\n"

      aDebugUnitXPosition ; 89/C864

        .text "Ｘ\n"

      aDebugUnitYPosition ; 89/C868

        .text "Ｙ\n"

      rsDebugMenuTab1Page4 ; 89/C86C

        .al
        .autsiz
        .databank ?

        jsr rsDebugMenuTab1Page4Effect
        rts

        .databank 0

      rsDebugMenuTab1Page5 ; 89/C870

        .al
        .autsiz
        .databank ?

        jsr rsDebugMenuTab1Page5Effect
        rts

        .databank 0

      rsDebugMenuTab1Page6 ; 89/C874

        .al
        .autsiz
        .databank ?

        jsr rsDebugMenuTab1Page6Effect
        rts

        .databank 0

      rsDebugMenuTab1Page7 ; 89/C878

        .al
        .autsiz
        .databank ?

        jsr rsDebugMenuTab1Page7Effect
        rts

        .databank 0

      rsDebugMenuTab1Page8 ; 89/C87C

        .al
        .autsiz
        .databank ?

        jsr rsDebugMenuTab1Page8Effect
        rts

        .databank 0

      rsDebugMenuTab2 ; 89/C880

        .al
        .autsiz
        .databank ?

        ; relation viewer for all factions on the map
        ; who is friendly, aggressive or neutral to each other

        lda wDebugMenuScreenIndex
        cmp wLoadedFactionCount,b
        bmi +

          jml _Absent

        +
        lda #$2000
        sta aCurrentTilemapInfo.wBaseTile,b

        lda wDebugMenuScreenIndex
        jsl rlGetFactionSlotNamePointer

        lda lRoutineVariable,b
        sta lR18
        lda lRoutineVariable+1,b
        sta lR18+1
        ldx #pack([1, 3])
        jsl rlDrawMenuTextLine

        lda #$3C00
        sta aCurrentTilemapInfo.wBaseTile,b
        lda #0

          _Loop1
          sta wR15
          jsl rlGetFactionSlotNamePointer

          lda lRoutineVariable+1,b
          sta lR18+1
          lda lRoutineVariable,b
          sta lR18

          lda wR15
          asl a
          tax
          lda aDebugMenuTab2Coordinates,x
          tax
          jsl rlDrawMenuTextLine

          lda wR15
          inc a
          cmp wLoadedFactionCount,b
          bne _Loop1

        lda #$3800
        sta aCurrentTilemapInfo.wBaseTile,b
        stz wR15
        
          _Loop2
          lda wDebugMenuScreenIndex
          ldx wR15
          jsl rlGetFactionRelation
          sta wR14
          asl a
          clc
          adc wR14
          tax
          lda aDebugFactionRelations+1,x
          sta lR18+1
          lda aDebugFactionRelations,x
          sta lR18

          lda wR15
          asl a
          tax
          lda aDebugMenuTab2Coordinates,x
          clc
          adc #8
          tax
          jsl rlDrawMenuTextLine

          inc wR15
          lda wR15
          cmp wLoadedFactionCount,b
          bne _Loop2

        rts

        _Absent
        lda #$3C00
        sta aCurrentTilemapInfo.wBaseTile,b
        lda #(`aDebugAbsentText)<<8
        sta lR18+1
        lda #<>aDebugAbsentText
        sta lR18
        ldx #pack([10, 12])
        jsl rlDrawMenuTextLine
        rts

        .databank 0

      aDebugAbsentText ; 89/C932

        .text "ない\n"

      aDebugMenuTab2Coordinates ; 89/C938

        .word pack([2,  7]) 
        .word pack([2,  9]) 
        .word pack([2, 11]) 
        .word pack([2, 13]) 
        .word pack([2, 15]) 
        .word pack([2, 17]) 
        .word pack([2, 19]) 
        .word pack([2, 21]) 

      aDebugFactionRelations ; 89/C948

        .long aDebugFactionRelationOwn
        .long aDebugFactionRelationEnemy
        .long aDebugFactionRelationNeutral
        .long aDebugFactionRelationOther

      aDebugFactionRelationOwn ; 89/C954

        .text "じぐん\n"

      aDebugFactionRelationEnemy ; 89/C95C

        .text "てき\n"

      aDebugFactionRelationNeutral ; 89/C962

        .text "どう\n"

      aDebugFactionRelationOther ; 89/C968

        .text "ちゅう\n"

      rsDebugDrawBitOnOrOff ; 89/C970

        .al
        .autsiz
        .databank ?

        pha
        lda aCurrentTilemapInfo.wBaseTile,b
        sta $7F8410
        lda #$3800
        sta aCurrentTilemapInfo.wBaseTile,b
        pla

        beq _Off

        ; On
        lda #(`aDebugBitflagOnText)<<8
        sta lR18+1
        lda #<>aDebugBitflagOnText
        sta lR18
        bra +

        _Off
        lda #(`aDebugBitflagOffText)<<8
        sta lR18+1
        lda #<>aDebugBitflagOffText
        sta lR18

        +
        jsl rlDrawMenuTextLine

        lda $7F8410
        sta aCurrentTilemapInfo.wBaseTile,b
        rts

        .databank 0

      aDebugBitflagOnText ; 89/C9A3

        .text "ＯＮ\n"

      aDebugBitflagOffText ; 89/C9A9

        .text "ＯＦＦ\n"

      rsDebugDrawPlayableUnitGrowths ; 89/C9B1

        .al
        .autsiz
        .databank ?

        lda #$3000
        sta aCurrentTilemapInfo.wBaseTile,b
        lda #(`aDebugGrowthsText)<<8
        sta lR18+1
        lda #<>aDebugGrowthsText
        sta lR18
        ldx #pack([2, 3])
        jsl rlDrawMenuTextLine

        lda #$3C00
        sta aCurrentTilemapInfo.wBaseTile,b
        lda #(`aDebugHPText)<<8
        sta lR18+1
        lda #<>aDebugHPText
        sta lR18
        ldx #pack([7, 5])
        jsl rlDrawMenuTextLine

        jsl rlGetSelectedUnitTotalHPGrowth
        ldx #$3920
        stx wR5
        ldx #3
        stx wR6
        ldx #C2I((11, 5), 32) * size(word)
        jsl rlDrawMenuTextNumber

        lda #(`aDebugStrengthText)<<8
        sta lR18+1
        lda #<>aDebugStrengthText
        sta lR18
        ldx #pack([6, 7])
        jsl rlDrawMenuTextLine

        jsl rlGetSelectedUnitTotalStrGrowth
        ldx #$3920
        stx wR5
        ldx #3
        stx wR6
        ldx #C2I((11, 7), 32) * size(word)
        jsl rlDrawMenuTextNumber

        lda #(`aDebugMagicText)<<8
        sta lR18+1
        lda #<>aDebugMagicText
        sta lR18
        ldx #pack([6, 9])
        jsl rlDrawMenuTextLine

        jsl rlGetSelectedUnitTotalMagGrowth
        ldx #$3920
        stx wR5
        ldx #3
        stx wR6
        ldx #C2I((11, 9), 32) * size(word)
        jsl rlDrawMenuTextNumber

        lda #(`aDebugSkillText)<<8
        sta lR18+1
        lda #<>aDebugSkillText
        sta lR18
        ldx #pack([7, 11])
        jsl rlDrawMenuTextLine

        jsl rlGetSelectedUnitTotalSklGrowth
        ldx #$3920
        stx wR5
        ldx #3
        stx wR6
        ldx #C2I((11, 11), 32) * size(word)
        jsl rlDrawMenuTextNumber

        lda #(`aDebugSpeedText)<<8
        sta lR18+1
        lda #<>aDebugSpeedText
        sta lR18
        ldx #pack([6, 13])
        jsl rlDrawMenuTextLine

        jsl rlGetSelectedUnitTotalSpdGrowth
        ldx #$3920
        stx wR5
        ldx #3
        stx wR6
        ldx #C2I((11, 13), 32) * size(word)
        jsl rlDrawMenuTextNumber

        lda #(`aDebugLuckText)<<8
        sta lR18+1
        lda #<>aDebugLuckText
        sta lR18
        ldx #pack([7, 15])
        jsl rlDrawMenuTextLine

        jsl rlGetSelectedUnitTotalLuckGrowth
        ldx #$3920
        stx wR5
        ldx #3
        stx wR6
        ldx #C2I((11, 15), 32) * size(word)
        jsl rlDrawMenuTextNumber

        lda #(`aDebugDefenseText)<<8
        sta lR18+1
        lda #<>aDebugDefenseText
        sta lR18
        ldx #pack([6, 17])
        jsl rlDrawMenuTextLine

        jsl rlGetSelectedUnitTotalDefGrowth
        ldx #$3920
        stx wR5
        ldx #3
        stx wR6
        ldx #C2I((11, 17), 32) * size(word)
        jsl rlDrawMenuTextNumber

        lda #(`aDebugResistanceText)<<8
        sta lR18+1
        lda #<>aDebugResistanceText
        sta lR18
        ldx #pack([6, 19])
        jsl rlDrawMenuTextLine

        jsl rlGetSelectedUnitTotalResGrowth
        ldx #$3920
        stx wR5
        ldx #3
        stx wR6
        ldx #C2I((11, 19), 32) * size(word)
        jsl rlDrawMenuTextNumber

        jsl rlGetUnitType
        cmp #UnitTypeDynamic
        beq +

          jml _End
        
        +
        lda #$3000
        sta aCurrentTilemapInfo.wBaseTile,b
        lda #(`aDebugFatherText)<<8
        sta lR18+1
        lda #<>aDebugFatherText
        sta lR18
        ldx #pack([18, 6])
        jsl rlDrawMenuTextLine

        lda #(`aDebugMotherText)<<8
        sta lR18+1
        lda #<>aDebugMotherText
        sta lR18
        ldx #pack([18, 10])
        jsl rlDrawMenuTextLine

        lda #$2000
        sta aCurrentTilemapInfo.wBaseTile,b
        jsl rlGetSelectedUnitFatherID
        cmp #0
        beq +

          jsl rlGetCharacterNamePointer

          lda lRoutineVariable,b
          sta lR18
          lda lRoutineVariable+1,b
          sta lR18+1
          ldx #pack([19, 8])
          jsl rlDrawMenuTextLine

        +
        jsl rlGetSelectedUnitMotherID
        cmp #0
        beq _End

          jsl rlGetCharacterNamePointer

          lda lRoutineVariable,b
          sta lR18
          lda lRoutineVariable+1,b
          sta lR18+1
          ldx #pack([19, 12])
          jsl rlDrawMenuTextLine
        
        _End
        rts

        .databank 0 

      aDebugGrowthsText ; 89/CB76

        .enc "SJIS"
        .text "せいちょ\n"

      aDebugHPText ; 89/CB80

        .text "ＨＰ\n"

      aDebugStrengthText ; 89/CB86

        .text "ちから\n"

      aDebugMagicText ; 89/CB8E

        .text "まりょ\n"

      aDebugSkillText ; 89/CB96

        .text "わざ\n"

      aDebugSpeedText ; 89/CB9C

        .text "ばやさ\n"

      aDebugLuckText ; 89/CBA4

        .text "うん\n"

      aDebugDefenseText ; 89/CBAA

        .text "しゅび\n"

      aDebugResistanceText ; 89/CBB2

        .text "まぼう\n"

      aDebugFatherText ; 89/CBBA

        .text "パ\n"

      aDebugMotherText ; 89/CBBE

        .text "マ\n"

      rsDebugMenuTab1Page2Effect ; 89/CBC2

        .al
        .autsiz
        .databank ?

        jsl rlGetSelectedUnitStates

        tax
        and #UnitStateFielded
        sta $7F8410
        txa
        and #UnitStateMoved
        sta $7F8412
        txa
        and #UnitStateGuardingCastle
        sta $7F8414
        txa
        and #UnitState1000
        sta $7F8416
        txa
        and #UnitStateCanto
        sta $7F8418
        txa
        and #UnitState0400
        sta $7F841A
        txa
        and #UnitStateDead
        sta $7F841C
        txa
        and #UnitStateGroupLeader
        sta $7F841E
        txa
        and #UnitStateMapAnimation
        sta $7F8420

        jsl rlGetUnitType
        sta $7F8428

        jsl rlGetSelectedUnitAI
        sta $7F842A

        lda #$3000
        sta aCurrentTilemapInfo.wBaseTile,b
        lda #(`aUnknown89CD8A)<<8
        sta lR18+1
        lda #<>aUnknown89CD8A
        sta lR18
        ldx #pack([2, 3])
        jsl rlDrawMenuTextLine
        
        lda #$3C00
        sta aCurrentTilemapInfo.wBaseTile,b
        lda #(`aUnknown89CD96)<<8
        sta lR18+1
        lda #<>aUnknown89CD96
        sta lR18
        ldx #pack([5, 5])
        jsl rlDrawMenuTextLine

        lda $7F8410
        ldx #pack([10, 5])
        jsr rsDebugDrawBitOnOrOff

        lda #(`aDebugMovedBit)<<8
        sta lR18+1
        lda #<>aDebugMovedBit
        sta lR18
        ldx #pack([6, 7])
        jsl rlDrawMenuTextLine

        lda $7F8412
        ldx #pack([10, 7])
        jsr rsDebugDrawBitOnOrOff

        lda #(`aDebugDefendingCastleBit)<<8
        sta lR18+1
        lda #<>aDebugDefendingCastleBit
        sta lR18
        ldx #pack([6, 9])
        jsl rlDrawMenuTextLine

        lda $7F8414
        ldx #pack([10, 9])
        jsr rsDebugDrawBitOnOrOff

        lda #(`aUnknown89CDB0)<<8
        sta lR18+1
        lda #<>aUnknown89CDB0
        sta lR18
        ldx #pack([6, 11])
        jsl rlDrawMenuTextLine

        lda $7F8416
        ldx #pack([10, 11])
        jsr rsDebugDrawBitOnOrOff

        lda #(`aUnknown89CDB8)<<8
        sta lR18+1
        lda #<>aUnknown89CDB8
        sta lR18
        ldx #pack([4, 13])
        jsl rlDrawMenuTextLine

        lda $7F8418
        ldx #pack([10, 13])
        jsr rsDebugDrawBitOnOrOff

        lda #(`aUnknown89CDC2)<<8
        sta lR18+1
        lda #<>aUnknown89CDC2
        sta lR18
        ldx #pack([6, 15])
        jsl rlDrawMenuTextLine

        lda $7F841A
        ldx #pack([10, 15])
        jsr rsDebugDrawBitOnOrOff

        lda #(`aDebugDeadBit)<<8
        sta lR18+1
        lda #<>aDebugDeadBit
        sta lR18
        ldx #pack([6, 17])
        jsl rlDrawMenuTextLine

        lda $7F841C
        ldx #pack([10, 17])
        jsr rsDebugDrawBitOnOrOff

        lda #(`aDebugGroupLeaderBit)<<8
        sta lR18+1
        lda #<>aDebugGroupLeaderBit
        sta lR18
        ldx #pack([4, 19])
        jsl rlDrawMenuTextLine

        lda $7F841E
        ldx #pack([10, 19])
        jsr rsDebugDrawBitOnOrOff

        lda #(`aDebugIndividualAnimationBit)<<8
        sta lR18+1
        lda #<>aDebugIndividualAnimationBit
        sta lR18
        ldx #pack([6, 21])
        jsl rlDrawMenuTextLine

        lda $7F8420
        ldx #pack([10, 21])
        jsr rsDebugDrawBitOnOrOff

        lda #(`aUnknown89CDEE)<<8
        sta lR18+1
        lda #<>aUnknown89CDEE
        sta lR18
        ldx #pack([19, 21])
        jsl rlDrawMenuTextLine

        lda $7F842A
        ldx #$3920
        stx wR5
        ldx #0
        stx wR6
        ldx #C2I((25, 21), 32) * size(word)
        jsl rlDrawMenuTextNumber

        lda #(`aDebugUnitType)<<8
        sta lR18+1
        lda #<>aDebugUnitType
        sta lR18
        ldx #pack([19, 19])
        jsl rlDrawMenuTextLine

        lda #$3000
        sta aCurrentTilemapInfo.wBaseTile,b

        lda $7F8428
        sta wR0
        asl a
        clc
        adc wR0
        tax
        lda aDebugUnitTypePointers+1,x
        sta lR18+1
        lda aDebugUnitTypePointers,x
        sta lR18
        ldx #pack([25, 19])
        jsl rlDrawMenuTextLine
        rts

        .databank 0

      aUnknown89CD8A ; 89/CD8A
        ; the page desc

        .text "じょうフラ\n"

      aUnknown89CD96 ; 89/CD96
        ; attacking/charge?

        .text "しんげき\n"

      aDebugMovedBit ; 89/CDA0

        .text "たいき\n"

      aDebugDefendingCastleBit ; 89/CDA8

        .text "しゅび\n"

      aUnknown89CDB0 ; 89/CDB0

        ; town?
        .text "こうば\n"

      aUnknown89CDB8 ; 89/CDB8

        .text "さいいど\n"

      aUnknown89CDC2 ; 89/CDC2

        .text "とつげ\n"

      aDebugDeadBit ; 89/CDCA

        .text "しぼう\n"

      aDebugGroupLeaderBit ; 89/CDD2

        .text "ぶたいちょ\n"

      aDebugIndividualAnimationBit ; 89/CDDE

        .text "アニメ\n"

      aDebugUnitType ; 89/CDE6

        .text "タイプ\n"

      aUnknown89CDEE ; 89/CDEE

        ; group ?
        .text "ぶたい\n"

      aDebugUnitTypePointers ; 89/CDF6

        .long aDebugUnitType0Text
        .long aDebugUnitType1Text
        .long aDebugUnitType2Text
        .long aDebugUnitType3Text

      aDebugUnitType0Text ; 89/CE02

        .text "ＡＣ\n"

      aDebugUnitType1Text ; 89/CE08

        .text "ＡＮ\n"

      aDebugUnitType2Text ; 89/CE0E

        .text "ＦＣ\n"

      aDebugUnitType3Text ; 89/CE14

        .text "ＦＲ\n"

      rsDebugMenuTab1Page4Effect ; 89/CE1A

        .al
        .autsiz
        .databank ?

        ; Ring stat boost display

        lda #$3000
        sta aCurrentTilemapInfo.wBaseTile,b

        lda #(`aUnknown89CF0E)<<8
        sta lR18+1
        lda #<>aUnknown89CF0E
        sta lR18
        ldx #pack([2, 3])
        jsl rlDrawMenuTextLine

        lda #$3C00
        sta aCurrentTilemapInfo.wBaseTile,b

        jsl rlGetActiveRingStatBonusBitfield
        tax
        and #$0080
        sta $7F8410
        txa
        and #$0040
        sta $7F8412
        txa
        and #$0020
        sta $7F8414
        txa
        and #$0010
        sta $7F8416
        txa
        and #$0008
        sta $7F8418
        txa
        and #$0004
        sta $7F841A

        lda #(`aDebugRingPowerText)<<8
        sta lR18+1
        lda #<>aDebugRingPowerText
        sta lR18
        ldx #pack([10, 5])
        jsl rlDrawMenuTextLine

        lda $7F8410
        ldx #pack([16, 5])
        jsr rsDebugDrawBitOnOrOff

        lda #(`aDebugRingMagicText)<<8
        sta lR18+1
        lda #<>aDebugRingMagicText
        sta lR18
        ldx #pack([10, 7])
        jsl rlDrawMenuTextLine

        lda $7F8412
        ldx #pack([16, 7])
        jsr rsDebugDrawBitOnOrOff

        lda #(`aDebugRingSkillText)<<8
        sta lR18+1
        lda #<>aDebugRingSkillText
        sta lR18
        ldx #pack([11, 9])
        jsl rlDrawMenuTextLine

        lda $7F8414
        ldx #pack([16, 9])
        jsr rsDebugDrawBitOnOrOff

        lda #(`aDebugRingSpeedText)<<8
        sta lR18+1
        lda #<>aDebugRingSpeedText
        sta lR18
        ldx #pack([10, 11])
        jsl rlDrawMenuTextLine

        lda $7F8416
        ldx #pack([16, 11])
        jsr rsDebugDrawBitOnOrOff

        lda #(`aDebugRingDefenseText)<<8
        sta lR18+1
        lda #<>aDebugRingDefenseText
        sta lR18
        ldx #pack([10, 13])
        jsl rlDrawMenuTextLine

        lda $7F8418
        ldx #pack([16, 13])
        jsr rsDebugDrawBitOnOrOff

        lda #(`aDebugRingResistanceText)<<8
        sta lR18+1
        lda #<>aDebugRingResistanceText
        sta lR18
        ldx #pack([10, 15])
        jsl rlDrawMenuTextLine

        lda $7F841A
        ldx #pack([16, 15])
        jsr rsDebugDrawBitOnOrOff
        rts

        .databank 0

      aUnknown89CF0E ; 89/CF0E

        .text "こうフラ\n"

      aDebugRingPowerText ; 89/CF18

        .text "ちから\n"

      aDebugRingMagicText ; 89/CF20

        .text "まりょ\n"

      aDebugRingSkillText ; 89/CF28

        .text "わざ\n"

      aDebugRingSpeedText ; 89/CF2E

        .text "ばやさ\n"

      aDebugRingDefenseText ; 89/CF36

        .text "しゅび\n"

      aDebugRingResistanceText ; 89/CF3E

        .text "まぼう\n"

      rsDebugMenuTab1Page5Effect ; 89/CF46

        .al
        .autsiz
        .databank ?

        ; Lover points display, only for women
        ; Shows unknown number in top left, lover name, base and growth

        lda #$3000
        sta aCurrentTilemapInfo.wBaseTile,b

        lda #(`aUnknown89D133)<<8
        sta lR18+1
        lda #<>aUnknown89D133
        sta lR18
        ldx #pack([2, 3])
        jsl rlDrawMenuTextLine

        lda #$3C00
        sta aCurrentTilemapInfo.wBaseTile,b

        lda $7F840E
        beq +

          lda #(`aUnknown89D15D)<<8
          sta lR18+1
          lda #<>aUnknown89D15D
          sta lR18
          ldx #pack([10, 10])
          jsl rlDrawMenuTextLine
          rts

        +
        jsl rlGetSelectedUnitLoverGenerationID

        ldx #$3920
        stx wR5
        ldx #0
        stx wR6
        ldx #C2I((7, 3), 32) * size(word)
        jsl rlDrawMenuTextNumber

        jsl rlGetSelectedUnitGender
        cmp #0
        bne +

          jml _Man

        +
        lda #(`aUnknown89D13D)<<8
        sta lR18+1
        lda #<>aUnknown89D13D
        sta lR18
        ldx #pack([9, 5])
        jsl rlDrawMenuTextLine

        lda #(`aUnknown89D149)<<8
        sta lR18+1
        lda #<>aUnknown89D149
        sta lR18
        ldx #pack([19, 5])
        jsl rlDrawMenuTextLine

        lda wSelectedUnitDataRAMPointer,b
        sta $7F842E

        jsr rsUnknown89D34C

        lda #0
        
        -
        sta $7F8410
        asl a
        tax
        lda $7F8430,x
        beq +

          sta wSelectedUnitDataRAMPointer,b
          jsl rlGetSelectedUnitNamePointer

          lda $7F8410
          asl a
          clc
          adc #7
          and #$00FF
          xba
          ora #2
          tax
          lda lRoutineVariable,b
          sta lR18
          lda lRoutineVariable+1,b
          sta lR18+1
          jsl rlDrawMenuTextLine

          jsl rlGetSelectedUnitGenerationID
          bcc ++

        +
        lda #$FFFF
        
        +
        pha
        lda $7F8410
        asl a
        tax
        pla
        sta $7F8450,x

        lda $7F8410
        inc a
        cmp #9
        bne -

        lda $7F842E
        sta wSelectedUnitDataRAMPointer,b

        lda #0

        _Loop
        sta $7F8410
        asl a
        tax
        lda $7F8450,x
        bpl +

          jml _Next
        
        +
        jsl rlGetLoverPointsWithTarget
        cmp #0
        bmi +

          pha
          lda $7F8410
          asl a
          clc
          adc #7
          and #$00FF
          xba
          lsr a
          lsr a
          clc
          adc #18
          tax
          lda #$3920
          sta wR5
          lda #5
          sta wR6
          pla
          jsl rlDrawMenuTextNumber
          bra ++

        +
        eor #$FFFF  
        inc a
        pha
        lda $7F8410
        asl a
        clc
        adc #7
        and #$00FF
        xba
        lsr a
        lsr a
        clc
        adc #18
        tax
        lda #$3D20
        sta wR5
        lda #5
        sta wR6
        pla
        jsl rlDrawMenuTextNumber
        
        +
        lda wSelectedUnitDataRAMPointer,b
        sta $7F842E

        lda $7F8410
        asl a
        tax
        lda $7F8450,x
        sta wRoutineVariable1,b

        lda #0
        jsl rlFindGenerationIDInFactionSlotData

        lda wSelectedUnitDataRAMPointer,b
        sta wRoutineVariable1,b

        lda $7F842E
        sta wSelectedUnitDataRAMPointer,b

        jsl rlGetUnitLoveGrowthWithTarget
        cmp #0
        bmi +

          pha
          lda $7F8410
          asl a
          clc
          adc #7
          and #$00FF
          xba
          lsr a
          lsr a
          clc
          adc #38
          tax
          lda #$3920
          sta wR5
          lda #5
          sta wR6
          pla
          jsl rlDrawMenuTextNumber
          jml _Next
        
        +
        ora #$FF00
        eor #$FFFF
        inc a
        pha
        lda $7F8410
        asl a
        clc
        adc #7
        and #$00FF
        xba
        lsr a
        lsr a
        clc
        adc #38
        tax
        lda #$3D20
        sta wR5
        lda #5
        sta wR6
        pla
        jsl rlDrawMenuTextNumber

        _Next
        lda $7F8410
        inc a
        cmp #9
        beq +

          jml _Loop
        
        +
        rts

        _Man
        lda #(`aUnknown89D155)<<8
        sta lR18+1
        lda #<>aUnknown89D155
        sta lR18
        ldx #pack([10, 10])
        jsl rlDrawMenuTextLine
        rts

        .databank 0

      aUnknown89D133 ; 89/D133

        ; marriage?
        .text "れんあい\n"

      aUnknown89D13D ; 89/D13D

        ; favorability?
        .text "こうかんど\n"

      aUnknown89D149 ; 89/D149

        ; good marriage?
        .text "あいしょう\n"

      aUnknown89D155 ; 89/D155

        ; man?
        .text "おとこ\n"

      aUnknown89D15D ; 89/D15D

        ; enemy?
        .text "てき\n"

      rsDebugMenuTab1Page6Effect ; 89/D163

        .al
        .autsiz
        .databank ?

        lda #$3000
        sta aCurrentTilemapInfo.wBaseTile,b

        lda #(`aDebugLoversPart2Text)<<8
        sta lR18+1
        lda #<>aDebugLoversPart2Text
        sta lR18
        ldx #pack([2, 3])
        jsl rlDrawMenuTextLine

        lda #$3C00
        sta aCurrentTilemapInfo.wBaseTile,b

        lda $7F840E
        beq +

          rts

        +
        jsl rlGetSelectedUnitGender
        cmp #0
        bne +

          jml _End

        +
        lda #(`aUnknown89D334)<<8
        sta lR18+1
        lda #<>aUnknown89D334
        sta lR18
        ldx #pack([9, 5])
        jsl rlDrawMenuTextLine

        lda #(`aUnknown89D340)<<8
        sta lR18+1
        lda #<>aUnknown89D340
        sta lR18
        ldx #pack([19, 5])
        jsl rlDrawMenuTextLine

        lda wSelectedUnitDataRAMPointer,b
        sta $7F842E

        jsr rsUnknown89D34C

        lda #9
        
        -
        sta $7F8410
        asl a
        tax
        lda $7F8430,x
        beq +

        sta wSelectedUnitDataRAMPointer,b
        jsl rlGetSelectedUnitNamePointer

        lda $7F8410
        sec
        sbc #9
        asl a
        clc
        adc #7
        and #$00FF
        xba
        ora #2
        tax
        lda lRoutineVariable,b
        sta lR18
        lda lRoutineVariable+1,b
        sta lR18+1
        jsl rlDrawMenuTextLine
        jsl rlGetSelectedUnitGenerationID
        bcc ++

          +
          lda #$FFFF

        +
        pha
        lda $7F8410
        asl a
        tax
        pla
        sta $7F8450,x
        lda $7F8410
        inc a
        cmp #15
        bne -

        lda $7F842E
        sta wSelectedUnitDataRAMPointer,b

        lda #9

        _Loop
        sta $7F8410
        asl a
        tax
        lda $7F8450,x
        bpl +

          jml _Next

        +
        jsl rlGetLoverPointsWithTarget
        cmp #0
        bmi +

        pha
        lda $7F8410
        sec
        sbc #9
        asl a
        clc
        adc #7
        and #$00FF
        xba
        lsr a
        lsr a
        clc
        adc #18
        tax
        lda #$3920
        sta wR5
        lda #5
        sta wR6
        pla
        jsl rlDrawMenuTextNumber
        bra ++
        
        +
        eor #$FFFF
        inc a
        pha
        lda $7F8410
        sec
        sbc #9
        asl a
        clc
        adc #7
        and #$00FF
        xba
        lsr a
        lsr a
        clc
        adc #18
        tax
        lda #$3D20
        sta wR5
        lda #5
        sta wR6
        pla
        jsl rlDrawMenuTextNumber
        
        +
        lda wSelectedUnitDataRAMPointer,b
        sta $7F842E

        lda $7F8410
        asl a
        tax
        lda $7F8450,x
        sta wRoutineVariable1,b

        lda #0
        jsl rlFindGenerationIDInFactionSlotData

        lda wSelectedUnitDataRAMPointer,b
        sta wRoutineVariable1,b
        lda $7F842E
        sta wSelectedUnitDataRAMPointer,b

        jsl rlGetUnitLoveGrowthWithTarget
        cmp #0
        bmi +

          pha
          lda $7F8410
          sec
          sbc #9
          asl a
          clc
          adc #7
          and #$00FF
          xba
          lsr a
          lsr a
          clc
          adc #38
          tax
          lda #$3920
          sta wR5
          lda #5
          sta wR6
          pla
          jsl rlDrawMenuTextNumber
          jml _Next

        +
        ora #$FF00
        eor #$FFFF
        inc a
        pha
        lda $7F8410
        sec
        sbc #9
        asl a
        clc
        adc #7
        and #$00FF
        xba
        lsr a
        lsr a
        clc
        adc #38
        tax
        lda #$3D20
        sta wR5
        lda #5
        sta wR6
        pla
        jsl rlDrawMenuTextNumber
        
        _Next
        lda $7F8410
        inc a
        cmp #15
        beq _End

          jml _Loop

        _End
        rts

        .databank 0

      aDebugLoversPart2Text ; 89/D32C

        .text "その２\n"

      aUnknown89D334 ; 89/D334

        ; favorability?
        .text "こうかんど\n"

      aUnknown89D340 ; 89/D340

        .text "あいしょう\n"

      rsUnknown89D34C ; 89/D34C

        .al
        .autsiz
        .databank ?

        ; Fills a table with unit pointers for lover data

        lda #1

        _Loop
        sta wRoutineVariable1,b

        lda #0
        jsl rlFindGenerationIDInFactionSlotData

        lda wRoutineVariable1,b
        dec a
        asl a
        tax
        lda wSelectedUnitDataRAMPointer,b
        sta $7F8430,x

        lda wRoutineVariable1,b
        inc a
        cmp #16 ; all males, dew = 15 +1
        bne _Loop

        rts

        .databank 0

      rsDebugDrawEnemyUnitGrowths ; 89/D370

        .al
        .autsiz
        .databank ?

        lda #$3000
        sta aCurrentTilemapInfo.wBaseTile,b

        lda #(`aDebugEnemyName)<<8
        sta lR18+1
        lda #<>aDebugEnemyName
        sta lR18
        ldx #pack([1, 3])
        jsl rlDrawMenuTextLine

        lda #$3C00
        sta aCurrentTilemapInfo.wBaseTile,b
        lda #(`aDebugEnemyHPText)<<8
        sta lR18+1
        lda #<>aDebugEnemyHPText
        sta lR18
        ldx #pack([2, 5])
        jsl rlDrawMenuTextLine

        lda #(`aDebugEnemyStrengthText)<<8
        sta lR18+1
        lda #<>aDebugEnemyStrengthText
        sta lR18
        ldx #pack([2, 7])
        jsl rlDrawMenuTextLine

        lda #(`aDebugEnemyMagicText)<<8
        sta lR18+1
        lda #<>aDebugEnemyMagicText
        sta lR18
        ldx #pack([2, 9])
        jsl rlDrawMenuTextLine

        lda #(`aDebugEnemySkillText)<<8
        sta lR18+1
        lda #<>aDebugEnemySkillText
        sta lR18
        ldx #pack([2, 11])
        jsl rlDrawMenuTextLine

        lda #(`aDebugEnemySpeedText)<<8
        sta lR18+1
        lda #<>aDebugEnemySpeedText
        sta lR18
        ldx #pack([2, 13])
        jsl rlDrawMenuTextLine

        lda #(`aDebugEnemyDefenseText)<<8
        sta lR18+1
        lda #<>aDebugEnemyDefenseText
        sta lR18
        ldx #pack([2, 15])
        jsl rlDrawMenuTextLine

        lda #(`aDebugEnemyResistanceText)<<8
        sta lR18+1
        lda #<>aDebugEnemyResistanceText
        sta lR18
        ldx #pack([2, 17])
        jsl rlDrawMenuTextLine

        jsl rlGetEnemyClassHPGrowth
        ldx #$3920
        stx wR5
        ldx #0
        stx wR6
        ldx #C2I((10, 5), 32) * size(word)
        jsl rlDrawMenuTextNumber

        jsl rlGetEnemyClassStrGrowth
        ldx #$3920
        stx wR5
        ldx #0
        stx wR6
        ldx #C2I((10, 7), 32) * size(word)
        jsl rlDrawMenuTextNumber

        jsl rlGetEnemyClassMagGrowth
        ldx #$3920
        stx wR5
        ldx #0
        stx wR6
        ldx #C2I((10, 9), 32) * size(word)
        jsl rlDrawMenuTextNumber

        jsl rlGetEnemyClassSklGrowth
        ldx #$3920
        stx wR5
        ldx #0
        stx wR6
        ldx #C2I((10, 11), 32) * size(word)
        jsl rlDrawMenuTextNumber

        jsl rlGetEnemyClassSpdGrowth
        ldx #$3920
        stx wR5
        ldx #0
        stx wR6
        ldx #C2I((10, 13), 32) * size(word)
        jsl rlDrawMenuTextNumber

        jsl rlGetEnemyClassDefGrowth
        ldx #$3920
        stx wR5
        ldx #0
        stx wR6
        ldx #C2I((10, 15), 32) * size(word)
        jsl rlDrawMenuTextNumber

        jsl rlGetEnemyClassResGrowth
        ldx #$3920
        stx wR5
        ldx #0
        stx wR6
        ldx #C2I((10, 17), 32) * size(word)
        jsl rlDrawMenuTextNumber

        rts

        .databank 0

      aDebugEnemyName ; 89/D498

        .text "ザコかけりつ\n"

      aDebugEnemyHPText ; 89/D4A6

        .text "ＨＰ\n"

      aDebugEnemyStrengthText ; 89/D4AC

        .text "ちから\n"

      aDebugEnemyMagicText ; 89/D4B4

        .text "まりょく\n"

      aDebugEnemySkillText ; 89/D4BE

        .text "わざ\n"

      aDebugEnemySpeedText ; 89/D4C4

        .text "すばやさ\n"

      aDebugEnemyDefenseText ; 89/D4CE

        .text "しゅび\n"

      aDebugEnemyResistanceText ; 89/D4D6

        .text "まぼう\n"

      rsDebugMenuTab1Page7Effect ; 89/D4DE

        .al
        .autsiz
        .databank ?

        ; Terrain avoid and movement cost data

        lda #$3C00
        sta aCurrentTilemapInfo.wBaseTile,b

        lda #0
        
        -
        sta wR0
        asl a
        clc
        adc wR0
        tax

        lda aDebugTerrainNamePointers+1,x
        sta lR18+1
        lda aDebugTerrainNamePointers,x
        sta lR18

        lda wR0
        asl a
        tax
        lda aDebugTerrainTextCoordinates,x
        tax
        jsl rlDrawMenuTextLine

        lda wR0
        inc a
        cmp #size(aDebugTerrainNamePointers) / 3
        bne -

        lda #$3800
        sta aCurrentTilemapInfo.wBaseTile,b

        lda #(`aDebugTerrainCostAvoidText)<<8
        sta lR18+1
        lda #<>aDebugTerrainCostAvoidText
        sta lR18
        ldx #pack([4, 3])
        jsl rlDrawMenuTextLine

        jsl rlGetSelectedUnitTerrainAvoidPointer
        sta $7F8412

        jsl rlGetSelectedUnitMovementCostPointer
        sta $7F8410

        lda #0
        sta $7F8414

        _D53D
        lda $7F8410
        clc
        adc $7F8414
        tax
        lda $830000,x
        and #$00FF
        cmp #$0080
        beq _Untraversable

        tay
        lda $7F8414
        asl a
        tax
        lda aDebugTerrainNumberCoordinates,x
        tax

        lda #$3920
        sta wR5
        lda #1
        sta wR6
        tya
        jsl rlDrawMenuTextNumber
        bra +

        _Untraversable
        lda #(`aDebugDashText)<<8
        sta lR18+1
        lda #<>aDebugDashText
        sta lR18

        lda $7F8414
        asl a
        tax
        lda aDebugTerrainTextCoordinates,x
        clc
        adc #4
        tax
        jsl rlDrawMenuTextLine

        +
        lda $7F8412
        clc
        adc $7F8414
        tax
        lda $830000,x
        and #$00FF
        tay

        lda $7F8414
        asl a
        tax
        lda aDebugTerrainNumberCoordinates,x
        clc
        adc #4
        tax
        lda #$3920
        sta wR5
        lda #2
        sta wR6
        tya
        jsl rlDrawMenuTextNumber

        lda $7F8414
        inc a
        sta $7F8414
        cmp #26
        beq +

          jml _D53D

        +
        rts

        .databank 0

      aDebugTerrainNumberCoordinates ; 89/D5D0

        .word C2I(( 5,  5), 32) * size(word)
        .word C2I(( 5,  7), 32) * size(word)
        .word C2I(( 5,  9), 32) * size(word)
        .word C2I(( 5, 11), 32) * size(word)
        .word C2I(( 5, 13), 32) * size(word)
        .word C2I(( 5, 15), 32) * size(word)
        .word C2I(( 5, 17), 32) * size(word)
        .word C2I(( 5, 19), 32) * size(word)
        .word C2I(( 5, 21), 32) * size(word)
        .word C2I(( 5, 23), 32) * size(word)
        .word C2I(( 5, 25), 32) * size(word)
        .word C2I((16,  5), 32) * size(word)
        .word C2I((16,  7), 32) * size(word)
        .word C2I((16,  9), 32) * size(word)
        .word C2I((16, 11), 32) * size(word)
        .word C2I((16, 13), 32) * size(word)
        .word C2I((16, 15), 32) * size(word)
        .word C2I((16, 17), 32) * size(word)
        .word C2I((16, 19), 32) * size(word)
        .word C2I((16, 21), 32) * size(word)
        .word C2I((16, 23), 32) * size(word)
        .word C2I((16, 25), 32) * size(word)
        .word C2I((26,  5), 32) * size(word)
        .word C2I((26,  7), 32) * size(word)
        .word C2I((26,  9), 32) * size(word)
        .word C2I((26, 11), 32) * size(word)

      aDebugTerrainTextCoordinates ; 89/D604

        .word pack([ 1,  5])
        .word pack([ 1,  7])
        .word pack([ 1,  9])
        .word pack([ 1, 11])
        .word pack([ 1, 13])
        .word pack([ 1, 15])
        .word pack([ 1, 17])
        .word pack([ 1, 19])
        .word pack([ 1, 21])
        .word pack([ 1, 23])
        .word pack([ 1, 25])
        .word pack([12,  5])
        .word pack([12,  7])
        .word pack([12,  9])
        .word pack([12, 11])
        .word pack([12, 13])
        .word pack([12, 15])
        .word pack([12, 17])
        .word pack([12, 19])
        .word pack([12, 21])
        .word pack([12, 23])
        .word pack([12, 25])
        .word pack([22,  5])
        .word pack([22,  7])
        .word pack([22,  9])
        .word pack([22, 11])

      aDebugTerrainCostAvoidText ; 89/D638

        .text "ロス　かいひ\n"

      aDebugDashText ; 89/D646

        .text "ー\n"

      aDebugTerrainNamePointers .block ; 89/D64A

        .long aUnknown89D698
        .long aUnknown89D6A0
        .long aUnknown89D6A8
        .long aUnknown89D6AE
        .long aUnknown89D6B4
        .long aUnknown89D6BA
        .long aUnknown89D6C0
        .long aUnknown89D6C6
        .long aUnknown89D6CC
        .long aUnknown89D6D4
        .long aUnknown89D6DA
        .long aUnknown89D6E2
        .long aUnknown89D6E8
        .long aUnknown89D6EE
        .long aUnknown89D6F4
        .long aUnknown89D6FC
        .long aUnknown89D702
        .long aUnknown89D708
        .long aUnknown89D710
        .long aUnknown89D716
        .long aUnknown89D71E
        .long aUnknown89D726
        .long aUnknown89D72E
        .long aUnknown89D736
        .long aUnknown89D73E
        .long aUnknown89D744

      .bend

      aUnknown89D698 ; 89/D698

        ; peak?
        .text "たかい\n"

      aUnknown89D6A0 ; 89/D6A0

        ; road?
        .text "ふかい\n"

      aUnknown89D6A8 ; 89/D6A8

        ; cliff?
        .text "がけ\n"

      aUnknown89D6AE ; 89/D6AE

        ; wall?
        .text "へい\n"

      aUnknown89D6B4 ; 89/D6B4

        ; forest ?
        .text "もり\n"

      aUnknown89D6BA ; 89/D6BA

        ; sea?
        .text "うみ\n"

      aUnknown89D6C0 ; 89/D6C0

        ; river?
        .text "かわ\n"

      aUnknown89D6C6 ; 89/D6C6

        ; mountain?
        .text "やま\n"

      aUnknown89D6CC ; 89/D6CC

        ; ?
        .text "さばく\n"

      aUnknown89D6D4 ; 89/D6D4

        ; castle?
        .text "しろ\n"

      aUnknown89D6DA ; 89/D6DA

        ; fortress?
        .text "とりで\n"

      aUnknown89D6E2 ; 89/D6E2

        ; town?
        .text "まち\n"

      aUnknown89D6E8 ; 89/D6E8

        ; gate?
        .text "もん\n"

      aUnknown89D6EE ; 89/D6EE

        ; different wall?
        .text "かべ\n"

      aUnknown89D6F4 ; 89/D6F4

        ; barrens?
        .text "あれち\n"

      aUnknown89D6FC ; 89/D6FC

        ; bridge?
        .text "はし\n"

      aUnknown89D702 ; 89/D702

        ; swamp?
        .text "ぬま\n"

      aUnknown89D708 ; 89/D708

        ; cave?
        .text "どうく\n"

      aUnknown89D710 ; 89/D710

        ; village?
        .text "むら\n"

      aUnknown89D716 ; 89/D716

        ;  ?
        .text "はいき\n"

      aUnknown89D71E ; 89/D71E

        ; supply?
        .text "そうこ\n"

      aUnknown89D726 ; 89/D726

        ; ?
        .text "はいき\n"

      aUnknown89D72E ; 89/D72E

        ; ?
        .text "きょう\n"

      aUnknown89D736 ; 89/D736

        ; ?
        .text "しんで\n"

      aUnknown89D73E ; 89/D73E

        ; tower?
        .text "とう\n"

      aUnknown89D744 ; 89/D744

        ; road?
        .text "みち\n"

      rsDebugMenuTab1Page8Effect ; 89/D74A

        .al
        .autsiz
        .databank ?

        ; Selected character skill list

        jsl rlDebugGetSkillList

        lda wDebugMenuSkillCounter
        beq _End

        lda #0
        sta wR13
        
        -
        sta wR15
        tax
        lda aDebugMenuSkillFlags,x
        and #$00FF
        sta wR14
        beq +

          lda wR15
          sta wR0
          asl a
          clc
          adc wR0
          tax
          lda aDebugSkillNamePointers+1,x
          sta lR18+1
          lda aDebugSkillNamePointers,x
          sta lR18

          lda wR13
          asl a
          clc
          adc #5
          and #$00FF
          xba
          ora #5
          tax
          jsl rlDrawMenuTextLine
          inc wR13

        +
        lda wR15
        inc a
        cmp #size(aDebugSkillNamePointers) /3
        bne -

        _End
        rts

        .databank 0

      aUnknown89D79A ; 89/D79A

        .word $C682
        .word $AD82
        .word $B582
        .word $E382
        .word $CC82
        .word $A482
        .word $E882
        .word $E582
        .word $AD82
        .word 0

      aDebugSkillNamePointers .block; 89/D7AE

        .long 0
        .long aDebugSkillCanto
        .long aDebugSkillPavise
        .long aDebugSkillWrath
        .long aDebugSkillPursuit
        .long aDebugSkillAdept
        .long aDebugSkillSteal
        .long 0                       ; Unknown2

        .long aDebugSkillDance
        .long 0                       ; Unknown3
        .long 0                       ; Unknown4
        .long aDebugSkillDismount
        .long aDebugSkillCharm
        .long aDebugSkillPoW
        .long aDebugSkillNihil
        .long aDebugSkillMiracle

        .long aDebugSkillCritical
        .long aDebugSkillVantage
        .long aDebugSkillAccost
        .long aDebugSkillAstra
        .long aDebugSkillLuna
        .long aDebugSkillSol
        .long 0                       ; Holy Sword
        .long 0                       ; Darkness Sword

        .long aDebugSkillRenewal
        .long aDebugSkillParagon
        .long aDebugSkillEscape       ; Unknown7
        .long 0                       ; Recover
        .long aDebugSkillBargain
        .long aDebugSkillReturn
        .long 0

      .bend

      aDebugSkillCanto ; 89/D80B

        .text "さいいどう\n"

      aDebugSkillPavise ; 89/D817

        .text "おおたて\n"

      aDebugSkillWrath ; 89/D821

        .text "いかり\n"

      aDebugSkillPursuit ; 89/D829

        .text "ついげき\n"

      aDebugSkillAdept ; 89/D833

        .text "れんぞく\n"

      aDebugSkillSteal ; 89/D83D

        .text "ぬすむ\n"

      aDebugSkillDance ; 89/D845

        .text "おどる\n"

      aDebugSkillDismount ; 89/D84D

        ; only on knight lord, disabled for sigurd
        .text "のりおり\n"

      aDebugSkillCharm ; 89/D857

        .text "カリスマ\n"

      aDebugSkillPoW ; 89/D861

        ; on deirdre and julia
        .text "ほりょ\n"

      aDebugSkillNihil ; 89/D869

        .text "みきり\n"

      aDebugSkillMiracle ; 89/D871

        ; name doesnt fit
        .text "こんじょう\n"

      aDebugSkillCritical ; 89/D87D

        .text "ひっさつ\n"

      aDebugSkillVantage ; 89/D887

        .text "まちぶせ\n"

      aDebugSkillAccost ; 89/D891

        .text "とつげき\n"

      aDebugSkillAstra ; 89/D89B

        .text "りゅうせい剣\n"

      aDebugSkillLuna ; 89/D8A9

        .text "げっこう剣\n"

      aDebugSkillSol ; 89/D8B5

        .text "たいよう剣\n"

      aDebugSkillRenewal ; 89/D8C1

        .text "ライブ\n"

      aDebugSkillParagon ; 89/D8C9

        .text "エリート\n"

      aDebugSkillEscape ; 89/D8D3

        .text "だっしゅつ\n"

      aDebugSkillBargain ; 89/D8DF

        .text "ねぎり\n"

      aDebugSkillReturn ; 89/D8E7

        .text "リターン\n"


      rsDebugMenuTab3Page1 ; 89/D8F1

        .al
        .autsiz
        .databank `aActionStructUnit1

        sep #$20
        lda #`aActionStructUnit1
        pha
        rep #$20
        plb

        lda #$3C00
        sta aCurrentTilemapInfo.wBaseTile,b

        _PointerList  := [(aDebugCombatUnitText  , pack([4,  5]))]
        _PointerList ..= [(aDebugCombatClassText , pack([5,  7]))]
        _PointerList ..= [(aDebugCombatGenderText, pack([5,  9]))]
        _PointerList ..= [(aDebugCombatWeaponText, pack([2, 11]))]
        _PointerList ..= [(aDebugCombatRangeText , pack([3, 13]))]
        _PointerList ..= [(aDebugCombatLevelText , pack([6, 15]))]
        _PointerList ..= [(aDebugCombatHPText    , pack([1, 17]))]
        _PointerList ..= [(aDebugCombatAtkDefText, pack([1, 19]))]
        _PointerList ..= [(aDebugCombatHitAvoText, pack([1, 21]))]
        _PointerList ..= [(aDebugCombatCritText  , pack([4, 23]))]
        _PointerList ..= [(aDebugCombatSpdText   , pack([5, 25]))]

        .for _Pointer, _Coordinates in _PointerList

          lda #(`_Pointer)<<8
          sta lR18+1
          lda #<>_Pointer
          sta lR18
          ldx #_Coordinates
          jsl rlDrawMenuTextLine

        .endfor

        lda #$3800
        sta aCurrentTilemapInfo.wBaseTile,b

        lda aActionStructUnit2.CharacterID
        jsl rlGetCharacterNamePointer

        lda lRoutineVariable,b
        sta lR18
        lda lRoutineVariable+1,b
        sta lR18+1
        ldx #pack([10, 5])
        jsl rlDrawMenuTextLine

        lda aActionStructUnit1.CharacterID
        jsl rlGetCharacterNamePointer

        lda lRoutineVariable,b
        sta lR18
        lda lRoutineVariable+1,b
        sta lR18+1
        ldx #pack([21, 5])
        jsl rlDrawMenuTextLine

        lda aActionStructUnit2.DeploymentNumber
        ldx #$3920
        stx wR5
        ldx #0
        stx wR6
        ldx #C2I((17, 5), 32) * size(word)
        jsl rlDrawMenuTextNumber

        lda aActionStructUnit1.DeploymentNumber
        ldx #$3920
        stx wR5
        ldx #0
        stx wR6
        ldx #C2I((28, 5), 32) * size(word)
        jsl rlDrawMenuTextNumber

        lda aActionStructUnit2.ClassID
        jsl rlGetClassNamePointer

        lda lRoutineVariable,b
        sta lR18
        lda lRoutineVariable+1,b
        sta lR18+1
        ldx #pack([10, 7])
        jsl rlDrawMenuTextLine

        lda aActionStructUnit1.ClassID
        jsl rlGetClassNamePointer

        lda lRoutineVariable,b
        sta lR18
        lda lRoutineVariable+1,b
        sta lR18+1
        ldx #pack([21, 7])
        jsl rlDrawMenuTextLine

        lda aActionStructUnit2.Gender
        inc a
        sta wR0
        asl a
        clc
        adc wR0
        tax
        lda aDebugCombatGenderTextPointers+1,x
        sta lR18+1
        lda aDebugCombatGenderTextPointers,x
        sta lR18

        ldx #pack([10, 9])
        jsl rlDrawMenuTextLine

        lda aActionStructUnit1.Gender
        inc a
        sta wR0
        asl a
        clc
        adc wR0
        tax
        lda aDebugCombatGenderTextPointers+1,x
        sta lR18+1
        lda aDebugCombatGenderTextPointers,x
        sta lR18

        ldx #pack([21, 9])
        jsl rlDrawMenuTextLine

        lda aActionStructUnit2.WeaponID
        jsl rlGetItemNamePointerByItemID

        lda lRoutineVariable,b
        sta lR18
        lda lRoutineVariable+1,b
        sta lR18+1
        ldx #pack([10, 11])
        jsl rlDrawMenuTextLine

        lda aActionStructUnit1.WeaponID
        jsl rlGetItemNamePointerByItemID

        lda lRoutineVariable,b
        sta lR18
        lda lRoutineVariable+1,b
        sta lR18+1
        ldx #pack([21, 11])
        jsl rlDrawMenuTextLine

        _ValueList  := [(aActionStructUnit2.WeaponInventorySlot,  1, C2I((18, 11), 32) * size(word))]
        _ValueList ..= [(aActionStructUnit1.WeaponInventorySlot,  1, C2I((29, 11), 32) * size(word))]
        _ValueList ..= [(aActionStructUnit2.WeaponMinRange,       1, C2I((10, 13), 32) * size(word))]
        _ValueList ..= [(aActionStructUnit1.WeaponMinRange,       1, C2I((21, 13), 32) * size(word))]
        _ValueList ..= [(aActionStructUnit2.WeaponMaxRange,       0, C2I((12, 13), 32) * size(word))]
        _ValueList ..= [(aActionStructUnit1.WeaponMaxRange,       0, C2I((23, 13), 32) * size(word))]
        _ValueList ..= [(aActionStructUnit2.Level,                0, C2I((10, 15), 32) * size(word))]
        _ValueList ..= [(aActionStructUnit1.Level,                0, C2I((21, 15), 32) * size(word))]
        _ValueList ..= [(aActionStructUnit2.CurrentHP,            2, C2I((10, 17), 32) * size(word))]
        _ValueList ..= [(aActionStructUnit1.CurrentHP,            2, C2I((21, 17), 32) * size(word))]
        _ValueList ..= [(aActionStructUnit2.MaxHP,                0, C2I((13, 17), 32) * size(word))]
        _ValueList ..= [(aActionStructUnit1.MaxHP,                0, C2I((24, 17), 32) * size(word))]
        _ValueList ..= [(aActionStructUnit2.BattleMight,          2, C2I((10, 19), 32) * size(word))]
        _ValueList ..= [(aActionStructUnit1.BattleMight,          2, C2I((21, 19), 32) * size(word))]
        _ValueList ..= [(aActionStructUnit2.BattleDefense,        0, C2I((13, 19), 32) * size(word))]
        _ValueList ..= [(aActionStructUnit1.BattleDefense,        0, C2I((24, 19), 32) * size(word))]
        _ValueList ..= [(aActionStructUnit2.BattleAdjustedHit,    2, C2I((10, 21), 32) * size(word))]
        _ValueList ..= [(aActionStructUnit1.BattleAdjustedHit,    2, C2I((21, 21), 32) * size(word))]
        _ValueList ..= [(aActionStructUnit2.BattleAvoid,          0, C2I((13, 21), 32) * size(word))]
        _ValueList ..= [(aActionStructUnit1.BattleAvoid,          0, C2I((24, 21), 32) * size(word))]
        _ValueList ..= [(aActionStructUnit2.BattleCrit,           0, C2I((10, 23), 32) * size(word))]
        _ValueList ..= [(aActionStructUnit1.BattleCrit,           0, C2I((21, 23), 32) * size(word))]
        _ValueList ..= [(aActionStructUnit2.BattleAttackSpeed,    0, C2I((10, 25), 32) * size(word))]
        _ValueList ..= [(aActionStructUnit1.BattleAttackSpeed,    0, C2I((21, 25), 32) * size(word))]

        .for _Address, _Size, _Coordinates in _ValueList

          lda _Address
          ldx #$3920
          stx wR5
          ldx #_Size
          stx wR6
          ldx #_Coordinates
          jsl rlDrawMenuTextNumber

        .endfor 

        rts

        .databank 0

      aDebugCombatUnitText    .text "ＵＮＩＴ　　　　　　　　／　　　　　　　　　　／\n"         ; 89/DC95
      aDebugCombatClassText   .text "ＪＯＢ\n"                                               ; 89/DCC7
      aDebugCombatGenderText  .text "ＳＥＸ\n"                                               ; 89/DCCF
      aDebugCombatWeaponText  .text "ＷＥＡＰＯＮ　　　　　　　　　／　　　　　　　　　　／\n"   ; 89/DCD7
      aDebugCombatRangeText   .text "ＲＡＮＧＥ　　　ー　　　　　　　　　　ー\n"                 ; 89/DD0F
      aDebugCombatLevelText   .text "ＬＶ\n"                                                ; 89/DD39
      aDebugCombatHPText      .text "　ＨＰ／ＭＡＸ　　　　／　　　　　　　　　　／\n"          ; 89/DD3F
      aDebugCombatAtkDefText  .text "ＡＴＣ／ＤＥＦ　　　　／　　　　　　　　　　／\n"          ; 89/DD6F
      aDebugCombatHitAvoText  .text "ＨＩＴ／ＡＶＯ　　　　／　　　　　　　　　　／\n"          ; 89/DD9F
      aDebugCombatCritText    .text "ＣＬＩＴ\n"                                            ; 89/DDCF
      aDebugCombatSpdText     .text "ＳＰＤ\n"                                              ; 89/DDD9

      aDebugCombatGenderTextPointers ; 89/DDE1

        .long aDebugCombatGenderNoneText
        .long aDebugCombatGenderMaleText
        .long aDebugCombatGenderFemaleText

      aDebugCombatGenderNoneText .text "なし\n" ; 89/DDEA
      aDebugCombatGenderMaleText .text "オス\n" ; 89/DDF0
      aDebugCombatGenderFemaleText .text "メス\n" ; 89/DDF6

      rsDebugMenuTab3Page2 ; 89/DDFC

        .al
        .autsiz
        .databank `aActionStructUnit1

        sep #$20
        lda #`aActionStructUnit1
        pha
        rep #$20
        plb

        lda #$3C00
        sta aCurrentTilemapInfo.wBaseTile,b

        _PointerList  := [(aDebugCombatCoordinatesText, pack([1,  5]))]
        _PointerList ..= [(aDebugCombatUnknown1Text   , pack([5,  7]))]
        _PointerList ..= [(aDebugCombatLevelUpText    , pack([3,  9]))]
        _PointerList ..= [(aDebugCombatGainedEXPText  , pack([5, 11]))]
        _PointerList ..= [(aDebugCombatItemText       , pack([4, 13]))]
        _PointerList ..= [(aDebugCombatGoldText       , pack([4, 15]))]
        _PointerList ..= [(aDebugCombatSkillsText     , pack([5, 17]))]

        .for _Pointer, _Coordinates in _PointerList

          lda #(`_Pointer)<<8
          sta lR18+1
          lda #<>_Pointer
          sta lR18
          ldx #_Coordinates
          jsl rlDrawMenuTextLine

        .endfor

        lda #$3800
        sta aCurrentTilemapInfo.wBaseTile,b

        lda aActionStructUnit2.XPosition
        ldx #$3920
        stx wR5
        ldx #0
        stx wR6
        ldx #C2I((11, 5), 32) * size(word)
        jsl rlDrawMenuTextNumber

        lda aActionStructUnit1.XPosition
        ldx #$3920
        stx wR5
        ldx #0
        stx wR6
        ldx #C2I((22, 5), 32) * size(word)
        jsl rlDrawMenuTextNumber

        lda aActionStructUnit2.YPosition
        ldx #$3920
        stx wR5
        ldx #0
        stx wR6
        ldx #C2I((15, 5), 32) * size(word)
        jsl rlDrawMenuTextNumber

        lda aActionStructUnit1.YPosition
        ldx #$3920
        stx wR5
        ldx #0
        stx wR6
        ldx #C2I((26, 5), 32) * size(word)
        jsl rlDrawMenuTextNumber

        lda aActionStructUnit2.TerrainType
        jsl $848EFB

        lda lRoutineVariable,b
        sta lR18
        lda lRoutineVariable+1,b
        sta lR18+1
        ldx #pack([10, 7])
        jsl rlDrawMenuTextLine

        lda aActionStructUnit2.TerrainType
        ldx #$3920
        stx wR5
        ldx #0
        stx wR6
        ldx #C2I((16, 7), 32) * size(word)
        jsl rlDrawMenuTextNumber

        lda aActionStructUnit1.TerrainType
        jsl $848EFB

        lda lRoutineVariable,b
        sta lR18
        lda lRoutineVariable+1,b
        sta lR18+1
        ldx #pack([21, 7])
        jsl rlDrawMenuTextLine

        lda aActionStructUnit1.TerrainType
        ldx #$3920
        stx wR5
        ldx #0
        stx wR6
        ldx #C2I((27, 7), 32) * size(word)
        jsl rlDrawMenuTextNumber

        lda aActionStructUnit2.GainedLevels
        ldx #$3920
        stx wR5
        ldx #0
        stx wR6
        ldx #C2I((10, 9), 32) * size(word)
        jsl rlDrawMenuTextNumber

        lda aActionStructUnit1.GainedLevels
        ldx #$3920
        stx wR5
        ldx #0
        stx wR6
        ldx #C2I((21, 9), 32) * size(word)
        jsl rlDrawMenuTextNumber

        lda aActionStructUnit2.StartingExperience
        cmp #$FFFF
        bne +

          lda #0

        +
        ldx #$3920
        stx wR5
        ldx #0
        stx wR6
        ldx #C2I((10, 11), 32) * size(word)
        jsl rlDrawMenuTextNumber

        lda aActionStructUnit1.StartingExperience
        cmp #$FFFF
        bne +

          lda #0

        +
        ldx #$3920
        stx wR5
        ldx #0
        stx wR6
        ldx #C2I((21, 11), 32) * size(word)
        jsl rlDrawMenuTextNumber

        lda aActionStructUnit2.GainedExperience
        ldx #$3920
        stx wR5
        ldx #0
        stx wR6
        ldx #C2I((16, 11), 32) * size(word)
        jsl rlDrawMenuTextNumber

        lda aActionStructUnit1.GainedExperience
        ldx #$3920
        stx wR5
        ldx #0
        stx wR6
        ldx #C2I((27, 11), 32) * size(word)
        jsl rlDrawMenuTextNumber

        lda aActionStructUnit2.ObtainedItem
        cmp #$FFFF
        beq +

          jsl rlGetItemNamePointerByItemID

          lda lRoutineVariable,b
          sta lR18
          lda lRoutineVariable+1,b
          sta lR18+1
          ldx #pack([10, 13])
          jsl rlDrawMenuTextLine

          lda aActionStructUnit2.ObtainedItem
          ldx #$3920  
          stx wR5
          ldx #0
          stx wR6
          ldx #C2I((18, 13), 32) * size(word)
          jsl rlDrawMenuTextNumber

        +
        lda aActionStructUnit1.ObtainedItem
        cmp #$FFFF
        beq +

          jsl rlGetItemNamePointerByItemID

          lda lRoutineVariable,b
          sta lR18
          lda lRoutineVariable+1,b
          sta lR18+1
          ldx #pack([21, 13])
          jsl rlDrawMenuTextLine

          lda aActionStructUnit1.ObtainedItem
          ldx #$3920
          stx wR5
          ldx #0
          stx wR6
          ldx #C2I((29, 13), 32) * size(word)
          jsl rlDrawMenuTextNumber

        +
        lda aActionStructUnit2.ObtainedStealMoney
        ldx #$3920
        stx wR5
        ldx #0
        stx wR6
        ldx #C2I((10, 15), 32) * size(word)
        jsl rlDrawMenuTextNumber

        lda aActionStructUnit1.ObtainedStealMoney
        ldx #$3920
        stx wR5
        ldx #0
        stx wR6
        ldx #C2I((21, 15), 32) * size(word)
        jsl rlDrawMenuTextNumber

        lda aActionStructUnit2.Unknown
        beq +

          sta wR0
          asl a
          clc
          adc wR0
          tax
          lda aDebugSkillNamePointers+1,x
          sta lR18+1
          lda aDebugSkillNamePointers,x
          sta lR18
          ldx #pack([10, 17])
          jsl rlDrawMenuTextLine
        
        +
        lda aActionStructUnit2.Unknown
        ldx #$3920
        stx wR5
        ldx #0
        stx wR6
        ldx #C2I((18, 17), 32) * size(word)
        jsl rlDrawMenuTextNumber

        lda aActionStructUnit1.Unknown
        beq +

          sta wR0
          asl a
          clc
          adc wR0
          tax
          lda aDebugSkillNamePointers+1,x
          sta lRoutineVariable+1,b
          lda aDebugSkillNamePointers,x
          sta lRoutineVariable,b

          lda lRoutineVariable,b
          sta lR18
          lda lRoutineVariable+1,b
          sta lR18+1
          ldx #pack([21, 17])
          jsl rlDrawMenuTextLine

        +
        lda aActionStructUnit1.Unknown
        ldx #$3920
        stx wR5
        ldx #0
        stx wR6
        ldx #C2I((29, 17), 32) * size(word)
        jsl rlDrawMenuTextNumber
        rts

        .databank 0

      aDebugCombatCoordinatesText .text "ＭＡＰ　Ｘ／Ｙ　　Ｘ　　　Ｙ　　　　　　Ｘ　　　Ｙ\n"  ; 89/E0B4
      aDebugCombatUnknown1Text    .text "ちけい　　　　　　　／　　　　　　　　　　／\n"         ; 89/E0E8
      aDebugCombatLevelUpText     .text "ＬＶ　ＵＰ\n"                                       ; 89/E116
      aDebugCombatGainedEXPText   .text "ＥＸＰ　　　　　ＧＥＴ　　　　　　　　ＧＥＴ\n"        ; 89/E122
      aDebugCombatItemText        .text "ＩＴＥＭ　　　　　　　　　／　　　　　　　　　　／\n"   ; 89/E150
      aDebugCombatGoldText        .text "ＧＯＬＤ\n"                                         ; 89/E184
      aDebugCombatSkillsText      .text "ＳＫＬ　　　　　　　　　／　　　　　　　　　　／\n"    ; 89/E18E

      rsDebugMenuTab3Page3 ; 89/E1C0

        .al
        .autsiz
        .databank `aActionStructUnit1

        sep #$20
        lda #`aActionStructUnit1
        pha
        rep #$20
        plb

        lda #$3000
        sta aCurrentTilemapInfo.wBaseTile,b

        lda #(`aDebugCombatLVUPPageText)<<8
        sta lR18+1
        lda #<>aDebugCombatLVUPPageText
        sta lR18
        ldx #pack([1, 3])
        jsl rlDrawMenuTextLine

        lda #$3C00
        sta aCurrentTilemapInfo.wBaseTile,b

        _PointerList  := [(aDebugCombatHPGainText  , pack([1,  5]))]
        _PointerList ..= [(aDebugCombatSTRGainText , pack([1,  7]))]
        _PointerList ..= [(aDebugCombatMAGGainText , pack([1,  9]))]
        _PointerList ..= [(aDebugCombatSKLGainText , pack([1, 11]))]
        _PointerList ..= [(aDebugCombatSPDGainText , pack([1, 13]))]
        _PointerList ..= [(aDebugCombatDEFGainText , pack([1, 15]))]
        _PointerList ..= [(aDebugCombatRESGainText , pack([1, 17]))]
        _PointerList ..= [(aDebugCombatLUCKGainText, pack([1, 19]))]

        .for _Pointer, _Coordinates in _PointerList

          lda #(`_Pointer)<<8
          sta lR18+1
          lda #<>_Pointer
          sta lR18
          ldx #_Coordinates
          jsl rlDrawMenuTextLine

        .endfor

        lda #$3800
        sta aCurrentTilemapInfo.wBaseTile,b

        _ValueList  := [(<>aActionStructUnit2.LevelUpData.HPGain,         0, C2I((10,  5), 32) * size(word))]
        _ValueList ..= [(<>aActionStructUnit1.LevelUpData.HPGain,         0, C2I((21,  5), 32) * size(word))]
        _ValueList ..= [(<>aActionStructUnit2.LevelUpData.StrengthGain,   0, C2I((10,  7), 32) * size(word))]
        _ValueList ..= [(<>aActionStructUnit1.LevelUpData.StrengthGain,   0, C2I((21,  7), 32) * size(word))]
        _ValueList ..= [(<>aActionStructUnit2.LevelUpData.MagicGain,      0, C2I((10,  9), 32) * size(word))]
        _ValueList ..= [(<>aActionStructUnit1.LevelUpData.MagicGain,      0, C2I((21,  9), 32) * size(word))]
        _ValueList ..= [(<>aActionStructUnit2.LevelUpData.SkillGain,      0, C2I((10, 11), 32) * size(word))]
        _ValueList ..= [(<>aActionStructUnit1.LevelUpData.SkillGain,      0, C2I((21, 11), 32) * size(word))]
        _ValueList ..= [(<>aActionStructUnit2.LevelUpData.SpeedGain,      0, C2I((10, 13), 32) * size(word))]
        _ValueList ..= [(<>aActionStructUnit1.LevelUpData.SpeedGain,      0, C2I((21, 13), 32) * size(word))]
        _ValueList ..= [(<>aActionStructUnit2.LevelUpData.DefenseGain,    0, C2I((10, 15), 32) * size(word))]
        _ValueList ..= [(<>aActionStructUnit1.LevelUpData.DefenseGain,    0, C2I((21, 15), 32) * size(word))]
        _ValueList ..= [(<>aActionStructUnit2.LevelUpData.ResistanceGain, 0, C2I((10, 17), 32) * size(word))]
        _ValueList ..= [(<>aActionStructUnit1.LevelUpData.ResistanceGain, 0, C2I((21, 17), 32) * size(word))]
        _ValueList ..= [(<>aActionStructUnit2.LevelUpData.LuckGain,       0, C2I((10, 19), 32) * size(word))]
        _ValueList ..= [(<>aActionStructUnit1.LevelUpData.LuckGain,       0, C2I((21, 19), 32) * size(word))]

        .for _Address, _Size, _Coordinates in _ValueList

          lda _Address,b
          ldx #$3920
          stx wR5
          ldx #_Size
          stx wR6
          ldx #_Coordinates
          jsl rlDrawMenuTextNumber

        .endfor

        rts

        .databank 0

        aDebugCombatLVUPPageText  .text "ＬＶ　ＵＰ\n" ; 89/E3B4

        aDebugCombatHPGainText    .text "ＨＰ\n"       ; 89/E3C0
        aDebugCombatSTRGainText   .text "ＳＴＲ\n"     ; 89/E3C6
        aDebugCombatMAGGainText   .text "ＭＧＣ\n"     ; 89/E3CE
        aDebugCombatSKLGainText   .text "ＴＥＣ\n"     ; 89/E3D6
        aDebugCombatSPDGainText   .text "ＳＰＤ\n"     ; 89/E3DE
        aDebugCombatDEFGainText   .text "ＤＥＦ\n"     ; 89/E3E6
        aDebugCombatRESGainText   .text "ＭＤＥＦ\n"   ; 89/E3EE
        aDebugCombatLUCKGainText  .text "ＬＵＣＫ\n"   ; 89/E3F8

      rsDebugMenuTab3Page4 ; 89/E402

        .al
        .autsiz
        .databank ?

        rts 

        .databank 0

      rsDebugMenuTab3Page5 ; 89/E403

        .al
        .autsiz
        .databank ?

        lda #$3000
        sta aCurrentTilemapInfo.wBaseTile,b

        lda #(`aDebugCombatFlagsTitleText1)<<8
        sta lR18+1
        lda #<>aDebugCombatFlagsTitleText1
        sta lR18
        ldx #pack([1, 3])
        jsl rlDrawMenuTextLine

        lda #0
        sta $7F8412

          _OuterLoop
          lda #0
          sta $7F8410

          lda $7F8412
          tax
          lda $7E4F85,x
          sta $7F8414

            _InnerLoop
            lda $7F8410
            asl a
            tax
            lda $7F8414
            and aDebugCombatRoundFlagMasks1,x
            beq +

              lda #1

            +
            pha

            lda $7F8412
            clc
            adc #5
            and #$00FF
            xba
            lsr a
            lsr a
            sta wR0

            lda $7F8410
            clc
            adc #10
            asl a
            clc
            adc wR0
            tax

            lda #$3920
            sta wR5
            lda #1
            sta wR6

            pla
            jsl rlDrawMenuTextNumber

            lda $7F8410
            inc a
            sta $7F8410
            cmp #8
            bne _InnerLoop

          lda $7F8412
          inc a
          inc a
          sta $7F8412
          cmp #11 *2
          bne _OuterLoop

        lda #0
        sta $7F8412

          -
          tax
          lda $7E4F86,x
          and #$00FF
          pha

          lda $7F8412
          clc
          adc #5
          and #$00FF
          xba
          lsr a
          lsr a
          clc
          adc #40
          tax
          lda #$3920
          sta wR5
          lda #3
          sta wR6

          pla
          jsl rlDrawMenuTextNumber

          lda $7F8412
          inc a
          inc a
          sta $7F8412
          cmp #11 *2
          bne -

        rts

        .databank 0

      aDebugCombatRoundFlagMasks1 ; 89/E4D4

        .word $0080
        .word $0040
        .word $0020
        .word $0010
        .word $0008
        .word $0004
        .word $0002
        .word $0001

      aDebugCombatFlagsTitleText1 ; 89/E4E4
        .text "シーケンス１　　　ＥＭＴＤＤＣＡＴ　　Ｄ／Ｒ\n"

      rsDebugMenuTab3Page6 ; 89/E512

        .al
        .autsiz
        .databank ?

        lda #$3000
        sta aCurrentTilemapInfo.wBaseTile,b

        lda #(`aDebugCombatFlagsTitleText2)<<8
        sta lR18+1
        lda #<>aDebugCombatFlagsTitleText2
        sta lR18
        ldx #pack([1, 3])
        jsl rlDrawMenuTextLine

        lda #0
        sta $7F8412

          _OuterLoop
          lda #0
          sta $7F8410
          lda $7F8412
          tax
          lda $7E4F9B,x
          sta $7F8414
          
            _InnerLoop
            lda $7F8410
            asl a
            tax
            lda $7F8414
            and aDebugCombatRoundFlagMasks2,x
            beq +

              lda #1

            +
            pha

            lda $7F8412
            clc
            adc #5
            and #$00FF
            xba
            lsr a
            lsr a
            sta wR0
            lda $7F8410
            clc
            adc #10
            asl a
            clc
            adc wR0
            tax

            lda #$3920
            sta wR5
            lda #1
            sta wR6

            pla
            jsl rlDrawMenuTextNumber

            lda $7F8410
            inc a
            sta $7F8410
            cmp #8
            bne _InnerLoop

          lda $7F8412
          inc a
          inc a
          sta $7F8412
          cmp #11 *2
          bne _OuterLoop

        lda #0
        sta $7F8412

          -
          tax
          lda $7E4F9C,x
          and #$00FF
          pha

          lda $7F8412
          clc
          adc #5
          and #$00FF
          xba
          lsr a
          lsr a
          clc
          adc #40
          tax

          lda #$3920
          sta wR5
          lda #3
          sta wR6
          
          pla
          jsl rlDrawMenuTextNumber

          lda $7F8412
          inc a
          inc a
          sta $7F8412
          cmp #11 *2
          bne -

        rts

        .databank 0

      aDebugCombatFlagsTitleText2 ; 89/E5E3
        .text "シーケンス２　　　ＥＭＴＤＤＣＡＴ　　Ｄ／Ｒ\n"

      aDebugCombatRoundFlagMasks2 ; 89/E611

        .word $0080
        .word $0040
        .word $0020
        .word $0010
        .word $0008
        .word $0004
        .word $0002
        .word $0001

      rsDebugMenuTab3Page7 ; 89/E621

        .al
        .autsiz
        .databank ?

        lda #$3000
        sta aCurrentTilemapInfo.wBaseTile,b

        lda #(`aDebugCombatFlagsTitleText3)<<8
        sta lR18+1
        lda #<>aDebugCombatFlagsTitleText3
        sta lR18
        ldx #pack([1, 3])
        jsl rlDrawMenuTextLine

        lda #$3800
        sta aCurrentTilemapInfo.wBaseTile,b

        lda #0
        sta $7F8412
        
          _OuterLoop
          lda #0
          sta $7F8410
          lda $7F8412
          tax
          lda $7E4FB1,x
          sta $7F8414
          
            _InnerLoop
            lda $7F8410
            asl a
            tax
            lda $7F8414
            and aDebugCombatRoundFlagMasks3,x
            beq +

              lda #1

            +
            pha

            lda $7F8412
            clc
            adc #5
            and #$00FF
            xba
            lsr a
            lsr a
            sta wR0
            lda $7F8410
            clc
            adc #10
            asl a
            clc
            adc wR0
            tax

            lda #$3920
            sta wR5
            lda #1
            sta wR6

            pla
            jsl rlDrawMenuTextNumber

            lda $7F8410
            inc a
            sta $7F8410
            cmp #8
            bne _InnerLoop

          lda $7F8412
          inc a
          inc a
          sta $7F8412
          cmp #10 *2
          bne _OuterLoop

        lda #0
        sta $7F8412
        
          -
          tax
          lda $7E4FB2,x
          and #$00FF
          pha

          lda $7F8412
          clc
          adc #5
          and #$00FF
          xba
          lsr a
          lsr a
          clc
          adc #40
          tax

          lda #$3920
          sta wR5
          lda #3
          sta wR6

          pla
          jsl rlDrawMenuTextNumber

          lda $7F8412
          inc a
          inc a
          sta $7F8412
          cmp #10 *2
          bne -

        rts

        .databank 0

      aDebugCombatRoundFlagMasks3 ; 89/E6F8

        .word $0080
        .word $0040
        .word $0020
        .word $0010
        .word $0008
        .word $0004
        .word $0002
        .word $0001

      aDebugCombatFlagsTitleText3 ; 89/E708
        .text "シーケンス３　　　ＥＭＴＤＤＣＡＴ　　Ｄ／Ｒ\n"

      rsDebugMenuTab3Page8 ; 89/E736

        .al
        .autsiz
        .databank ?

        rts

        .databank 0

      rsDebugMenuTab4 ; 89/E737

        .al
        .autsiz
        .databank ?

        lda #$2000
        sta aCurrentTilemapInfo.wBaseTile,b

        lda #(`aDebugSoundMenuText)<<8
        sta lR18+1
        lda #<>aDebugSoundMenuText
        sta lR18
        ldx #pack([10, 3])
        jsl rlDrawMenuTextLine

        lda $7F8408
        ldx #$3520
        stx wR5
        ldx #3
        stx wR6
        ldx #pack([2, 2])
        jsl rlDrawMenuTextNumber
        rts

        .databank 0

      aDebugSoundMenuText ; 89/E764
        .text "サウンドモード\n"

      rsDebugDrawCursorSpriteAndCoordinates ; 89/E774

        .al
        .autsiz
        .databank ?

        lda $7F840A
        sta wR0
        lda $7F840C
        clc
        adc #4
        sta wR1
        lda #1
        jsl $88A704

        lda $7F840A
        lsr a
        lsr a
        lsr a
        inc a
        ldx #$3120
        stx wR5
        ldx #3
        stx wR6
        ldx #$00B2
        jsl rlDrawMenuTextNumber

        lda $7F840C
        lsr a
        lsr a
        lsr a
        ldx #$3120
        stx wR5
        ldx #3
        stx wR6
        ldx #$00B8
        jsl rlDrawMenuTextNumber
        rts

        .databank 0

      rlUnknown89E7BD ; 89/E7BD

        .al
        .autsiz
        .databank ?

        inc $0302,b
        jsr rlDrawDebugMenu

        sep #$20
        lda #INIDISP_Setting(false, 15)
        sta bBufferINIDISP
        rep #$20
        rtl

        .databank 0

      rlDebugMenuPageInputHandler ; 89/E7CC

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        lda $0304,b
        cmp #4
        bmi +

          -
          bra -

        +
        asl a
        tax
        jsr (aDebugMenuInputRoutines,x)
        plp
        plb
        rtl

        .databank 0

      aDebugMenuInputRoutines ; 89/E7E2

        .addr rsDebugMenuTab1PageInputHandler
        .addr rsDebugMenuTab2PageInputHandler
        .addr rsDebugMenuTab3PageInputHandler
        .addr rsDebugMenuTab4PageInputHandler

      rlDebugMenuTabInputHandler ; 89/E7EA

        .al
        .autsiz
        .databank ?

        jsl rlDMAByStruct

          .dstruct structDMAToVRAM, aBG3TilemapBuffer, $0700, $80, $E000

        lda wJoy1New
        bit #JOY_B
        bne +

        bit #JOY_Start
        bne _E84B

        rtl

        +
        lda #6
        jsl $808FAD

        sep #$20
        lda #INIDISP_Setting(true, 0)
        sta bBufferINIDISP
        rep #$20

        lda $0304,b
        cmp #0
        beq ++

        cmp #1
        beq +

        cmp #2
        beq +

        +
        lda #0
        sta $0304,b
        lda #1
        sta $0D77,b
        lda #$B122
        sta wMainLoopPointer
        rtl

        +
        lda #0
        sta $0304,b
        lda $7F8404
        sta $7F8183
        lda #$BBD9
        sta wMainLoopPointer
        rtl
        
        _E84B
        lda #6
        jsl $808FAD
        lda $0304,b
        inc a
        cmp #4
        bne +

          lda #0

        +
        sta $0304,b
        lda #0
        sta $7F8402
        jsl $8BB45D
        jsr rlDrawDebugMenu
        rtl

        .databank 0

      rsDebugMenuTab1PageInputHandler ; 89/E870

        .al
        .autsiz
        .databank ?

        lda wJoy1Repeated
        bit #JOY_Right
        bne _RightPress

        bit #JOY_Left
        bne _LeftPress

        rts

        _RightPress
        lda $7F8402
        inc a
        cmp #8
        bne +

          lda #7

        +
        sta $7F8402
        jsr rlDrawDebugMenu
        rts

        _LeftPress
        lda $7F8402
        dec a
        bpl +

          lda #0

        +
        sta $7F8402
        jsr rlDrawDebugMenu
        rts

        .databank 0

      rsDebugMenuTab2PageInputHandler ; 89/E8A4

        .al
        .autsiz
        .databank ?

        lda wJoy1Repeated
        bit #JOY_Right
        bne _RightPress

        bit #JOY_Left
        bne _LeftPress

        rts

        _RightPress
        lda $7F8402
        inc a
        cmp #7
        bne +

          lda #6

        +
        sta $7F8402
        jsr rlDrawDebugMenu

        rts

        _LeftPress
        lda $7F8402
        dec a
        bpl +

          lda #0

        +
        sta $7F8402
        jsr rlDrawDebugMenu
        rts

        .databank 0

      rsDebugMenuTab3PageInputHandler ; 89/E8D8

        .al
        .autsiz
        .databank ?

        jsr rsDebugDrawCursorSpriteAndCoordinates

        lda wJoy1Repeated
        ora wJoy2Repeated
        bit #JOY_R
        bne _RPress

        bit #JOY_L
        bne _LPress

        bit #JOY_X
        bne _XPress

        bit #JOY_Y
        bne _YPress

        bit #JOY_Directions
        bne _DirectionalInput

        rts

        _YPress
        jml _E974

        _RPress
        lda $7F8402
        inc a
        cmp #7
        bne +

          lda #6

        +
        sta $7F8402
        jsr rlDrawDebugMenu
        rts

        _LPress
        lda $7F8402
        dec a
        bpl +

          lda #0

        +
        sta $7F8402
        jsr rlDrawDebugMenu
        rts

        _DirectionalInput
        lda wJoy1Repeated+1
        ora wJoy2Repeated+1
        and #(JOY_Right | JOY_Left)>>8
        asl a
        tax
        lda aDebugRightLeftCoordinateInputs,x
        clc
        adc $7F840A
        sta $7F840A

        lda wJoy1Repeated+1
        ora wJoy2Repeated+1
        and #(JOY_Down | JOY_Up)>>8
        lsr a
        tax
        lda aDebugUpDownCoordinateInputs,x
        clc
        adc $7F840C
        sta $7F840C
        rts

        ; not sure what these were supposed to do, the regs here get clobbered
        ; by the drawing routine
        _XPress
        lda $7F840A
        lsr a
        lsr a
        lsr a
        inc a
        sta wR0

        lda $7F840C
        lsr a
        lsr a
        lsr a
        sta wR1

        lda $7F8402
        inc a
        sta wR2
        lda #1
        sta wR3
        jsr rlDrawDebugMenu
        rts

        _E974
        lda $7F840A
        lsr a
        lsr a
        lsr a
        inc a
        sta wR0

        lda $7F840C
        lsr a
        lsr a
        lsr a
        sta wR1

        lda $7F8402
        inc a
        sta wR2
        lda #$FFFF
        sta wR3
        jsr rlDrawDebugMenu
        rts

        .databank 0

      aDebugRightLeftCoordinateInputs ; 89/E997

        .word $0000
        .word $0008
        .word $FFF8
        .word $0000

      aDebugUpDownCoordinateInputs ; 89/E99F

        .word $0000
        .word $0008
        .word $FFF8
        .word $0000

      rsDebugMenuTab4PageInputHandler ; 89/E9A7

        .al
        .autsiz
        .databank ?

        lda wJoy1Repeated
        bit #JOY_Up
        bne _UpPress

        bit #JOY_Down
        bne _DownPress

        lda wJoy1New
        bit #JOY_A
        bne _APress

        bit #JOY_X
        bne _XPress

        bit #JOY_Y
        bne _YPress

        rts

        _UpPress
        lda $7F8408
        cmp #137
        beq +

          inc a
          sta $7F8408
          jsr rlDrawDebugMenu
          lda #6
          jsl $808FAD

        + 
        rts

        _DownPress
        lda $7F8408
        dec a
        bmi +

          sta $7F8408
          jsr rlDrawDebugMenu
          lda #6
          jsl $808FAD

        +
        rts

        ; Start song
        _APress
        lda $7F8408
        asl a
        tax
        lda aDebugSongList,x
        sta $04BA,b
        rts

        ; Stop song
        _XPress
        lda #$00C0
        jsl $808F6F
        rts

        ; Fade out and pause song, some can be continued with A
        _YPress
        lda #$00E0
        jsl $808F6F
        rts

        .databank 0

      aDebugSongList ; 89/EA12

        .word $0011
        .word $0013
        .word $002C
        .word $001C
        .word $0014
        .word $002B
        .word $0012
        .word $0018
        .word $001E
        .word $0024
        .word $001B
        .word $002D
        .word $002E
        .word $0020
        .word $0021
        .word $0022
        .word $0023
        .word $001F
        .word $0025
        .word $0026
        .word $0027
        .word $0028
        .word $0029
        .word $0019
        .word $0017
        .word $001D
        .word $002A
        .word $0031
        .word $0032
        .word $0033
        .word $0034
        .word $0035
        .word $0036
        .word $003E
        .word $003A
        .word $0037
        .word $0038
        .word $0039
        .word $003F
        .word $0040
        .word $003B
        .word $003C
        .word $003D
        .word $0041
        .word $0042
        .word $0043
        .word $0044
        .word $0045
        .word $0046
        .word $004F
        .word $004A
        .word $0047
        .word $0048
        .word $0049
        .word $004D
        .word $004E
        .word $0004
        .word $004B
        .word $006B
        .word $0066
        .word $0068
        .word $0076
        .word $007C
        .word $007D
        .word $0077
        .word $0062
        .word $0073
        .word $0055
        .word $0056
        .word $0070
        .word $006C
        .word $0063
        .word $0085
        .word $0000
        .word $005B
        .word $0000
        .word $007B
        .word $0075
        .word $0051
        .word $006F
        .word $0064
        .word $0058
        .word $0069
        .word $0081
        .word $006A
        .word $0054
        .word $0074
        .word $005D
        .word $0060
        .word $0006
        .word $0053
        .word $005F
        .word $007B
        .word $007A
        .word $0082
        .word $0083
        .word $0084
        .word $0086
        .word $0087
        .word $0088
        .word $006D
        .word $006E
        .word $0089
        .word $008A
        .word $008B
        .word $008C
        .word $0057
        .word $0071
        .word $0001
        .word $0002
        .word $0003
        .word $0000
        .word $005E
        .word $0061
        .word $005C
        .word $0059
        .word $001A
        .word $008D
        .word $0052
        .word $0078
        .word $000B
        .word $000F
        .word $000D
        .word $000C
        .word $000E
        .word $0091
        .word $0092
        .word $0093
        .word $0094
        .word $0095
        .word $0096
        .word $0097
        .word $0098
        .word $0099
        .word $009A
        .word $0000
        .word $0000
        .word $0000

      ; 89/EB26

    .here

