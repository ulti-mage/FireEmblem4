
  aEventChapterFinalFeeHermina_ArthurAmidTalk ; 8F/FCDF

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $65
    YIELD

    DIALOGUE dialogueChapterFinalFeeHermina_ArthurAmidTalk
    YIELD

    RUN_ASM rlClearBattleData

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT Arthur, Skill, 3

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT Amid, Skill, 3

    TEST_PERMANENT_FLAG_SET PermanentFlagArthurExists
    JUMP_TRUE +

      FILL_EVENT_UNIT_SLOT Amid, EventUnitSlot1
      JUMP ++

      +
      FILL_EVENT_UNIT_SLOT Arthur, EventUnitSlot1

    +
    RUN_ASM rlASMCStatUpDisplay
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
