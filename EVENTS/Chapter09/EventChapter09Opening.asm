
  aEventChapter09Opening ; B1/D3D6

    RUN_EVENT_CONDITION
      REGISTER_UNITGROUP_MAP_SPRITES UNITGroupChapter09Opening

    SET_CAMERA_POSITION [48, 0]
    EVENT_3B $80
    PAUSE 2
    YIELD

    MOVE_TEMPORARY_BY_SCRIPT Altena, [59, 0], 4, MAP_SPRITE_RED, _ScriptedMovementAltena
    WAIT_UNIT_SPRITE_DECOMPRESSED

    SCRIPTED_MAP_SCROLL _ScriptedMapScroll1, 1
    FADE_IN_BY_TIMER 4
    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    CASTLE_NAME dialogueCastleNameThracia, CASLTE_NAME_RED, 100
    YIELD

    FADE_OUT_BY_TIMER 2
    YIELD

    _UnitList1 := [aUNITGroupDataChapter09Opening.ID_22]
    _UnitList1..= [aUNITGroupDataChapter09Opening.ID_23]
    _UnitList1..= [aUNITGroupDataChapter09Opening.ID_24]
    _UnitList1..= [aUNITGroupDataChapter09Opening.ID_25]
    _UnitList1..= [aUNITGroupDataChapter09Opening.ID_26]
    _UnitList1..= [aUNITGroupDataChapter09Opening.ID_27]
    _UnitList1..= [aUNITGroupDataChapter09Opening.ID_28]
    _UnitList1..= [aUNITGroupDataChapter09Opening.ID_29]
    _UnitList1..= [aUNITGroupDataChapter09Opening.ID_30]

    .for _Unit in _UnitList1

      LOAD_UNIT_BY_GROUP_SILENT UNITGroupChapter09Opening, _Unit

    .endfor

    DIALOGUE_WITH_BG dialogueChapter09Opening1, DIALOGUE_BG_HALLWAY, 3, 1
    YIELD

    PAUSE 20
    YIELD

    RUN_EVENT_CONDITION
      CHANGE_UNITS_FACTIONSLOT Altena, FS_Ch09Thracia

    LOAD_UNIT_BY_GROUP UNITGroupChapter09Opening, aUNITGroupDataChapter09Opening.ID_21, [52, 43], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $85
    YIELD

    DIALOGUE_WITH_BG dialogueChapter09Opening2, DIALOGUE_BG_HALLWAY, 3, 1
    SET_CAMERA_POSITION [45, 34]
    YIELD

    PAUSE 20
    YIELD

    MOVE_TEMPORARY_BY_SCRIPT TravantCh09, [52, 43], 5, MAP_SPRITE_RED, _ScriptedMovementTravant1
    WAIT_UNIT_SPRITE_DECOMPRESSED

    PAUSE 6
    YIELD

    SCRIPTED_MAP_SCROLL _ScriptedMapScroll2, 2
    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    CASTLE_NAME dialogueCastleNameKapathogia, CASLTE_NAME_RED, 90
    YIELD

    FADE_OUT_BY_TIMER 1
    YIELD

    _UnitList2 := [aUNITGroupDataChapter09Opening.ID_02]
    _UnitList2..= [aUNITGroupDataChapter09Opening.ID_03]
    _UnitList2..= [aUNITGroupDataChapter09Opening.ID_04]
    _UnitList2..= [aUNITGroupDataChapter09Opening.ID_05]
    _UnitList2..= [aUNITGroupDataChapter09Opening.ID_06]
    _UnitList2..= [aUNITGroupDataChapter09Opening.ID_07]
    _UnitList2..= [aUNITGroupDataChapter09Opening.ID_08]
    _UnitList2..= [aUNITGroupDataChapter09Opening.ID_09]
    _UnitList2..= [aUNITGroupDataChapter09Opening.ID_10]
    _UnitList2..= [aUNITGroupDataChapter09Opening.ID_11]
    _UnitList2..= [aUNITGroupDataChapter09Opening.ID_12]
    _UnitList2..= [aUNITGroupDataChapter09Opening.ID_13]
    _UnitList2..= [aUNITGroupDataChapter09Opening.ID_14]
    _UnitList2..= [aUNITGroupDataChapter09Opening.ID_15]
    _UnitList2..= [aUNITGroupDataChapter09Opening.ID_16]
    _UnitList2..= [aUNITGroupDataChapter09Opening.ID_17]
    _UnitList2..= [aUNITGroupDataChapter09Opening.ID_18]
    _UnitList2..= [aUNITGroupDataChapter09Opening.ID_19]

    .for _Unit in _UnitList2

      LOAD_UNIT_BY_GROUP_SILENT UNITGroupChapter09Opening, _Unit

    .endfor

    DIALOGUE_WITH_BG dialogueChapter09Opening3, DIALOGUE_BG_HALLWAY, 3, 1
    YIELD

    PAUSE 20
    YIELD

    LOAD_UNIT_BY_GROUP UNITGroupChapter09Opening, aUNITGroupDataChapter09Opening.ID_01, [32, 19], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    PAUSE 20
    YIELD

    MOVE_TEMPORARY_BY_SCRIPT TravantCh09, [32, 19], 5, MAP_SPRITE_RED, _ScriptedMovementTravant2
    WAIT_UNIT_SPRITE_DECOMPRESSED

    PAUSE 6
    YIELD

    SCRIPTED_MAP_SCROLL _ScriptedMapScroll3, 2
    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    CASTLE_NAME dialogueCastleNameLuthecia, CASLTE_NAME_RED, 90
    YIELD

    DIALOGUE_WITH_BG dialogueChapter09Opening4, DIALOGUE_BG_HALLWAY, 3, 1
    YIELD

    LOAD_UNIT_BY_GROUP UNITGroupChapter09Opening, aUNITGroupDataChapter09Opening.ID_20, [10, 27], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    PAUSE 20
    YIELD

    MOVE_TEMPORARY_BY_SCRIPT TravantCh09, [10, 29], 5, MAP_SPRITE_RED, _ScriptedMovementTravant3
    WAIT_UNIT_SPRITE_DECOMPRESSED

    PAUSE 6
    YIELD

    SCRIPTED_MAP_SCROLL _ScriptedMapScroll4, 2
    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    CASTLE_NAME dialogueCastleNameGrutia, CASLTE_NAME_RED, 90
    YIELD

    DIALOGUE_WITH_BG dialogueChapter09Opening5, DIALOGUE_BG_HALLWAY, 3, 1
    YIELD

    PAUSE 15
    YIELD

    MOVE_TEMPORARY_BY_SCRIPT TravantCh09, [18, 56], 5, MAP_SPRITE_RED, _ScriptedMovementTravant4
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    PAUSE 20
    YIELD

    PLAY_SFX_WORD $00E5
    MAP_SCROLL [44, 0], 4
    YIELD

    PLAY_SONG $68
    YIELD

    CASTLE_NAME dialogueCastleNameMeath, CASLTE_NAME_BLUE, 100
    YIELD

    TEST_FLAG_IN_CHAPTER_SET Chapter09, FlagChapter09_OifeyAlive
    JUMP_FALSE _OifeyDead

      DIALOGUE_WITH_BG dialogueChapter09Opening6OifeyAlive, DIALOGUE_BG_THRONE, 5, 2
      YIELD

      JUMP +

      _OifeyDead
      DIALOGUE_WITH_BG dialogueChapter09Opening6, DIALOGUE_BG_THRONE, 5, 2
      YIELD

    +
    TEST_FLAG_IN_CHAPTER_SET Chapter09, FlagChapter09_LeifFinnAlive
    JUMP_FALSE _SkipLeifFinnTalk

      PLAY_SFX_WORD $00E0
      PAUSE 35
      YIELD

      PLAY_SONG $62
      YIELD

      PAUSE 25
      YIELD

      DIALOGUE_WITH_BG dialogueChapter09Opening7LeifFinn, DIALOGUE_BG_GATE, 3, 3
      YIELD

      JUMP +

    _SkipLeifFinnTalk
    EVENT_3B 1
    YIELD

    +
    JUMP _End

      ; B1/D59A
      EVENT_DUMMY
      FADE_OUT_BY_TIMER 1
      YIELD

      RUN_EVENT_CONDITION
        DEPLOY_UNIT_GROUP UNITGroupChapter09Opening

      SET_CAMERA_POSITION [44, 0]
      EVENT_3B 1
      YIELD

      JUMP +

    _End ; B1/D5AB
    RUN_EVENT_CONDITION
      DEPLOY_UNIT_GROUP UNITGroupChapter09Opening

    +
    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RUN_EVENT_CONDITION
      SET_CHILD_TALK_TARGET [Febail, Asaello], [Patty, Daisy]

    END_EVENT

    _ScriptedMovementAltena ; B1/D5BD
      MAP_FACE_DOWN
      MAP_DOWN_MULTIPLE 43
      MAP_LEFT_MULTIPLE 7
      MAP_FACE_UP
      MAP_PAUSE 10
      MAP_END

    _ScriptedMapScroll1 ; B1/D5C6
      MAP_PAUSE 120
      MAP_DOWN_MULTIPLE 34
      MAP_PAUSE 32
      MAP_LEFT_MULTIPLE 3
      MAP_END

    _ScriptedMovementTravant1 ; B1/D5CF
      MAP_LEFT_MULTIPLE 20
      MAP_UP_MULTIPLE 24
      MAP_PAUSE 12
      MAP_END

    _ScriptedMapScroll2 ; B1/D5D6
      MAP_LEFT_MULTIPLE 20
      MAP_UP_MULTIPLE 23
      MAP_END

    _ScriptedMovementTravant2 ; B1/D5DB
      MAP_DOWN_MULTIPLE 10
      MAP_LEFT_MULTIPLE 22
      MAP_FACE_UP
      MAP_PAUSE 10
      MAP_END

    _ScriptedMapScroll3 ; B1/D5E3
      MAP_DOWN_MULTIPLE 10
      MAP_LEFT_MULTIPLE 22
      MAP_END

    _ScriptedMovementTravant3 ; B1/D5E8
      MAP_DOWN_MULTIPLE 27
      MAP_RIGHT_MULTIPLE 8
      MAP_FACE_UP
      MAP_PAUSE 10
      MAP_END

    _ScriptedMapScroll4 ; B1/D5F0
      MAP_DOWN_MULTIPLE 27
      MAP_RIGHT_MULTIPLE 8
      MAP_END

    _ScriptedMovementTravant4 ; B1/D5F5
      MAP_RIGHT_MULTIPLE 11
      MAP_END
