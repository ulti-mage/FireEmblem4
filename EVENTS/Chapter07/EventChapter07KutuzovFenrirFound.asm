
  aEventChapter07KutuzovFenrirFound ; B2/90EB

    PLAY_SONG $7A
    YIELD

    MAP_SCROLL [13, 0], 4
    YIELD

    PAUSE 20
    YIELD

    DIALOGUE_WITH_BG dialogueChapter07KutuzovFenrirFound, DIALOGUE_BG_HALLWAY, 3, 2
    YIELD

    RUN_EVENT_CONDITION
      REPLACE_UNIT Kutuzov, KutuzovFenrir

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
