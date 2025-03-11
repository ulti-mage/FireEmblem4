


      rlUnknown869D1B ; 86/9D1B

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb

        lda #$0020
        tsb bUnknown000E7B,b

        lda $0302,b
        cmp #18
        bne +

          lda $0304,b
          cmp #5
          beq +

            cmp #3
            beq +

              lda wUnknown00171A,b
              bne +

                lda $0D79,b
                bit #$0080
                bne +

                  lda bUnknown000E7B,b
                  bit #$0080
                  bne +

                    bit #$0040
                    beq +

                      lda wAIEngineCycleType,b
                      asl a
                      tax
                      jsr (aAIEngineCycleRoutines,x)

        +
        lda #($0010 | $0020)
        trb bUnknown000E7B,b

        plp
        plb
        rtl

        .databank 0

      aAIEngineCycleRoutines ; 86/9D65

        .word <>rsAIEngineSetupCycle
        .word <>rsAIEngineTargetListCycle
        .word <>rsAIEngineCycle2 ; build ally list
        .word <>rsAIEngineCycle3 ; builds distance map to target tile
        .word <>rsAIEngineCycle4 ; sets destination tile of all allies with same AI?
        .word <>rsAIEngineCycle5 ; gets best move tile?
        .word <>rsAIEngineCycle6 ; waits for movement to finish
        .word <>rsAIEngineNextCycle

      rsAIEngineSetupCycle ; 86/9D75

        .al
        .autsiz
        .databank ?

        lda wActiveFactionSlot,b
        sta wAIActiveFaction,b
        lda #1
        sta wAICurrentAISetting,b

        inc wAIEngineCycleType,b
        rts

        .databank 0

      rsAIEngineTargetListCycle ; 86/9D85

        .al
        .autsiz
        .databank ?

        lda #$0010
        tsb bUnknown000E7B,b

        jsl rlBuildAITargetList

        inc wAIEngineCycleType,b
        rts

        .databank 0

      rsAIEngineCycle2 ; 86/9D93

        .al
        .autsiz
        .databank ?

        lda #$0010
        tsb bUnknown000E7B,b

        jsl rlFillAllyUnitMap
        jsl rlFillFoeUnitMap

        ; This loop builds unit lists out of matching group AIs and runs their
        ; AI scripts, set in the chapter event data.

        _Loop
        lda #0
        sta wAICurrentAIUnitCounter,b
        sta wAISelectedAIUnitOffset,b
        sta wAIUnknownBitfield7E2000
        sta wAIUnknown7E2002

        lda wAICurrentAISetting,b
        jsl rlBuildAIUnitList

        lda wAIUnitCounter
        beq +

          lda wAICurrentAISetting,b
          jsl rlGetFactionGroupDataGroupAIScript

          lda lAITemp000E90,b
          ora lAITemp000E90+1,b
          beq +

            jsl rlAICheckIfAnyFoeInAlliesThreatRange
            jsl rlRunAIScript

            lda wAIUnknown7E201A
            bne ++

        +
        inc wAICurrentAISetting,b

        lda wAICurrentAISetting,b
        cmp #9
        bcc _Loop
        bra ++

        +
        inc wAIEngineCycleType,b
        rts

        +
        lda #$0020
        tsb $0D87,b

        lda #7
        sta wAIEngineCycleType,b
        rts

        .databank 0

      rsAIEngineCycle3 ; 86/9DFA

        .al
        .autsiz
        .databank ?

        lda #$0010
        tsb bUnknown000E7B,b

        ; If any target is within threat range:
        ; Either update wAIUnknown7E2002 with 2 if its 1, or leave it be.

        jsl rlUnknown86AF39

        jsl rlUnknown86B018

        inc wAIEngineCycleType,b
        rts

        .databank 0

      rsAIEngineCycle4 ; 86/9E0C

        .al
        .autsiz
        .databank ?

        lda #$0010
        tsb bUnknown000E7B,b

        lda $086F,b
        bne _End

          lda #$0002
          trb bUnknown000E7B,b

          lda wAIUnknownBitfield7E2000
          bit #$0001
          bne +

            jsl rlUnknown87DB37
            bra _9E3F
          
          +
          lda wAIUnknown7E201A
          cmp #6
          bne +

            jsl rlUnknown87DBD2
            bcs _9E49
          
          +
          jsl rlSetTargetPositionForAIGroupMembers

          _9E3F
          lda #$0080
          tsb $0D79,b

          inc wAIEngineCycleType,b

        _End
        rts

        _9E49
        jsr rsUnknown869F2A
        bra _End

        .databank 0

      rsAIEngineCycle5 ; 86/9E4E

        .al
        .autsiz
        .databank ?

        php

        lda #$0010
        tsb bUnknown000E7B,b

        jsl rlCheckIfAIUnitCanAct
        bcs +

          jsl rlFillAllyUnitMap
          jsl rlFillFoeUnitMap
          jsl rlUnknown86B129

        +
        inc wAIEngineCycleType,b
        plp 
        rts

        .databank 0

      rsAIEngineCycle6 ; 86/9E6C

        .al
        .autsiz
        .databank ?

        lda $086F,b
        bne _End

          jsr rsUnknown869EC9
          bcs _End

            jsl rlCheckIfAIUnitCanAct
            bcs +

              jsl rlGetSelectedUnitStates
              bit #UnitStateCanto
              bne _9EBD

            +
            lda wAIUnknownBitfield7E2000
            bit #$0040
            beq +

              ; group leader is fielded
              and #~$40
              sta wAIUnknownBitfield7E2000
              lda #0
              sta wAICurrentAIUnitCounter,b
              sta wAISelectedAIUnitOffset,b
              bra ++

            +
            lda wAICurrentAIUnitCounter,b
            inc a
            cmp wAIUnitCounter
            bcs _9EC4

            lda wAISelectedAIUnitOffset,b
            clc
            adc #size(structAIUnitEntry)
            sta wAISelectedAIUnitOffset,b

            inc wAICurrentAIUnitCounter,b

            +
            lda #$0080
            trb $0D79,b

            _9EBD
            lda #5
            sta wAIEngineCycleType,b
        
        _End
        rts
        
        _9EC4
        jsr rsUnknown869F2A
        bra _End

        .databank 0

      rsUnknown869EC9 ; 86/9EC9

        .al
        .autsiz
        .databank ?

        lda wAIUnknown000E8E,b
        cmp #2
        bne _CLC

          lda $0580,b
          beq _CLC

            sta $0590,b
            jsl rlCheckIfCastleGuarded
            bcs _CLC

              jsl $87ECFD
              sta $0E88,b
              asl a
              asl a
              asl a
              asl a
              sta $0875,b

              jsl rlGetEventLocationEntryEffectiveYCoordinate
              sta $0E8A,b
              asl a
              asl a
              asl a
              asl a
              sta $0877,b

              ldx wAISelectedAIUnitOffset,b
              lda aAIUnitList.DeploymentOffset,x
              and #$00FF
              sta $0871,b
              lda #4
              sta $0E8E,b
              sta $0879,b
              lda #$FFFF
              sta $0E8C,b
              sta $0873,b
              lda #$FFFF
              sta $086F,b
              lda #$0001
              tsb bUnknown000E7B,b
              sec
              rts
        
        _CLC
        clc
        rts

        .databank 0

      rsUnknown869F2A ; 86/9F2A

        .al
        .autsiz
        .databank ?

        inc wAICurrentAISetting,b

        lda #2
        sta $0E7C,b
        rts

        .databank 0

      rsAIEngineNextCycle ; 86/9F34

        .al
        .autsiz
        .databank ?

        rts

        .databank 0

      rlUnknown869F35 ; 86/9F35

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #$7F
        pha
        rep #$20
        plb

        phx
        lda wSelectedUnitDataRAMPointer
        pha
        lda wCurrentItemDataROMPointer
        pha

        lda #63
        sta aAIAction.wMapWidth,b

        lda wCurrentChapter
        bne +

        lda #31
        bra ++

        +
        lda #63

        +
        sta aAIAction.wMapHeight,b

        lda aAIAction.wTargetXPosition,b
        sta aAIAction.wAttackTileXPosition,b

        lda aAIAction.wTargetYPosition,b
        clc
        adc aAIAction.wMinimumAttackRange,b
        sta aAIAction.wAttackTileYPosition,b

        lda aAIAction.wTargetYPosition,b
        clc
        adc aAIAction.wMinimumAttackRange,b
        xba
        lsr a
        lsr a
        clc
        adc aAIAction.wTargetXPosition,b
        sta aAIAction.wAttackMapTileIndex,b

        lda aAIAction.wUnknown7F4402,b
        asl a
        tax
        lda aUnknown86A035,x
        sta lAITemp000E93

        ; Keep track of the max - min range.
        ; Eg for weapons with only 1 specified range, like an iron sword 
        ; or bow, it only needs to check all directions once.
        ; For a weapon with different ranges like a javelin, it needs to check
        ; all directions at 2 range, and then all directions at 1 range.

        lda aAIAction.wMaximumAttackRange,b
        sec
        sbc aAIAction.wMinimumAttackRange,b
        bcs +

          jml _End

        +
        sta aAIAction.wMaximumAttackRange,b

        _AdditionalRangeLoop
        lda #3
        sta aAIAction.wAttackDirection,b

          ; Here it sets up a counter for additional tiles in the 
          ; modified direction to check. For a sword, after checking down
          ; the next thing to check would be left, so no additional tiles
          ; are needed. For a bow though, after checking down, we also
          ; need to check an additional tile in the bottom left before
          ; advancing to the left check. Weapons with min 3 range need
          ; to check 2 additional tiles, etc.

          _DirectionLoop
          lda aAIAction.wMinimumAttackRange,b
          dec a
          sta aAIAction.wAdditionalAttackDirections,b

          lda aAIAction.wAttackDirection,b
          asl a
          tax
          lda aAttackMapTileIndexModifiers,x
          sta aAIAction.wAttackMapTileIndexModifier,b
          lda aAttackTileXPositionModifiers,x
          sta aAIAction.wAttackTileXPositionModifier,b
          lda aAttackTileYPositionModifiers,x
          sta aAIAction.wAttackTileYPositionModifier,b

            ; Check if attack tile is within the map boundaries
            _DirectionCounterLoop
            lda aAIAction.wAttackTileXPosition,b
            cmp #1
            bmi +

              cmp aAIAction.wMapWidth,b
              bpl +

                lda aAIAction.wAttackTileYPosition,b
                cmp #1
                bmi +

                  cmp aAIAction.wMapHeight,b
                  bpl +

                    pea #<>(+)-1
                    jmp (lAITemp000E93)

            +
            lda aAIAction.wAttackTileXPosition,b
            clc
            adc aAIAction.wAttackTileXPositionModifier,b
            sta aAIAction.wAttackTileXPosition,b

            lda aAIAction.wAttackTileYPosition,b
            clc
            adc aAIAction.wAttackTileYPositionModifier,b
            sta aAIAction.wAttackTileYPosition,b

            lda aAIAction.wAttackMapTileIndex,b
            clc
            adc aAIAction.wAttackMapTileIndexModifier,b
            sta aAIAction.wAttackMapTileIndex,b

            dec aAIAction.wAdditionalAttackDirections,b
            bpl _DirectionCounterLoop

          dec aAIAction.wAttackDirection,b
          bpl _DirectionLoop

        lda aAIAction.wAttackMapTileIndex,b
        clc
        adc #64
        sta aAIAction.wAttackMapTileIndex,b

        inc aAIAction.wAttackTileYPosition,b
        inc aAIAction.wMinimumAttackRange,b

        dec aAIAction.wMaximumAttackRange,b
        bmi _End

          jml _AdditionalRangeLoop

        _End
        pla
        sta wCurrentItemDataROMPointer
        pla
        sta wSelectedUnitDataRAMPointer
        plx
        plp
        plb
        rtl

        .databank 0

      aUnknown86A035 ; 86/A035

        .word <>rsUnknown86A092
        .word <>rsUnknown86A126
        .word <>rsUnknown86A174

      aAttackMapTileIndexModifiers ; 86/A03B

        ; 1st attack is always down from target
        ; Then bottom left of target

        .sint  64 - 1
        .sint  64 + 1
        .sint -64 + 1
        .sint -64 - 1

      aAttackTileXPositionModifiers ; 86/A043

        .sint -1
        .sint  1
        .sint  1
        .sint -1

      aAttackTileYPositionModifiers ; 86/A04B

        .sint  1
        .sint  1
        .sint -1
        .sint -1

      rsAICheckIfAttackTileOccupied ; 86/A053

        .al
        .autsiz
        .databank ?

        ; Output:
        ; CLC if tile free, SEC if occupied
        ; A = movement cost of the attack tile

        ; Check if unit already on attack tile

        ldx aAIAction.wAttackMapTileIndex,b
        lda aUnitMap,b,x
        and #$00FF
        cmp aAIAction.wUntDeploymentOffset,b
        beq _CLC

          ; Check if tile is blocked by anyone else
          cmp #$00FF
          bne _SEC

            ; Attack tile isnt occupied
            lda aAIAction.wAttackMapTileIndex,b
            asl a
            tax
            lda aMapData,x
            and #$03FF
            tax
            lda aTerrainTileset,x
            and #$00FF
            sta aAIAction.wAttackTileTerrainType,b
            clc
            adc aAIAction.wUnitMovementCostPointer,b
            tax
            lda $830000,x
            and #$00FF
            cmp #$007F
            bcs _SEC

        _CLC
        clc
        rts

        _SEC
        sec
        rts

        .databank 0

      rsUnknown86A092 ; 86/A092

        .al
        .autsiz
        .databank ?

        jsr rsAICheckIfAttackTileIsValid
        bcc +

          jsr rsCheckIfUnitOnAttackTile
          bcc +

            jsr rsAICalculateAttackChanceIfFoeSilencable
            bcc +

              jsr rsAICheckIfNewBestTarget
              bcc +

                lda #8
                sta $4440,b

        +
        rts

        .databank 0

      rsAICalculateAttackChanceIfFoeSilencable ; 86/A0AD

        .al
        .autsiz
        .databank ?

        lda wSelectedUnitDataRAMPointer
        pha

        ldx aAIAction.wTargetDeploymentOffset,b
        lda aDeploymentTable._UnitRAMPointer,x
        sta wSelectedUnitDataRAMPointer
        jsl rlGetSelectedUnitStatus
        cmp #StatusSilence
        bcs _CLC

          jsl rlGetSelectedUnitTotalResistance
          sta aAIAction.wTempValue,b
          jsl rlGetFirstWeaponBattleMight
          sta aAIAction.wTargetsBattleMight,b

          ldx aAIAction.wUntDeploymentOffset,b
          lda aDeploymentTable._UnitRAMPointer,x
          sta wSelectedUnitDataRAMPointer

          lda wAISelectedAITargetOffset
          tax
          jsl rlGetSelectedUnitTotalMagic
          sep #$20
          cmp aAIAction.wTempValue,b
          rep #$20
          beq _CLC
          bcc _CLC

            phx
            jsr rsAIGetAttackTileThreatValue
            sta aAIAction.wAttackTileThreatValue,b
            jsr rsAIGetUnitDistanceToAttackTile
            sta aAIAction.wUnitToAttackTileDistance,b
            plx

            lda aAIAction.wTargetsBattleMight,b
            and #$00FF
            sta wExpectedTakenDamage,b

            lda #300
            clc
            adc wExpectedTakenDamage,b
            sec
            sbc aAIAction.wAttackTileThreatValue,b
            sta aAIAction.wAttackChance,b

            pla
            sta wSelectedUnitDataRAMPointer
            sec
            rts

        _CLC
        pla
        sta wSelectedUnitDataRAMPointer
        clc
        rts

        .databank 0

      rsUnknown86A126 ; 86/A126

        .al
        .autsiz
        .databank ?

        jsr rsAICheckIfAttackTileIsValid
        bcc +

          jsr rsAICheckIfAttackTileReachableByUnit
          bcc +

            jsr rsAICalculateAttackChanceIfFoeInjured
            bcc +

              jsr rsAICheckIfNewBestTarget
              bcc +

                lda #14
                sta $4440,b

        +
        rts

        .databank 0

      rsAICalculateAttackChanceIfFoeInjured ; 86/A141

        .al
        .autsiz
        .databank ?

        ; Output:
        ; CLC if foe at full HP, SEC if injured

        jsr rsAIGetUnitDistanceToAttackTile
        sta aAIAction.wUnitToAttackTileDistance,b

        lda #$C000
        sta aAIAction.wAttackChance,b

        jsr rsAIGetAttackTileThreatValue
        sta aAIAction.wAttackTileThreatValue,b

        ldx aAIAction.wTargetDeploymentOffset,b
        jsl rlAIGetMissingHPRatio
        ora #0
        beq _CLC

          sta aAIAction.wTargetHPBonus,b

          lda #500
          clc
          adc aAIAction.wTargetHPBonus,b
          sec
          sbc aAIAction.wAttackTileThreatValue,b
          sta aAIAction.wAttackChance,b

          sec
          rts

        _CLC
        clc
        rts

        .databank 0

      rsUnknown86A174 ; 86/A174

        .al
        .autsiz
        .databank ?

        jsr rsAICheckIfAttackTileIsValid
        bcc +

          lda aAIAction.wUnknown7F4448,b
          asl a
          tax
          jsr (aUnknown86A18F,x)
          bcc +

            jsr rsAICheckIfNewBestTarget
            bcc +

              lda #1
              sta $4440,b

        +
        rts

        .databank 0

      aUnknown86A18F ; 86/A18F

        .word <>rsUnknown86A1A1 ; AttackTypeIntimidate
        .word <>rsUnknown86A1CD ; AttackTypeReachable
        .word <>rsUnknown86A1D1 ; AttackTypeRegular
        .word <>rsUnknown86A1DF ; AttackTypeAlways
        .word <>rsUnknown86A1E1 ; AttackTypeCautious
        .word <>rsUnknown86A221 ; AttackTypeDefendingCastle
        .word <>rsUnknown86A1DF ; AttackTypeAlways
        .word <>rsUnknown86A1D1 ; AttackTypeRegular
        .word <>rsUnknown86A1D1 ; AttackTypeRegular

      rsUnknown86A1A1 ; 86/A1A1

        .al
        .autsiz
        .databank ?

        ; AttackTypeIntimidate

        ; Can be intimidated? Charge if far away from foe, may not attack if close by?

        ; Tile needs to be reachable
        ; Expected inflicted damage > 0
        ; Units HP/2 + turn/2 >= taken damage
        ; Nobody in groups threat range > charge, else
        ; something with move distance?

        jsr rsAICheckIfAttackTileReachableByUnit
        bcc _CLC

          jsr rsAICalculateAttackChance
          bcc _CLC

            lda aAIAction.wUnitCurrentHP,b
            lsr a
            clc
            adc aAIAction.wTurnValue,b
            cmp aAIAction.wExpectedTakenDamage,b
            bcc _CLC

              lda wAIUnknownBitfield7E2000
              bit #$0004
              beq _SEC

                lda aAIAction.wMovementDistanceToTarget,b
                cmp aAIAction.wUnknown7F445C,b
                bcc _CLC

              _SEC
              sec
              rts
        
        _CLC
        clc
        rts

        .databank 0

      rsUnknown86A1CD ; 86/A1CD

        .al
        .autsiz
        .databank ?

        ; AttackTypeReachable

        ; Tile just needs to be reachable

        jsr rsAICheckIfAttackTileReachableByUnit
        rts

        .databank 0

      rsUnknown86A1D1 ; 86/A1D1

        .al
        .autsiz
        .databank ?

        ; AttackTypeRegular

        ; Tile needs to be reachable
        ; Expected inflicted damage > 0

        jsr rsAICheckIfAttackTileReachableByUnit
        bcc +

          jsr rsAICalculateAttackChance
          bcc +

            sec
            rts

        +
        clc
        rts

        .databank 0

      rsUnknown86A1DF ; 86/A1DF

        .al
        .autsiz
        .databank ?

        ; AttackTypeAlways

        clc
        rts

        .databank 0

      rsUnknown86A1E1 ; 86/A1E1

        .al
        .autsiz
        .databank ?

        ; AttackTypeCautious

        ; Tile needs to be reachable
        ; Expected inflicted damage > 0
        ; Units HP - 5 + turn/2 >= taken damge
        ; Inflicted Dmg/2 + turn/2 >= taken damge
        ; current HP *3 >= threat value

        jsr rsAICheckIfAttackTileReachableByUnit
        bcc _CLC

          jsr rsAICalculateAttackChance
          bcc _CLC

            lda aAIAction.wUnitCurrentHP,b
            sec
            sbc #5
            clc
            adc aAIAction.wTurnValue,b
            cmp aAIAction.wExpectedTakenDamage,b
            bcc _CLC

              lda aAIAction.wExpectedInflictedDamage,b
              lsr a
              eor #$FFFF
              inc a
              clc
              adc aAIAction.wExpectedInflictedDamage,b
              clc
              adc aAIAction.wTurnValue,b
              cmp aAIAction.wExpectedTakenDamage,b
              bcc _CLC

                lda aAIAction.wUnitCurrentHP,b
                asl a
                clc
                adc aAIAction.wUnitCurrentHP,b
                cmp aAIAction.wAttackTileThreatValue,b
                bcc _CLC

                  sec
                  rts

        _CLC
        clc
        rts

        .databank 0

      rsUnknown86A221 ; 86/A221

        .al
        .autsiz
        .databank ?

        ; AttackTypeDefendingCastle

        ; Tile needs to be reachable
        ; Expected inflicted damage > 0

        jsr rsCheckIfUnitOnAttackTile
        bcc +

          jsr rsAICalculateAttackChance
          bcc +

            sec
            rts

        +
        clc
        rts

        .databank 0

      rsAICheckIfAttackTileReachableByUnit ; 86/A22F

        .al
        .autsiz
        .databank ?

        ldx aAIAction.wAttackMapTileIndex,b
        lda aMovementMap,b,x
        and #$00FF
        beq +

          sec
          rts

        +
        clc
        rts

        .databank 0

      rsCheckIfUnitOnAttackTile ; 86/A23E

        .al
        .autsiz
        .databank ?

        jsr rsAIGetUnitDistanceToAttackTile
        bne +

          sec
          rts

        +
        clc
        rts

        .databank 0

      rsAICheckIfAttackTileIsValid ; 86/A247

        .al
        .autsiz
        .databank ?

        jsr rsAICheckIfAttackTileOccupied
        bcs _CLC

          ; Tile is free
          lda aAIAction.wAttackTileTerrainType,b
          cmp #TerrainCastleGate
          beq _CLC

            sec
            rts

        _CLC
        clc
        rts

        .databank 0

      rsAICheckIfNewBestTarget ; 86/A258

        .al
        .autsiz
        .databank ?

        ; SEC = target new unit, CLC not

        ; Check if the prior attack chance is the default value, if yes branch
        lda aAIAction.wBestAttackChance,b
        cmp #$C000
        beq +

          ; If a RN is equal or higher than the leadership power and an even value,
          ; Write the current attack chance over the best one, even if it makes it worse

          jsl rlGetRandomNumber
          cmp aAIAction.wLeadershipPower,b
          bcc +

            lsr a
            bcs _CLC

              lda aAIAction.wAttackChance,b
              sta aAIAction.wBestAttackChance,b
              lda aAIAction.wUnitToAttackTileDistance,b
              bra _UpdateDecidedTarget

        ; If the new attack chance is worse than the previous one, exit
        ; if its equal, overwrite the old data
        ; If its better, update the chance

        +
        lda aAIAction.wAttackChance,b
        cmp aAIAction.wBestAttackChance,b
        bmi _CLC
        beq +

          sta aAIAction.wBestAttackChance,b
          lda aAIAction.wUnitToAttackTileDistance,b
          bra _UpdateDecidedTarget

        +
        lda aAIAction.wUnitToAttackTileDistance,b
        cmp aAIAction.wUnitToChosenTargetDistance,b
        bcs _CLC

        _UpdateDecidedTarget
        sta aAIAction.wUnitToChosenTargetDistance,b
        lda aAIAction.wUnitInventorySlot,b
        sta wSelectedInventorySlot
        lda aAIAction.wAttackTileXPosition,b
        sta aAIAction.wDestinationXPosition,b
        lda aAIAction.wAttackTileYPosition,b
        sta aAIUnitList.wDestinationYPosition,b
        lda aAIAction.wTargetDeploymentOffset,b
        sta aAIAction.wChosenTargetDeploymentOffset,b
        sec
        rts

        _CLC
        clc
        rts

        .databank 0

      rsAICalculateAttackChance ; 86/A2B1

        .al
        .autsiz
        .databank ?

        ; Output:
        ; SEC if there is a chance, CLC if the expected inflicted damage is 0

        phy
        jsr rsAIGetUnitDistanceToAttackTile
        sta aAIAction.wUnitToAttackTileDistance,b

        lda #$C000
        sta aAIAction.wAttackChance,b

        jsr rsAIGetTargetDistanceToAttackTile
        sta aAIAction.wTargetToAttackTileDistance,b

        jsr rsAIGetExpectedInflictedDamage
        sta aAIAction.wExpectedInflictedDamage,b
        bcc +

          jml _CLC

        +
        jsr rsAIGetAttackTileThreatValue
        sta aAIAction.wAttackTileThreatValue,b

        lda aTargetDistanceMap,b,x
        and #$00FF
        bne +

          lda #$00FF

        +
        sta $445C,b

        lda wCurrentTurn
        lsr a
        sta aAIAction.wTurnValue,b

        ldx aAIAction.wTargetDeploymentOffset,b
        jsl rlAICheckIfUnitOnLowHP
        sta aAIAction.wTargetHPBonus,b
        dec y
        tya
        cmp wAITemp000E9A
        bcs +

          ; If inflicted damage > target HP, add 20 points
          lda aAIAction.wTargetHPBonus,b
          clc
          adc #20
          sta aAIAction.wTargetHPBonus,b

        +
        lda aAIAction.wAttackTileTerrainType,b
        sta wAITemp000E96
        lda aAIAction.wTargetToAttackTileDistance,b
        sta wAITemp000E98
        jsr rsAIGetExpectedTakenDamage
        sta aAIAction.wExpectedTakenDamage,b

        ldx aAIAction.wUntDeploymentOffset,b
        jsl rlAICheckIfUnitOnLowHP
        sta aAIAction.wUnitHPPenalty,b
        sty aAIAction.wUnitCurrentHP,b

        lda #0
        clc
        adc aAIAction.wExpectedInflictedDamage,b
        clc
        adc aAIAction.wTargetHPBonus,b
        sec
        sbc aAIAction.wExpectedTakenDamage,b
        sec
        sbc aAIAction.wUnitHPPenalty,b
        sec
        sbc aAIAction.wAttackTileThreatValue,b
        sta aAIAction.wAttackChance,b
        ply
        sec

        -
        rts

        _CLC
        ply
        clc
        bra -

        .databank 0

        ; 86/A24A






      rsAIGetAttackTileThreatValue ; 86/A34A

        .al
        .autsiz
        .databank ?

        ldx aAIAction.wAttackMapTileIndex,b
        lda aRangeMap,b,x
        and #$00FF
        cmp #8
        bcc +

          lda #7

        +
        rts

        .databank 0

      rsAIGetTargetDistanceToAttackTile ; 86/A35C

        .al
        .autsiz
        .databank ?

        ldx aAIAction.wTargetDeploymentOffset,b
        lda aAIAction.wAttackTileXPosition,b
        sec
        sbc aDeploymentTable._XTilePosition,x
        bpl +

          eor #$FFFF
          inc a
        
        +
        sta aAIAction.wTempValue,b

        lda aAIAction.wAttackTileYPosition,b
        sec
        sbc aDeploymentTable._YTilePosition,x
        bpl +

          eor #$FFFF
          inc a

        +
        clc
        adc aAIAction.wTempValue,b
        rts

        .databank 0

      rsAIGetUnitDistanceToAttackTile ; 86/A383

        .al
        .autsiz
        .databank ?

        ldx aAIAction.wUntDeploymentOffset,b
        lda aAIAction.wAttackTileXPosition,b
        sec
        sbc aDeploymentTable._XTilePosition,x
        bpl +

          eor #$FFFF
          inc a

        +
        sta aAIAction.wTempValue,b

        lda aAIAction.wAttackTileYPosition,b
        sec
        sbc aDeploymentTable._YTilePosition,x
        bpl +

          eor #$FFFF
          inc a

        +
        clc
        adc aAIAction.wTempValue,b
        rts

        .databank 0

      rsAIGetExpectedInflictedDamage ; 86/A3AA

        .al
        .autsiz
        .databank ?

        phb
        sep #$20
        lda #$7E
        pha
        rep #$20
        plb

        phx
        phy
        lda wSelectedUnitDataRAMPointer,b
        pha

        lda wAISelectedAIUnitOffset,b
        clc
        adc #aAIUnitList
        tax
        lda wAISelectedAITargetOffset,b
        bmi _CLC

          clc
          adc #aAITargetList
          tay
          lda structAITargetEntry.TerrainType,b,y
          and #$00FF
          sta wAITemp000E96,b
          lda aAIAction.wTargetToAttackTileDistance
          sta wAITemp000E98,b
          jsr rsAIGetExpectedDamage

          -
          plx
          stx wSelectedUnitDataRAMPointer,b
          ply
          plx
          plb
          rts
        
        _CLC
        lda #0
        clc
        bra -

        .databank 0

      rsAIGetExpectedTakenDamage ; 86/A3EC

        .al
        .autsiz
        .databank ?

        phb

        sep #$20
        lda #$7E
        pha
        rep #$20
        plb

        phx
        phy
        lda wSelectedUnitDataRAMPointer,b
        pha

        lda wAISelectedAITargetOffset,b
        bmi +

          clc
          adc #<>aAITargetList
          tax

          lda wAISelectedAIUnitOffset,b
          clc
          adc #<>aAIUnitList
          tay

          lda aAIAction.wAttackTileTerrainType
          sta wAITemp000E96,b
          lda aAIAction.wTargetToAttackTileDistance
          sta wAITemp000E98,b
          jsr rsAIGetExpectedDamage

          -
          plx
          stx wSelectedUnitDataRAMPointer,b
          ply
          plx
          plb
          rts
        
        +
        lda #0
        clc
        bra -

        .databank 0

      rsAIGetExpectedDamage ; 86/A42C

        .al
        .autsiz
        .databank ?

        ; Input:
        ; X = attacker AI list pointer
        ; Y = defender AI list pointer
        ; wAITemp000E96 = attack tile terrain type
        ; wAITemp000E98 = distance of target to target tile

        ; Output:
        ; SEC if its not worth attacking foe
        ; CLC and expected damage in A

        lda structAIUnitEntry.ItemROMPointer,b,x
        bmi +

          jml _CLC

        +
        sta wCurrentItemDataROMPointer,b

        lda wAITemp000E98,b
        beq _A45F

          jsl rlGetItemMinimumRange
          dec a
          cmp wAITemp000E98,b
          bcc +

            jml _SEC

          +
          jsl rlGetItemMaximumRange
          cmp wAITemp000E98,b
          bcs +

            jml _SEC

          +
          jsl rlGetItemEffectiveness
          sta wAITemp000EA2,b

        _A45F
        lda structAITargetEntry.ItemType,b,y
        and #$00FF
        xba
        sta wAITemp000EA0,b

        lda structAIUnitEntry.ItemType,b,x
        and #$00FF
        ora wAITemp000EA0,b
        jsl rlGetWeaponTriangleBonus
        sta wAITemp000EA0,b

        lda structAIUnitEntry.UnitRAMPointer,b,x
        sta wSelectedUnitDataRAMPointer,b
        lda structAIUnitEntry.ItemType,b,x
        and #$00FF
        cmp #WeaponTypeStaff
        bcs +

        lda structAITargetEntry.BattleDefense,b,y
        bra ++
        
        +
        lda structAITargetEntry.BattleResistance,b,y
        
        +
        and #$00FF
        sta wAITemp000E9C,b

        jsl rlGetSelectedUnitBattleHit
        clc
        adc wAITemp000EA0,b
        sta wAITemp000E9E,b

        lda structAITargetEntry.UnitRAMPointer,b,y
        sta wSelectedUnitDataRAMPointer,b
        jsl rlGetClassWeakness
        bit wAITemp000EA2,b
        bne _Effective

        lda structAIUnitEntry.BattleMight,b,x
        and #$00FF
        bra +

        _Effective
        lda structAIUnitEntry.BattleMight,b,x
        and #$00FF
        asl a

        +
        sec
        sbc wAITemp000E9C,b
        cmp #1
        bmi _SEC

          ; AI unit can do damage to target
          sta wAITemp000E9A,b

          lda structAIUnitEntry.ItemType,b,x
          and #$00FF
          xba
          sta wAITemp000EA0,b

          lda structAITargetEntry.ItemType,b,y
          and #$00FF
          ora wAITemp000EA0,b
          jsl rlGetWeaponTriangleBonus
          sta wAITemp000EA0,b

          lda structAITargetEntry.ItemROMPointer,b,y
          sta wCurrentItemDataROMPointer,b

          lda wAITemp000E96,b
          jsl rlGetSelectedUnitBattleAvoid
          clc
          adc wAITemp000EA0,b
          sta wAITemp000EA0,b

          lda wAITemp000E9E,b
          sec
          sbc wAITemp000EA0,b
          bmi _SEC
          beq _SEC

          cmp #101
          bmi +

            lda #100

          +
          jsl rlConvertChanceToFullByte
          sta wR34
          lda wAITemp000E9A,b
          and #$00FF
          xba
          sta wR35
          jsl rlUnsignedMultiply16By16High
          lda wR37

          _CLC
          clc
          rts

        _SEC
        lda #0
        sec
        rts

        .databank 0

      rlAIGetExpectedDamageWrapper ; 86/A52A

        .al
        .autsiz
        .databank ?

        jsr rsAIGetExpectedDamage
        rtl

        .databank 0

      rlGetNearestPossibleTarget ; 86/A52E

        .al
        .autsiz
        .databank ?

        ; Fills target distance map until it hits the first target set in aTargetMap.

        ; Input:
        ; wAITemp000E96 = Start X coord
        ; wAITemp000E98 = Start Y coord

        ; Output:
        ; SEC if success, CLC if not
        ; A = target value
        ; wAITemp000E9A = Target X coord
        ; wAITemp000E9C = Target Y coord

        phb
        php
        phk
        plb
        phx
        phy

        sep #$20
        lda #$7F
        pha
        rep #$20
        plb

        lda #`aTargetDistanceMap
        ldx #<>aTargetDistanceMap
        jsl rlClearMapBufferAddBorders

        ; Get map tile index
        lda wAITemp000E98
        xba
        lsr a
        lsr a
        clc
        adc wAITemp000E96
        tay

        lda aTargetMap,b,y
        bit #$0080
        bne +

          jml _UnitOnTarget

        +
        sep #$20
        lda #1
        sta aTargetDistanceMap,b,y
        rep #$20

        sty aMapTraversalList,b

        ; wR34 holds the running movement cost for the traversed distance
        ; wR35 holds the last offset of the map tile index that needs to be analyzed
        ; wR36 holds the current offset for aMapTraversalList

        stz wR35

        lda #2
        sta wR36
        lda #1
        sta wR34
        
        _Loop
        ldx wR35

        stz wR37
        sep #$20

          -
          ldy aMapTraversalList,b,x
          lda aTargetDistanceMap,b,y
          cmp wR34
          bne +
          bra _HandleUp

            _MarkFinishedMapTileIndex
            lda #$FF
            sta aMapTraversalList+1,b,x
            sta wR37

          +
          dec x
          dec x
          bpl -

        ; Done handling all previous entries.

        rep #$20
        lda wR37
        beq ++

        ; Overwrite marked entries and shift all following ones forward.

        ldx #0
        ldy #0

          -
          lda aMapTraversalList,b,x
          bmi +

            sta aMapTraversalList,b,y
            inc y
            inc y

          +
          inc x
          inc x
          cpx wR36
          bne -

        sty wR36

        +
        lda wR36
        beq +

          dec a
          dec a
          sta wR35

          inc wR34
          lda wR34
          cmp #$00FC
          bne _Loop

        +
        ply
        plx
        plp
        plb
        clc
        rtl

        _HandleUp
        phx
        ldx wR36

        lda aTargetDistanceMap - 64,b,y
        bne _HandleLeft

          ; The distance map in this direction is still empty.

          lda aMovementCostMap - 64,b,y
          bmi +

            ; Unit can move upwards.

            clc
            adc wR34
            sta aTargetDistanceMap - 64,b,y
            rep #$20
            tya
            clc
            adc #-64
            sta aMapTraversalList,b,x
            inc x
            inc x
            sep #$20
            bra ++

          +
          lda #$FF
          sta aTargetDistanceMap - 64,b,y

          +
          lda aTargetMap - 64,b,y
          bmi _HandleLeft

            jml _TargetIsUpwards

        _HandleLeft
        lda aTargetDistanceMap - 1,b,y
        bne _HandleRight

          lda aMovementCostMap - 1,b,y
          bmi +

          clc
          adc wR34
          sta aTargetDistanceMap - 1,b,y
          rep #$20
          tya
          clc
          adc #-1
          sta aMapTraversalList,b,x
          inc x
          inc x
          sep #$20
          bra ++

        +
        lda #$FF
        sta aTargetDistanceMap - 1,b,y
        
        +
        lda aTargetMap - 1,b,y
        bmi _HandleRight

          jml _TargetIsLeftwards

        _HandleRight
        lda aTargetDistanceMap + 1,b,y
        bne _HandleDown

          lda aMovementCostMap + 1,b,y
          bmi +

          clc
          adc wR34
          sta aTargetDistanceMap + 1,b,y
          rep #$20
          tya
          clc
          adc #1
          sta aMapTraversalList,b,x
          inc x
          inc x
          sep #$20
          bra ++
          
        +
        lda #$FF
        sta aTargetDistanceMap + 1,b,y
        
        +
        lda aTargetMap + 1,b,y
        bmi _HandleDown

          jml _TargetIsRightwards

        _HandleDown
        lda aTargetDistanceMap + 64,b,y
        bne _A684

          lda aMovementCostMap + 64,b,y
          bmi +

          clc
          adc wR34
          sta aTargetDistanceMap + 64,b,y
          rep #$20
          tya
          clc
          adc #64
          sta aMapTraversalList,b,x
          inc x
          inc x
          sep #$20
          bra ++

        +
        lda #$FF
        sta aTargetDistanceMap + 64,b,y
        
        +
        lda aTargetMap + 64,b,y
        bmi _HandleNextTile

          jml _TargetIsDownwards

        _HandleNextTile
        stx wR36
        plx
        jml _MarkFinishedMapTileIndex

        _TargetIsUpwards
        plx
        ldx #-64
        bra +
        
        _TargetIsLeftwards
        plx
        ldx #-1
        bra +
        
        _TargetIsRightwards
        plx
        ldx #1
        bra +
        
        _TargetIsDownwards
        plx
        ldx #64
        bra +

        _UnitOnTarget
        ldx #0

        +
        rep #$20
        and #$00FF
        pha

        txa
        sta wR37
        tya
        clc
        adc wR37
        tay
        and #$003F
        sta wAITemp000E9A
        tya
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        sta wAITemp000E9C

        pla
        ply
        plx
        plp
        plb
        sec
        rtl

        .databank 0

      rlFillMovementMap ; 86/A6CD

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        phy

        sep #$20
        lda #$7F
        pha
        rep #$20
        plb

        lda #`aMovementMap
        ldx #<>aMovementMap
        jsl rlClearMapBufferAddBorders

        stz wR36

        jsr rsFillMapData

        ply
        plx
        plp
        plb
        clc
        rtl

        .databank 0

      rsFillMapData ; 86/A6F0

        .al
        .autsiz
        .databank ?

        ; wR36 = Special field movement cost, if 0 use regular movement cost
        ; wAITemp000E96 = X Pos
        ; wAITemp000E98 = Y Pos
        ; wAITemp000EA2 = field movement

        jsr rsGetMovementMapBuildingInfo

        ldx #64 - 2
        lda #$FFFF

          -
          sta aMapTraversalList,b,x
          sta aMapTraversalList + ($40 * 1),b,x
          sta aMapTraversalList + ($40 * 2),b,x
          sta aMapTraversalList + ($40 * 3),b,x
          dec x
          dec x
          bpl -

        lda wAITemp000E98
        xba
        lsr a
        lsr a
        clc
        adc wAITemp000E96
        tay

        ; Set units field movement at their starting position
        lda wAITemp000EA2
        sep #$20
        sta aMovementMap,b,y
        rep #$20
        sta wR34

        asl a
        tax
        lda #aNextTraversedTileIndexList - aMapTraversalList
        sta aMapTraversalList,b,x
        lda #$FFFF
        sta aNextTraversedTileIndexList,b
        tya
        sta aNextTraversedTileIndexList+2,b
        lda #aNextTraversedTileIndexList - aMapTraversalList + size(word) * 2
        sta wR35

          ; If remaining move is less than 0.7, exit
          -
          lda wR34
          cmp #7
          bcc _End

          asl a
          tax

            -
            lda aMapTraversalList,b,x
            bmi +

              tax
              ldy aMapTraversalList+2,b,x
              jsr rsAppendAdjacentTilesToMapTraversalList
              bra -

          +
          dec wR34
          bra --

        _End
        rts

        .databank 0

      rsAppendAdjacentTilesToMapTraversalList ; 86/A756

        .al
        .autsiz
        .databank ?

        ; Checks 4 adjacent tiles to specified tile index
        ; If filled or too costly, skip
        ; Else update tile with value equal to remaining move if moved to the space

        ; Input:
        ; Y = units map tile index
        ; wR34 = units field movement
        ; wR36 = special field movement cost, if 0 use regular movement cost

        sep #$20
        phx
        lda aMovementMap - 64,b,y
        bne _HandleLeft

          lda wR36
          beq +

            lda wR34
            sec
            sbc wR36
            bra ++

          ; Check if the direction is traversable

          +
          rep #$20
          lda #-64
          jsr rsGetFieldMovementCostInSpecifiedDirection

          sep #$20
          bmi _HandleLeft

            ; Check if remaining movement would be able to move there

            lda wR34
            sec
            sbc wR37

            +
            bcc _HandleLeft

              sta aMovementMap - 64,b,y
              beq _HandleLeft

                ; There is still some move left over

                rep #$20
                and #$007F
                asl a
                tax
                lda aMapTraversalList,b,x
                pha

                lda wR35
                sta aMapTraversalList,b,x
                tax
                clc
                adc #4
                sta wR35

                pla
                sta aMapTraversalList,b,x
                tay
                clc
                adc #-64
                sta aMapTraversalList+2,b,x
                sep #$20
        
        _HandleLeft
        lda aMovementMap - 1,b,y
        bne _HandleRight

          lda wR36
          beq +

          lda wR34
          sec
          sbc wR36
          bra ++
          
          +
          rep #$20
          lda #-1
          jsr rsGetFieldMovementCostInSpecifiedDirection
          sep #$20
          bmi _HandleRight

            lda wR34
            sec
            sbc wR37

            +
            bcc _HandleRight

              sta aMovementMap - 1,b,x
              beq _HandleRight

                rep #$20
                and #$007F
                asl a
                tax
                lda aMapTraversalList,b,x
                pha

                lda wR35
                sta aMapTraversalList,b,x
                tax
                clc
                adc #4
                sta wR35

                pla
                sta aMapTraversalList,b,x
                tya
                clc
                adc #-1
                sta aMapTraversalList+2,b,x
                sep #$20
        
        _HandleRight
        lda aMovementMap + 1,b,y
        bmi _HandleDown

          lda wR36
          beq +

          lda wR34
          sec
          sbc wR36
          bra ++
          
          +
          rep #$20
          lda #1
          jsr rsGetFieldMovementCostInSpecifiedDirection
          sep #$20
          bmi _HandleDown

            lda wR34
            sec
            sbc wR37
            
            +
            bcc _HandleDown

              sta aMovementMap +1,b,y
              beq _HandleDown

                rep #$20
                and #$007F
                asl a
                tax
                lda aMapTraversalList,b,x
                pha

                lda wR35
                sta aMapTraversalList,b,x
                tax
                clc
                adc #4
                sta wR35

                pla
                sta aMapTraversalList,b,x
                tya
                clc
                adc #1
                sta aMapTraversalList+2,b,x
                sep #$20
        
        _HandleDown
        lda aMovementMap + 64,b,y
        bne _End

          lda wR36
          beq +

          lda wR34
          sec
          sbc wR36
          bra ++


          +
          rep #$20
          lda #64
          jsr rsGetFieldMovementCostInSpecifiedDirection
          sep #$20
          bmi _End

            lda wR34
            sec
            sbc wR37
            
            +
            bcc _End

              sta aMovementMap + 64,b,y
              beq _End

                rep #$20
                and #$007F
                asl a
                tax
                lda aMapTraversalList,b,x
                pha

                lda wR35
                sta aMapTraversalList,b,x
                tax
                clc
                adc #4
                sta wR35

                pla
                sta aMapTraversalList,b,x
                tya
                clc
                adc #64
                sta aMapTraversalList+2,b,x
                sep #$20

        _End
        plx
        rep #$20
        rts

        .databank 0

      rsGetMovementMapBuildingInfo ; 86/A891

        .al
        .autsiz
        .databank ?

        lda wAIActiveFaction
        tax

        jsl rlGetSelectedUnitFactionSlot
        jsl rlGetFactionRelation
        asl a
        tax
        lda aBlockingUnitMapPointers,x
        sta aAIAction.wMapPointer,b
        jsl rlGetSelectedUnitMovementCostPointer
        sta aAIAction.wUnitMovementCostPointer,b
        rts

        .databank 0

      aBlockingUnitMapPointers ; 86/A8AF

        .word <>aFoeUnitMap
        .word <>aAllyUnitMap
        .word <>aFoeUnitMap
        .word <>aFoeUnitMap

      aUnknown86A8B7 ; 86/A8B7

        ; Approximation of (Move * 10 [-1]) * 256/179)/10
        ; Leaving out the -1 part

        .byte ceil(( 0 * 10) * 256.0/179.0/10) ; =  0
        .byte ceil(( 1 * 10) * 256.0/179.0/10) ; =  2
        .byte ceil(( 2 * 10) * 256.0/179.0/10) ; =  3
        .byte ceil(( 3 * 10) * 256.0/179.0/10) ; =  5
        .byte ceil(( 4 * 10) * 256.0/179.0/10) ; =  6
        .byte ceil(( 5 * 10) * 256.0/179.0/10) ; =  8
        .byte ceil(( 6 * 10) * 256.0/179.0/10) ; =  9
        .byte ceil(( 7 * 10) * 256.0/179.0/10) ; = 11
        .byte ceil(( 8 * 10) * 256.0/179.0/10) ; = 12
        .byte ceil(( 9 * 10) * 256.0/179.0/10) ; = 13
        .byte ceil((10 * 10) * 256.0/179.0/10) ; = 15
        .byte ceil((11 * 10) * 256.0/179.0/10) ; = 16
        .byte ceil((12 * 10) * 256.0/179.0/10) ; = 18
        .byte ceil((13 * 10) * 256.0/179.0/10) ; = 19

      rsGetFieldMovementCostInSpecifiedDirection ; 86/A8C5

        .al
        .autsiz
        .databank ?

        ; Gets field movement cost of map tile index in specified direction

        ; Input:
        ; A = offset from current map tile index
        ; Y = current map tile index
        ; aAIAction.wMapPointer
        ; aAIAction.wUnitMovementCostPointer

        ; Output:
        ; wR37 = field movement cost

        phx
        phy
        sty wR37
        clc
        adc wR37
        tay

        tya
        clc
        adc aAIAction.wMapPointer,b
        tax
        lda $0000,b,x
        and #$00FF
        cmp #$00FF
        beq +

          lda #$007F
          bra _End

        +
        tya
        asl a
        tax
        lda aMapData,b,x
        and #$03FF
        tax
        lda aTerrainTileset,b,x
        and #$00FF
        cmp #TerrainRoad+1
        bcc +

          lda #TerrainPeak

        +
        clc
        adc aAIAction.wUnitMovementCostPointer,b
        tax
        lda $830000,x
        and #$00FF
        bit #$0080
        bne _End

          asl a
          tax
          lda aFieldMovementCostLookupTable,x

        _End
        ply
        plx
        sta wR37
        cmp #0
        rts

        .databank 0

      aFieldMovementCostLookupTable ; 86/A91A

        ; Indexed by movement cost

        .word 7
        .word 10
        .word 20
        .word 30
        .word 40
        .word 50
        .word 60
        .word 70

      rlUnknown86A92A ; 86/A92A

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        phy

        sep #$20
        lda #$7F
        pha
        rep #$20
        plb

        lda #`aMovementMap
        ldx #<>aMovementMap
        jsl rlClearMapBufferAddBorders

        lda wAITemp000EA4
        cmp #10
        bcs _A96B

        stz wR36
        jsr rsFillMapData
        sep #$20
        ldx #$0100

          -
          cpx wR35
          beq +

          ldy aMapTraversalList+2,b,x
          jsr rsUnknown86A9A0
          inc x
          inc x
          inc x
          inc x
          cpx wR35
          bra -

        +
        rep #$20
        bra _End
        
        _A96B
        lda #101
        sta wAITemp000EA2
        lda #10
        sta wR36
        jsr rsFillMapData
        lda #101
        sta wR34

          -
          lda wR34
          asl a
          tax
          
            -
            lda aMapTraversalList,b,x
            bmi +

            tax
            ldy aMapTraversalList+2,b,x
            jsr rsUnknown86AA43
            bra -

          +
          lda wR34
          sec
          sbc wR36
          sta wR34
          bpl --

        _End
        ply
        plx
        plp
        plb
        clc
        rtl

        .databank 0

      rsUnknown86A9A0 ; 86/A9A0

        .as
        .autsiz
        .databank ?

        lda wAITemp000EA4
        cmp #1
        bne +

          lda aMovementMap - 64,b,y
          ora #$80
          sta aMovementMap - 64,b,y
          lda aMovementMap -  1,b,y
          ora #$80
          sta aMovementMap -  1,b,y
          lda aMovementMap +  1,b,y
          ora #$80
          sta aMovementMap +  1,b,y
          lda aMovementMap + 64,b,y
          ora #$80
          sta aMovementMap + 64,b,y
          bra _End

        +
        cmp #2
        beq +

          rep #$20
          lda aMovementMap - 64 - 1,b,y
          ora #$8080
          sta aMovementMap - 64 - 1,b,y
          lda aMovementMap -  1 - 1,b,y
          ora #$8080
          sta aMovementMap -  1 - 1,b,y
          lda aMovementMap +  1,b,y
          ora #$8080
          sta aMovementMap +  1,b,y
          lda aMovementMap + 64 - 1,b,y
          ora #$8080
          sta aMovementMap + 64 - 1,b,y
          sep #$20
          bra ++

        +
        lda aMovementMap - 64 - 1,b,y
        ora #$80
        sta aMovementMap - 64 - 1,b,y
        lda aMovementMap -  1 - 1,b,y
        ora #$80
        sta aMovementMap -  1 - 1,b,y
        lda aMovementMap +  1 + 1,b,y
        ora #$80
        sta aMovementMap +  1 + 1,b,y
        lda aMovementMap + 64 - 1,b,y
        ora #$80
        sta aMovementMap + 64 - 1,b,y

        +
        lda aMovementMap + 64 + 1,b,y
        ora #$80
        sta aMovementMap + 64 + 1,b,y
        lda aMovementMap - 64 + 1,b,y
        ora #$80
        sta aMovementMap - 64 + 1,b,y
        cpy #$0080
        bmi +

          lda $744A - 64 - 64,b,y
          ora #$80
          sta $744A - 64 - 64,b,y

        +
        cpy #$0F80
        bpl _End

          lda aMovementMap + 64 + 64,b,y
          ora #$80
          sta aMovementMap + 64 + 64,b,y

        _End
        rts

        .databank 0

      rsUnknown86AA43 ; 86/AA43

        .al
        .autsiz
        .databank ?

        sep #$20
        lda $4C
        cmp #101
        beq _AA5D

        lda $000EA4
        cmp #11
        beq +

        lda $4C
        cmp #81
        bcs _AA61
        
        +
        lda #$80
        bra +
        
        _AA5D
        lda #1
        bra +
        
        _AA61
        lda #0
        
        +
        sta aMovementMap,b,y
        rep #$20
        rts

        .databank 0

      rsFillRangeMap ; 86/AA69

        .al
        .autsiz
        .databank ?

        ; Input:
        ; wAITemp000E96 = X Pos
        ; wAITemp000E98 = Y Pos
        ; wAITemp000EA2 = field movement
        ; wAITemp000EA4 = weapon range

        phb
        php
        phk
        plb
        phx
        phy

        sep #$20
        lda #$7F
        pha
        rep #$20
        plb

        lda #`aMovementMap
        ldx #<>aMovementMap
        jsl rlClearMapBufferAddBorders

        ; Min + Max item range
        lda wAITemp000EA4
        cmp #3 + 10
        beq _SiegeWeapon

          stz wR36
          jsr rsFillMapData

          sep #$20
          ldx #$0100

            -
            cpx wR35
            beq +

              ldy aMapTraversalList+2,b,x
              jsr rsFlagNonSiegeAttackRangeOfSpecifiedTile
              inc x
              inc x
              inc x
              inc x
              cpx wR35
              bra -

          +
          rep #$20
          bra _End

        _SiegeWeapon
        lda #10 * 10 + 1
        sta wAITemp000EA2
        lda #10
        sta wR36
        jsr rsFillMapData

        lda #71
        sta wR34
        
          _Loop
          lda wR34
          asl a
          tax
          
            -
            lda aMapTraversalList,b,x
            bmi +

              tax
              ldy aMapTraversalList+2,b,x
              jsr rsFlagSiegeAttackRangeOfSpecifiedTile
              bra -

          +
          lda wR34
          sec
          sbc wR36
          sta wR34
          bpl _Loop

        _End
        ply
        plx
        plp
        plb
        clc
        rtl

        .databank 0

      rsFlagNonSiegeAttackRangeOfSpecifiedTile ; 86/AADF

        .as
        .autsiz
        .databank ?

        ; Check all tiles within 2 tiles around a tile that can be moved to.
        ; After checking a tile, flag it so it doesnt get looked at again.

        ; Input:
        ; Y = map tile index from aMapTraversalList
        ; wAITemp000EA0 = value to write to the range map
        ; wAITemp000EA4 = weapon range

        lda wAITemp000EA4
        and #$01
        beq _CheckRanged

          lda aMovementMap - 64,b,y
          bmi ++

            ora #$80
            sta aMovementMap - 64,b,y
            lda aRangeMap - 64,b,y
            clc
            adc wAITemp000EA0
            bcc +

              lda #$FF

            +
            sta aRangeMap - 64,b,y
          
          +
          lda aMovementMap + 64,b,y
          bmi ++

            ora #$80
            sta aMovementMap + 64,b,y
            lda aRangeMap + 64,b,y
            clc
            adc wAITemp000EA0
            bcc +

              lda #$FF

            +
            sta aRangeMap + 64,b,y

          +
          lda aMovementMap - 1,b,y
          bmi ++

            ora #$80
            sta aMovementMap - 1,b,y
            lda aRangeMap - 1,b,y
            clc
            adc wAITemp000EA0
            bcc +

              lda #$FF

            +
            sta aRangeMap - 1,b,y

          +
          lda aMovementMap + 1,b,y
          bmi _CheckRanged

            ora #$80
            sta aMovementMap + 1,b,y
            lda aRangeMap + 1,b,y
            clc
            adc wAITemp000EA0
            bcc +

              lda #$FF

            +
            sta aRangeMap + 1,b,y

        _CheckRanged
        lda wAITemp000EA4
        and #$02
        bne +

          jml _End

        +
        lda aMovementMap - 64 - 1,b,y
        bmi ++

          ora #$80
          sta aMovementMap - 64 - 1,b,y
          lda aRangeMap - 64 - 1,b,y
          clc
          adc wAITemp000EA0
          bcc +

            lda #$FF

          +
          sta aRangeMap - 64 - 1,b,y

        +
        lda aMovementMap - 64 + 1,b,y
        bmi ++

          ora #$80
          sta aMovementMap - 64 + 1,b,y
          lda aRangeMap - 64 + 1,b,y
          clc
          adc wAITemp000EA0
          bcc +

            lda #$FF

          +
          sta aRangeMap - 64 + 1,b,y

        +
        lda aMovementMap - 2,b,y
        bmi ++

          ora #$80
          sta aMovementMap - 2,b,y
          lda aRangeMap - 2,b,y
          clc
          adc wAITemp000EA0
          bcc +

            lda #$FF

          +
          sta aRangeMap - 2,b,y

        +
        lda aMovementMap + 2,b,y
        bmi ++

          ora #$80
          sta aMovementMap + 2,b,y
          lda aRangeMap + 2,b,y
          clc
          adc wAITemp000EA0
          bcc +

            lda #$FF

          +
          sta aRangeMap + 2,b,y

        +
        lda aMovementMap + 64 - 1,b,y
        bmi ++

          ora #$80
          sta aMovementMap + 64 - 1,b,y
          lda aRangeMap + 64 - 1,b,y
          clc
          adc wAITemp000EA0
          bcc +

            lda #$FF

          +
          sta aRangeMap + 64 - 1,b,y

        +
        lda aMovementMap + 64 + 1,b,y
        bmi ++

          ora #$80
          sta aMovementMap + 64 + 1,b,y
          lda aRangeMap + 64 + 1,b,y
          clc
          adc wAITemp000EA0
          bcc +

            lda #$FF

          +
          sta aRangeMap + 64 + 1,b,y

        +
        cpy #64 * 2
        bmi ++

          lda aMovementMap - 64 - 64,b,y
          bmi ++

            ora #$80
            sta aMovementMap - 64 - 64,b,y
            lda aRangeMap - 64 - 64,b,y
            clc
            adc wAITemp000EA0
            bcc +

              lda #$FF

          +
          sta aRangeMap - 64 - 64,b,y

        +
        cpy #64 * 62
        bpl _End

          lda aMovementMap + 64 + 64,b,y
          bmi _End

            ora #$80
            sta aMovementMap + 64 + 64,b,y
            lda aRangeMap + 64 + 64,b,y
            clc
            adc wAITemp000EA0
            bcc +

              lda #$FF

            +
            sta aRangeMap + 64 + 64,b,y

        _End
        rts

        .databank 0

      rsFlagSiegeAttackRangeOfSpecifiedTile ; 86/AC2A

        .al
        .autsiz
        .databank ?

        sep #$20
        lda aRangeMap,b,y
        clc
        adc wAITemp000EA0
        bcc +

          lda #$FF

        +
        sta aRangeMap,b,y
        rep #$20
        rts

        .databank 0

      rlFillMovementCostMapSpecial ; 86/AC3E

        .al
        .autsiz
        .databank ?

        ; Like the regular one, but makes ramparts and castle tiles passable 
        ; with a move cost of 16

        phb
        php

        sep #$20
        lda #`aMovementCostMap
        pha
        rep #$20
        plb

        phx
        phy

        jsl rlGetSelectedUnitMovementCostPointer
        sta aAIAction.wUnitMovementCostPointer

        sep #$20
        ldy #size(aMapData) / size(word) -1

          -
          jsr rlFillMovementCostMapSpecialEffect
          sta aMovementCostMap,b,y
          dec y
          bpl -

        rep #$20

        ply
        plx
        plp
        plb
        rtl

        .databank 0

      rlFillMovementCostMapSpecialEffect ; 86/AC67

        .as
        .autsiz
        .databank ?

        ; Input:
        ; aAIAction.wUnitMovementCostPointer

        ; Output:
        ; A = movement cost

        php
        rep #$20

        .al

        tya
        asl
        tax
        lda aMapData,b,x
        and #$03FF
        tax
        lda aTerrainTileset,b,x
        and #$00FF
        cmp #TerrainRampart
        beq ++

        cmp #TerrainCastle
        beq ++

        cmp #TerrainRoad+1
        bcc +

          ; Any invalid terrain counts as a peak
          lda #TerrainPeak

        ; Get the terrain movement cost +1 fot that tile
        +
        clc
        adc aAIAction.wUnitMovementCostPointer
        tax
        plp

        .as

        lda $830000,x
        inc a

        -
        rts

        +
        plp
        lda #16
        bra -

        .databank 0

      rlFillMovementCostMap ; 86/AC9E

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aMovementCostMap
        pha
        rep #$20
        plb

        phx
        phy

        jsl rlGetSelectedUnitMovementCostPointer
        lda aAIAction.wUnitMovementCostPointer

        sep #$20
        ldy #size(aMapData) / size(word) -1

        -
        jsr rsFillMovementCostMapEffect
        sta aMovementCostMap,b,y
        dec y
        bpl -

        ply
        plx
        plp
        plb
        rtl

        .databank 0

      rsFillMovementCostMapEffect ; 86/ACC5

        .as
        .autsiz
        .databank ?

        php
        rep #$20
        tya
        asl a
        tax
        lda aMapData,b,x
        and #$03FF
        tax
        lda aTerrainTileset,b,x
        and #$00FF
        cmp #TerrainRoad +1
        bcc +

          lda #0
        
        +
        clc
        adc aAIAction.wUnitMovementCostPointer
        tax
        plp
        lda $830000,x
        inc a
        rts

        .databank 0

      rlIncreaseMoveCostOfFoesOccupiedTiles ; 86/ACED

        .al
        .autsiz
        .databank ?

        ; Add 24 to the move cost of any tile a foe is on?

        phb
        php
        phk
        plb
        phx
        phy

        jsl rlGetSelectedUnitFactionSlot
        sta $7F442C

        sep #$20
        lda #$7F
        pha
        rep #$20
        plb

        ldx (len(aDeploymentTable._State) - 2)
        
          _Loop
          txa
          lda aDeploymentTable._State,x
          bit #DeploymentStateAlive
          beq _Next

            bit #DeploymentStateHidden
            bne _Next

              phx
              lda aDeploymentTable._FactionSlot,x
              ldx $442C,b
              jsl rlGetFactionRelation
              plx

              cmp #AllegianceOther
              beq +

                cmp #AllegianceEnemy
                beq _Next

              ; Target is a foe
              +
              lda aDeploymentTable._XTilePosition,x
              sta aAIAction.wAttackTileXPosition,b
              lda aDeploymentTable._YTilePosition,x
              sta aAIAction.wAttackTileYPosition,b

              lda aAIAction.wAttackTileYPosition,b
              and #$00FF
              xba
              lsr a
              lsr a
              clc
              adc aAIAction.wAttackTileXPosition,b
              tay

              sep #$20
              lda #24
              clc
              adc aMovementCostMap,b,y
              sta aMovementCostMap,b,y
              rep #$20

          _Next
          dec x
          dec x
          bpl _Loop

        ply
        plx
        plp
        plb
        rtl

        .databank 0

        ; 86/AD5E


















      rlUnknown86AF39 ; 86/AF39

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`wAIUnknownBitfield7E2000
        pha
        rep #$20
        plb

        lda wAIUnknownBitfield7E2000
        bit #$0004
        beq +

          lda wAIUnknown7E2002,b
          asl a
          tax
          jsr (aUnknown86AF57,x)

        +
        plp
        plb
        rtl

        .databank 0

      aUnknown86AF57 ; 86/AF57

        .word <>rsUnknown86AF69
        .word <>rsUnknown86AF6A
        .word <>rsUnknown86AF69
        .word <>rsUnknown86AF69
        .word <>rsUnknown86AF69
        .word <>rsUnknown86AF69
        .word <>rsUnknown86AF69
        .word <>rsUnknown86AF69
        .word <>rsUnknown86AF69

      rsUnknown86AF69 ; 86/AF69

        .al
        .autsiz
        .databank ?

        rts

        .databank 0

      rsUnknown86AF6A ; 86/AF6A

        .al
        .autsiz
        .databank ?

        lda #2
        sta wAIUnknown7E2002,b
        rts

        .databank 0

      rlAICheckIfAnyFoeInAlliesThreatRange ; 86/AF71

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`wAIUnknownBitfield7E2000
        pha
        rep #$20
        plb

        phx
        phy

        lda wAITargetCounter,b
        bne +

          jml _End

        +
        sta wAITemp000E9A,b

        ldx #<>aAITargetList

          ; Outer loop goes over all targets, inner loop over all allies

          _OuterLoop
          phx
          lda structAITargetEntry.DeploymentOffset,b,x
          and #$00FF
          tax
          lda aDeploymentTable._State,b,x
          plx

          bit #(DeploymentStateDefeated | DeploymentStateHidden)
          bne _Next

            lda structAITargetEntry.XPosition,b,x
            and #$00FF
            sta wAITemp000E96,b
            lda structAITargetEntry.YPosition,b,x
            and #$00FF
            sta wAITemp000E98,b

            lda wAIUnitCounter,b
            bne +

              jml _End
            
            +
            sta wAITemp000E9C,b

            ldy #<>aAIUnitList

              _InnerLoop
              lda structAIUnitEntry.XPosition,b,y
              and #$00FF
              sec
              sbc wAITemp000E96,b
              bpl +

                eor #$FFFF
                inc a

              +
              sta wR35

              lda structAIUnitEntry.YPosition,b,y
              and #$00FF
              sec
              sbc wAITemp000E98,b
              bpl +

                eor #$FFFF
                inc a

              +
              clc
              adc wR35
              sta wR35

              ; wR35 holds distance to target

              lda structAIUnitEntry.ThreatRange,b,y
              and #$00FF
              cmp wR35
              bcs _SEC

              tya
              clc
              adc #size(structAIUnitEntry)
              tay
              dec wAITemp000E9C,b
              bne _InnerLoop

          _Next
          txa
          clc
          adc #size(structAITargetEntry)
          tax
          dec wAITemp000E9A,b
          bne _OuterLoop
        
        _End
        ply
        plx
        plp
        plb
        clc

        -
        rtl

        _SEC
        lda #$0004
        tsb wAIUnknownBitfield7E2000,b

        ply
        plx
        plp
        plb
        sec
        bra -

        .databank 0

      rlUnknown86B018 ; 86/B018

        .al
        .autsiz
        .databank ?

        ; Builds target distance map around group leader

        phb
        php

        sep #$20
        lda #`wAIUnknownBitfield7E2000
        pha
        rep #$20
        plb

        phx
        lda wAIUnknownBitfield7E2000,b
        bit #$0020
        bne +

          jml _End

        +
        lda wAIUnknown7E201A,b
        bne +

          jml _End

        +
        jsl rlTryGetAIFactionGroupLeader

        lda wAIGroupLeaderXPosition,b
        sta wAIUnknown7E2010,b
        sta wAITemp000E96,b

        lda wAIGroupLeaderYPosition,b
        sta wAIUnknown7E2012,b
        sta wAITemp000E98,b

        jsl rlFillMovementCostMapSpecial

        jsl rlGetNearestPossibleTarget
        bcs +

          jml _End

        +
        sta wAIUnknown7E2018,b

        ; Get the targets coords
        lda wAITemp000E9A,b
        sta wAIUnknown7E2014,b
        lda wAITemp000E9C,b
        sta wAIUnknown7E2016,b

        lda wAIUnknown7E201A,b
        cmp #6
        bne +

          lda wAIUnknown7E2002,b
          cmp #4
          beq _B0A6

            jml _End

        +
        lda wAIUnknownBitfield7E2000,b
        bit #$0008
        bne _B0B6

        ; Group leader isnt dead
        bit #$0110
        bne _B0A6

        lda wAIGroupLeaderDeploymentOffset,b
        bpl _B0B6

        lda wAIUnknown7E2002,b
        cmp #4
        bne +

          jml _End

        +
        cmp #5
        bne _B0A6

          jml _End

        ; Write target coords to other ram values
        _B0A6
        lda wAIUnknown7E2014,b
        sta wAIUnknown7E2010,b
        lda wAIUnknown7E2016,b
        sta wAIUnknown7E2012,b
        jml +

          _B0B6
          lda wAIGroupLeaderFieldMovement
          sta $0EA2,b
          jsl rlTryGetAIFactionGroupLeader
          jsl rlFillMovementMap
          jsl $86AD5E

          lda wAITemp000E96,b
          sta wAIUnknown7E2010,b
          lda wAITemp000E98,b
          sta wAIUnknown7E2012,b

        +
        jsl rlUnknown87DB70

        lda wAICurrentAISetting,b
        jsl rlUnknown87DA0A

        _End
        plx
        plp
        plb
        rtl

        .databank 0

      rlGetSelectedUnitAttackThreatRange ; 86/B0E4

        .al
        .autsiz
        .databank ?

        phx
        jsl rlGetHighestRangeItemInInventory

        lda wCurrentItemDataROMPointer,b
        beq +

          jsl rlGetItemMaximumRange
          bra ++

          +
          lda #0

        +
        sta $0EA4,b

        lda $7E2002
        cmp #5
        bne +

          lda $0EA4,b
          bra _END

        +
        jsl rlGetSelectedUnitTotalMovement
        inc a
        tax
        lda _MovementThreatRangeLookupTable,x
        and #$00FF
        clc
        adc $0EA4,b
        
        _END
        plx
        rtl

        .databank 0

        _MovementThreatRangeLookupTable ; 86/B11B

        ; Approximation of (Move * 10 [-1]) * 256/179)/10
        ; Leaving out the -1 part

        .byte ceil(( 0 * 10) * 256.0/179.0/10) ; =  0
        .byte ceil(( 1 * 10) * 256.0/179.0/10) ; =  2
        .byte ceil(( 2 * 10) * 256.0/179.0/10) ; =  3
        .byte ceil(( 3 * 10) * 256.0/179.0/10) ; =  5
        .byte ceil(( 4 * 10) * 256.0/179.0/10) ; =  6
        .byte ceil(( 5 * 10) * 256.0/179.0/10) ; =  8
        .byte ceil(( 6 * 10) * 256.0/179.0/10) ; =  9
        .byte ceil(( 7 * 10) * 256.0/179.0/10) ; = 11
        .byte ceil(( 8 * 10) * 256.0/179.0/10) ; = 12
        .byte ceil(( 9 * 10) * 256.0/179.0/10) ; = 13
        .byte ceil((10 * 10) * 256.0/179.0/10) ; = 15
        .byte ceil((11 * 10) * 256.0/179.0/10) ; = 16
        .byte ceil((12 * 10) * 256.0/179.0/10) ; = 18
        .byte ceil((13 * 10) * 256.0/179.0/10) ; = 19

      rlUnknown86B129 ; 86/B129

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb

        jsr rsUnknown86B200

        ldx wAISelectedAIUnitOffset,b
        lda aAIUnitList.UnitRAMPointer,x
        sta wSelectedUnitDataRAMPointer,b

        lda aAIUnitList.XPosition,x
        and #$00FF
        sta wAITemp000E96,b

        lda aAIUnitList.YPosition,x
        and #$00FF
        sta wAITemp000E98,b

        jsl rlGetSelectedUnitAI
        cmp wAICurrentAISetting,b
        beq +

          jml _End

        +
        lda aAIUnitList.XTargetPosition,x
        and #$00FF
        sta wAITargetXPosition,b

        lda aAIUnitList.YTargetPosition,x
        and #$00FF
        sta wAITargetYPosition,b

        lda #0
        sta wAIUnknown000E8E,b
        lda #$FFFF
        sta wAIUnknown000E8C,b

        ; Fill movement map
        jsl rlUnkown86C1F5

        lda aAIUnitList.DeploymentOffset,x
        and #$00FF
        tax
        sta aAIAction.wUntDeploymentOffset
        lda #$FFFF
        sta $7F4440

        jsl rlGetSelectedUnitStates
        bit #UnitStateFielded
        bne +

          jsr rsUnknown86BD9D
          bcc +

            jml _End

        +
        jsl rlGetSelectedUnitStatus
        cmp #StatusBerserk
        beq _Berserked

          jsr rsCheckIfCastlesCapturable
          bcs _B1E0

            lda aDeploymentTable._State,x
            bit #DeploymentStateGuardingCastle
            beq +

              jsr rsUnknown86BA86
              bra ++

            +
            lda wAIUnknown7E201A
            asl a
            tax
            jsr (aUnknown86B1E6,x)
            bcs _B1E0

            +
            lda $7F4440
            cmp #$FFFF
            bne _B1E0

        _Berserked
        jsl rlGetSelectedUnitStates
        bit #UnitStateCanto
        bne _B1E0

          jsr rsUnknown86B480

        _B1E0
        jsr rsUnknown86B221
        
        _End
        plp
        plb
        rtl

        .databank 0

      aUnknown86B1E6 ; 86/B1E6

        .word <>rsUnknown86B7D1
        .word <>rsUnknown86B7D1
        .word <>rsUnknown86B9E8
        .word <>rsCheckAnyFoeInGroupRangeFlagUnset
        .word <>rsCheckAnyFoeInGroupRangeFlagUnset
        .word <>rsCheckAnyFoeInGroupRangeFlagUnset
        .word <>rsUnknown86BA86
        .word <>rsUnknown86B7D1
        .word <>rsUnknown86BB38
        .word <>rsUnknown86BCE3
        .word <>rsUnknown86BD37
        .word <>rsUnknown86BD5A
        .word <>rsUnknown86BD8B

      rsUnknown86B200 ; 86/B200

        .al
        .autsiz
        .databank ?

        lda wAIUnknown7E2002
        cmp #4
        beq +

          cmp #5
          beq +

            ldx wAISelectedAIUnitOffset,b
            lda aAIUnitList.DeploymentOffset,x
            and #$00FF
            sta $7F443C
            jsl rlFillRangeMapOfAITargetsNearLeader

        +
        rts

        .databank 0

      rsUnknown86B221 ; 86/B221

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb

        ldx wAISelectedAIUnitOffset,b
        lda #0
        sta $0879,b
        lda #$FFFF
        sta $0873,b
        lda aAIUnitList.XPosition,x
        and #$00FF
        cmp wAITargetXPosition,b
        bne _B270

          lda aAIUnitList.YPosition,x
          and #$00FF
          cmp wAITargetYPosition,b
          bne _B270

            lda wAIUnknown000E8E,b
            bne _B270
            
              -
              jsl rlGetSelectedUnitStates
              bit #UnitStateCanto
              bne +

                jml _End

              +
              phx
              lda aAIUnitList.DeploymentOffset,x
              and #$00FF
              tax
              jsl rlUnknown84CAA9
              plx
              jml _End

        _B270
        lda aAIUnitList.XPosition,x
        and #$00FF
        sta wAITemp000E96,b
        lda aAIUnitList.YPosition,x
        and #$00FF
        sta wAITemp000E98,b

        lda wAITargetXPosition,b
        sta wAITemp000E9A,b
        lda wAITargetYPosition,b
        sta wAITemp000E9C,b
        jsl rlUnknown86BDE8
        bcc +

          lda wAIUnknown7E2014
          sta wAITemp000E9A,b
          lda wAIUnknown7E2016
          sta wAITemp000E9C,b
          jsl rlUnknown86BDE8
          bcs -

        +
        lda wAITemp000E9E,b
        cmp wAITemp000E9A,b
        bne +

          lda wAITemp000EA0,b
          cmp wAITemp000E9C,b
          bne +

            lda wAIUnknown000E8E,b
            sta $0879,b
            lda wAIUnknown000E8C,b
            bmi +

              sta $0873,b

        ; Update units position with the post movement positions
        +
        sep #$20
        lda wAITemp000E9E,b
        sta aAIUnitList.XPosition,x
        lda wAITemp000EA0,b
        sta aAIUnitList.YPosition,x
        rep #$20

        lda wAITemp000E9E,b
        asl a
        asl a
        asl a
        asl a
        sta $0875,b
        lda wAITemp000EA0,b
        asl a
        asl a
        asl a
        asl a
        sta $0877,b

        lda aAIUnitList.DeploymentOffset,x
        and #$00FF
        sta $0871,b
        lda #$FFFF
        sta $086F,b

        lda #$0001
        tsb bUnknown000E7B,b

        _End
        plp
        plb
        rts

        .databank 0

      rlUnknown86B307 ; 86/B307

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
        jsr (_B315,x)

        plx
        plp
        plb
        rtl

        .databank 0

        _B315
        .word $B335
        .word $B343
        .word $B358
        .word $B371
        .word $B39D
        .word $B38F
        .word $B3AB
        .word $B3B9
        .word $B343
        .word $B36A
        .word $B3C7
        .word $B3CE
        .word $B3DD
        .word $B410
        .word $B343
        .word $B343

        ; 86/B335




      rlCheckIfAIUnitCanAct ; 86/B421

        .al
        .autsiz
        .databank ?

        phx
        ldx wAISelectedAIUnitOffset,b
        lda aAIUnitList.UnitRAMPointer,x
        sta wSelectedUnitDataRAMPointer,b
        tax
        lda $7E0000,x
        cmp #$FFFF
        beq _SEC

          jsl rlGetSelectedUnitStates
          bit #(UnitStateMoved | UnitStateDead)
          bne _SEC

            jsl rlGetSelectedUnitStatus
            cmp #StatusCured
            beq _SEC

              cmp #StatusFreelancer
              beq _SEC

                cmp #StatusCaptive
                beq _SEC

                  cmp #StatusSleep
                  beq _SEC

                    clc

                    -
                    plx
                    rtl

        _SEC
        sec
        bra -

        .databank 0

      rlUnknown86B45D ; 86/B45D

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        lda aAIAction.wDestinationXPosition
        sta wAITargetXPosition,b
        lda aAIUnitList.wDestinationYPosition
        sta wAITargetYPosition,b
        lda $7F4440
        sta wAIUnknown000E8E,b
        lda aAIAction.wChosenTargetDeploymentOffset
        sta wAIUnknown000E8C,b
        plp
        plb
        rtl

        .databank 0

      rsUnknown86B480 ; 86/B480

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx

        ldx wAISelectedAIUnitOffset,b
        bit #$2000
        bne ++

          lda wAIUnknownBitfield7E2000
          bit #$0004
          beq ++

            ; foes in threat range
            lda aAIUnitList.XPosition,x
            and #$00FF
            sta wAITemp000E96,b
            lda aAIUnitList.YPosition,x
            and #$00FF
            sta wAITemp000E98,x

            lda wAIUnknown7E2014
            sta wAITemp000E9A,b
            lda wAIUnknown7E2016
            sta wAITemp000E9C,b
            jsl rlUnkown86C221

            phx
            lda wAITemp000E98,b
            xba
            lsr a
            lsr a
            clc
            adc wAITemp000E96,b
            tax

            lda aTargetDistanceMap,x
            and #$00FF
            bne +

              lda #$00FF

            ; Save distance to target
            +
            sta aAIAction.wMovementDistanceToTarget
            plx

        +
        sep #$20
        lda #$7F
        pha
        rep #$20
        plb

        lda #1
        sta aAIAction.wUnitInventorySlot,b
        lda aAIUnitList.XPosition,x
        and #$00FF
        sta aAIAction.wDestinationXPosition,b
        lda aAIUnitList.YPosition,x
        and #$00FF
        sta aAIUnitList.wDestinationYPosition,b
        lda #$FFFF
        sta aAIUnitList.wChosenTargetDeploymentOffset,b
        lda #$C000
        sta aAIAction.wBestAttackChance,b
        lda #$4000
        sta aAIAction.wUnitToChosenTargetDistance,b

        jsl rlGetCleverModeFlag
        cmp #1
        beq _CleverModeEnabled

          lda wAICurrentAISetting
          jsl rlGetAIGroupsLeadershipPower
          bra ++

        _CleverModeEnabled
        lda #100

        +
        sta aAIAction.wLeadershipPower,b

        lda wAIUnknown7E2002
        sta aAIAction.wUnknown7F4448,b

        jsl rlGetSelectedUnitStates
        bit #UnitStateGuardingCastle
        beq +

          lda #5
          sta aAIAction.wUnknown7F4448,b

        +
        lda #$FFFF
        sta $000EA2
        lda #<>aUnitMap
        sta aAIAction.wMapPointer
        lda #FillUnitMapNoFilter
        jsl rlFillUnitMap

        jsl rlGetSelectedUnitFactionSlot
        sta aAIAction.wUnitFaction,b
        jsl rlGetSelectedUnitMovementCostPointer
        sta aAIAction.wUnitMovementCostPointer,b
        lda aAIUnitList.DeploymentOffset,x
        and #$00FF
        sta aAIAction.wUntDeploymentOffset,b

          _Loop
          lda aAIAction.wUnitInventorySlot,b
          jsl rlGetItemROMDataByInventorySlot
          lda wCurrentItemDataROMPointer
          beq _End

          jsl rlGetItemMinimumRange
          sta aAIAction.wUnitItemMinimumRange,b
          jsl rlGetItemMaximumRange
          sta aAIAction.wUnitItemMaximumRange,b

          lda wCurrentItemDataROMPointer
          sta aAIUnitList.ItemROMPointer,x
          jsl rlGetSelectedUnitBattleMight
          cmp #256
          bcc +

            lda #255

          +
          sep #$20
          sta aAIUnitList.BattleMight,x
          rep #$20

          jsl rlGetItemWeaponType
          sep #$20
          sta aAIUnitList.ItemType,x
          rep #$20

          jsl rlGetItemEquipmentType
          cmp #EquipTypeWeapon
          beq _Weapon

            cmp #EquipTypeStaff
            beq _Staff
            bra _Next
          
          _Weapon
          jsl rlCheckWeaponEquippable
          bcc _Next

            jsr rsUnknown86B5E7
            bra _Next
          
          _Staff
          jsl rlCheckStaffEquippable
          bcc _Next

            phx
            jsr rsUnknown86B60B
            plx

          _Next
          inc aAIAction.wUnitInventorySlot,b
          bra _Loop

        _End
        lda aAIAction.wChosenTargetDeploymentOffset,b
        cmp #$FFFF
        beq +

          jsl rlUnknown86B45D

        +
        plx
        plp
        plb
        rts

        .databank 0

      rsUnknown86B5E7 ; 86/B5E7

        .al
        .autsiz
        .databank ?

        jsl rlGetSelectedUnitStatus
        cmp #StatusBerserk
        beq +

        lda #2
        sta aAIAction.wUnknown7F4402,b
        jsr rsUnknown86B666
        bra ++
        
        +
        lda #0
        sta aAIAction.wLeadershipPower,b
        lda #2
        sta aAIAction.wUnknown7F4402,b
        jsr rsUnknown86B73E

        +
        rts

        .databank 0

      rsUnknown86B60B ; 86/B60B

        .al
        .autsiz
        .databank ?

        jsl rlGetItemStaffEffect
        cmp #$0C
        bcs _StatusStaff

          ; Branch if utility staff
          cmp #6
          bcs _End

            ; Only healing staves left
            tax
            jsl rlGetSelectedUnitStatus
            cmp #StatusBerserk
            beq _End

              lda #1
              sta aAIAction.wUnknown7F4402,b
              jsr rsUnknown86B73E
              cpx #5
              bne _End

                lda aAIAction.wChosenTargetDeploymentOffset,b
                cmp #$FFFF
                beq _End

                  lda $4440,b
                  cmp #14
                  bne _End

                    lda #$FFFE
                    sta aAIAction.wChosenTargetDeploymentOffset,b

          _End
          rts
        
        _StatusStaff
        jsl rlGetSelectedUnitStatus
        cmp #StatusBerserk
        beq +

        lda #0
        sta aAIAction.wUnknown7F4402,b
        jsr rsUnknown86B666
        bra ++

        +
        lda #0
        sta aAIAction.wUnknown7F4402,b
        jsr $86B73E
        
        +
        rts

        .databank 0

      rsUnknown86B666 ; 86/B666

        .al
        .autsiz
        .databank ?

        phx
        lda wAITargetCounter
        beq _End

          tay
          lda #0
          sta wAISelectedAITargetOffset
          
            _Loop
            lda wAISelectedAITargetOffset
            tax
            lda aAITargetList.DeploymentOffset,x
            and #$00FF
            sta aAIAction.wTargetDeploymentOffset,b
            tax
            jsr rsCheckIfPossibleSilenceTarget
            bcs _Next

              jsr rsUnknown86B6BE
              bcs _Next

                lda aDeploymentTable._State,x
                bit #DeploymentStateGrayed
                beq _Next

                  lda wAIUnknown7E2002
                  cmp #7
                  bne +

                    lda aDeploymentTable._State,x
                    bit #DeploymentStateGuardingCastle
                    bne _Next

                  +
                  jsr rsUnknown86B771

            _Next
            lda wAISelectedAITargetOffset
            clc
            adc #size(structAITargetEntry)
            sta wAISelectedAITargetOffset
            dec y
            bne _Loop
        
        _End
        plx
        rts

        .databank 0

      rsUnknown86B6BE ; 86/B6BE

        .al
        .autsiz
        .databank ?

        phx
        lda wSelectedUnitDataRAMPointer
        pha

        lda wAIIgnoredGenerationID
        beq _CLC

          lda aAIAction.wUntDeploymentOffset,b
          cmp wAIGroupLeaderDeploymentOffset,b
          bne _CLC

            ldx aAIAction.wTargetDeploymentOffset,b
            lda aDeploymentTable._UnitRAMPointer,x
            sta wSelectedUnitDataRAMPointer
            jsl rlGetSelectedUnitFactionSlot
            cmp #0
            bne _CLC

              jsl rlGetSelectedUnitGenerationID
              cmp wAIIgnoredGenerationID
              bne _CLC

                sec
                pla
                sta wSelectedUnitDataRAMPointer
                plx
                rts
        
        _CLC
        clc
        pla
        sta wSelectedUnitDataRAMPointer
        plx
        rts

        .databank 0

      rsCheckIfPossibleSilenceTarget ; 86/B701

        .al
        .autsiz
        .databank ?

        ; Input:
        ; X = offset into target AI list
        ; aAIAction.wTargetDeploymentOffset

        phx
        lda wSelectedUnitDataRAMPointer
        pha

        jsl rlGetItemStaffEffect
        cmp #$000C
        bne _CLC

          ; Is silence
          ldx aAIAction.wTargetDeploymentOffset,b
          lda aDeploymentTable._UnitRAMPointer,x
          sta wSelectedUnitDataRAMPointer

          ldx #structClassROMEntry.StaffRank - structClassROMEntry.SwordRank

            -
            txa
            jsl rlGetSelectedUnitWeaponRank
            cmp #WeaponRankNone
            bcc _CLC

            inc x
            cpx #size(structClassROMEntry.WeaponRanks)
            bcc -

          sec
          pla
          sta wSelectedUnitDataRAMPointer
          plx
          rts
        
        _CLC
        clc
        pla
        sta wSelectedUnitDataRAMPointer
        plx
        rts

        .databank 0

      rsUnknown86B73E ; 86/B73E

        .al
        .autsiz
        .databank ?

        phx
        lda #$FFFF
        sta wAISelectedAITargetOffset

        ldx #(len(aDeploymentTable._State) - 2)

          _Loop
          cpx aAIAction.wUntDeploymentOffset,b
          beq _Next

            lda aDeploymentTable._State,x
            bit #DeploymentStateAlive
            beq _Next

              txa
              jsl rlCheckIfTargetFoeOfOwnFaction
              bcc _Next

                stx aAIAction.wTargetDeploymentOffset,b
                jsr rsCheckIfPossibleSilenceTarget
                bcs _Next

                  phx
                  jsr rsUnknown86B771
                  plx

          _Next
          dec x
          dec x
          bpl _Loop

        plx
        rts

        .databank 0

      rsUnknown86B771 ; 86/B771

        .al
        .autsiz
        .databank ?

        ; Check if target within units threat range?

        ; X = AI target deployment offset

        lda aDeploymentTable._XTilePosition,x
        sta aAIAction.wTargetXPosition,b
        lda aDeploymentTable._YTilePosition,x
        sta aAIAction.wTargetYPosition,b

        lda wAISelectedAIUnitOffset
        tax
        lda aAIUnitList.XPosition,x
        and #$00FF
        sec
        sbc aAIAction.wTargetXPosition,b
        bpl +

          eor #$FFFF
          inc a

        +
        sta wAITemp000E9E

        lda aAIUnitList.YPosition,x
        and #$00FF
        sec
        sbc aAIAction.wTargetYPosition,b
        bpl +

          eor #$FFFF
          inc a
        
        +
        clc 
        adc wAITemp000E9E
        sta wAITemp000E9E

        lda aAIUnitList.ThreatRange,x
        and #$00FF
        cmp wAITemp000E9E
        bcc +

          lda aAIAction.wUnitItemMinimumRange,b
          sta aAIAction.wMinimumAttackRange,b
          lda aAIAction.wUnitItemMaximumRange,b
          sta aAIAction.wMaximumAttackRange,b
          jsl rlUnknown869F35

        +
        rts

        .databank 0

      rsUnknown86B7D1 ; 86/B7D1

        .al
        .autsiz
        .databank ?

        clc
        rts

        .databank 0

      rsCheckAnyFoeInGroupRangeFlagUnset ; 86/B7D3

        .al
        .autsiz
        .databank ?

        lda wAIUnknownBitfield7E2000
        bit #$0004
        beq +

          clc
          rts

        +
        sec
        rts

        .databank 0

      rsCheckIfCastlesCapturable ; 86/B7E0

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        phy

        lda wSelectedUnitDataRAMPointer,b
        pha

        lda wAIUnknown7E2002
        cmp #7
        beq _CLC

        cmp #3
        beq _CLC

        cmp #6
        beq _CLC

          ldx wAISelectedAIUnitOffset,b
          lda aAIUnitList.UnitRAMPointer,x
          sta wSelectedUnitDataRAMPointer,b

          jsl rlGetSelectedUnitStatus
          cmp #StatusBerserk
          beq _CLC

            lda wAIUnknown7E201A
            cmp #7
            beq _CLC

              jsl rlGetSelectedUnitStates
              bit #UnitStateGroupLeader
              beq +

                lda wAIUnknown7E201A
                cmp #10
                beq _CLC

                  cmp #11
                  beq _CLC

              +
              lda aAIUnitList.DeploymentOffset,x
              and #$00FF
              sta aAIAction.wUntDeploymentOffset

              sep #$20
              lda #$7F
              pha
              rep #$20
              plb

              ldy #0

              -
              tya
              jsl lGetLocationEventDataEntry
              bcs _CLC

                jsl rlGetEventLocationEntryType
                cmp #0
                bne _Next

                  ; Is a castle
                  jsr rsCheckIfFoesCastleUnblockedReachable
                  bcc _Next

                    jsr rsUnknown86B8CB
                    bcs _SEC

                    jsr rsUnknown86B8E5
                    bcs _SEC

                _Next
                inc y
                bra -

        _CLC
        pla
        sta wSelectedUnitDataRAMPointer
        ply
        plx
        plp
        plb
        clc
        rts
        
        _SEC
        pla
        sta wSelectedUnitDataRAMPointer
        ply
        plx
        plp
        plb
        sec
        rts

        .databank 0

      rsCheckIfFoesCastleUnblockedReachable ; 86/B87E

        .al
        .autsiz
        .databank ?

        ; Check if foes castle is within move range
        ; and not blocked or blocked by own unit

        lda wAIActiveFaction
        tax
        jsl rlGetLocationFactionSlotOwner
        jsl rlGetFactionRelation
        cmp #AllegianceEnemy
        bne _CLC
        
          jsl rlCheckLocationDestroyed
          bcs _CLC

            jsl rlGetEventLocationEntryEffectiveXCoordinate
            sta aAIAction.wDestinationXPosition,b
            jsl rlGetEventLocationEntryEffectiveYCoordinate
            sta aAIUnitList.wDestinationYPosition,b

            lda aAIUnitList.wDestinationYPosition,b
            xba
            lsr a
            lsr a
            clc
            adc aAIAction.wDestinationXPosition,b
            tax

            lda aMovementMap,b,x
            and #$00FF
            beq _CLC

              lda aAllyUnitMap,b,x
              and #$00FF
              cmp aAIAction.wUntDeploymentOffset,b
              beq _SEC

                cmp #$00FF
                bne _CLC

              _SEC
              sec
              rts
        
        _CLC
        clc
        rts

        .databank 0

      rsUnknown86B8CB ; 86/B8CB

        .al
        .autsiz
        .databank ?

        jsl rlCheckIfCastleGuarded
        bcs +

          lda #4
          sta $4440,b
          lda #$FFFF
          sta aAIAction.wChosenTargetDeploymentOffset,b
          jsl rlUnknown86B45D
          sec
          rts
        
        +
        clc
        rts

        .databank 0

      rsUnknown86B8E5 ; 86/B8E5

        .al
        .autsiz
        .databank ?

        jsl rlGetSelectedUnitStates
        bit #UnitStateCanto
        beq +

          jml _CLC
        
        +
        jsl rlGetFirstEquippableWeaponInInventory
        sta aAIAction.wUnitInventorySlot,b

        jsl rlCheckWeaponEquippable
        bcs +

          jml _CLC
        
        +
        lda wCurrentItemDataROMPointer
        bne +

          jml _CLC
        
        +
        jsl rlGetItemMinimumRange
        cmp #2
        bcc +

          jml _CLC
        
        +
        jsl rlGetEventLocationEntryCoordinates
        pha
        and #$00FF
        sta $EC48,b
        pla

        and #$FF00
        lsr a
        lsr a
        clc
        adc $EC48,b
        tax
        lda $554A,b,x
        and #$00FF
        sta aAIAction.wTargetDeploymentOffset,b
        jsr rsUnknown86B6BE
        bcc +

          jml _CLC
        
        +
        lda wCurrentTurn
        and #$FFC0
        sta aAIAction.wTurnValue,b
        lda aAIAction.wUntDeploymentOffset,b
        sta wAITemp000E96

        lda aAIAction.wTargetDeploymentOffset,b
        sta wAITemp000E98
        lda #9
        sta $000E9A
        lda #1
        sta $000E9C
        lda aAIAction.wUnitInventorySlot,b
        sta $000E9E
        jsl $86BFE6
        clc
        adc aAIAction.wTurnValue,b
        ora #0
        beq _CLC

        ldx aAIAction.wTargetDeploymentOffset,b
        lda aDeploymentTable._UnitRAMPointer,x
        sta wSelectedUnitDataRAMPointer
        jsl rlGetFirstEquippableWeaponInInventory

        lda wCurrentItemDataROMPointer
        beq +

          jsl rlGetItemMaximumRange
          cmp #2
          beq +

            lda wAISelectedAIUnitOffset
            tax
            lda aAIUnitList.ItemROMPointer,x
            sta wCurrentItemDataROMPointer
            jsl rlGetItemMaximumRange
            cmp #2
            beq ++
        
        +
        lda aAIAction.wUnitInventorySlot,b
        sta wSelectedInventorySlot
        lda #2
        sta $4440,b
        lda aAIAction.wTargetDeploymentOffset,b
        sta aAIAction.wChosenTargetDeploymentOffset,b
        jsl rlUnknown86B45D
        bra _SEC

        +
        lda aAIAction.wUnitInventorySlot,b
        sta wSelectedInventorySlot
        lda #15
        sta $4440,b
        lda aAIAction.wTargetDeploymentOffset,b
        sta aAIAction.wChosenTargetDeploymentOffset,b
        jsl rlUnknown86B45D
        bra _SEC
        
        _SEC
        sec
        rts
        
        _CLC
        clc
        rts

        .databank 0

      rsUnknown86B9E6 ; 86/B9E6

        .al
        .autsiz
        .databank ?

        clc
        rts

      rsUnknown86B9E8 ; 86/B9E8

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx

        sep #$20
        lda #$7F
        pha
        rep #$20
        plb

        lda wAIUnknown7E2018
        cmp #$FFFF
        bne +

          jsr $86BA3B
          cmp #$FFFF
          beq ++

        +
        jsl rlGetLocationEventDataEntry
        bcs _End

          jsl rlGetEventLocationEntryType
          cmp #2
          bne _End

            jsl rlGetEventLocationEntryEffectiveXCoordinate
            sta aAIAction.wDestinationXPosition,b
            jsl rlGetEventLocationEntryEffectiveYCoordinate
            sta aAIUnitList.wDestinationYPosition,b

            lda #5
            sta $4440,b
            lda #$FFFF
            sta aAIAction.wChosenTargetDeploymentOffset,b
            jsl rlUnknown86B45D
            bra _End
            
            +
            nop

        _End
        plx
        plp
        plb
        clc
        rts

        .databank 0

        ; 86/BA3B






      rsUnknown86BA86 ; 86/BA86

        .al
        .autsiz
        .databank ?

        phx
        jsl rlGetSelectedUnitStates
        bit #UnitStateGuardingCastle
        bne +

          jml _End
        
        +
        bit #UnitStateCanto
        beq +

          jml _End
        
        +
        jsl rlGetSelectedUnitStatus
        cmp #StatusBerserk
        bne +

          jml _End
        
        +
        lda wAITemp000E96,b
        sta aAIAction.wDestinationXPosition
        lda wAITemp000E98,b
        sta aAIUnitList.wDestinationYPosition
        jsl rlGetFirstEquippableWeaponInInventory
        sta aAIAction.wUnitInventorySlot
        jsl rlCheckWeaponEquippable
        bcc _End

          lda wCurrentItemDataROMPointer,b
          beq _End

            jsl rlGetItemMinimumRange
            cmp #2
            bcs _End

              lda wAITemp000E98,b
              inc a
              inc a
              xba
              lsr a
              lsr a
              clc
              adc wAITemp000E96,b
              tax

              lda aFoeUnitMap,x
              and #$00FF
              cmp #$00FF
              beq _End

                sta aAIAction.wTargetDeploymentOffset

                lda aAIAction.wUntDeploymentOffset
                sta wAITemp000E96,b
                lda aAIAction.wTargetDeploymentOffset
                sta wAITemp000E98,b
                lda #9
                sta wAITemp000E9A,b
                lda #1
                sta wAITemp000E9C,b
                lda aAIAction.wUnitInventorySlot
                sta wAITemp000E9E,b
                jsl $86BFE6
                ora #0
                beq _End

                  lda aAIAction.wUnitInventorySlot
                  sta wSelectedInventorySlot,b
                  lda #2
                  sta $7F4440
                  lda aAIAction.wTargetDeploymentOffset
                  sta aAIAction.wChosenTargetDeploymentOffset
                  jsl rlUnknown86B45D

        _End
        plx
        sec
        rts

        .databank 0

      rsUnknown86BB38 ; 86/BB38

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx

        ldx wAISelectedAIUnitOffset,b
        lda aAIUnitList.UnitRAMPointer,x
        sta wSelectedUnitDataRAMPointer,b
        jsl rlGetSelectedUnitStates
        bit #UnitStateCanto
        beq +

          jml _End
        
        +
        jsr $86BCB1
        bcc +

          jml _End
        
        +
        jsr $86BCC7
        beq +

          jml _End
        
        +
        jsl rlGetSelectedUnitStates
        bit #UnitStateCanto
        beq +

          jml _End
        
        +
        bit #UnitStateGroupLeader
        bne +

        lda wAIUnknown7E201C
        cmp #12
        bne +

          jml _End
        
        +
        sep #$20
        lda #$7F
        pha
        rep #$20
        plb

        lda wAIUnknown7E2018
        asl a
        tax
        lda aDeploymentTable._State,x
        bit #DeploymentStateAlive
        bne +

          jml _End
        
        +
        bit #DeploymentStateHidden
        beq +

          jml _End
        
        +
        lda wCurrentChapter
        bne +

        lda #31
        bra ++
        
        +
        lda #63
        
        +
        sta wAITemp000EA2
        lda aDeploymentTable._XTilePosition,x
        sta aAIAction.wDestinationXPosition,b
        lda aDeploymentTable._YTilePosition,x
        dec a
        cmp #1
        bcc +

          sta aAIUnitList.wDestinationYPosition,b
          jsr $86BC64
          bne _BC3E
        
        +
        lda aDeploymentTable._XTilePosition,x
        dec a
        cmp #1
        bcc +

          sta aAIAction.wDestinationXPosition,b
          lda aDeploymentTable._YTilePosition,x
          sta aAIUnitList.wDestinationYPosition,b
          jsr $86BC64
          bne _BC3E
        
        +
        lda aDeploymentTable._XTilePosition,x
        inc a
        cmp #63
        bcs +

          sta aAIAction.wDestinationXPosition,b
          lda aDeploymentTable._YTilePosition,x
          sta aAIUnitList.wDestinationYPosition,b
          jsr $86BC64
          bne _BC3E
        
        +
        lda aDeploymentTable._XTilePosition,x
        sta aAIAction.wDestinationXPosition,b
        lda aDeploymentTable._YTilePosition,x
        inc a
        cmp $000EA2
        bcs +

          sta aAIUnitList.wDestinationYPosition,b
          jsr $86BC64
          bne _BC3E
        
        +
        lda aDeploymentTable._State,x
        bit #DeploymentStateGuardingCastle
        beq _End

          lda aDeploymentTable._XTilePosition,x
          sta aAIAction.wDestinationXPosition,b
          lda aDeploymentTable._YTilePosition,x
          inc a
          inc a
          sta aAIUnitList.wDestinationYPosition,b
          jsr $86BC64
          beq _End
          
            _BC3E
            lda wAIUnknown7E201C
            sta $4440,b
            bne +

            lda #$FFFF
            bra ++
            
            +
            lda wAIUnknown7E2018
            asl a

            +
            sta aAIAction.wChosenTargetDeploymentOffset,b
            lda #1
            sta wSelectedInventorySlot
            jsl rlUnknown86B45D
        
        _End
        plx
        plp
        plb
        clc
        rts

        .databank 0

        ; 86/BC64




      rsUnknown86BCE3 ; 86/BCE3

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx

        jsl rlGetSelectedUnitStates
        bit #UnitStateGroupLeader
        beq +

          jsr rsUnknown86BD06
          bcs +

            lda #3
            sta $7F4440
            jsl rlUnknown86B45D
        
        +
        plx
        plp
        plb
        clc
        rts

        .databank 0

      rsUnknown86BD06 ; 86/BD06

        .al
        .autsiz
        .databank ?

        lda wAIActiveFaction,b
        jsl rlGetFactionSlotLocationID
        jsl rlGetLocationEventDataEntry
        bcs _SEC

          jsl rlGetEventLocationEntryType
          cmp #0
          bne _SEC

            jsl rlGetEventLocationEntryEffectiveXCoordinate
            sta aAIAction.wDestinationXPosition
            jsl rlGetEventLocationEntryEffectiveYCoordinate
            sta aAIUnitList.wDestinationYPosition
            lda #$FFFF
            sta aAIAction.wChosenTargetDeploymentOffset
            clc
            rts

        _SEC
        sec
        rts

        .databank 0

      rsUnknown86BD37 ; 86/BD37

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx

        jsl rlGetSelectedUnitStates
        bit #UnitStateGroupLeader
        beq +

          jsr $86DB06
          bcs +

            lda #13
            sta $7F4440
            jsl rlUnknown86B45D

        +
        plx
        plp
        plb
        clc
        rts

        .databank 0

      rsUnknown86BD5A ; 86/BD5A

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb

        jsl rlGetSelectedUnitStates
        bit #UnitStateGroupLeader
        beq +

          lda wAITemp000E96,b
          sta aAIAction.wDestinationXPosition
          lda wAITemp000E98,b
          sta aAIUnitList.wDestinationYPosition
          lda #$FFFF
          sta aAIAction.wChosenTargetDeploymentOffset
          lda #0
          sta $7F4440
          jsl rlUnknown86B45D

        +
        plp
        plb
        clc
        rts

        .databank 0

      rsUnknown86BD8B ; 86/BD8B

        .al
        .autsiz
        .databank ?

        jsr rsUnknown86BD06
        bcs +

          lda #3
          sta $7F4440
          jsl rlUnknown86B45D

        +
        clc
        rts

        .databank 0

      rsUnknown86BD9D ; 86/BD9D

        .al
        .autsiz
        .databank ?

        phx
        lda wAIUnknown7E201A
        cmp #9
        beq _SEC

          cmp #11
          beq _SEC

            cmp #12
            beq _SEC

              lda wAITemp000E98,b
              and #$00FF
              xba
              lsr a
              lsr a
              clc
              adc wAITemp000E96,b
              tax

              lda aFoeUnitMap,x
              and #$00FF
              cmp #$00FF
              bne _SEC 

                lda #4
                sta $0D81,b
                lda $056F,b
                sta $0D83,b
                lda #0
                sta wUnknownDeploymentOffset000D7F,b

                  -
                  lda wUnknownDeploymentOffset000D7F,b
                  beq -

                clc
                bra +

        _SEC
        sec
        
        +
        plx
        rts

        .databank 0

      rlUnknown86BDE8 ; 86/BDE8

        .al
        .autsiz
        .databank ?

        ; wAITemp000E96 = unit X
        ; wAITemp000E98 = unit Y

        ; wAITemp000E9A = target X
        ; wAITemp000E9C = target Y

        phb
        php
        phk
        plb
        phx

        ldx wAITemp000E9A,b
        cpx #1
        bmi _SEC

        cpx #63
        bpl _SEC

        ldx wAITemp000E9C,b
        cpx #1
        bmi _SEC

        cpx #63
        bpl _SEC

        ldx wAITemp000E96,b
        cpx wAITemp000E9C,b
        bne +

          ldx wAITemp000E98,b
          cpx wAITemp000E9C,b
          beq _CLC

        +
        jsl rlUnkown86C221
        bcs _SEC

        jsr rsGetClosestTileToTarget
        bcs _CLC

        ldx wAITemp000E96,b
        cpx wAITemp000E9E,b
        bne _End

        ldx wAITemp000E98,b
        cpx wAITemp000EA0,b
        beq +
        
        _End
        plx
        plp
        plb
        clc
        
        -
        rtl
        
        _CLC
        lda wAITemp000E96,b
        sta wAITemp000E9E,b
        lda wAITemp000E98,b
        sta wAITemp000EA0,b
        bra _End
        
        _SEC
        lda wAITemp000E96,b
        sta wAITemp000E9E,b
        lda wAITemp000E98,b
        lda wAITemp000EA0,b
        
        +
        plx
        plp
        plb
        sec
        bra -

        .databank 0

      rsGetClosestTileToTarget ; 86/BE57

        .al
        .autsiz
        .databank ?

        ; Makes a box around units with length = threat range lookup * 2 + 1

        ; Input:
        ; wAITemp000E96 = starting X pos
        ; wAITemp000E98 = starting Y pos

        ; Output:
        ; wAITemp000E9E = ending X pos
        ; wAITemp000EA0 = ending Y pos

        phb
        php
        phk
        plb

        jsl rlGetSelectedUnitTotalMovement
        inc a
        tax
        lda _MovementThreatRangeLookupTable,x
        and #$00FF
        sta wAITemp000E9E,b

        lda wAITemp000E98,b
        sec
        sbc wAITemp000E9E,b
        cmp #1
        bmi +
        bra ++

          +
          lda #1

        +
        xba
        lsr a
        lsr a
        sta wR37

        lda wAITemp000E96,b
        sec
        sbc wAITemp000E9E,b
        cmp #1
        bpl +

          lda #1

        +
        clc
        adc wR37
        tay

        ; Tile index of top left corner in Y

        stz wR36
        lda wAITemp000E96,b
        sec
        sbc wAITemp000E9E,b
        sec
        sbc #1
        bpl +

          eor #$FFFF
          inc a
          sta wR36
          bra ++

        +
        lda wAITemp000E96,b
        clc
        adc wAITemp000E9E,b
        sec
        sbc #63
        bmi +

          inc a
          sta wR36

        +
        lda wAITemp000E9E,b
        asl a
        inc a
        sec
        sbc wR36
        sta wR34

        stz wR36
        lda wAITemp000E98,b
        sec
        sbc wAITemp000E9E,b
        sec
        sbc #1
        bpl +

          eor #$FFFF
          inc a
          sta wR36
          bra ++
        
        +
        lda wAITemp000E98,b
        clc
        adc wAITemp000E9E,b
        sec
        sbc #63
        bmi +

          inc a
          sta wR36

        +
        lda wAITemp000E9E,b
        asl a
        inc a
        sec
        sbc wR36
        sta wR35

        sep #$20
        lda #$7F
        pha
        rep #$20
        plb

        lda #$00FF
        sta $442A,b
        lda #$7FFF
        sta aAIAction.wDestinationXPosition,b
        lda #0
        sta $442C,b

        ; Starts in the top left corner, offset by class move loopup stuff
        ; wR34 = width, wR35 = height

        sep #$20
        lda wR35
        sta wR37

          -
          lda wR34
          sta wR36

            -
            jsr rsCheckIfTileCloserToTarget
            inc y
            dec wR36
            bne -

          rep #$20
          tya
          clc
          adc #64
          sec
          sbc wR34
          tay

          sep #$20
          dec wR37
          bne --

        rep #$20
        lda $442C,b
        beq _SEC

        ; Get target X and Y coordinates
        and #$003F
        sta wAITemp000E9E
        lda $442C,b
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        sta wAITemp000EA0
        plp
        plb
        clc

        -
        rts

        _SEC
        plp
        plb
        sec
        bra -

        .databank 0

        _MovementThreatRangeLookupTable ; 86/BF57

        ; Approximation of (Move * 10 [-1]) * 256/179)/10
        ; Leaving out the -1 part

        .byte ceil(( 0 * 10) * 256.0/179.0/10) ; =  0
        .byte ceil(( 1 * 10) * 256.0/179.0/10) ; =  2
        .byte ceil(( 2 * 10) * 256.0/179.0/10) ; =  3
        .byte ceil(( 3 * 10) * 256.0/179.0/10) ; =  5
        .byte ceil(( 4 * 10) * 256.0/179.0/10) ; =  6
        .byte ceil(( 5 * 10) * 256.0/179.0/10) ; =  8
        .byte ceil(( 6 * 10) * 256.0/179.0/10) ; =  9
        .byte ceil(( 7 * 10) * 256.0/179.0/10) ; = 11
        .byte ceil(( 8 * 10) * 256.0/179.0/10) ; = 12
        .byte ceil(( 9 * 10) * 256.0/179.0/10) ; = 13
        .byte ceil((10 * 10) * 256.0/179.0/10) ; = 15
        .byte ceil((11 * 10) * 256.0/179.0/10) ; = 16
        .byte ceil((12 * 10) * 256.0/179.0/10) ; = 18
        .byte ceil((13 * 10) * 256.0/179.0/10) ; = 19

      rsCheckIfTileCloserToTarget ; 86/BF65

        .al
        .autsiz
        .databank ?

        ; Y = map tile index / 2

        ; Output:
        ; $442A best movement distance
        ; $442C best tile index

        php
        rep #$20
        tya
        asl a
        tax
        lda aMapData,b,x
        and #$03FF
        tax
        lda aTerrainTileset,b,x
        and #$00FF
        cmp #TerrainCastleGate
        bne +

          lda wAIUnknown000E8E
          bmi +

          cmp #0
          beq +

          cmp #15
          beq +

          cmp #4
          beq +

          cmp #3
          beq +

          cmp #13
          beq +
          bra _End
        
        +
        lda aAllyUnitMap,b,y
        and #$00FF
        cmp aAIAction.wUntDeploymentOffset,b
        beq +

          cmp #$00FF
          bne _End

        +
        lda aMovementMap,b,y
        and #$00FF
        beq _End

          ; found a tile unit can move to
          lda aRangeMap,b,y
          and #$00FF
          sta aAIAction.wAttackTileThreatValue,b

          lda aTargetDistanceMap,b,y
          and #$00FF
          beq _End

            ; Tile had an entry on the distance map
            cmp $442A,b
            beq _SameDistance
            bcs _End

            ; Is newest closest tile
            sta $442A,b

            lda aAIAction.wAttackTileThreatValue,b
            bra +

            _SameDistance
            lda aAIAction.wAttackTileThreatValue,b
            cmp aAIAction.wDestinationXPosition,b
            bcs _End

            +
            sta aAIAction.wDestinationXPosition,b
            sty $442C,b
        
        _End
        plp
        rts

        .databank 0

        ; 86/BFE6









      rlAICheckIfUnitOnLowHP ; 86/C0AF

        .al
        .autsiz
        .databank ?

        ; Input:
        ; X = deployment offset

        ; Output:
        ; A = 21 - current HP, if HP is above 21 = 0
        ; Y = current HP
        ; SEC if HP is 21 or above, else CLC

        phb
        php
        phk
        plb
        phx
        lda wSelectedUnitDataRAMPointer,b
        pha

        lda aDeploymentTable._UnitRAMPointer,x
        sta wSelectedUnitDataRAMPointer,b
        jsl rlGetSelectedUnitCurrentHP
        tay
        cmp #21
        bcs +

        eor #$FFFF
        inc a
        clc
        adc #21

        -
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

      rlAIGetMissingHPRatio ; 86/C0DE

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

        lda aDeploymentTable._UnitRAMPointer,x
        sta wSelectedUnitDataRAMPointer,b

        jsl rlGetSelectedUnitCurrentHP
        and #$00FF
        xba
        sta wR36
        jsl rlGetSelectedUnitMaxHP
        sta wR37
        jsl rlUnsignedDivide16By16

        lda #256
        sec
        sbc wR36

        plx
        stx wSelectedUnitDataRAMPointer,b
        plx
        plp
        plb
        rtl

        .databank 0

      rlFillAllyUnitMap ; 86/C110

        .al
        .autsiz
        .databank ?

        lda #<>aAllyUnitMap
        sta aAIAction.wMapPointer
        lda #$FFFF
        sta $0EA2,b
        lda #FillUnitMapAllyFilter
        jsl rlFillUnitMap
        rtl

        .databank 0

      rlFillFoeUnitMap ; 86/C125

        .al
        .autsiz
        .databank ?

        lda #<>aFoeUnitMap
        sta aAIAction.wMapPointer
        lda #$FFFF
        sta $0EA2,b
        lda #FillUnitMapFoeFilter
        jsl rlFillUnitMap
        rtl

        .databank 0

      rlFillUnitMap ; 86/C13A

        .al
        .autsiz
        .databank ?

        ; Writes deployment offsets of units to their map tile index, depening on the filter setting.

        ; Input:
        ; aAIAction.wMapPointer
        ; $0EA2 = deployment offset AND value
        ; A = filter

        phb
        php
        phk
        plb
        phx
        phy

        asl a
        tax
        lda aFillUnitMapFilter,b,x
        sta lAITemp000E90,b

        lda wAIActiveFaction,b
        sta $7F442C

        sep #$20
        lda #`aAlliedUnitMap
        pha
        rep #$20
        plb

        lda aAIAction.wMapPointer
        tay
        ldx #size(aAlliedUnitMap)
        lda #$FFFF

          -
          sta $0000,b,y
          inc y
          inc y
          dec x
          dec x
          bne -

        ldx #(len(aDeploymentTable._State) - 2)

        _Loop
        txa
        lda aDeploymentTable._State,x
        bit #DeploymentStateAlive
        beq _Next

          bit #DeploymentStateHidden
          bne _Next

            jsr rsFillUnitMapApplyFilter
            bcc _Next

              lda aDeploymentTable._XTilePosition,x
              sta aAIAction.wAttackTileXPosition,b
              lda aDeploymentTable._YTilePosition,x
              sta aAIAction.wAttackTileYPosition,b

              lda aAIAction.wAttackTileYPosition,b
              and #$00FF
              xba
              lsr a
              lsr a
              clc
              adc aAIAction.wAttackTileXPosition,b
              adc aAIAction.wMapPointer,b
              tay

              txa
              and $000EA2
              sep #$20
              sta $0000,b,y
              rep #$20

        _Next
        dec x
        dec x
        bpl _Loop

        ply
        plx
        plp
        plb
        rtl

        .databank 0

      rsFillUnitMapApplyFilter ; 86/C1B6

        .al
        .autsiz
        .databank ?

        jmp (lAITemp000E90)

        .databank 0

      aFillUnitMapFilter ; 86/C1B9

        .include "../TABLES/FillUnitMapFilters.csv.asm"

      rsFillUnitMapAllyFilter ; 86/C1BF

        .al
        .autsiz
        .databank ?

        phx
        lda aDeploymentTable._FactionSlot,x
        ldx $442C,b
        jsl rlGetFactionRelation
        cmp #AllegianceEnemy
        beq rsFillUnitMapFoeFilter._CLC

        cmp #AllegianceOther
        beq rsFillUnitMapFoeFilter._CLC
        bra rsFillUnitMapFoeFilter._SEC

        .databank 0

      rsFillUnitMapFoeFilter ; 86/C1D7

        .al
        .autsiz
        .databank ?

        phx
        lda aDeploymentTable._FactionSlot,x
        ldx $442C,b
        jsl rlGetFactionRelation
        cmp #AllegianceOther
        beq _SEC

        cmp #AllegianceEnemy
        bne _CLC
        
        _SEC
        plx
        sec
        rts

        _CLC
        plx
        clc
        rts

        .databank 0

      rsFillUnitMapNoFilter ; 86/C1F3

        .al
        .autsiz
        .databank ?

        sec
        rts

        .databank 0

      rlUnkown86C1F5 ; 86/C1F5

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb

        jsl rlGetSelectedUnitTotalFieldMovement
        sta wAITemp000EA2

        jsr rsUnknown86C20B
        jsl rlFillMovementMap
        plp
        plb
        rtl

        .databank 0

      rsUnknown86C20B ; 86/C20B

        .al
        .autsiz
        .databank ?

        lda wAIUnknownBitfield7E2000
        bit #$0200
        beq +

          jsl rlGetSelectedUnitStates
          bit #UnitStateCanto
          bne +

            lsr wAITemp000EA2,b

        +
        rts

        .databank 0

      rlUnkown86C221 ; 86/C221

        .al
        .autsiz
        .databank ?

        ; Sets units position as the target tile and then checks if from the position
        ; of the target tile if the units tile is reachable.

        ; wAITemp000E96 / wAITemp000E98 = units coords
        ; wAITemp000E9A / wAITemp000E9C = target coords

        phb
        php
        phk
        plb
        lda wAITemp000E96
        pha
        lda wAITemp000E98
        pha
        lda wAITemp000E9A
        pha
        lda wAITemp000E9C
        pha

        jsl rlClearTargetMap

        lda #0
        jsl rlSetTargetMapTile
        jsl rlFillMovementCostMap
        jsl rlIncreaseMoveCostOfFoesOccupiedTiles

        lda wAITemp000E9A
        sta wAITemp000E96
        lda wAITemp000E9C
        sta wAITemp000E98

        jsl rlGetNearestPossibleTarget
        bcc _SEC

          pla
          sta wAITemp000E9C
          pla
          sta wAITemp000E9A
          pla
          sta wAITemp000E98
          pla
          sta wAITemp000E96
          plp
          plb
          clc
          bra +

        _SEC
        pla
        sta wAITemp000E9C
        pla
        sta wAITemp000E9A
        pla
        sta wAITemp000E98
        pla
        sta wAITemp000E96
        plp
        plb
        sec

        +
        rtl

        .databank 0

        ; 86/C293







      rlGetCleverModeFlag ; 87/C003

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        lda wOptionSettings,b
        and #$1000
        xba 
        lsr a
        lsr a
        lsr a
        lsr a
        plp
        plb
        rtl

        .databank 0

        ; 87/C015







      rlBuildAITargetList ; 87/CBC6

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx 
        phy

        sep #$20
        lda #$7E
        pha
        rep #$20
        plb

        ldy #<>aAITargetList
        stz wAITargetCounter,b
        ldx #(len(aDeploymentTable._State) - 2)

          _Loop
          lda aDeploymentTable._State,b,x
          bit #DeploymentStateAlive
          bne +

            jml _Next

          +
          phx
          lda aDeploymentTable._FactionSlot,b,x
          tax
          lda wAIActiveFaction,b
          jsl rlGetFactionRelation
          plx
          cmp #AllegianceEnemy
          beq +

            jml _Next

          +
          lda aDeploymentTable._UnitRAMPointer,b,x
          sta wSelectedUnitDataRAMPointer,b
          sta structAITargetEntry.UnitRAMPointer,b,y
          txa
          sta structAITargetEntry.DeploymentOffset,b,y

          jsl rlGetFirstWeaponBattleMight
          ora #0
          bne +

            inc a

          +
          sep #$20
          sta structAITargetEntry.BattleMight,b,y
          rep #$20

          jsl rlGetSelectedUnitTotalDefense

          sep #$20
          sta structAITargetEntry.BattleDefense,b,y
          rep #$20

          jsl rlGetSelectedUnitTotalResistance

          sep #$20
          sta structAITargetEntry.BattleDefense,b,y
          rep #$20

          lda wCurrentItemDataROMPointer,b
          sta structAITargetEntry.ItemROMPointer,b,y
          beq +

            jsl rlGetItemMaximumRange
          
          +
          sta $7FEC48

          jsr rsGetSelectedUnitMovementThreatRange
          clc
          adc $7FEC48

          sep #$20
          sta structAITargetEntry.ThreatRange,b,y
          rep #$20

          jsl rlGetItemWeaponType
          sep #$20
          sta structAITargetEntry.ItemType,b,y
          lda aDeploymentTable._XTilePosition,x
          sta structAITargetEntry.XPosition,b,y
          lda aDeploymentTable._YTilePosition,x
          sta structAITargetEntry.YPosition,b,y
          rep #$20

          txa
          jsl rlGetTerrainTypeByDeploymentOffset

          sep #$20
          sta structAITargetEntry.TerrainType,b,y
          rep #$20

          inc wAITargetCounter,b

          tya
          clc
          adc #size(structAITargetEntry)
          tay

          _Next
          dec x
          dec x
          bmi +

            jml _Loop

        +
        ply
        plx
        plp
        plb
        rtl

        .databank 0

      rsGetSelectedUnitMovementThreatRange ; 87/CC8D

        .al
        .autsiz
        .databank ?

        phx
        jsl rlGetSelectedUnitTotalMovement
        tax
        lda _MovementThreatRangeLookupTable,x
        and #$00FF
        plx
        rts

        .databank 0

        _MovementThreatRangeLookupTable ; 87/CC9C

        ; Approximation of (Move * 10 [-1]) * 256/179)/10
        ; Leaving out the -1 part

        .byte ceil(( 0 * 10) * 256.0/179.0/10) ; =  0
        .byte ceil(( 1 * 10) * 256.0/179.0/10) ; =  2
        .byte ceil(( 2 * 10) * 256.0/179.0/10) ; =  3
        .byte ceil(( 3 * 10) * 256.0/179.0/10) ; =  5
        .byte ceil(( 4 * 10) * 256.0/179.0/10) ; =  6
        .byte ceil(( 5 * 10) * 256.0/179.0/10) ; =  8
        .byte ceil(( 6 * 10) * 256.0/179.0/10) ; =  9
        .byte ceil(( 7 * 10) * 256.0/179.0/10) ; = 11
        .byte ceil(( 8 * 10) * 256.0/179.0/10) ; = 12
        .byte ceil(( 9 * 10) * 256.0/179.0/10) ; = 13
        .byte ceil((10 * 10) * 256.0/179.0/10) ; = 15
        .byte ceil((11 * 10) * 256.0/179.0/10) ; = 16
        .byte ceil((12 * 10) * 256.0/179.0/10) ; = 18
        .byte ceil((13 * 10) * 256.0/179.0/10) ; = 19

      rlRunAIScript ; 87/CCAA

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        phy

        jsl rlClearTargetMap

        lda #1
        sta wAIUnknown7E2002
        lda #0
        sta wAIFormationType
        sta wAIFormationDirection
        sta wAIIgnoredGenerationID

        lda #round(0.7 * 256)
        jsr rsSetAIGroupLeaderScaledFieldMovement

        lda #$FFFF
        sta wAIUnknown7E2018
        lda #0
        sta wAIUnknown7E201A

        lda wAICurrentAISetting,b
        jsl rlTryGetGroupLeaderCoordinates

        lda wAITemp000E96,b
        sta wAIGroupLeaderXPosition
        sta wAIUnknown7E2014

        lda wAITemp000E98,b
        sta wAIGroupLeaderYPosition
        sta wAIUnknown7E2016

        lda wAIUnknownBitfield7E2000
        bit #$0008
        beq +

          ; Group leader is dead
          lda wAIGroupHighestItemRange
          cmp #10
          bcs +

            ; Max weapon range of group is 9 or less
            jsr rsAIScriptCommand18
            bra _End

        +
        ldy lAITemp000E90,b
        sep #$20
        lda lAITemp000E90+2,b
        pha
        rep #$20
        plb
        
        _Loop
        lda $0000,b,y
        and #$00FF
        cmp #$00FF
        beq _End

        inc y
        asl a
        tax
        jsr (aAIScriptCommands,x)
        bcs _End
        bra _Loop
        
        _End
        ply
        plx
        plp
        plb
        rtl

        .databank 0

      aAIScriptCommands ; 87/CD38

        .word <>rsAIScriptCommand00 ; $00
        .word <>rsAIScriptCommand01 ; $01
        .word <>rsAIScriptCommand02 ; $02
        .word <>rsAIScriptCommand03 ; $03
        .word <>rsAIScriptCommand04 ; $04
        .word <>rsAIScriptCommand05 ; $05
        .word <>rsAIScriptCommand06 ; $06
        .word <>rsAIScriptCommand07 ; $07
        .word <>rsAIScriptCommand08 ; $08
        .word <>rsAIScriptCommand09 ; $09
        .word <>rsAIScriptCommand0A ; $0A
        .word <>rsAIScriptCommand0B ; $0B
        .word <>rsAIScriptCommand0C ; $0C
        .word <>rsAIScriptCommand0D ; $0D
        .word <>rsAIScriptCommand0E ; $0E
        .word <>rsAIScriptCommand0F ; $0F
        .word <>rsAIScriptCommand10 ; $10
        .word <>rsAIScriptCommand11 ; $11
        .word <>rsAIScriptCommand12 ; $12
        .word <>rsAIScriptCommand13 ; $13
        .word <>rsAIScriptCommand14 ; $14
        .word <>rsAIScriptCommand15 ; $15
        .word <>rsAIScriptCommand16 ; $16
        .word <>rsAIScriptCommand17 ; $17
        .word <>rsAIScriptCommand18 ; $18
        .word <>rsAIScriptCommand19 ; $19
        .word <>rsAIScriptCommand1A ; $1A
        .word <>rsAIScriptCommand1A ; $1B
        .word <>rsAIScriptCommand1A ; $1C
        .word <>rsAIScriptCommand1A ; $1D
        .word <>rsAIScriptCommand1E ; $1E
        .word <>rsAIScriptCommand1F ; $1F
        .word <>rsAIScriptCommand20 ; $20
        .word <>rsAIScriptCommand21 ; $21
        .word <>rsAIScriptCommand22 ; $22
        .word <>rsAIScriptCommand23 ; $23

      rsAIScriptCommand01 ; 87/CD80

        .al
        .autsiz
        .databank ?

        ; AI_JUMP

        lda $0000,b,y
        tay

        clc
        rts

        .databank 0

      rsAIScriptCommand00 ; 87/CD86

        .al
        .autsiz
        .databank ?

        lda #0
        sta wAIUnknown7E201A
        sec
        rts

        .databank 0

      rsAIScriptCommand02 ; 87/CD8F

        .al
        .autsiz
        .databank ?

        lda $0000,b,y
        and #$00FF
        sta wAIUnknown7E2002
        inc y
        clc
        rts

        .databank 0

      rsAIScriptCommand03 ; 87/CD9C

        .al
        .autsiz
        .databank ?

        ; MODIFY_GROUP_LEADER_FIELD_MOVEMENT

        lda $0000,b,y
        and #$00FF
        beq +

          jsr rsSetAIGroupLeaderScaledFieldMovement

          -
          inc y
          clc
          rts

        +
        jsl rlTryGetAIFactionGroupLeader
        jsl rlGetSelectedUnitTotalFieldMovement
        sta wAIGroupLeaderFieldMovement
        bra -

        .databank 0

      rsSetAIGroupLeaderScaledFieldMovement ; 87/CDB8

        .al
        .autsiz
        .databank ?

        ; A = fraction over 256, eg. 0.7 equals $B7/$FF

        sta wR35

        jsl rlTryGetAIFactionGroupLeader
        jsl rlGetSelectedUnitTotalFieldMovement
        and #$00FF
        xba
        sta wR34

        jsl rlUnsignedMultiply16By16High

        lda wR37
        inc a
        sta wAIGroupLeaderFieldMovement
        rts

        .databank 0

      rsAIScriptCommand04 ; 87/CDD4

        .al
        .autsiz
        .databank ?

        ; AI_SET_IGNORED_GENERATION_ID

        lda $0000,b,y
        and #$00FF
        sta wAIIgnoredGenerationID
        inc y
        clc
        rts

        .databank 0

      rsAIScriptCommand05 ; 87/CDE1

        .al
        .autsiz
        .databank ?

        lda wAIUnknownBitfield7E2000
        ora #$0200
        sta wAIUnknownBitfield7E2000
        rts

        .databank 0

      rsAIScriptCommand06 ; 87/CDED

        .al
        .autsiz
        .databank ?

        ; Mark foes location ID as target tile

        ; 1st byte = Location ID
        ; 2nd byte = ?

        lda $0000,b,y
        and #$00FF
        sta wAITemp000E9A,b

        jsl rlGetLocationEventDataEntry

        lda wAIActiveFaction
        tax
        jsl rlGetLocationFactionSlotOwner
        jsl rlGetFactionRelation
        cmp #AllegianceEnemy
        bne _CLC

          ; Specified location is under foes control
          jsl rlGetEventLocationEntryEffectiveXCoordinate
          sta wAITemp000E96,b

          jsl rlGetEventLocationEntryEffectiveYCoordinate
          sta wAITemp000E98,b

          lda wAITemp000E9A,b
          jsl rlSetTargetMapTile

          lda $0001,b,y
          and #$00FF
          sta wAIUnknown7E2002

          lda #1
          sta wAIUnknown7E201A

          inc y
          inc y
          sec
          rts

        _CLC
        inc y
        inc y
        clc
        rts

        .databank 0

      rsAIScriptCommand07 ; 87/CE3A

        .al
        .autsiz
        .databank ?

        ; 1st byte = Location ID
        ; 2nd byte = ?

        lda $0000,b,y
        and #$00FF
        sta wAITemp000E9A,b

        jsl rlGetLocationEventDataEntry
        jsl rlGetLocationFactionSlotOwner
        cmp wAIActiveFaction,b
        bne _CLC

          ; Current faction owns specified location

          lda $0001,b,y
          and #$00FF
          cmp #5
          beq _CEA3

          jsl rlUnknown87D411
          bcs _CEA9

          jsl rlGetEventLocationEntryEffectiveXCoordinate
          sta wAITemp000E96,b

          jsl rlGetEventLocationEntryEffectiveYCoordinate
          sta wAITemp000E98,b

          lda wAITemp000E9A,b
          jsl rlSetTargetMapTile

          lda #6
          sta wAIUnknown7E201A
          lda $0001,b,y
          and #$00FF
          sta wAIUnknown7E2002

          lda wAIFormationType
          bne +

            ; Set aFormationPatternCastleDefense

            lda #13
            sta wAIFormationType
            lda #0
            sta wAIFormationDirection

          +
          inc y
          inc y
          sec
          rts
        
        _CLC
        inc y
        inc y
        clc
        rts
        
        _CEA3
        inc y
        inc y
        jsr rsAIScriptCommand0B
        rts

        _CEA9
        inc y
        inc y
        jsr rsAIScriptCommand18
        rts

        .databank 0

      rsAIScriptCommand08 ; 87/CEAF

        .al
        .autsiz
        .databank ?

        ; AI_TARGET_VILLAGE

        lda $0000,b,y
        and #$00FF
        jsl rlGetLocationEventDataEntry
        jsl rlGetEventLocationEntryType
        cmp #2
        bne _CLC

          ; Is a village

          jsl rlCheckIfVillageClosed
          bcs _CLC

            jsl rlCheckLocationDestroyed
            bcs _CLC

              jsl rlGetEventLocationEntryEffectiveXCoordinate
              sta wAITemp000E96,b
              jsl rlGetEventLocationEntryEffectiveYCoordinate
              sta wAITemp000E98,b

              lda $0000,b,y
              and #$00FF
              jsl rlSetTargetMapTile

              lda #2
              sta wAIUnknown7E201A

              inc y
              sec
              rts
        
        _CLC
        inc y
        clc
        rts

        .databank 0

      rsAIScriptCommand09 ; 87/CEF3

        .al
        .autsiz
        .databank ?

        ; AI_FLAG_IF_LEADER_ON_COORDS

        lda $0002,b,y
        and #$00FF
        sta wEventEngineParameter1,b

        lda $0000,b,y
        jsl rlCheckIfEventFlagOfSpecifiedChapterSet
        bcs _CLC

          lda $0003,b,y
          and #$00FF
          cmp wAIGroupLeaderXPosition
          bne +

            lda $0004,b,y
            and #$00FF
            cmp wAIGroupLeaderYPosition
            bne +

              lda $0002,b,y
              and #$00FF
              jsl rlSetEventFlag
              bra _CLC

          +
          lda $0003,b,y
          and #$00FF
          sta wAITemp000E96,b
          lda $0004,b,y
          and #$00FF
          sta wAITemp000E98,b

          lda #0
          jsl rlSetTargetMapTile

          lda #7
          sta wAIUnknown7E201A
          lda #0
          sta wAIUnknown7E2002

          tya
          clc
          adc #5
          tay
          sec
          rts

        _CLC
        tya
        clc
        adc #5
        tay
        clc
        rts

        .databank 0

      rsAIScriptCommand0A ; 87/CF60

        .al
        .autsiz
        .databank ?

        jsl rlUnknown87D411
        bcs +

          lda #4
          sta wAIUnknown7E201A
          lda #4
          sta wAIUnknown7E2002
          sec
          rts

        +
        jsr rsAIScriptCommand18
        rts

        .databank 0

      rsAIScriptCommand0B ; 87/CF7A

        .al
        .autsiz
        .databank ?

        lda wAIUnknownBitfield7E2000
        bit #$0004
        beq +

          ; Any foe is in groups threat range

          lda #5
          sta wAIUnknown7E201A
          lda #5
          sta wAIUnknown7E2002
          sec
          rts

        +
        clc
        rts

        .databank 0

      rsAIScriptCommand0C ; 87/CF95

        .al
        .autsiz
        .databank ?

        ; AI_SET_FORMATION

        lda $0000,b,y
        and #$00FF
        sta wAIFormationType
        lda $0001,b,y
        and #$0003
        sta wAIFormationDirection
        inc y
        inc y
        clc
        rts

        .databank 0

      rsAIScriptCommand0D ; 87/CFAD

        .al
        .autsiz
        .databank ?

        ; AI_TARGET_SPECIFIED_UNIT

        lda $0000,b,y
        jsl rlGetUnitRAMDataPointerByID
        bcs _CLC

          jsl rlGetSelectedUnitStates
          bit #UnitStateDead
          bne _CLC

            bit #UnitStateGuardingCastle
            bne _CLC

              jsl rlGetSelectedUnitDeploymentOffset
              tax
              lda aDeploymentTable._XTilePosition,x
              sta wAITemp000E96,b
              lda aDeploymentTable._YTilePosition,x
              sta wAITemp000E98,b

              txa
              lsr a
              jsl rlSetTargetMapTile

              lda #3
              sta wAIUnknown7E201A

              inc y
              inc y
              sec
              rts
        
        _CLC
        inc y
        inc y
        clc
        rts

        .databank 0

      rsAIScriptCommand0E ; 87/CFEC

        .al
        .autsiz
        .databank ?

        ; AI_INTERACT_WITH_UNIT

        lda $0000,b,y
        jsl rlGetUnitRAMDataPointerByID
        bcs _CLC

          jsl rlGetSelectedUnitDeploymentOffset
          tax
          lda aDeploymentTable._XTilePosition,x
          sta wAITemp000E96,b
          lda aDeploymentTable._YTilePosition,x
          sta wAITemp000E98

          txa
          lsr a
          jsl rlSetTargetMapTile

          lda $0002,b,y
          and #$00FF
          sta wAIUnknown7E201C

          lda #8
          sta wAIUnknown7E201A

          inc y
          inc y
          inc y
          sec
          rts
        
        _CLC
        inc y
        inc y
        inc y
        clc
        rts

        .databank 0

      rsAIScriptCommand0F ; 87/D029

        .al
        .autsiz
        .databank ?

        lda #0
        sta wAIUnknown7E201A
        lda #$FFFF
        sta wAIUnknown7E2018
        lda #2
        sta wAIUnknown7E2002

        lda wAIUnknownBitfield7E2000
        ora #$0100
        sta wAIUnknownBitfield7E2000
        sec
        rts

        .databank 0

      rsAIScriptCommand10 ; 87/D04B

        .al
        .autsiz
        .databank ?

        lda wAITargetCounter
        bne _CLC

          lda #12
          sta wAIUnknown7E201A
          lda #$FFFF
          sta wAIUnknown7E2018
          lda #2
          sta wAIUnknown7E2002
          sec
          rts

        _CLC
        clc
        rts

        .databank 0

      rsAIScriptCommand11 ; 87/D06A

        .al
        .autsiz
        .databank ?

        lda wAIGroupLeaderDeploymentOffset
        cmp #$FFFF
        beq _CLC

          tax
          lda aDeploymentTable._State,x
          bit #DeploymentStateAlive
          beq _CLC

            ; Leader is alive

            lda $0000,b,y
            and #$00FF
            sta wAITemp000E9A,b

            jsl rlGetAliveGroupMembersRatio
            inc y
            cmp wAITemp000E9A,b
            bcs _CLC

              jsr rsAIScriptCommand18

              lda #10
              sta wAIUnknown7E201A
              lda #$FFFF
              sta wAIUnknown7E2018
              lda #1
              sta wAIUnknown7E2002

              lda wAIUnknownBitfield7E2000
              ora #$0100
              sta wAIUnknownBitfield7E2000

              inc y
              sec
              rts

        _CLC
        inc y
        clc
        rts

        .databank 0

      rsAIScriptCommand12 ; 87/D0B9

        .al
        .autsiz
        .databank ?

        jsr rsAIScriptCommand18

        lda #11
        sta wAIUnknown7E201A
        lda #$FFFF
        sta wAIUnknown7E2018
        lda #2
        sta wAIUnknown7E2002

        lda wAIUnknownBitfield7E2000
        ora #$0100
        sta wAIUnknownBitfield7E2000

        sec
        rts

        .databank 0

      rsAIScriptCommand13 ; 87/D0DE

        .al
        .autsiz
        .databank ?

        lda #7
        sta wAIUnknown7E201A
        lda #5
        sta wAIUnknown7E2002

        sec
        rts

        .databank 0

      rsAIScriptCommand14 ; 87/D0EE

        .al
        .autsiz
        .databank ?

        lda wAIUnknownBitfield7E2000
        bit #$0008
        bne +

          ; Group leader alive
          lda wCurrentTurn,b
          sta wR36

          lda $0000,b,y
          and #$00FF
          sta wR37
          jsl rlUnsignedDivide16By16

          lda wR34
          bne +

            jsl rlGetAliveGroupMembersRatio
            cmp #256
            beq +

              lda wAICurrentAISetting,b
              sta wRoutineVariable1,b
              lda wAIActiveFaction,b
              jsl rlUnknown84C54C

              lda wAIUnknownBitfield7E2000
              ora #$0080
              sta wAIUnknownBitfield7E2000

              lda wAICurrentAISetting,b
              jsl rlBuildAIUnitList
        
        +
        inc y
        clc
        rts

        .databank 0

      rsAIScriptCommand15 ; 87/D137

        .al
        .autsiz
        .databank ?

        ; AI_SET_CHAPTER_EVENT_FLAG

        lda $0000,b,y
        jsl rlGetSpecifiedChaptersRAMPointer
        lda $0002,b,y
        and #$00FF
        jsl rlSetEventFlag

        inc y
        inc y
        inc y
        clc
        rts

        .databank 0

      rsAIScriptCommand16 ; 87/D14D

        .al
        .autsiz
        .databank ?

        ; AI_UNSET_CHAPTER_EVENT_FLAG

        lda $0000,b,y
        jsl rlGetSpecifiedChaptersRAMPointer
        lda $0002,b,y
        and #$00FF
        jsl rlUnsetEventFlag

        inc y
        inc y
        inc y
        clc
        rts

        .databank 0

      rsAIScriptCommand17 ; 87/D163

        .al
        .autsiz
        .databank ?

        ; AI_TARGET_REMAINING_VILLAGES

        ; CLC if no villages left

        ldx #0

        -
        txa
        jsl rlGetLocationEventDataEntry
        bcs _CLC

          jsl rlGetEventLocationEntryType
          cmp #2
          bne _Next

            jsl rlCheckIfVillageClosed
            bcs _Next

              jsl rlCheckLocationDestroyed
              bcc _SEC

          _Next
          inc x
          bra -

        _CLC
        clc
        rts

        _SEC
        lda #2
        sta wAIUnknown7E201A
        sec
        rts

        .databank 0

      rsAIScriptCommand18 ; 87/D190

        .al
        .autsiz
        .databank ?

        ; AI_TARGET_ALL_FOES, except wAIIgnoredGenerationID

        ldx #(len(aDeploymentTable._State) - 2)

          _Loop
          txa

          lda aDeploymentTable._State,x
          bit #DeploymentStateAlive
          beq _Next

            bit #DeploymentStateHidden
            bne _Next

              ; Unit is alive and not hidden
              lda aDeploymentTable._UnitRAMPointer[0],x
              sta wSelectedUnitDataRAMPointer,b
              jsl rlGetSelectedUnitGenerationID
              bcs +

                cmp wAIIgnoredGenerationID
                beq _Next

              +
              jsr rsCheckIfUnitIsEnemyOfCurrentPhase
              bcc _Next

                lda aDeploymentTable._XTilePosition,x
                sta wAITemp000E96,b
                lda aDeploymentTable._YTilePosition,x
                sta wAITemp000E98,b

                lda #1
                jsl rlSetTargetMapTile

          _Next
          dec x
          dec x
          bpl _Loop

        lda #3
        sta wAIUnknown7E201A
        sec
        rts

        .databank 0

      rsCheckIfUnitIsEnemyOfCurrentPhase ; 87/D1DC

        .al
        .autsiz
        .databank ?

        phx
        lda aDeploymentTable._FactionSlot,x
        ldx wAIActiveFaction,b
        jsl rlGetFactionRelation
        cmp #AllegianceEnemy
        bne +

          plx
          sec
          rts

        +
        plx
        clc
        rts

        .databank 0

      rsAIScriptCommand19 ; 87/D1F3

        .al
        .autsiz
        .databank ?

        jsr rsAIScriptCommand18

        lda #7
        sta wAIUnknown7E2002
        rts

        .databank 0

      rsAIScriptCommand1A ; 87/D1FE

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #$7F
        pha
        rep #$20
        plb

        jsl rlTryGetAIFactionGroupLeader
        jsl rlFillMovementCostMap

        lda wAITargetCounter
        sta $4430,b

        stz $4432,b

        ldx #0
        
          _Loop
          lda aAITargetList.XPosition[0],x
          and #$00FF
          sta wAITemp000E96
          lda aAITargetList.YPosition[0],x
          and #$00FF
          sta wAITemp000E98

          lda wAITemp000E98
          xba
          lsr a
          lsr a
          clc
          adc wAITemp000E96
          sta aAIAction.wMapPointer,b

          stz $442C,b

          lda #-64
          jsr rsUnknown87D2A1
          lda #-1
          jsr rsUnknown87D2A1
          lda #64
          jsr rsUnknown87D2A1
          lda #1
          jsr rsUnknown87D2A1

          lda $442C,b
          cmp #3
          bcc _Next

            lda aAITargetList.DeploymentOffset[0],x
            and #$00FF
            lsr a
            jsl rlSetTargetMapTile
            inc $4432,b
            lda #1
            sta wAIUnknown7E201C
            lda #8
            sta wAIUnknown7E201A
            lda #0
            sta wAIUnknown7E2002

          _Next
          txa
          clc
          adc #size(structAITargetEntry)
          tax
          dec $4430,b
          bne _Loop

        lda $4432,b
        beq _CLC

          plp
          plb
          sec
          rts

        _CLC
        plp
        plb
        clc
        rts

        .databank 0

      rsUnknown87D2A1 ; 87/D2A1

        .al
        .autsiz
        .databank ?

        phx
        phy
        clc
        adc aAIAction.wMapPointer,b
        tay
        lda aMovementCostMap,b,y
        and #$0080
        bne _End

          lda aFoeUnitMap,b,y
          and #$00FF
          cmp #$00FF
          bne _End

            lda aAllyUnitMap,b,y
            and #$00FF
            cmp #$00FF
            beq +

              tax
              lda aDeploymentTable._UnitRAMPointer,x
              sta wSelectedUnitDataRAMPointer
              jsl rlGetSelectedUnitAI
              cmp wAICurrentAISetting
              bne _End

            +
            inc $442C,b
        
        _End
        ply
        plx
        rts

        .databank 0

      rsAIScriptCommand1E ; 87/D2DF

        .al
        .autsiz
        .databank ?

        lda wAIUnknownBitfield7E2000
        bit #$0008
        bne _CLC

          lda wAIGroupLeaderDeploymentOffset
          bmi _CLC

            ; Group leader is alive
            tax
            lda aDeploymentTable._UnitRAMPointer,x
            sta wSelectedUnitDataRAMPointer,b

            jsl rlGetSelectedUnitCurrentHP
            xba
            sta wR36
            jsl rlGetSelectedUnitMaxHP
            sta wR37
            jsl rlUnsignedDivide16By16

            lda wR36
            dec a
            sep #$20
            cmp $0000,b,y
            rep #$20
            bcc _SEC

              jsl rlGetSelectedUnitStates
              bit #UnitStateFielded
              bne _CLC

                lda wR36
                cmp $0001,b,y
                bcs _CLC

            _SEC
            jsr rsAIScriptCommand18
            jsr rsAIScriptCommand0F

            inc y
            inc y
            inc y
            sec
            rts

        _CLC
        inc y
        inc y
        inc y
        clc
        rts

        .databank 0

      rsAIScriptCommand1F ; 87/D333

        .al
        .autsiz
        .databank ?

        ; AI_JUMP_IF_TURN_REACHED

        lda $0000,b,y
        and #$00FF
        dec a
        cmp wCurrentTurn,b
        bcs +

          inc y
          jml rsAIScriptCommand01
        
        +
        inc y
        inc y
        inc y
        clc
        rts

        .databank 0

      rsAIScriptCommand20 ; 87/D349

        .al
        .autsiz
        .databank ?

        ; AI_JUMP_IF_CHAPTER_EVENT_FLAG_SET

        lda $0002,b,y
        and #$00FF
        sta wEventEngineParameter1,b

        lda $0000,b,y
        jsl rlCheckIfEventFlagOfSpecifiedChapterSet
        bcc _CLC

          inc y
          inc y
          inc y
          jml rsAIScriptCommand01

        _CLC
        tya
        clc
        adc #5
        tay
        clc
        rts

        .databank 0

      rsAIScriptCommand21 ; 87/D36A

        .al
        .autsiz
        .databank ?

        lda $0002,b,y
        and #$00FF
        sta wEventEngineParameter1,b

        lda $0000,b,y
        jsl rlCheckIfEventFlagOfSpecifiedChapterSet
        bcs _CLC

          inc y
          inc y
          inc y
          jml rsAIScriptCommand01

        _CLC
        tya
        clc
        adc #5
        tay
        clc
        rts

        .databank 0

      rsAIScriptCommand22 ; 87/D38B

        .al
        .autsiz
        .databank ?

        jsl rlUnknown87D411
        bcc _CLC

          jml rsAIScriptCommand01
        
        _CLC
        inc y
        inc y
        clc
        rts

        .databank 0

      rsAIScriptCommand23 ; 87/D399

        .al
        .autsiz
        .databank ?

        lda $0000,b,y
        sta lAITemp000E90,b
        lda $0001,b,y
        sta lAITemp000E90+1,b,y

        phk
        pea #<>(+)-1
        jml [lAITemp000E90,b]

        +
        bcc _CLC

          inc y
          inc y
          inc y
          jml rsAIScriptCommand01

        _CLC
        tya
        clc
        adc #5
        tay
        clc
        rts

        .databank 0

      rlGetAliveGroupMembersRatio ; 87/D3BD

        .al
        .autsiz
        .databank ?

        ; Get the total number of units of a group and the total
        ; number of dead units. Then gets the number of alive units, divides it
        ; by the total and returns a ratio over 256 in A.

        phb
        php
        phk
        plb
        phx

        stz wAITemp000E96,b
        stz wAITemp000E98,b

        ldx #1

          _Loop
          stx wRoutineVariable1,b
          lda wAIActiveFaction,b
          jsl rlGetUnitRAMDataPointerByFactionSlotEntryID
          lda wSelectedUnitDataRAMPointer,b
          beq _End

            jsl rlGetSelectedUnitAI
            cmp wAICurrentAISetting,b
            bne +

              inc wAITemp000E98,b

              jsl rlGetSelectedUnitStates
              bit #UnitStateDead
              beq +

                inc wAITemp000E96,b

          +
          inc x
          bra _Loop

        _End
        lda wAITemp000E98,b
        sec
        sbc wAITemp000E96,b
        and #$00FF
        xba
        sta wR36
        lda wAITemp000E98,b
        sta wR37
        jsl rlUnsignedDivide16By16
        lda wR36
        plx
        plp
        plb
        rtl

        .databank 0

      rlUnknown87D411 ; 87/D411

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`wAIUnknownBitfield7E2000
        pha
        rep #$20
        plb

        phx
        phy

        lda wAIUnknownBitfield7E2000,b
        bit #$0004
        beq _CLC

          ; Any foe is in groups threat range
          lda wAIUnitCounter,b
          tay
          ldx #<>aAIUnitList
          
          -
          jsr rsUnknown87D45B
          bcs _SEC

          ply
          plx
          adc #size(structAIUnitEntry)
          tax
          dec y
          bne -

          lda #$0004
          trb wAIUnknownBitfield7E2000,b
        
        _CLC
        ply
        plx
        plp
        plb
        clc

        -
        rtl
        
        _SEC
        txa
        sec
        sbc #<>aAIUnitList
        sta $0E82,b

        lda #$0040
        tsb wAIUnknownBitfield7E2000,b

        ply
        plx
        plp
        plb
        sec
        bra -

        .databank 0

      rsUnknown87D45B ; 87/D45B

        .al
        .autsiz
        .databank ?

        ; X = aAIUnitList pointer

        phx
        phy
        lda structAIUnitEntry.UnitRAMPointer,b,x
        sta wSelectedUnitDataRAMPointer,b
        jsl rlGetHighestRangeItemInInventory

        lda wCurrentItemDataROMPointer,b
        sta structAIUnitEntry.ItemROMPointer,b,x
        bne +

          jml _CLC

        +
        lda structAIUnitEntry.XPosition,b,x
        and #$00FF
        sta wAITemp000E96,b
        lda structAIUnitEntry.YPosition,b,x
        and #$00FF
        sta wAITemp000E98,b
        jsl rlGetSelectedUnitTotalFieldMovement
        sta wAITemp000EA2,b

        jsl rlGetItemMinimumRange
        sta wAITemp000EA4,b

        jsl rlGetItemMaximumRange
        cmp wAITemp000EA4,b
        beq +

          clc
          adc wAITemp000EA4,b
          sta wAITemp000EA4,b

        +
        jsl rlUnknown86A92A

        lda wAITargetCounter,b
        bne +

          jml _End
        
        +
        sta wAITemp000EA4,b
        ldy #<>aAITargetList

        _Loop
        phx
        lda structAITargetEntry.DeploymentOffset,b,x
        and #$00FF
        tax
        lda aDeploymentTable._State,b,x
        plx

        bit #(DeploymentStateDefeated | DeploymentStateHidden)
        bne _Next

          lda structAITargetEntry.XPosition,b,y
          and #$00FF
          sta wAITemp000E96,b
          lda structAITargetEntry.YPosition,b,y
          and #$00FF
          sta wAITemp000E98,b

          phx
          lda wAITemp000E98,b
          xba
          lsr a
          lsr a
          clc
          adc wAITemp000E96,b
          tax
          lda aMovementMap,x
          plx

          bit #$0080
          beq _Next

            jsr rsUnknown87D506
            bcs _SEC
        
        _Next
        tya
        clc
        adc #size(structAITargetEntry)
        tay
        dec wAITemp000EA4,b
        bne _Loop

        _CLC
        clc
        
        _End
        ply
        plx
        rts

        _SEC
        sec
        bra _End

        .databank 0

      rsUnknown87D506 ; 87/D506

        .al
        .autsiz
        .databank ?

        stz wAITemp000E96,b
        stz $0E89,b

        jsl rlAIGetExpectedDamageWrapper
        bcs _SEC

          lda $0000,b,x
          sta wSelectedUnitDataRAMPointer,b
          lda $0005,b,y
          and #$00FF
          cmp #4
          bcs +

            lda $0007,b,x
            bra ++
          
          +
          lda $0008,b,x

          +
          and #$00FF
          sta wAITemp000E9C,b
          jsl rlGetSelectedUnitCurrentHP
          clc
          adc wAITemp000E9C,b
          sep #$20
          cmp $0006,b,y
          rep #$20
          bpl _SEC

          clc
          rts
        
        _SEC
        sec
        rts

        .databank 0

      rlGetHighestRangeItemInInventory ; 87/D546

        .al
        .autsiz
        .databank ?

        ; Output:
        ; $0EA2 = pointer of highest range item
        ; $0EA4 = highest range weapon in inv

        phy
        lda #0
        sta $0EA4,b
        sta $0EA2,b
        sta wCurrentItemDataROMPointer,b

        jsl rlGetSelectedUnitInventorySize
        cmp #0
        beq _End

          tay
          
            _Loop
            tya
            jsl rlGetItemROMDataByInventorySlot
            jsl rlGetItemEquipmentType
            cmp #EquipTypeWeapon
            beq +

              ; if: silence, sleep, berserk or thief staff effect, ok, else branch
              jsl rlGetItemStaffEffect
              cmp #$000C
              bcc _Next

            +
            jsl rlGetItemMaximumRange
            cmp $0EA4,b
            bcc _Next

              sta $0EA4,b
              lda wCurrentItemDataROMPointer,b
              sta $0EA2,b
            
            _Next
            dec y
            bne _Loop

          lda $0EA2,b
          sta wCurrentItemDataROMPointer,b
        
        _End
        ply
        rtl

        .databank 0

      rlClearRangeMap ; 87/D591

        .al
        .autsiz
        .databank ?

        phb
        sep #$20
        lda #`aRangeMap
        pha
        rep #$20
        plb

        ldx #size(aRangeMap) / 8 - 2
        lda #0

          -
          sta aRangeMap,b,x
          sta aRangeMap + $200,b,x
          sta aRangeMap + $400,b,x
          sta aRangeMap + $600,b,x
          sta aRangeMap + $800,b,x
          sta aRangeMap + $A00,b,x
          sta aRangeMap + $C00,b,x
          sta aRangeMap + $E00,b,x
          dec x
          dec x
          bpl -

        plb
        rtl

        .databank 0

      rlFillRangeMapOfAITargetsNearLeader ; 87/D5BE

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        phy

        sep #$20
        lda #$7F
        pha
        rep #$20
        plb

        jsl rlClearRangeMap

        lda wAIGroupLeaderXPosition
        sec
        sbc #16
        bcs +

          lda #1

        +
        sta wAITemp000E9A

        lda wAIGroupLeaderYPosition
        sec
        sbc #16
        bcs +

          lda #1
        
        +
        sta wAITemp000E9C

        lda wAIGroupLeaderXPosition
        clc
        adc #16
        cmp #64
        bcc +

          lda #63
        
        +
        sta wAITemp000E9E

        lda wAIGroupLeaderYPosition
        clc
        adc #16
        cmp #64
        bcc +

          lda #63
        
        +
        sta wAITemp000EA0

        lda wAITargetCounter
        beq ++

          tay
          ldx #0
          
          _Loop
          jsr rsCheckIfAITargetWithinSpecifiedLeaderRange
          bcc +

            jsr rsFillAITargetsRangeMap

          +
          txa
          clc
          adc #size(structAITargetEntry)
          tax
          dec y
          bne _Loop

        +
        bra _End

        ; 87/D637

        jsr $87D65A
        ldy #3
        ldx #0

        _Loop2
        phx
        lda $EC4A,b,x
        cmp #$FFFF
        beq +

          tax
          jsr rsFillAITargetsRangeMap

        +
        plx
        inc x
        inc x
        inc x
        inc x
        dec y
        bne _Loop2
        
        _End
        ply
        plx
        plp
        plb
        rtl

        .databank 0

        ; 87/D65A















      rsCheckIfAITargetWithinSpecifiedLeaderRange ; 87/D711

        .al
        .autsiz
        .databank ?

        ; Input:
        ; X = AITarget offset
        ; wAITemp000E9A = leader X coord - 16
        ; wAITemp000E9C = leader Y coord - 16
        ; wAITemp000E9E = leader X coord + 16
        ; wAITemp000EA0 = leader Y coord + 16
        ; All coords are exclusive

        lda aAITargetList.XPosition,x
        and #$00FF
        cmp wAITemp000E9A
        bcc _CLC

        cmp wAITemp000E9E
        bcs _CLC

        lda aAITargetList.YPosition,x
        and #$00FF
        cmp wAITemp000E9C
        bcc _CLC

        cmp wAITemp000EA0
        bcs _CLC
        bra _SEC

        _CLC
        clc
        bra +

        _SEC
        sec

        +
        rts

        .databank 0

      rsFillAITargetsRangeMap ; 87/D73E

        .al
        .autsiz
        .databank ?

        ; X = AI target list offset

        lda wAITemp000EA0
        pha
        phx

        lda aAITargetList.DeploymentOffset,x
        and #$00FF
        tax
        lda aDeploymentTable._State,x
        plx
        bit #DeploymentStateAlive
        beq _End

          lda aAITargetList.UnitRAMPointer,x
          sta wSelectedUnitDataRAMPointer
          lda aAITargetList.ItemROMPointer,x
          beq _End

            sta wCurrentItemDataROMPointer
            lda aAITargetList.XPosition,x
            and #$00FF
            sta wAITemp000E96
            lda aAITargetList.YPosition,x
            and #$00FF
            sta wAITemp000E98

            lda #1
            sta wAITemp000EA0

            jsl rlGetSelectedUnitTotalFieldMovement
            sta wAITemp000EA2

            jsl rlGetItemMinimumRange
            cmp #3
            bcs _End

              sta wAITemp000EA4
              jsl rlGetItemMaximumRange
              cmp wAITemp000EA4
              beq +

                clc
                adc wAITemp000EA4
                sta wAITemp000EA4

              +
              jsl rsFillRangeMap

        _End
        pla
        sta wAITemp000EA0
        rts

        .databank 0

      rlClearTargetMap ; 87/D7B7

        .al
        .autsiz
        .databank ?

        phb
        php

        sep #$20
        lda #`aTargetMap
        pha
        rep #$20
        plb

        phx
        ldx #size(aTargetMap) / 8 - 2
        lda #$FFFF

          -
          sta aTargetMap,b,x
          sta aTargetMap + $200,b,x
          sta aTargetMap + $400,b,x
          sta aTargetMap + $600,b,x
          sta aTargetMap + $800,b,x
          sta aTargetMap + $A00,b,x
          sta aTargetMap + $C00,b,x
          sta aTargetMap + $E00,b,x
          dec x
          dec x
          bpl -

        plx
        plp
        plb
        rtl

        .databank 0

      rlSetTargetMapTile ; 87/D7E8

        .al
        .autsiz
        .databank ?

        ; A = value to write to TargetMap
        ; wAITemp000E96 = XPosition
        ; wAITemp000E98 = YPosition

        phb
        php
        phk
        plb
        phx
        pha

        ; Get tile index from coordinates
        lda wAITemp000E98,b
        xba
        lsr a
        lsr a
        clc
        adc wAITemp000E96,b
        tax

        pla
        sep #$20
        sta aTargetMap,x
        rep #$20

        lda wAIUnknownBitfield7E2000
        ora #$0020
        sta wAIUnknownBitfield7E2000

        plx
        plp
        plb
        rtl

        .databank 0

      rlBuildAIUnitList ; 87/D811

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = group ID

        phb
        php
        phk
        plb
        phx

        ldx wAITemp000E96,b
        phx
        ldx wAITemp000E98,b
        phx

        sta wAITemp000E96,b

        lda #$FFFF
        sta wAIGroupLeaderDeploymentOffset
        lda #0
        sta wAIGroupHighestItemRange

        ldx #0
        txa
        sta wAIUnitCounter

        lda wAIActiveFaction,b
        jsl rlGetFactionSlotUnitCount
        ora #0
        bne +

          jml _End

        +
        sta wAITemp000E98,b

          ; Now wAITemp000E98 holds the unit count/last faction entry ID and is decremented each loop.

          _Loop
          lda wAITemp000E98,b
          sta wRoutineVariable1,b

          lda wAIActiveFaction,b
          jsl rlGetUnitRAMDataPointerByFactionSlotEntryID

          lda wSelectedUnitDataRAMPointer,b
          beq _End

            jsl rlGetSelectedUnitAI
            cmp wAITemp000E96,b
            bne _Next

              jsl rlGetSelectedUnitStates
              bit #UnitStateDead
              beq _Alive

                bit #UnitStateGroupLeader
                beq _Next

                  lda wAIUnknownBitfield7E2000
                  ora #$0008
                  sta wAIUnknownBitfield7E2000
                  bra _Next

              _Alive
              phx
              jsl rlGetSelectedUnitDeploymentOffset
              tax
              lda aDeploymentTable._XTilePosition,x
              sta wAITemp000E9A,b
              lda aDeploymentTable._YTilePosition,x
              sta wAITemp000E9C,b
              txa

              plx
              jsr rsFillAIUnitListEntry

              jsl rlGetSelectedUnitStates
              bit #UnitStateGroupLeader
              beq _NotLeader

                bit #UnitStateFielded
                bne +

                  stx wAISelectedAIUnitOffset,b
                  lda wAIUnknownBitfield7E2000
                  ora #$0040
                  sta wAIUnknownBitfield7E2000

                +
                lda aAIUnitList.DeploymentOffset[0]
                and #$00FF
                sta wAIGroupLeaderDeploymentOffset

              _NotLeader
              txa
              clc
              adc #size(structAIUnitEntry)
              tax

              lda wAIUnitCounter
              inc a
              sta wAIUnitCounter

          _Next
          dec wAITemp000E98,b
          beq _End

            jml _Loop

        _End
        plx
        stx wAITemp000E98,b
        plx
        stx wAITemp000E96,b
        plx
        plp
        plb
        rtl

        .databank 0

      rsFillAIUnitListEntry ; 87/D8E4

        .al
        .autsiz
        .databank ?

        ; Input:
        ; wAITemp000E9A = X coordinate
        ; wAITemp000E9C = Y coordinate

        sep #$20
        sta aAIUnitList.DeploymentOffset,x
        lda wAITemp000E9A,b
        sta aAIUnitList.XPosition,x
        lda wAITemp000E9C,b
        sta aAIUnitList.YPosition,x
        rep #$20

        lda wSelectedUnitDataRAMPointer,b
        sta aAIUnitList.UnitRAMPointer,x

        jsl rlGetFirstWeaponBattleMight
        sep #$20
        sta aAIUnitList.BattleMight,x
        rep #$20

        lda wCurrentItemDataROMPointer,b
        sta aAIUnitList.ItemROMPointer,x

        jsl rlGetSelectedUnitTotalDefense
        sep #$20
        sta aAIUnitList.BattleDefense,x
        rep #$20

        jsl rlGetSelectedUnitTotalResistance
        sep #$20
        sta aAIUnitList.BattleResistance,x
        rep #$20

        jsl rlGetItemWeaponType
        sep #$20
        sta aAIUnitList.ItemType,x
        rep #$20

        jsl rlGetSelectedUnitAttackThreatRange
        sep #$20
        sta aAIUnitList.ThreatRange,x
        rep #$20

        jsl rlGetItemMaximumRange
        cmp wAIGroupHighestItemRange
        bcc +

          sta wAIGroupHighestItemRange

        +
        rts

        .databank 0

      rlTryGetAIFactionGroupLeader ; 87/D953

        .al
        .autsiz
        .databank ?

        ; If there is no group leader, get the first AIUnit instead

        phb
        php
        phk
        plb
        phx

        lda wAIGroupLeaderDeploymentOffset
        bmi +

        and #$00FF
        tax
        lda aDeploymentTable._UnitRAMPointer,x
        bra ++

        +
        lda aAIUnitList.UnitRAMPointer[0]

        +
        sta wSelectedUnitDataRAMPointer,b

        plx
        plp
        plb
        rtl

        .databank 0

      rlTryGetGroupLeaderCoordinates ; 87/D973

        .al
        .autsiz
        .databank ?

        ; Output:
        ; X in wAITemp000E96
        ; Y in wAITemp000E98

        phb
        php
        phk
        plb
        phx

        lda wAIUnitCounter
        beq _End

          lda wAIGroupLeaderDeploymentOffset
          tax
          bpl +

            lda aAIUnitList.DeploymentOffset[0]
            and #$00FF
            tax

          +
          lda aDeploymentTable._XTilePosition,x
          sta wAITemp000E96,b
          lda aDeploymentTable._YTilePosition,x
          sta wAITemp000E98,b

          lda aDeploymentTable._State,x
          bit #DeploymentStateGuardingCastle
          beq _End

            ; Is guarding
            inc wAITemp000E98,b
            inc wAITemp000E98,b

            lda wAIUnknownBitfield7E2000
            ora #$0010
            sta wAIUnknownBitfield7E2000

        _End
        plx
        plp
        plb
        rtl

        .databank 0

      rlGetFactionGroupDataGroupAIScript ; 87/D9B9

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = AI setting

        ; Output:
        ; lAITemp000E90 = selected groups AI script pointer

        phb
        php
        phk
        plb
        phx
        phy

        dec a
        bmi +

          sta wAITemp000E96,b
          asl a
          clc
          adc wAITemp000E96,b
          sta wAITemp000E96,b

          lda wAIActiveFaction,b
          jsl rlGetFactionSlotOffsetWrapper
          bcs +

            lda $7E0000 + structFactionHeader.GroupID,x
            and #$00FF
            jsl rlGetFactionGroupPointerByID

            lda structFactionGroupData.AIDataPointer,b,y
            beq +

              clc
              adc wAITemp000E96,b
              tay
              lda $0000,b,y
              sta lAITemp000E90,b
              lda $0001,b,y
              sta lAITemp000E90+1,b

              -
              ply
              plx
              plp
              plb
              rtl

        +
        lda #0
        sta lAITemp000E90+1,b
        lda #0
        sta lAITemp000E90,b
        bra -

        .databank 0

      rlUnknown87DA0A ; 87/DA0A

        .al
        .autsiz
        .databank ?

        lda wAIUnknownBitfield7E2000
        ora #$0001
        sta wAIUnknownBitfield7E2000
        rtl

        .databank 0

      rlGetAIGroupsLeadershipPower ; 87/DA16

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        ldx wSelectedUnitDataRAMPointer,b
        phx

        lda wAIUnitCounter
        beq _End

          lda wAIGroupLeaderDeploymentOffset
          bpl +

            lda #0
            bra ++

          +
          tax
          lda aDeploymentTable._UnitRAMPointer,x
          sta wSelectedUnitDataRAMPointer,b
          jsl rlGetSelectedUnitLeadershipStars

          +
          tax
          lda aLeadershipPowerLookupTable,x
          and #$00FF

        _End
        plx
        stx wSelectedUnitDataRAMPointer,b
        plx
        plp
        plb
        rtl

        .databank 0

      aLeadershipPowerLookupTable ; 87/DA4C

        .byte 50
        .byte 60
        .byte 70
        .byte 80
        .byte 90
        .byte 100

      rlSetTargetPositionForAIGroupMembers ; 87/DA52

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

        phx
        phy

        lda wAIUnitCounter
        beq _End

          sta wAITemp000E9A,b

          lda wAIFormationDirection
          asl a
          tax
          lda aFormationDirectionRoutines,x
          sta lAITemp000E90,b

          lda wAIFormationType
          asl a
          tax
          lda aFormationPatternOffsets,x
          sta wAITemp000E9C,b

          ldy #<>aAIUnitList

          _Loop
          lda structAIUnitEntry.DeploymentOffset,b,y
          and #$00FF
          tax
          jsr rsSetTargetPositionIfGuarding
          bcs _Next

            ; Unit is not guarding a castle

            jsl rlGetFormationIDByDeploymentOffset
            asl a
            clc
            adc wAITemp000E9C,b
            tax
            jsr rsRunFormationDirectionRoutine

          _Next
          tya
          clc
          adc #size(structAIUnitEntry)
          tay
          dec wAITemp000E9A,b
          bne _Loop
        
        _End
        ply
        plx
        plp
        plb
        rtl

        .databank 0

      rsRunFormationDirectionRoutine ; 87/DAAD

        .al
        .autsiz
        .databank ?

        jmp (lAITemp000E90,b)

        .databank 0

      aFormationDirectionRoutines ; 87/DAB0

        .word <>rsSetCoordinateFormationUp
        .word <>rsSetCoordinateFormationRight
        .word <>rsSetCoordinateFormationDown
        .word <>rsSetCoordinateFormationLeft

      rsSetCoordinateFormationUp ; 87/DAB8

        .al
        .autsiz
        .databank ?

        sep #$20
        lda wAIUnknown7E2010,b
        clc
        adc aFormationPatternOffsets,x
        sta structAIUnitEntry.XTargetPosition,b,y

        lda wAIUnknown7E2012,b
        clc
        adc aFormationPatternOffsets+1,x
        sta structAIUnitEntry.YTargetPosition,b,y
        rep #$20
        rts

        .databank 0

      rsSetCoordinateFormationRight ; 87/DAD3

        .al
        .autsiz
        .databank ?

        sep #$20
        lda wAIUnknown7E2010,b
        sec
        sbc aFormationPatternOffsets+1,x
        sta structAIUnitEntry.XTargetPosition,b,y

        lda wAIUnknown7E2012,b
        clc
        adc aFormationPatternOffsets,x
        sta structAIUnitEntry.YTargetPosition,b,y
        rep #$20
        rts

        .databank 0

      rsSetCoordinateFormationDown ; 87/DAEE

        .al
        .autsiz
        .databank ?

        sep #$20
        lda wAIUnknown7E2010,b
        sec
        sbc aFormationPatternOffsets,x
        sta structAIUnitEntry.XTargetPosition,b,y

        lda wAIUnknown7E2012,b
        sec
        sbc aFormationPatternOffsets+1,x
        sta structAIUnitEntry.YTargetPosition,b,y
        rep #$20
        rts

        .databank 0

      rsSetCoordinateFormationLeft ; 87/DB09

        .al
        .autsiz
        .databank ?

        sep #$20
        lda wAIUnknown7E2010,b
        clc
        adc aFormationPatternOffsets+1,x
        sta structAIUnitEntry.XTargetPosition,b,y

        lda wAIUnknown7E2012,b
        sec
        sbc aFormationPatternOffsets,x
        sta structAIUnitEntry.YTargetPosition,b,y
        rep #$20
        rts

        .databank 0

      rsSetTargetPositionIfGuarding ; 87/DB24

        .al
        .autsiz
        .databank ?

        ; X = deployment offset

        lda aDeploymentTable._State,x
        bit #DeploymentStateGuardingCastle
        beq +

          lda structAIUnitEntry.XPosition,b,y
          sta structAIUnitEntry.XTargetPosition,b,y
          sec
          rts

        +
        clc
        rts

        .databank 0

      rlUnknown87DB37 ; 87/DB37

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

        phx
        phy

        lda wAIUnitCounter
        sta wAITemp000E96,b

        lda wAICurrentAISetting,b
        ldx #<>aAIUnitList

          -
          sep #$20
          lda structAIUnitEntry.XPosition,b,x
          sta structAIUnitEntry.XTargetPosition,b,x
          lda structAIUnitEntry.YPosition,b,x
          sta structAIUnitEntry.YTargetPosition,b,x
          rep #$20
          txa
          clc
          adc #size(structAIUnitEntry)
          tax
          dec wAITemp000E96,b
          bne -

        ply
        plx
        plp
        plb
        rtl

        .databank 0

      rlUnknown87DB70 ; 87/DB70

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

        lda wAIFormationType,b
        beq _End

          cmp #13
          beq _End

            lda wAIUnknown7E2010,b
            sec
            sbc wAIGroupLeaderXPosition,b
            bpl +

              eor #$FFFF
              inc a
              ldx #3
              bra ++
              
              +
              ldx #1

            +
            sta wAITemp000E9A,b
            stx wAITemp000E9E,b

            lda wAIUnknown7E2012,b
            sec
            sbc wAIGroupLeaderYPosition,b
            bpl +

              eor #$FFFF
              inc a
              ldx #0
              bra ++
              
              +
              ldx #2
            
            +
            sta wAITemp000E9C,b
            stx wAITemp000EA0,b

            lda wAITemp000E9A,b
            cmp wAITemp000E9C,b
            beq _End
            bcc +

              lda wAITemp000E9E,b
              bra ++

            +
            lda wAITemp000EA0,b

            +
            sta wAIFormationDirection,b
        
        _End
        plp
        plb
        rtl

        .databank 0

      rlUnknown87DBD2 ; 87/DBD2

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

        phx
        phy

        lda wAIFormationDirection,b
        asl a
        tax
        lda $87DC74,x
        sta lAITemp000E90,b

        lda wAIFormationType,b
        beq _SEC

        asl a
        tax
        lda aFormationPatternOffsets,x
        sta $0EA2,b

        lda wAIUnitCounter,b
        sta $0E9A,b
        stz $0E9C,b
        cmp #1
        beq _CLC

        ldy #<>aAIUnitList
        
        _Loop
        lda structAIUnitEntry.DeploymentOffset,b,y
        and #$00FF
        tax
        jsl rlGetFormationIDByDeploymentOffset
        asl a
        clc
        adc $0EA2,b
        tax
        sep #$20
        jsr $87DC71

        lda $0E9E,b
        cmp structAIUnitEntry.XPosition,b,y
        bne +

          lda $0EA0,b
          cmp structAIUnitEntry.YPosition,b,y
          bne +

            inc $0E9C,b

        +
        rep #$20
        tya
        clc
        adc #size(structAIUnitEntry)
        tay
        dec $0E9A,b
        bne _Loop

        lda $0E9C,b
        cmp wAIUnitCounter,b
        beq _SEC

        lda #$0002
        tsb wAIUnknownBitfield7E2000,b

        lda $0E9C,b
        and #$00FF
        xba
        sta $50
        lda wAIUnitCounter,b
        sta $52
        jsl rlUnsignedDivide16By16
        lda $50
        
        _CLC
        ply
        plx
        plp
        plb
        clc
        
        -
        rtl
        
        _SEC
        lda #$0100
        ply
        plx
        plp
        plb
        sec
        bra -

        .databank 0

        ; 87/DC71







