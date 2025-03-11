
  aEventChapter03VillageRestore ; 9D/912D

    RUN_EVENT_CONDITION
      GIVE_UNIT_PID AnyCharacter, PI_RestoreStaff

    PLAY_SFX_WORD $7FF7
    DIALOGUE dialogueChapter03VillageRestore
    YIELD

    PLAY_SFX_WORD $00E8
    YIELD

    END_EVENT
