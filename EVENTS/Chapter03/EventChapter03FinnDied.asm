
  aEventChapter03FinnDied ; 9D/92DC

    PLAY_SFX_WORD $00E1
    PAUSE 20
    YIELD

    FADE_OUT_BY_TIMER 3
    YIELD

    PLAY_SONG $6A
    YIELD

    PAUSE 15
    YIELD

    RUN_EVENT_CONDITION
      UNDEPLOY_UNIT Finn

    SET_CAMERA_POSITION [29, 50]
    EVENT_3B $80
    PAUSE 3
    YIELD

    FADE_IN_BY_TIMER 2
    YIELD

    PAUSE 20
    YIELD

    MOVE_TEMPORARY_BY_SCRIPT Finn, [36, 61], 2, 2, _ScriptedMovementFinn
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    RUN_EVENT_CONDITION
      SET_PERMANENT_FLAG PermanentFlagFinnDied

    PAUSE 40
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT

    _ScriptedMovementFinn ; 9D/9320
      MAP_RIGHT_MULTIPLE 2
      MAP_SET_SPEED 3
      MAP_RIGHT_MULTIPLE 2
      MAP_DOWN_MULTIPLE 2
      MAP_END
