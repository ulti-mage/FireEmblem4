
  aEventChapter10WorldMap ; 8D/FF1A

    PLAY_SONG $5C
    YIELD

    SET_CAMERA_POSITION [22, 24]
    WM_FADE_IN

    WM_SCROLL [36.5 * 16, 36.5 * 16]
    YIELD

    WM_DIALOGUE dialogueChapter10WorldMap1
    YIELD

    WM_CLEAR_DIALOGUE
    YIELD

    WM_SCROLL [23.5 * 16, 37.5 * 16]
    YIELD

    WM_DIALOGUE dialogueChapter10WorldMap2
    YIELD

    PLAY_SFX_WORD $00E1
    WM_CLEAR_DIALOGUE
    YIELD

    WM_FADE_OUT
    END_EVENT
