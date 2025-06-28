
  aEventChapter10SeliphAtSea ; 8D/8DA6

    PLAY_SFX_WORD $00E1
    PAUSE 30
    YIELD

    DIALOGUE dialogueChapter10SeliphAtSea
    YIELD

    RUN_EVENT_CONDITION
      GIVE_UNIT_PID Seliph, PI_RenewalBand1

    PLAY_SFX_WORD $00E2
    PAUSE 75
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
