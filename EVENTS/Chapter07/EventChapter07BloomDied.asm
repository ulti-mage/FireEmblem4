
  aEventChapter07BloomDied ; B2/90D3

    RESTORE_PHASE_MUSIC
    YIELD

    UNSET_FLAG_IF_IN_CHAPTER Chapter07, FlagChapter07_DaisyShannanAdjacentCheck
    PAUSE 20
    YIELD

    FILL_EVENT_UNIT_SLOT BloomCh07, EventUnitSlot1
    RUN_ASM rlASMCChapter07WarpAway
    YIELD

    RUN_EVENT_CONDITION
      REMOVE_UNIT BloomCh07

    END_EVENT
