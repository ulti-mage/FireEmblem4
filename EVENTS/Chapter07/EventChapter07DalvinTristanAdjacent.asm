
  aEventChapter07DalvinTristanAdjacent ; B2/918A

    RUN_ASM rlASMCCheckDalvinTristanFightCapable
    JUMP_FALSE _End

      PLAY_SFX_WORD $7FF7
      DIALOGUE dialogueChapter07DalvinTristanAdjacent1
      YIELD

      RUN_ASM rlASMCDalvinTristanFightRound1
      YIELD

      DIALOGUE dialogueChapter07DalvinTristanAdjacent2
      YIELD

      RUN_ASM rlASMCDalvinTristanFightRound2
      YIELD

      DIALOGUE dialogueChapter07DalvinTristanAdjacent3
      YIELD

      RUN_ASM rlASMCDalvinTristanFightRound3
      YIELD

      RUN_ASM rlClearBattleData

      RUN_EVENT_CONDITION
        ADD_UNIT_STAT Dalvin, Strength, 2

      RUN_EVENT_CONDITION
        ADD_UNIT_STAT Dalvin, Defense, 1

      RUN_EVENT_CONDITION
        ADD_UNIT_STAT Dalvin, Skill, 1

      FILL_EVENT_UNIT_SLOT Dalvin, EventUnitSlot1
      RUN_ASM rlASMCStatUpDisplay
      YIELD

      RUN_ASM rlClearBattleData

      RUN_EVENT_CONDITION
        ADD_UNIT_STAT Tristan, Strength, 2

      RUN_EVENT_CONDITION
        ADD_UNIT_STAT Tristan, Defense, 1

      RUN_EVENT_CONDITION
        ADD_UNIT_STAT Tristan, Speed, 1

      FILL_EVENT_UNIT_SLOT Tristan, EventUnitSlot1
      RUN_ASM rlASMCStatUpDisplay
      YIELD

      PLAY_SFX_WORD $00E8

    _End
    END_EVENT

  rlASMCDalvinTristanFightRound1 ; B2/91EF

    .al
    .autsiz
    .databank ?

    jsl rlClearBattleData

    lda #(`aBattleRoundsData)<<8
    sta lR18+1
    lda #<>aBattleRoundsData
    sta lR18
    lda #32
    sta wR0
    lda #2
    sta wR1
    jsl rlBuildRAMStructHeader

    lda #9
    sta lStructPointer1,b
    lda #(`aBattleRoundsData)<<8
    sta lStructPointer2+1,b
    lda #<>aBattleRoundsData
    sta lStructPointer2,b
    jsl rlAppendNewStructEntry

    lda #$FFFF
    sta lStructPointer1,b
    lda #(`aBattleRoundsData)<<8
    sta lStructPointer2+1,b
    lda #<>aBattleRoundsData
    sta lStructPointer2,b
    jsl rlAppendNewStructEntry

    jsl rlHandleDalvinTristanFights
    rtl

    .databank 0

  rlASMCDalvinTristanFightRound2 ; B2/923C

    .al
    .autsiz
    .databank ?

    jsl rlClearBattleData

    lda #(`aBattleRoundsData)<<8
    sta lR18+1
    lda #<>aBattleRoundsData
    sta lR18
    lda #32
    sta wR0
    lda #2
    sta wR1
    jsl rlBuildRAMStructHeader

    lda #8
    sta lStructPointer1,b
    lda #(`aBattleRoundsData)<<8
    sta lStructPointer2+1,b
    lda #<>aBattleRoundsData
    sta lStructPointer2,b
    jsl rlAppendNewStructEntry

    lda #$FFFF
    sta lStructPointer1,b
    lda #(`aBattleRoundsData)<<8
    sta lStructPointer2+1,b
    lda #<>aBattleRoundsData
    sta lStructPointer2,b
    jsl rlAppendNewStructEntry

    jsl rlHandleDalvinTristanFights
    rtl

    .databank 0

  rlASMCDalvinTristanFightRound3 ; B2/9289

    .al
    .autsiz
    .databank ?

    jsl rlClearBattleData

    lda #(`aBattleRoundsData)<<8
    sta lR18+1
    lda #<>aBattleRoundsData
    sta lR18
    lda #32
    sta wR0
    lda #2
    sta wR1
    jsl rlBuildRAMStructHeader

    lda #9
    sta lStructPointer1,b
    lda #(`aBattleRoundsData)<<8
    sta lStructPointer2+1,b
    lda #<>aBattleRoundsData
    sta lStructPointer2,b
    jsl rlAppendNewStructEntry

    lda #8
    sta lStructPointer1,b
    lda #(`aBattleRoundsData)<<8
    sta lStructPointer2+1,b
    lda #<>aBattleRoundsData
    sta lStructPointer2,b
    jsl rlAppendNewStructEntry

    lda #9
    sta lStructPointer1,b
    lda #(`aBattleRoundsData)<<8
    sta lStructPointer2+1,b
    lda #<>aBattleRoundsData
    sta lStructPointer2,b
    jsl rlAppendNewStructEntry

    lda #8
    sta lStructPointer1,b
    lda #(`aBattleRoundsData)<<8
    sta lStructPointer2+1,b
    lda #<>aBattleRoundsData
    sta lStructPointer2,b
    jsl rlAppendNewStructEntry

    lda #$FFFF
    sta lStructPointer1,b
    lda #(`aBattleRoundsData)<<8
    sta lStructPointer2+1,b
    lda #<>aBattleRoundsData
    sta lStructPointer2,b
    jsl rlAppendNewStructEntry

    jsl rlHandleDalvinTristanFights
    rtl

    .databank 0

  rlHandleDalvinTristanFights ; B2/9318

    .al
    .autsiz
    .databank ?

    lda wEventUnitSlot1ID,b
    sta wR0
    lda wEventUnitSlot2ID,b
    sta wR1
    jsl $9EF0CF
    jsl rlCreateProcHaltEvent
    rtl

    .databank 0

  rlASMCCheckDalvinTristanFightCapable ; B2/932B

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

    lda #Dalvin
    jsl rlGetUnitRAMDataPointerByID
    bcs _False

      lda wSelectedUnitDataRAMPointer
      sta wEventUnitSlot1ID
      jsl rlGetSelectedUnitLevel
      cmp #11
      bge _False

        jsl rlGetSelectedUnitFirstInventoryItem
        cmp #0
        beq _False

          lda #Tristan
          jsl rlGetUnitRAMDataPointerByID
          bcs _False

            lda wSelectedUnitDataRAMPointer
            sta wEventUnitSlot2ID
            jsl rlGetSelectedUnitLevel
            cmp #11
            bge _False

              jsl rlGetSelectedUnitFirstInventoryItem
              cmp #0
              beq _False

                lda #1
                sta wEventEngineTruthFlag
                bra +

    _False
    lda #0
    sta wEventEngineTruthFlag

    +
    pla
    sta wSelectedUnitDataRAMPointer
    ply
    plx
    plp
    plb
    rtl

    .databank 0

    ; B2/9396















