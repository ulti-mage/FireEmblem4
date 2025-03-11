
  aEventChapter03VillageWingclipper ; 9D/911A

    RUN_EVENT_CONDITION
      GIVE_UNIT_PID AnyCharacter, PI_Wingclipper1

    PLAY_SFX_WORD $7FF7
    DIALOGUE dialogueChapter03VillageWingclipper
    YIELD

    PLAY_SFX_WORD $00E8
    YIELD

    END_EVENT
