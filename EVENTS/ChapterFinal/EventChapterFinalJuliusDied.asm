
  aEventChapterFinalJuliusDied ; B1/E7F4

    MAP_SCROLL [34, 13], 5
    YIELD

    RUN_ASM rlASMCUnknownB1E8AF
    YIELD

    FACTION_UNIT_DEATH FS_ChFinalBelhalla, AnyAI, JuliusChFinal
    YIELD

    RUN_ASM rlASMCUnknownB1E8B8
    YIELD

    RUN_EVENT_CONDITION
      REMOVE_UNIT JuliusChFinal

    _AIList := [1, 2, 3, 4]

    .for _AI in _AIList

      FACTION_UNIT_DEATH FS_ChFinalBelhalla, _AI, AnyCharacter
      YIELD

    .endfor

    .for _AI in _AIList

      RUN_EVENT_CONDITION
        DELETE_FACTIONS_AI FS_ChFinalBelhalla, _AI

    .endfor

    SET_FLAG_IF_IN_CHAPTER ChapterFinal, FlagChapterFinal_SeliphJuliaTalkManfroyDeadCheck
    SET_FLAG_IF_IN_CHAPTER ChapterFinal, FlagChapterFinal_SeliphJuliaTalkManfroyAliveCheck
    SET_FLAG_IF_IN_CHAPTER ChapterFinal, FlagChapterFinal_AltenaArionTalkCheck

    TEST_FLAG_IN_CHAPTER_SET ChapterFinal, FlagChapterFinal_ManfroyDiedCheck
    JUMP_TRUE _ManfroyDead

      FILL_EVENT_UNIT_SLOT Manfroy, EventUnitSlot1
      MAP_SCROLL_TO_EVENT_UNIT_SLOT_1 4
      YIELD

      PAUSE 10
      YIELD

      DIALOGUE dialogueChapterFinalJuliusDiedManfroyDeath
      YIELD

      PAUSE 10
      YIELD

    _ManfroyDead; B1/E858
    FACTION_UNIT_DEATH FS_ChFinalVelthomer
    YIELD

    RUN_EVENT_CONDITION
      DELETE_FACTIONS_AI FS_ChFinalVelthomer, 1

    TEST_FLAG_IN_CHAPTER_SET ChapterFinal, FlagChapterFinal_JuliaDied
    JUMP_TRUE _JuliaDead

      TEST_FLAG_IN_CHAPTER_SET ChapterFinal, FlagChapterFinal_SeliphJuliaTalkManfroyDead
      JUMP_FALSE _JuliaUnrecruited

    _JuliaDead
    RUN_ASM rlASMCLoadActiveUnitCoordinatesInEventUnitSlot1
    MAP_SCROLL_TO_EVENT_UNIT_SLOT_1 3
    YIELD

    SET_CAMERA_TO_EVENT_UNIT_SLOT_1
    RUN_ASM rlASMCUnknownB1E8BD
    YIELD

    END_EVENT

    _JuliaUnrecruited; B1/E87D
    FILL_EVENT_UNIT_SLOT Julia, EventUnitSlot1
    MAP_SCROLL_TO_EVENT_UNIT_SLOT_1 4
    YIELD

    PAUSE 15
    YIELD

    PLAY_SONG $84
    YIELD

    DIALOGUE dialogueChapterFinalJuliusDiedJuliaRecruitment
    YIELD

    RUN_EVENT_CONDITION
      CHANGE_UNITS_FACTIONSLOT Julia, FS_Player

    PAUSE 10
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RUN_ASM rlASMCLoadActiveUnitCoordinatesInEventUnitSlot1
    MAP_SCROLL_TO_EVENT_UNIT_SLOT_1 3
    YIELD

    SET_CAMERA_TO_EVENT_UNIT_SLOT_1
    RUN_ASM rlASMCUnknownB1E8BD
    YIELD

    END_EVENT

  rlASMCUnknownB1E8AF ; B1/E8AF

    .al
    .autsiz
    .databank ?

    jsl $9FF4C5
    jsl $829487
    rtl

    .databank 0

  rlASMCUnknownB1E8B8 ; B1/E8B8

    .al
    .autsiz
    .databank ?

    jsl $829478
    rtl

    .databank 0

  rlASMCUnknownB1E8BD ; B1/E8BD

    .al
    .autsiz
    .databank ?

    lda wActiveFactionSlot,b
    bne +

      jsl $81AB26
      lda #(`$828AF2)<<8
      sta lR44+1
      lda #<>$828AF2
      sta lR44
      jsl rlEventEngineCreateProc

    +
    rtl

    .databank 0
