
  aEventChapterFinalPattyLesterTalk ; 8F/FBFE

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $6F
    YIELD

    DIALOGUE dialogueChapterFinalPattyLesterTalk
    YIELD

    RUN_ASM rlClearBattleData

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT Lester, Speed, 3

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT Lester, HP, 3

    FILL_EVENT_UNIT_SLOT Lester, EventUnitSlot1
    RUN_ASM rlASMCStatUpDisplay
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
