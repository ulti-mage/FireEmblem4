
  aEventChapter04EdainJamkeTalk ; B0/CCA0

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $60
    YIELD

    DIALOGUE dialogueChapter04EdainJamkeTalk
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    RUN_EVENT_CONDITION
      GIVE_UNIT_PID Jamke, PI_BraveBow

    END_EVENT
