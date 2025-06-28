
  aEventChapter07AresThreatensBramsel ; B2/8C62

    MAP_SCROLL [8, 16], 4
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $48
    YIELD

    DIALOGUE_WITH_BG dialogueChapter07AresThreatensBramsel, DIALOGUE_BG_HALLWAY, 3, 2
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
