
  aEventChapter09PattyDaisy_CoirpreCharlotTalk ; 8F/F688

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $6F
    YIELD

    DIALOGUE dialogueChapter09PattyDaisy_CoirpreCharlotTalk
    YIELD

    RUN_EVENT_CONDITION
      MODIFY_LOVE_POINTS Patty, Coirpre, 100

    RUN_EVENT_CONDITION
      MODIFY_LOVE_POINTS Patty, Charlot, 100

    RUN_EVENT_CONDITION
      MODIFY_LOVE_POINTS Daisy, Coirpre, 100

    RUN_EVENT_CONDITION
      MODIFY_LOVE_POINTS Daisy, Charlot, 100

    RUN_ASM rlClearBattleData

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT Coirpre, HP, 3

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT Charlot, HP, 3

    TEST_PERMANENT_FLAG_SET PermanentFlagCoirpreExists
    JUMP_TRUE +

      FILL_EVENT_UNIT_SLOT Charlot, EventUnitSlot1
      JUMP ++

      +
      FILL_EVENT_UNIT_SLOT Coirpre, EventUnitSlot1

    +
    RUN_ASM rlASMCStatUpDisplay
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
