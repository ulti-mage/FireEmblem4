
  aEventChapter05EthlynDied ; 9D/C3C4

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $85
    YIELD

    FILL_EVENT_UNIT_SLOT Travant, EventUnitSlot1
    MAP_SCROLL_TO_EVENT_UNIT_SLOT_1 4
    YIELD

    TEST_FLAG_IN_CHAPTER_SET Chapter05, FlagChapter05_QuanDiedCheck
    JUMP_TRUE _QuanDead

      DIALOGUE dialogueChapter05EthlynDiedQuanAlive1
      YIELD

      FILL_EVENT_UNIT_SLOT Quan, EventUnitSlot1
      MAP_SCROLL_TO_EVENT_UNIT_SLOT_1 4
      YIELD

      DIALOGUE dialogueChapter05EthlynDiedQuanAlive2
      YIELD

      RUN_EVENT_CONDITION
        SEND_INVENTORY_TO_SUPPLY Quan

      JUMP _C416

    _QuanDead ; 9D/C3F3
    DIALOGUE dialogueChapter05EthlynDiedQuanDead
    YIELD

    RUN_EVENT_CONDITION
      macroSetFactionsEnemies [FS_Ch05Thracia, FS_Player]

    RUN_ASM rlASMCUnknown9DC421

    FILL_EVENT_UNIT_SLOT Travant, EventUnitSlot1
    MOVE_TEMPORARY_TO_COORDS Travant, [-1, -1], [57, 63], 4, EventUnitSlot1, MAP_SPRITE_RED, true
    WAIT_UNIT_SPRITE_DECOMPRESSED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    RUN_EVENT_CONDITION
      REMOVE_UNIT Travant

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    _C416
    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT

  rlASMCUnknown9DC421 ; 9D/C421

    .al
    .autsiz
    .databank ?

    lda #$0028
    sta $000DAB
    rtl

    .databank 0
