
  aEventChapter07OifeyDiarmuidTalk ; 8F/F1C2

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $75
    YIELD

    DIALOGUE dialogueChapter07OifeyDiarmuidTalk
    YIELD

    RUN_ASM rlClearBattleData

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT Diarmuid, Strength, 1

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT Diarmuid, Skill, 1

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT Diarmuid, Defense, 1

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT Tristan, Strength, 1

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT Tristan, Skill, 1

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT Tristan, Defense, 1

    TEST_PERMANENT_FLAG_SET PermanentFlagDiarmuidExists
    JUMP_TRUE +

      FILL_EVENT_UNIT_SLOT Tristan, EventUnitSlot1
      JUMP ++

      +
      FILL_EVENT_UNIT_SLOT Diarmuid, EventUnitSlot1

    +
    RUN_ASM rlASMCStatUpDisplay
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
