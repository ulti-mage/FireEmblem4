
  aEventChapter08IshtarSpawn ; 8F/BA90

    PLAY_SONG $63
    YIELD

    MAP_SCROLL [37, 22], 4
    YIELD

    PAUSE 20
    YIELD

    RUN_ASM rlASMCUnknown8FBAD0
    YIELD

    MAP_SCROLL [41, 2], 5
    YIELD

    RUN_ASM rlASMCUnknown8FBAFC
    YIELD

    DIALOGUE_WITH_BG dialogueChapter08IshtarSpawn, DIALOGUE_BG_HALLWAY, 3, 2
    YIELD

    PAUSE 20
    YIELD

    LOAD_UNIT_DIRECT IshtarCh08, FS_Ch08Connacht, [49, 10], [47, 11], 4, MAP_SPRITE_RED, false, 8
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT

  rlASMCUnknown8FBAD0 ; 8F/BAD0

    .al
    .autsiz
    .databank ?

    lda #1
    sta $7F4562
    lda #$003A
    sta $7E4EAF
    lda #1
    sta $7E4EBD
    lda #$002C
    sta $7E4EAB
    lda #$001E
    sta $7E4EAD
    jsl $9EF1D9
    jsl $829478
    rtl

    .databank 0

  rlASMCUnknown8FBAFC ; 8F/BAFC

    .al
    .autsiz
    .databank ?

    lda #1
    sta $7F4562
    lda #$003A
    sta $7E4EAF
    lda #1
    sta $7E4EBD
    lda #$0031
    sta $7E4EAB
    lda #10
    sta $7E4EAD
    jsl $9EF353
    jsl $829478
    rtl

    .databank 0
