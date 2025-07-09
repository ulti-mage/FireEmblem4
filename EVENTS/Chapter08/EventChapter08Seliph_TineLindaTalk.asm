
  aEventChapter08Seliph_TineLindaTalk ; 8F/F49E

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $7B
    YIELD

    DIALOGUE dialogueChapter08Seliph_TineLindaTalk
    YIELD

    RUN_EVENT_CONDITION
      MODIFY_LOVE_POINTS Tine, Seliph, 100

    RUN_EVENT_CONDITION
      MODIFY_LOVE_POINTS Linda, Seliph, 100

    RUN_ASM rlClearBattleData

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT Tine, HP, 3

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT Linda, HP, 3

    TEST_PERMANENT_FLAG_SET PermanentFlagTineExists
    JUMP_TRUE +

      FILL_EVENT_UNIT_SLOT Linda, EventUnitSlot1
      JUMP ++

      +
      FILL_EVENT_UNIT_SLOT Tine, EventUnitSlot1

    +
    RUN_ASM rlASMCStatUpDisplay
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
