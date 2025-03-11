
  aEventChapter03SylvaleSpawn ; 9D/8958

    RUN_EVENT_CONDITION
      REGISTER_UNITGROUP_MAP_SPRITES UNITGroupChapter03Sylvale

    SET_FLAG_IF_IN_CHAPTER Chapter03, FlagChapter03_SylvaleCommanderTalk

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $66
    YIELD

    MAP_SCROLL [1, 37], 4
    YIELD

    PAUSE 16
    YIELD

    MOVE_TEMPORARY_BY_SCRIPT ChagallCh03, [18, 45], 4, MAP_SPRITE_RED, _ScriptedMovementChagall
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    PAUSE 20
    YIELD

    FADE_OUT_BY_TIMER 2
    YIELD

    RUN_EVENT_CONDITION
      macroSetFactionsEnemies [FS_Player, FS_Ch03Sylvale]

    RUN_EVENT_CONDITION
      UPDATE_LOCATION_AND_MAP_CHANGE_EVENTS

    _UnitList1 := [aUNITGroupDataChapter03Sylvale.ID_15]
    _UnitList1..= [aUNITGroupDataChapter03Sylvale.ID_14]
    _UnitList1..= [aUNITGroupDataChapter03Sylvale.ID_13]
    _UnitList1..= [aUNITGroupDataChapter03Sylvale.ID_12]
    _UnitList1..= [aUNITGroupDataChapter03Sylvale.ID_11]
    _UnitList1..= [aUNITGroupDataChapter03Sylvale.ID_10]
    _UnitList1..= [aUNITGroupDataChapter03Sylvale.ID_08]
    _UnitList1..= [aUNITGroupDataChapter03Sylvale.ID_09]

    .for _Unit in _UnitList1

      LOAD_UNIT_BY_GROUP_SILENT UNITGroupChapter03Sylvale, _Unit

    .endfor

    DIALOGUE_WITH_BG dialogueChapter03SylvaleSpawn1, DIALOGUE_BG_HALLWAY, 3, 2
    YIELD

    PAUSE 15
    YIELD

    _UnitList2 :=[(aUNITGroupDataChapter03Sylvale.ID_07, 33)]
    _UnitList2..=[(aUNITGroupDataChapter03Sylvale.ID_06, 34)]
    _UnitList2..=[(aUNITGroupDataChapter03Sylvale.ID_05, 36)]
    _UnitList2..=[(aUNITGroupDataChapter03Sylvale.ID_04, 36)]
    _UnitList2..=[(aUNITGroupDataChapter03Sylvale.ID_03, 34)]
    _UnitList2..=[(aUNITGroupDataChapter03Sylvale.ID_02, 35)]

    .for _Unit, _Time in _UnitList2

      LOAD_UNIT_BY_GROUP UNITGroupChapter03Sylvale, _Unit, [7, 45], 4, MAP_SPRITE_RED
      WAIT_UNIT_SPRITE_DECOMPRESSED

      PAUSE _Time
      YIELD

    .endfor

    LOAD_UNIT_BY_GROUP UNITGroupChapter03Sylvale, aUNITGroupDataChapter03Sylvale.ID_01, [7, 45], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    MAP_SCROLL [5, 37], 1
    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    DIALOGUE dialogueChapter03SylvaleSpawn2
    YIELD

    PAUSE 10
    YIELD

    MAP_SCROLL [1, 37], 2
    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $22
    YIELD

    DIALOGUE_WITH_BG dialogueChapter03SylvaleSpawn3, DIALOGUE_BG_HALLWAY, 3, 2
    YIELD

    PAUSE 15
    YIELD

    _UnitList3 := [aUNITGroupDataChapter03Sylvale.ID_26]
    _UnitList3..= [aUNITGroupDataChapter03Sylvale.ID_25]
    _UnitList3..= [aUNITGroupDataChapter03Sylvale.ID_24]
    _UnitList3..= [aUNITGroupDataChapter03Sylvale.ID_23]
    _UnitList3..= [aUNITGroupDataChapter03Sylvale.ID_20]
    _UnitList3..= [aUNITGroupDataChapter03Sylvale.ID_22]
    _UnitList3..= [aUNITGroupDataChapter03Sylvale.ID_21]
    _UnitList3..= [aUNITGroupDataChapter03Sylvale.ID_19]
    _UnitList3..= [aUNITGroupDataChapter03Sylvale.ID_18]
    _UnitList3..= [aUNITGroupDataChapter03Sylvale.ID_17]

    .for _Unit in _UnitList3

      LOAD_UNIT_BY_GROUP UNITGroupChapter03Sylvale, _Unit, [7, 45], 4, MAP_SPRITE_RED
      WAIT_UNIT_SPRITE_DECOMPRESSED

    .endfor

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    LOAD_UNIT_BY_GROUP UNITGroupChapter03Sylvale, aUNITGroupDataChapter03Sylvale.ID_16, [7, 43], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    RUN_EVENT_CONDITION
      DEPLOY_UNIT_GROUP UNITGroupChapter03Sylvale

    RUN_EVENT_CONDITION
      REMOVE_AREA_RESTRICTION 1

    END_EVENT

    _ScriptedMovementChagall ; 9D/8AA9
      MAP_LEFT_MULTIPLE 11
      MAP_FACE_UP
      MAP_PAUSE 20
      MAP_END

    _ScriptedMovementUnknown ; 9D/8AAF
      MAP_PAUSE 20
      MAP_RIGHT_MULTIPLE 10
      MAP_END
