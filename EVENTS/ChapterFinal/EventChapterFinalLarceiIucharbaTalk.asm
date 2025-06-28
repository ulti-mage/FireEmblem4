
  aEventChapterFinalLarceiIucharbaTalk ; 8F/FB44

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $65
    YIELD

    DIALOGUE dialogueChapterFinalLarceiIucharbaTalk
    YIELD

    RUN_ASM rlClearBattleData

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT Iucharba, Strength, 3

    FILL_EVENT_UNIT_SLOT Iucharba, EventUnitSlot1
    RUN_ASM rlASMCStatUpDisplay
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
