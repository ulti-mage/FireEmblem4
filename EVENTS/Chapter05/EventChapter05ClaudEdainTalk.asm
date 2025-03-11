
  aEventChapter05ClaudEdainTalk ; B0/CD81

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $69
    YIELD

    DIALOGUE dialogueChapter05ClaudEdainTalk
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    RUN_EVENT_CONDITION
      GIVE_UNIT_PID Edain, PI_RescueStaff

    END_EVENT
