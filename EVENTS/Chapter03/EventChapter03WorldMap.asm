
  aEventChapter03WorldMap ; 8D/FD80

    PLAY_SONG $5E
    YIELD

    SET_CAMERA_POSITION [13, 30]
    WM_FADE_IN
    WM_SCROLL [10 * 16, 23 * 16]
    YIELD

    WM_MARKER [204, 108], WMM_Slot0, WMM_AgustiToMadino
    WM_DIALOGUE dialogueChapter03WorldMap1
    YIELD

    WM_CLEAR_MARKER 0
    YIELD

    WM_FADE_OUT_PORTRAIT 2
    PAUSE 5
    YIELD

    WM_LOAD_PORTRAIT 4, Sigurd
    WM_FADE_IN_PORTRAIT 4, [148, 88]
    YIELD

    WM_DIALOGUE dialogueChapter03WorldMap2
    YIELD

    WM_FADE_OUT_PORTRAIT 4
    PAUSE 5
    YIELD

    WM_DIALOGUE dialogueChapter03WorldMap3
    YIELD

    WM_DIALOGUE dialogueChapter03WorldMap4
    YIELD

    WM_FADE_OUT_PORTRAIT 2
    YIELD

    WM_CLEAR_MARKER 0
    YIELD

    WM_CLEAR_DIALOGUE
    YIELD

    WM_SCROLL [10 * 16, 20 * 16]
    YIELD

    WM_DIALOGUE dialogueChapter03WorldMap5
    YIELD

    PAUSE 50
    YIELD

    PLAY_SFX_WORD $00E1
    WM_CLEAR_DIALOGUE
    YIELD

    WM_FADE_OUT
    END_EVENT
