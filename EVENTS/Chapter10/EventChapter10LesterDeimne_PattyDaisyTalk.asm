
  aEventChapter10LesterDeimne_PattyDaisyTalk ; 8F/F7BD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $6F
    YIELD

    DIALOGUE dialogueChapter10LesterDeimne_PattyDaisyTalk
    YIELD

    RUN_EVENT_CONDITION
      MODIFY_LOVE_POINTS Patty, Lester, 100

    RUN_EVENT_CONDITION
      MODIFY_LOVE_POINTS Patty, Deimne, 100

    RUN_EVENT_CONDITION
      MODIFY_LOVE_POINTS Daisy, Lester, 100

    RUN_EVENT_CONDITION
      MODIFY_LOVE_POINTS Daisy, Deimne, 100

    RUN_ASM rlClearBattleData

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT Patty, HP, 3

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT Daisy, HP, 3

    TEST_PERMANENT_FLAG_SET PermanentFlagPattyExists
    JUMP_TRUE +

      FILL_EVENT_UNIT_SLOT Daisy, EventUnitSlot1
      JUMP ++

      +
      FILL_EVENT_UNIT_SLOT Patty, EventUnitSlot1

    +
    RUN_ASM rlASMCStatUpDisplay
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
