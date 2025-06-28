
  aEventChapter10RadosSeized ; 8D/88A6

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $77
    YIELD

    TEST_FLAG_IN_CHAPTER_SET Chapter10, FlagChapter10_ChronosSeizedCheck
    JUMP_TRUE _ChronosSeized

      DIALOGUE_WITH_BG dialogueChapter10RadosSeized, DIALOGUE_BG_ALLEY, 3, 2
      YIELD
      JUMP +

      _ChronosSeized ; 8D/88C1
      DIALOGUE_WITH_BG dialogueChapter10RadosSeizedAfterChronos, DIALOGUE_BG_ALLEY, 3, 2
      YIELD

    +
    RUN_ASM rlASMCSetChapter10LewynDaughterTalk

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT

  rlASMCSetChapter10LewynDaughterTalk ; 8D/88D8

    .al
    .autsiz
    .databank ?

    lda wSelectedUnitDataRAMPointer
    pha

    phx
    phy
    ldx #0
    
      _Loop
      lda _LewynsDaughters,x
      beq _End

        jsl rlGetUnitRAMDataPointerByID
        bcs _Next

          jsl rlGetSelectedUnitFatherID
          cmp #Lewyn
          beq _Found

      _Next
      inc x
      inc x
      bra _Loop

    _Found
    lda #Seliph
    jsl rlGetUnitRAMDataPointerByID
    bcs _End

      lda _LewynsDaughters,x
      jsl rlSetSelectedUnitTalkTarget

    _End
    ply
    plx

    pla
    sta wSelectedUnitDataRAMPointer
    rtl

    .databank 0

    _LewynsDaughters ; 8D/8914

    .word Lene
    .word Fee
    .word Tine
    .word 0



