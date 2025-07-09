
  aEventPrologueEnding ; B1/84CD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $76
    YIELD

    FADE_OUT_BY_TIMER 2
    YIELD

    _UnitList := [Sigurd]
    _UnitList..= [Naoise]
    _UnitList..= [Alec]
    _UnitList..= [Arden]
    _UnitList..= [Quan]
    _UnitList..= [Ethlyn]
    _UnitList..= [Finn]
    _UnitList..= [Midir]
    _UnitList..= [Azelle]
    _UnitList..= [Lex]

    .for _Unit in _UnitList

      RUN_EVENT_CONDITION
        SET_UNIT_IN_CASTLE _Unit, ChP_Chalphy

    .endfor

    RUN_EVENT_CONDITION
      REMOVE_UNIT ArvisChPrologue

    DIALOGUE_WITH_BG dialogueChapterPrologueEnding1, DIALOGUE_BG_HALLWAY, 5, 2
    YIELD

    SET_CAMERA_POSITION [1, 7]

    EVENT_3B $80

    PAUSE 20
    YIELD

    FADE_IN_BY_TIMER 4
    YIELD

    PAUSE 60
    YIELD

    MOVE_TEMPORARY_BY_SCRIPT Eve, [31, 2], 4, MAP_SPRITE_GREEN, _ScriptedMovement2
    WAIT_UNIT_SPRITE_DECOMPRESSED

    MOVE_TEMPORARY_BY_SCRIPT CrossKnightCh03Cavalier, [31, 2], 4, MAP_SPRITE_GREEN, _ScriptedMovement1
    WAIT_UNIT_SPRITE_DECOMPRESSED

    SCRIPTED_MAP_SCROLL _ScriptedMapScroll, 2

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    PAUSE 20
    YIELD

    DIALOGUE_WITH_BG dialogueChapterPrologueEnding2, DIALOGUE_BG_HALLWAY, 3, 2

    SET_CAMERA_POSITION [0, 8]
    YIELD

    RUN_EVENT_CONDITION
      ADD_CASTLE_MONEY

    RUN_EVENT_CONDITION
      REMOVE_CHAPTER_STRUCT ChapterPrologue

    RUN_EVENT_CONDITION
      SAVE_CHAPTER_TURNCOUNT

    END_EVENT

    _ScriptedMovement1 ; B1/855D
      MAP_PAUSE 17

    _ScriptedMovement2 ; B1/855F
      MAP_LEFT_MULTIPLE 2
      MAP_DOWN_MULTIPLE 2
      MAP_LEFT_MULTIPLE 3
      MAP_DOWN_MULTIPLE 2
      MAP_LEFT_MULTIPLE 4
      MAP_DOWN_MULTIPLE 1
      MAP_LEFT_MULTIPLE 4
      MAP_DOWN_MULTIPLE 3
      MAP_LEFT_MULTIPLE 2
      MAP_DOWN_MULTIPLE 3
      MAP_LEFT_MULTIPLE 2
      MAP_DOWN_MULTIPLE 2
      MAP_LEFT_MULTIPLE 9
      MAP_FACE_UP
      MAP_PAUSE 8
      MAP_END

    _ScriptedMapScroll ; B1/857D
      MAP_UP_RIGHT_MULTIPLE 4
      MAP_RIGHT_MULTIPLE 10
      MAP_UP_RIGHT_MULTIPLE 3
      MAP_PAUSE 120
      MAP_SET_SPEED 1
      MAP_LEFT_MULTIPLE 6
      MAP_DOWN_LEFT_MULTIPLE 7
      MAP_LEFT_MULTIPLE 4
      MAP_END

