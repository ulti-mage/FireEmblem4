
  aEventChapter02WorldMap ; 8D/FD3C

    PLAY_SONG $5E
    YIELD

    SET_CAMERA_POSITION [16, 32]
    WM_FADE_IN
    WM_SCROLL [9 * 16, 36 * 16]
    YIELD

    WM_DIALOGUE dialogueChapter02WorldMap1
    YIELD

    WM_CLEAR_DIALOGUE
    YIELD

    WM_SCROLL [10 * 16, 23 * 16]
    YIELD

    WM_DIALOGUE dialogueChapter02WorldMap2
    YIELD

    WM_DIALOGUE dialogueChapter02WorldMap3
    YIELD

    WM_CLEAR_HIGHLIGHT
    PAUSE 50
    YIELD

    WM_FADE_OUT_PORTRAIT 4
    PAUSE 5
    YIELD

    WM_CLEAR_DIALOGUE
    YIELD

    WM_SCROLL [10 * 16, 27 * 16]
    YIELD

    WM_DIALOGUE dialogueChapter02WorldMap4
    YIELD

    PLAY_SFX_WORD $00E1
    WM_CLEAR_DIALOGUE
    YIELD

    WM_FADE_OUT
    END_EVENT
