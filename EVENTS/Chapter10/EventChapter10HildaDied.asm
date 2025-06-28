
  aEventChapter10HildaDied ; 8D/8D8F

    RESTORE_PHASE_MUSIC
    YIELD

    PAUSE 20
    YIELD

    FILL_EVENT_UNIT_SLOT HildaCh10, EventUnitSlot1
    RUN_ASM rlASMCChapter10WarpAway
    YIELD

    RUN_EVENT_CONDITION
      REMOVE_UNIT HildaCh10

    END_EVENT
