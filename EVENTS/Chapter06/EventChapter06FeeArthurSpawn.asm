
  aEventChapter06FeeArthurSpawn ; 91/D1EA

    PLAY_SONG $56
    YIELD

    TEST_PERMANENT_FLAG_SET PermanentFlagFeeExists
    JUMP_TRUE +

      RUN_EVENT_CONDITION
        REGISTER_CHARACTER_MAP_SPRITE Hermina

      JUMP ++

      +
      RUN_EVENT_CONDITION
        REGISTER_CHARACTER_MAP_SPRITE Fee

    +
    TEST_PERMANENT_FLAG_SET PermanentFlagArthurExists
    JUMP_TRUE +

      RUN_EVENT_CONDITION
        REGISTER_CHARACTER_MAP_SPRITE Amid

      JUMP ++

      +
      RUN_EVENT_CONDITION
        REGISTER_CHARACTER_MAP_SPRITE Arthur

    +
    MAP_SCROLL [0, 14], 4
    YIELD

    MOVE_TEMPORARY_BY_SCRIPT Hermina, [0, 21], 4, MAP_SPRITE_BLUE, _ScriptedMovementHermina
    WAIT_UNIT_SPRITE_DECOMPRESSED

    PAUSE 130
    YIELD

    SCRIPTED_MAP_SCROLL _ScriptedMapScroll, 1
    YIELD

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    TEST_PERMANENT_FLAG_SET PermanentFlagFeeExists
    JUMP_TRUE +

      RUN_EVENT_CONDITION
        SET_UNIT_POSITION Hermina, $FF, [22, 40]

      JUMP ++

      +
      RUN_EVENT_CONDITION
        SET_UNIT_POSITION Fee, $FF, [22, 40]

    +
    CONTINUE_FORM_MAP_SPRITE_HALT

    TEST_PERMANENT_FLAG_SET PermanentFlagArthurExists
    JUMP_TRUE +

      LOAD_UNIT_DIRECT Amid, FS_Player, [22, 40], [23, 40], 4, MAP_SPRITE_BLUE
      WAIT_UNIT_SPRITE_DECOMPRESSED
      JUMP ++

      +
      LOAD_UNIT_DIRECT Arthur, FS_Player, [22, 40], [23, 40], 4, MAP_SPRITE_BLUE
      WAIT_UNIT_SPRITE_DECOMPRESSED

    +
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    DIALOGUE dialogueChapter06FeeArthurSpawn
    YIELD

    RUN_EVENT_CONDITION
      SET_CHILD_TALK_TARGET [Fee, Hermina], [Seliph, Seliph]

    RUN_EVENT_CONDITION
      SET_CHILD_TALK_TARGET [Arthur, Amid], [Seliph, Seliph]

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT

    _ScriptedMovementHermina ; 91/D27F
      MAP_RIGHT_MULTIPLE 8
      MAP_DOWN_MULTIPLE 8
      MAP_RIGHT_MULTIPLE 7
      MAP_DOWN_MULTIPLE 11
      MAP_RIGHT_MULTIPLE 2
      MAP_SET_SPEED 3
      MAP_RIGHT_MULTIPLE 3
      MAP_SET_SPEED 2
      MAP_RIGHT_MULTIPLE 2
      MAP_PAUSE 30
      MAP_HALT
      MAP_END

    _ScriptedMapScroll ; 91/D295
      MAP_DOWN_MULTIPLE 8
      MAP_RIGHT_MULTIPLE 7
      MAP_DOWN_MULTIPLE 10
      MAP_RIGHT_MULTIPLE 8
      MAP_END
