
  aEventChapter10VillageMagicRing ; 8D/8D60

    macroMapDialogue dialogueChapter10VillageMagicRing
    YIELD

    RUN_EVENT_CONDITION
      GIVE_UNIT_PID AnyCharacter, PI_MagicRing2

    END_EVENT
