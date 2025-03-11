
  aEventChapter02DeirdreEthlynTalk ; B2/F9A3

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $54
    YIELD

    DIALOGUE dialogueChapter02DeirdreEthlynTalk
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    RUN_EVENT_CONDITION
      GIVE_UNIT_PID Ethlyn, PI_LightBrand

    END_EVENT
