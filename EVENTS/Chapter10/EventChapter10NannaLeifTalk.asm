
  aEventChapter10NannaLeifTalk ; 8F/F816

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $67
    YIELD

    DIALOGUE dialogueChapter10NannaLeifTalk
    YIELD

    RUN_EVENT_CONDITION
      MODIFY_LOVE_POINTS Nanna, Leif, 100

    RUN_EVENT_CONDITION
      MODIFY_LOVE_POINTS Jeanne, Leif, 100

    RUN_ASM rlClearBattleData

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT Nanna, HP, 3

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT Jeanne, HP, 3

    TEST_PERMANENT_FLAG_SET PermanentFlagNannaExists
    JUMP_TRUE +

      FILL_EVENT_UNIT_SLOT Jeanne, EventUnitSlot1
      JUMP ++

      +
      FILL_EVENT_UNIT_SLOT Nanna, EventUnitSlot1

    +
    RUN_ASM rlASMCStatUpDisplay
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
