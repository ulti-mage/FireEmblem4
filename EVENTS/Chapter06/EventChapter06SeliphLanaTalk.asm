
  aEventChapter06SeliphLanaTalk ; 8F/F0E3

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $60
    YIELD

    DIALOGUE dialogueChapter06SeliphLanaTalk
    YIELD

    RUN_EVENT_CONDITION
      MODIFY_LOVE_POINTS Lana, Seliph, 100

    RUN_EVENT_CONDITION
      MODIFY_LOVE_POINTS Muirne, Seliph, 100

    RUN_ASM rlClearBattleData

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT Lana, HP, 3

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT Muirne, HP, 3

    TEST_PERMANENT_FLAG_SET PermanentFlagLanaExists
    JUMP_TRUE +

      FILL_EVENT_UNIT_SLOT Muirne, EventUnitSlot1
      JUMP ++

      +
      FILL_EVENT_UNIT_SLOT Lana, EventUnitSlot1

    +
    RUN_ASM rlASMCStatUpDisplay
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
