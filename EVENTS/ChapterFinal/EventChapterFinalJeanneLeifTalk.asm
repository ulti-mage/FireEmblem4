
  aEventChapterFinalJeanneLeifTalk ; 8F/F9FF

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $1A
    YIELD

    DIALOGUE dialogueChapterFinalJeanneLeifTalk
    YIELD

    RUN_ASM rlClearBattleData

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT Leif, HP, 5

    FILL_EVENT_UNIT_SLOT Leif, EventUnitSlot1
    RUN_ASM rlASMCStatUpDisplay
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
