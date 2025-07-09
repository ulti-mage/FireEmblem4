
  aEventChapter07WorldMap ; 8D/FE7C

    PLAY_SONG $5C
    YIELD

    SET_CAMERA_POSITION [24, 25]
    WM_FADE_IN

    WM_SCROLL [35 * 16, 28 * 16]
    YIELD

    WM_DIALOGUE dialogueChapter07WorldMap1
    YIELD

    WM_CLEAR_DIALOGUE
    YIELD

    WM_SCROLL [34 * 16, 31 * 16]
    YIELD

    WM_DIALOGUE dialogueChapter07WorldMap2
    YIELD

    WM_CLEAR_DIALOGUE
    YIELD

    WM_SCROLL [35 * 16, 23 * 16]
    YIELD

    WM_DIALOGUE dialogueChapter07WorldMap3
    YIELD

    WM_CLEAR_DIALOGUE
    YIELD

    PLAY_SFX_WORD $00E1

    WM_CLEAR_DIALOGUE
    YIELD

    WM_FADE_OUT
    END_EVENT

  rlASMCLoadDialogueUnit1Portrait ; 8D/FEB2

    .al
    .autsiz
    .databank ?

    lda aDialogue.wUnit1,b
    ldx #WM_PortraitSlot4
    jsl rlLoadWorldMapPortraitIntoSlot
    rtl

    .databank 0
