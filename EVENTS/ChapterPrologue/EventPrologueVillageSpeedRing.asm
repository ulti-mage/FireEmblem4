
  aEventPrologueVillageSpeedRing ; B1/8627

    RUN_EVENT_CONDITION
      GIVE_UNIT_PID $FFFF, PI_SpeedRing1

    PLAY_SFX_WORD $7FF7
    DIALOGUE dialogueChapterPrologueVillageSpeedRing
    YIELD

    PLAY_SFX_WORD $00E8
    YIELD

    END_EVENT
