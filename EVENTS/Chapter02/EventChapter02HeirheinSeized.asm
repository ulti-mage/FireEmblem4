
  aEventChapter02HeirheinSeized ; 8E/87DA

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $7C
    YIELD

    DIALOGUE_WITH_BG dialogueChapter02HeirheinSeized, DIALOGUE_BG_GATE, 3, 2
    YIELD

    RUN_EVENT_CONDITION
      SET_TALK_TARGET Quan, Finn

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
