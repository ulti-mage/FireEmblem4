
  aEventChapterFinalLarceiIucharTalk ; 8F/FB18

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $65
    YIELD

    DIALOGUE dialogueChapterFinalLarceiIucharTalk
    YIELD

    RUN_ASM rlClearBattleData

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT Iuchar, Strength, 3

    FILL_EVENT_UNIT_SLOT Iuchar, EventUnitSlot1
    RUN_ASM rlASMCStatUpDisplay
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
