
  aEventChapter07BramselWaiting ; B2/8B02

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $63
    YIELD

    MAP_SCROLL [8, 16], 4
    YIELD

    CASTLE_NAME dialogueCastleNameDahna, CASLTE_NAME_YELLOW, 90
    YIELD

    DIALOGUE_WITH_BG dialogueChapter07BramselWaiting1, DIALOGUE_BG_HALLWAY, 5, 2
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $5B
    YIELD

    PAUSE 15
    YIELD

    DIALOGUE_WITH_BG dialogueChapter07BramselWaiting2, DIALOGUE_BG_GATE, 3, 3
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
