
  aEventChapter02ArdenPursuitRing ; 8E/8A9B

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $64
    YIELD

    RUN_EVENT_CONDITION
      GIVE_UNIT_PID Arden, PI_PursuitRing

    macroMapDialogue dialogueChapter02ArdenPursuitRing
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
