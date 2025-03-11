
  aEventChapter02ErinysGroupArrive ; 8E/87FB

    PLAY_SONG $56
    YIELD

    MAP_SCROLL [48, 0], 4
    YIELD

    _UnitList := [([61,0],_ScriptedMovement1)]
    _UnitList..= [([60,0],_ScriptedMovement2)]
    _UnitList..= [([62,0],_ScriptedMovement3)]
    _UnitList..= [([61,0],_ScriptedMovement4)]

    .for _Position, _MovementScript in _UnitList

      MOVE_TEMPORARY_BY_SCRIPT Erinys, _Position, 4, MAP_SPRITE_YELLOW, _MovementScript
      WAIT_UNIT_SPRITE_DECOMPRESSED

    .endfor

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    DIALOGUE dialogueChapter02ErinysGroupArrive
    YIELD

    PAUSE 15
    YIELD

    CONTINUE_FORM_MAP_SPRITE_HALT
    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT

    _ScriptedMovement1 ; 8E/8848
      MAP_DOWN_MULTIPLE 3
      MAP_HALT

      MAP_DOWN_MULTIPLE 5
      MAP_LEFT_MULTIPLE 8
      MAP_FACE_UP
      MAP_PAUSE 6
      MAP_END

    _ScriptedMovement2 ; 8E/8853
      MAP_DOWN_MULTIPLE 2
      MAP_HALT

      MAP_PAUSE 34
      MAP_DOWN_MULTIPLE 6
      MAP_LEFT_MULTIPLE 7
      MAP_FACE_UP
      MAP_PAUSE 6
      MAP_END

    _ScriptedMovement3 ; 8E/8860
      MAP_DOWN_MULTIPLE 2
      MAP_HALT

      MAP_PAUSE 62
      MAP_DOWN_MULTIPLE 6
      MAP_LEFT_MULTIPLE 9
      MAP_FACE_UP
      MAP_PAUSE 6
      MAP_END

    _ScriptedMovement4 ; 8E/886D
      MAP_DOWN_MULTIPLE 2
      MAP_HALT

      MAP_PAUSE 48
      MAP_DOWN_MULTIPLE 6
      MAP_LEFT_MULTIPLE 8
      MAP_FACE_UP
      MAP_PAUSE 6
      MAP_END


