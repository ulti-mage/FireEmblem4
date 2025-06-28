
  aEventChapter09HannibalNotRecruited ; B1/D7DA

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $77
    YIELD

    DIALOGUE_WITH_BG dialogueChapter09HannibalNotRecruited, DIALOGUE_BG_HALLWAY, 3, 2
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
