
  aEventChapter01DeirdreSpawn ; 90/89F4

    RUN_EVENT_CONDITION
      REGISTER_CHARACTER_MAP_SPRITE Deirdre

    PLAY_SFX_WORD $00E0

    PAUSE 35
    YIELD

    PLAY_SONG $54
    YIELD

    MAP_SCROLL [7, 34], 3
    YIELD

    LOAD_UNIT_DIRECT Deirdre, FS_Player, [15, 42], [14, 42], 4, MAP_SPRITE_BLUE
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    PAUSE 15
    YIELD

    TEST_FLAG_IN_CHAPTER_SET Chapter01, FlagChapter01_SandimaDied
    JUMP_TRUE _SandimaDead

      DIALOGUE dialogueChapter01DeirdreSpawnSandimaAlive
      YIELD
      JUMP +

      _SandimaDead
      DIALOGUE dialogueChapter01DeirdreSpawnSandimaDead
      YIELD

    +
    RUN_EVENT_CONDITION
      GIVE_UNIT_PID_FORCED Deirdre, PI_Circlet

    FILL_EVENT_UNIT_SLOT Sigurd, EventUnitSlot1
    SET_CAMERA_TO_EVENT_UNIT_SLOT_1

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
