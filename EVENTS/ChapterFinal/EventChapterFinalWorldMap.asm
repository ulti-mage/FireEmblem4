
  aEventChapterFinalWorldMap ; 8D/FF41

    PLAY_SONG $1A
    YIELD

    SET_CAMERA_POSITION [25, 36]
    WM_FADE_IN

    WM_SCROLL [21 * 16, 30 * 16]
    YIELD

    WM_DIALOGUE dialogueChapterFinalWorldMap1
    YIELD

    WM_CLEAR_DIALOGUE
    YIELD

    WM_SCROLL [22.5 * 16, 16 * 16]
    YIELD

    WM_DIALOGUE dialogueChapterFinalWorldMap2
    YIELD

    WM_CLEAR_DIALOGUE
    YIELD

    WM_SCROLL [10 * 16, 23 * 16]
    YIELD

    WM_DIALOGUE dialogueChapterFinalWorldMap3
    YIELD

    WM_CLEAR_DIALOGUE
    YIELD

    WM_SCROLL [21 * 16, 30 * 16]
    YIELD

    WM_DIALOGUE dialogueChapterFinalWorldMap4
    YIELD

    WM_CLEAR_DIALOGUE
    YIELD

    WM_FADE_OUT
    END_EVENT
