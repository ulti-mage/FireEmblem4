
  aEventChapterEpilogueWorldMap ; 8D/FF7F

    PLAY_SONG $0F
    YIELD

    PAUSE 30
    YIELD

    SET_CAMERA_POSITION [8, 18]
    WM_FADE_IN

    WM_SCROLL [36.5 * 16, 36.5 * 16]
    YIELD

    WM_DIALOGUE dialogueChapterEpilogueWorldMapNewThracia
    YIELD

    WM_CLEAR_DIALOGUE
    YIELD

    WM_SCROLL [36.5 * 16, 16 * 16]
    YIELD

    WM_DIALOGUE dialogueChapterEpilogueWorldMapIsaach
    YIELD

    WM_CLEAR_DIALOGUE
    YIELD

    WM_SCROLL [10 * 16, 23 * 16]
    YIELD

    WM_DIALOGUE dialogueChapterEpilogueWorldMapAgustria
    YIELD

    WM_CLEAR_DIALOGUE
    YIELD

    WM_SCROLL [9 * 16, 36 * 16]
    YIELD

    WM_DIALOGUE dialogueChapterEpilogueWorldMapVerdane
    YIELD

    WM_CLEAR_DIALOGUE
    YIELD

    WM_SCROLL [22.5 * 16, 16 * 16]
    YIELD

    WM_DIALOGUE dialogueChapterEpilogueWorldMapSilesse
    YIELD

    WM_CLEAR_DIALOGUE
    YIELD

    WM_SCROLL [21 * 16, 30 * 16]
    YIELD

    WM_DIALOGUE dialogueChapterEpilogueWorldMapGrannvale
    YIELD

    END_EVENT
