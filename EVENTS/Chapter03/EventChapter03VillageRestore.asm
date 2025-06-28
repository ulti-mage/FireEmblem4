
  aEventChapter03VillageRestore ; 9D/912D

    RUN_EVENT_CONDITION
      GIVE_UNIT_PID AnyCharacter, PI_RestoreStaff

    macroMapDialogue dialogueChapter03VillageRestore
    YIELD

    END_EVENT
