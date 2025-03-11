
  aEventChapter04DaccarAndreyPreparing ; 8E/9320

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $63
    YIELD

    MAP_SCROLL [48, 36], 4
    YIELD

    CASTLE_NAME dialogueCastleNameZaxon, CASLTE_NAME_RED, 90
    YIELD

    DIALOGUE_WITH_BG dialogueChapter04DaccarAndreyPreparing, DIALOGUE_BG_HALLWAY, 3, 1
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
