
  aEventChapter07LarceiCreidne_ShannanTalk ; 8F/F213

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $73
    YIELD

    DIALOGUE dialogueChapter07LarceiCreidne_ShannanTalk
    YIELD

    RUN_EVENT_CONDITION
      MODIFY_LOVE_POINTS Larcei, Shannan, 100

    RUN_EVENT_CONDITION
      MODIFY_LOVE_POINTS Creidne, Shannan, 100

    RUN_ASM rlClearBattleData

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT Larcei, Strength, 2

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT Creidne, Strength, 2

    TEST_PERMANENT_FLAG_SET PermanentFlagLarceiExists
    JUMP_TRUE +

      FILL_EVENT_UNIT_SLOT Creidne, EventUnitSlot1
      JUMP ++

      +
      FILL_EVENT_UNIT_SLOT Larcei, EventUnitSlot1

    +
    RUN_ASM rlASMCStatUpDisplay
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
