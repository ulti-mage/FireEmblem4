
  aEventChapter09WorldMap ; 8D/FEF1

    PLAY_SONG $5C
    YIELD

    SET_CAMERA_POSITION [22, 24]
    WM_FADE_IN

    WM_SCROLL [36.5 * 16, 36.5 * 16]
    YIELD

    WM_DIALOGUE dialogueChapter09WorldMap1
    YIELD

    WM_CLEAR_DIALOGUE
    YIELD

    WM_SCROLL [36.5 * 16, 40 * 16]
    YIELD

    WM_DIALOGUE dialogueChapter09WorldMap2
    YIELD

    WM_CLEAR_DIALOGUE
    YIELD

    PLAY_SFX_WORD $00E1
    WM_CLEAR_DIALOGUE
    YIELD

    WM_FADE_OUT
    END_EVENT
