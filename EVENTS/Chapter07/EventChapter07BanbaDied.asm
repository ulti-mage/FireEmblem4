
  aEventChapter07BanbaDied ; B2/908B

    RESTORE_PHASE_MUSIC
    YIELD

    PAUSE 20
    YIELD

    FILL_EVENT_UNIT_SLOT BanbaCh07, EventUnitSlot1
    RUN_ASM rlASMCChapter07WarpAway
    YIELD

    RUN_EVENT_CONDITION
      REMOVE_UNIT BanbaCh07

    END_EVENT

  rlASMCChapter07WarpAway ; B2/90A0

    .al
    .autsiz
    .databank ?

    jsl $9EF1FA
    jsl $829478
    rtl

    .databank 0
