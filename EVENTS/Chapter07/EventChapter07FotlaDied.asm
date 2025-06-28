
  aEventChapter07FotlaDied ; B2/90A9

    RESTORE_PHASE_MUSIC
    YIELD

    PAUSE 20
    YIELD

    FILL_EVENT_UNIT_SLOT FotlaCh07, EventUnitSlot1
    RUN_ASM rlASMCChapter07WarpAway
    YIELD

    RUN_EVENT_CONDITION
      REMOVE_UNIT FotlaCh07

    END_EVENT
