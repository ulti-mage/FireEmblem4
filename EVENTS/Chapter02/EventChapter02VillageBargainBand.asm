
  aEventChapter02VillageBargainBand ; 8E/86AE

    RUN_EVENT_CONDITION
      GIVE_UNIT_PID AnyCharacter, PI_BargainBand

    PLAY_SFX_WORD $7FF7
    DIALOGUE dialogueChapter02VillageBargainBand
    YIELD

    PLAY_SFX_WORD $00E8
    YIELD

    END_EVENT
