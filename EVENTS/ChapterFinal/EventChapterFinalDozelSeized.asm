
  aEventChapterFinalDozelSeized ; B1/E0A0

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $69
    YIELD

    DIALOGUE_WITH_BG dialogueChapterFinalDozelSeized, DIALOGUE_BG_HALLWAY, 3, 2
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
