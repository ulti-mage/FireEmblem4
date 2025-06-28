
  aEventChapter08SeliphCedTalk ; 8F/BEE3

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $73
    YIELD

    DIALOGUE dialogueChapter08SeliphCedTalk
    YIELD

    TEST_PERMANENT_FLAG_SET PermanentFlagCedExists
    JUMP_TRUE +

      RUN_EVENT_CONDITION
        CHANGE_UNITS_FACTIONSLOT Hawk, FS_Player

      JUMP ++

      +
      RUN_EVENT_CONDITION
        CHANGE_UNITS_FACTIONSLOT Ced, FS_Player

    +
    RUN_EVENT_CONDITION
      SET_CHILD_TALK_TARGET [Fee, Hermina], [Ced, Hawk]

    RUN_ASM rlASMCSetCedSeliphTalk

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT

  rlASMCSetCedSeliphTalk ; 8F/BF19

    .al
    .autsiz
    .databank ?

    lda wSelectedUnitDataRAMPointer
    pha

    phx
    phy
    lda #Ced
    jsl rlGetUnitRAMDataPointerByID
    bcs +

      jsl rlGetSelectedUnitFatherID
      cmp #Lewyn
      bne +

        lda #Seliph
        jsl rlSetSelectedUnitTalkTarget

    +
    ply
    plx

    pla
    sta wSelectedUnitDataRAMPointer
    rtl

    .databank 0
