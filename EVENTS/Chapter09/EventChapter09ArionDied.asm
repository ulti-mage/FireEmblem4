
  aEventChapter09ArionDied ; B1/DBC2

    RUN_EVENT_CONDITION
      REGISTER_CHARACTER_MAP_SPRITE JuliusChFinal

    PAUSE 20
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $83
    YIELD

    FILL_EVENT_UNIT_SLOT ArionCh09, EventUnitSlot1
    MAP_SCROLL_TO_EVENT_UNIT_SLOT_1 3
    YIELD

    PAUSE 2
    YIELD

    FILL_EVENT_UNIT_SLOT ArionCh09, EventUnitSlot1
    RUN_ASM rlASMCUnknownB1DC2A
    RUN_ASM rlASMCUnknownB1DC36
    YIELD

    PAUSE 2
    YIELD

    RUN_ASM rlASMCUnknownB1DC3E
    PAUSE 10
    YIELD

    DIALOGUE dialogueChapter09ArionDied
    YIELD

    FILL_EVENT_UNIT_SLOT ArionCh09, EventUnitSlot1
    RUN_ASM rlASMCChapter09WarpAway
    YIELD

    FILL_EVENT_UNIT_SLOT JuliusChFinal, EventUnitSlot1
    RUN_ASM rlASMCChapter09WarpAway
    YIELD

    RUN_EVENT_CONDITION
      REMOVE_UNIT ArionCh09

    RUN_EVENT_CONDITION
      REMOVE_UNIT JuliusChFinal

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    RUN_ASM rlASMCLoadActiveUnitCoordinatesInEventUnitSlot1
    MAP_SCROLL_TO_EVENT_UNIT_SLOT_1 4
    YIELD

    SET_CAMERA_TO_EVENT_UNIT_SLOT_1

    END_EVENT

  rlASMCUnknownB1DC2A ; B1/DC2A

    .al
    .autsiz
    .databank ?

    lda #ArionCh09
    sta wRoutineVariable1
    jsl $8FBBA7
    rtl

    .databank 0

  rlASMCUnknownB1DC36 ; B1/DC36

    .al
    .autsiz
    .databank ?

    ldx #4
    jsl $8FBBFC
    rtl

    .databank 0

  rlASMCUnknownB1DC3E ; B1/DC3E

    .al
    .autsiz
    .databank ?

    jsl $8FBC11
    rtl

    .databank 0

  rlASMCChapter09WarpAway ; B1/DC43

    .al
    .autsiz
    .databank ?

    jsl $9EF1FA
    jsl $829478
    rtl

    .databank 0
