
  aEventChapter04ErinysSilviaAdjacent ; 8E/9B33

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $5B
    YIELD

    DIALOGUE dialogueChapter04ErinysSilviaAdjacent
    YIELD

    RUN_EVENT_CONDITION
      MODIFY_LOVE_POINTS Erinys, Lewyn, 20

    RUN_EVENT_CONDITION
      MODIFY_LOVE_POINTS Silvia, Lewyn, 50

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
