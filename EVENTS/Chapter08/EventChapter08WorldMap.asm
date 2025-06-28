
  aEventChapter08WorldMap ; 8D/FEBD

    PLAY_SONG $5C
    YIELD

    SET_CAMERA_POSITION [20, 20]
    WM_FADE_IN

    WM_SCROLL [35 * 16, 31.5 * 16]
    YIELD

    WM_DIALOGUE dialogueChapter08WorldMap1
    YIELD

    WM_CLEAR_DIALOGUE
    YIELD

    WM_SCROLL [36.5 * 16, 36.5 * 16]
    YIELD

    WM_DIALOGUE dialogueChapter08WorldMap2
    YIELD

    WM_CLEAR_DIALOGUE
    YIELD

    WM_SCROLL [35 * 16, 31.5 * 16]
    YIELD

    WM_DIALOGUE dialogueChapter08WorldMap3
    YIELD

    PLAY_SFX_WORD $00E1
    WM_CLEAR_DIALOGUE
    YIELD

    WM_FADE_OUT
    END_EVENT
