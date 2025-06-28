
  aEventChapter05WorldMap ; 8D/FE0E

    PLAY_SONG $61
    YIELD

    SET_CAMERA_POSITION [18, 14]
    WM_FADE_IN

    WM_SCROLL [26 * 16, 22.5 * 16]
    YIELD

    WM_DIALOGUE dialogueChapter05WorldMap
    YIELD

    PLAY_SFX_WORD $00E1
    WM_CLEAR_DIALOGUE
    YIELD

    WM_FADE_OUT
    END_EVENT
