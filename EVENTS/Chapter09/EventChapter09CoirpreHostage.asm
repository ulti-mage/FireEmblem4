
  aEventChapter09CoirpreHostage ; B1/D62D

    PLAY_SONG $6C
    YIELD

    MAP_SCROLL [3, 20], 4
    YIELD

    DIALOGUE_WITH_BG dialogueChapter09CoirpreHostage, DIALOGUE_BG_HALLWAY, 3, 1
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
