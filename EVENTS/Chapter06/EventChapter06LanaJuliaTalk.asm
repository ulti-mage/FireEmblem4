
  aEventChapter06LanaJuliaTalk ; 8F/F026

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $84
    YIELD

    DIALOGUE dialogueChapter06LanaJuliaTalk
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    RUN_EVENT_CONDITION
      GIVE_UNIT_PID Julia, PI_MendStaff2

    END_EVENT
