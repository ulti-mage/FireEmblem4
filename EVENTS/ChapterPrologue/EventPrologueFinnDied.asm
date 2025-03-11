
    aEventPrologueFinnDied ; B1/871C

      PLAY_SFX_WORD $00E1
      PAUSE 20
      YIELD

      FADE_OUT_BY_TIMER 3
      YIELD

      PLAY_SONG $6A
      YIELD

      RUN_EVENT_CONDITION
        UNDEPLOY_UNIT Finn

      PAUSE 15
      YIELD

      SET_CAMERA_POSITION [48, 4]

      EVENT_3B $80

      PAUSE 3
      YIELD

      FADE_IN_BY_TIMER 2
      YIELD

      PAUSE 20
      YIELD

      MOVE_TEMPORARY_BY_SCRIPT Finn, [60, 12], 2, MAP_SPRITE_BLUE, _ScriptedMovementFinn
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

      _ScriptedMovementFinn ; B1/8760
        MAP_DOWN_MULTIPLE 1
        MAP_RIGHT_MULTIPLE 1
        MAP_SET_SPEED 3
        MAP_RIGHT_MULTIPLE 2
        MAP_END
