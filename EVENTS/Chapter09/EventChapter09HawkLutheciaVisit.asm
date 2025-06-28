
  aEventChapter09HawkLutheciaVisit ; B1/DD2D

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $6F
    YIELD

    DIALOGUE_WITH_BG dialogueChapter09HawkLutheciaVisit, DIALOGUE_BG_FOUNTAIN, 3, 2
    YIELD

    RUN_ASM rlClearBattleData

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT Hawk, Magic, 3

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT Hawk, Resistance, 3

    FILL_EVENT_UNIT_SLOT Hawk, EventUnitSlot1
    RUN_ASM rlASMCStatUpDisplay
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
