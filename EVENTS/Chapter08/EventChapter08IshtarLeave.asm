
  aEventChapter08IshtarLeave ; 8F/BB28

    RUN_EVENT_CONDITION
      REGISTER_CHARACTER_MAP_SPRITE JuliusChFinal

    PLAY_SONG $83
    YIELD

    PAUSE 10
    YIELD

    FILL_EVENT_UNIT_SLOT IshtarCh08, EventUnitSlot1
    MAP_SCROLL_TO_EVENT_UNIT_SLOT_1 4
    YIELD

    PAUSE 6
    YIELD

    FILL_EVENT_UNIT_SLOT IshtarCh08, EventUnitSlot1
    RUN_ASM rlASMCUnknown8FBB85
    RUN_ASM rlASMCUnknown8FBB91
    YIELD

    PAUSE 5
    YIELD

    RUN_ASM rlASMCUnknown8FBB99
    PAUSE 10
    YIELD

    DIALOGUE dialogueChapter08IshtarLeave
    YIELD

    FILL_EVENT_UNIT_SLOT JuliusChFinal, EventUnitSlot1
    RUN_ASM rlASMCChapter08WarpAway
    YIELD

    FILL_EVENT_UNIT_SLOT IshtarCh08, EventUnitSlot1
    RUN_ASM rlASMCChapter08WarpAway
    YIELD

    RUN_EVENT_CONDITION
      REMOVE_UNIT IshtarCh08

    RUN_EVENT_CONDITION
      REMOVE_UNIT JuliusChFinal

    RUN_EVENT_CONDITION
      SET_TALK_TARGET Julia, None

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT

  rlASMCUnknown8FBB85 ; 8F/BB85

    .al
    .autsiz
    .databank ?

    lda #IshtarCh08
    sta wRoutineVariable1
    jsl rlUnknown8FBBA7
    rtl

    .databank 0

  rlASMCUnknown8FBB91 ; 8F/BB91

    .al
    .autsiz
    .databank ?

    ldx #1
    jsl rlUnknown8FBBFC
    rtl

    .databank 0

  rlASMCUnknown8FBB99 ; 8F/BB99

    .al
    .autsiz
    .databank ?

    jsl rlUnknown8FBC11
    rtl

    .databank 0

  rlASMCChapter08WarpAway ; 8F/BB9E

    .al
    .autsiz
    .databank ?

    jsl $9EF1FA
    jsl $829478
    rtl

    .databank 0

  rlUnknown8FBBA7 ; 8F/BBA7

    .al
    .autsiz
    .databank ?

    lda #$0047
    sta $7E4EAF
    lda #$FFFF
    sta $7E4EBD
    lda #1
    sta $7F4562

    lda wEventUnitSlot1XCoordinate
    sta $7EC490
    inc a
    sta $7EC48C

    lda wEventUnitSlot1YCoordinate
    sta $7EC492
    sta $7EC48E

    lda #0
    sta $7EC494
    lda #0
    jsl $87B01D

    lda $7ECCB6
    sta $7E4EAB
    lda $7ECCBE
    sta $7E4EAD
    jsl $9EF369
    jsl $829487
    rtl

    .databank 0

  rlUnknown8FBBFC ; 8F/BBFC

    .al
    .autsiz
    .databank ?

    lda $7E4EAD
    xba
    ora $7E4EAB
    sta wRoutineVariable1

    lda #JuliusChFinal
    jsl $84C87A
    rtl

    .databank 0

  rlUnknown8FBC11 ; 8F/BC11

    .al
    .autsiz
    .databank ?

    lda #JuliusChFinal
    jsl rlGetUnitRAMDataPointerByID
    jsl rlGetSelectedUnitDeploymentOffset
    tax
    jsl rlDeployedUnitUnsetHiddenIfAlive

    lda $7F4C07
    ora #$0008
    sta $7F4C07
    rtl

    .databank 0
