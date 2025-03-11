
  aEventChapter04WorldMap ; 8D/FDDD

    PLAY_SONG $5E
    YIELD

    SET_CAMERA_POSITION [10, 18]
    EVENT_4F
    WM_SCROLL [17.5 * 16, 16 * 16]
    YIELD

    WM_DIALOGUE dialogueChapter04WorldMap1
    YIELD

    EVENT_5A
    YIELD

    WM_SCROLL [22.5 * 16, 16 * 16]
    YIELD

    WM_DIALOGUE dialogueChapter04WorldMap2
    YIELD

    WM_FADE_OUT_PORTRAIT 2
    YIELD

    WM_FADE_OUT_PORTRAIT 4
    YIELD

    PAUSE 50
    YIELD

    PLAY_SFX_WORD $00E1
    EVENT_5A
    YIELD

    EVENT_50
    END_EVENT
