
  aEventChapter07MelgenSeized ; B2/8C86

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $77
    YIELD

    DIALOGUE_WITH_BG dialogueChapter07MelgenSeized, DIALOGUE_BG_GATE, 3, 2
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
