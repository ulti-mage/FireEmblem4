
  aEventChapter06WorldMap ; 8D/FE28

    PAUSE 20
    YIELD

    PLAY_SONG $5C
    YIELD

    PAUSE 10
    YIELD

    SET_CAMERA_POSITION [24, 25]
    WM_FADE_IN
    YIELD

    WM_SCROLL [26 * 16, 22.5 * 16]
    YIELD

    WM_DIALOGUE dialogueChapter06WorldMap1
    YIELD

    WM_CLEAR_DIALOGUE
    YIELD

    WM_SCROLL [21 * 16, 30 * 16]
    YIELD

    WM_DIALOGUE dialogueChapter06WorldMap2
    YIELD

    WM_DIALOGUE dialogueChapter06WorldMap3
    YIELD

    WM_CLEAR_DIALOGUE
    YIELD

    WM_SCROLL [36.5 * 16, 16 * 16]
    YIELD

    WM_DIALOGUE dialogueChapter06WorldMap4
    YIELD

    WM_CLEAR_DIALOGUE
    YIELD

    WM_SCROLL [36.5 * 16, 17 * 16]
    YIELD

    WM_DIALOGUE dialogueChapter06WorldMap5
    YIELD

    WM_DIALOGUE dialogueChapter06WorldMap6
    YIELD

    PLAY_SFX_WORD $00E1
    WM_CLEAR_DIALOGUE
    YIELD

    WM_FADE_OUT
    END_EVENT
