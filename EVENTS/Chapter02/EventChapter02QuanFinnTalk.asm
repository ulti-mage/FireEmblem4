
  aEventChapter02QuanFinnTalk ; B2/F9C2

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $70
    YIELD

    DIALOGUE dialogueChapter02QuanFinnTalk
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    RUN_EVENT_CONDITION
      GIVE_UNIT_PID Finn, PI_BraveLance

    END_EVENT
