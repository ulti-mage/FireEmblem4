
  aEventChapter02VillageArmorslayer ; 8E/86C1

    RUN_EVENT_CONDITION
      GIVE_UNIT_PID AnyCharacter, PI_Armorslayer1

    PLAY_SFX_WORD $7FF7
    DIALOGUE dialogueChapter02VillageArmorslayer
    YIELD

    PLAY_SFX_WORD $00E8
    YIELD

    END_EVENT
