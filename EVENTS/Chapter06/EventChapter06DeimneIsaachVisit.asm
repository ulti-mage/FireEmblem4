
  aEventChapter06DeimneIsaachVisit ; 91/D5E5

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $5B
    YIELD

    DIALOGUE_WITH_BG dialogueChapter06DeimneIsaachVisit, DIALOGUE_BG_ALLEY, 3, 2
    YIELD

    RUN_ASM rlClearBattleData

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT Deimne, Strength, 5

    FILL_EVENT_UNIT_SLOT Deimne, EventUnitSlot1
    RUN_ASM rlASMCStatUpDisplay
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
