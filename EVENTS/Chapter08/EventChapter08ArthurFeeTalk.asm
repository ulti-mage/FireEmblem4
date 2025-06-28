
  aEventChapter08ArthurFeeTalk ; 8F/F515

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $5B
    YIELD

    DIALOGUE dialogueChapter08ArthurFeeTalk
    YIELD

    RUN_EVENT_CONDITION
      MODIFY_LOVE_POINTS Fee, Arthur, 100

    RUN_EVENT_CONDITION
      MODIFY_LOVE_POINTS Fee, Amid, 100

    RUN_EVENT_CONDITION
      MODIFY_LOVE_POINTS Hermina, Arthur, 100

    RUN_EVENT_CONDITION
      MODIFY_LOVE_POINTS Hermina, Amid, 100

    RUN_ASM rlClearBattleData

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT Fee, HP, 3

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT Hermina, HP, 3

    TEST_PERMANENT_FLAG_SET PermanentFlagFeeExists
    JUMP_TRUE +

      FILL_EVENT_UNIT_SLOT Hermina, EventUnitSlot1
      JUMP ++

      +
      FILL_EVENT_UNIT_SLOT Fee, EventUnitSlot1

    +
    RUN_ASM rlASMCStatUpDisplay
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
