
  aEventChapter07VillageBarrierBladeLaylea ; B2/913A

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $5B
    YIELD

    DIALOGUE dialogueChapter07VillageBarrierBladeLaylea
    YIELD

    RUN_EVENT_CONDITION
      GIVE_UNIT_PID Laylea, PI_BarrierBlade

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
