
  aEventChapterFinalTineLinda_CedHawkTalk ; 8F/F96A

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $7B
    YIELD

    DIALOGUE dialogueChapterFinalTineLinda_CedHawkTalk
    YIELD

    RUN_ASM rlClearBattleData

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT Ced, Magic, 3

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT Hawk, Magic, 3

    TEST_PERMANENT_FLAG_SET PermanentFlagCedExists
    JUMP_TRUE +

      FILL_EVENT_UNIT_SLOT Hawk, EventUnitSlot1
      JUMP ++

      +
      FILL_EVENT_UNIT_SLOT Ced, EventUnitSlot1

    +
    RUN_ASM rlASMCStatUpDisplay
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
