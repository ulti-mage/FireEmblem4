
  aEventChapter01WorldMap ; 8D/FCDF

    PLAY_SONG $5E
    YIELD

    SET_CAMERA_POSITION [17, 28]
    WM_FADE_IN

    WM_SCROLL [16 * 16, 34 * 16]
    YIELD

    WM_DIALOGUE dialogueChapter01WorldMap1
    YIELD

    WM_CLEAR_DIALOGUE
    YIELD

    WM_SCROLL [9 * 16, 36 * 16]
    YIELD

    WM_DIALOGUE dialogueChapter01WorldMap2
    YIELD

    WM_HIGHLIGHT 0
    WM_DIALOGUE dialogueChapter01WorldMap3
    PAUSE 100
    YIELD

    WM_CLEAR_HIGHLIGHT
    PAUSE 50
    YIELD

    WM_DIALOGUE dialogueChapter01WorldMap4
    YIELD

    WM_DIALOGUE dialogueChapter01WorldMap5
    YIELD

    WM_FADE_OUT_PORTRAIT 2
    PAUSE 2
    YIELD

    WM_FADE_OUT_PORTRAIT 6
    PAUSE 2
    YIELD

    WM_FADE_OUT_PORTRAIT 8
    PAUSE 2
    YIELD

    WM_FADE_OUT_PORTRAIT 10
    PAUSE 2
    YIELD

    WM_DIALOGUE dialogueChapter01WorldMap6
    YIELD

    PLAY_SFX_WORD $00E1
    WM_CLEAR_DIALOGUE
    YIELD

    WM_FADE_OUT
    END_EVENT
