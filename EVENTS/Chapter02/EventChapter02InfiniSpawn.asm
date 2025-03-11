
  aEventChapter02InfiniSpawn ; 8E/8234

    RUN_EVENT_CONDITION
      REGISTER_UNITGROUP_MAP_SPRITES UNITGroupChapter02Infini

    PLAY_SONG $63
    YIELD

    MAP_SCROLL [6, 0], 4
    YIELD

    PAUSE 20
    YIELD

    FADE_OUT_BY_TIMER 1
    YIELD

    RUN_EVENT_CONDITION
      macroSetFactionsEnemies [FS_Player, FS_Ch02Infini]

    RUN_EVENT_CONDITION
      macroSetFactionsEnemies [FS_Ch02Nordion, FS_Ch02Infini]

    RUN_EVENT_CONDITION
      UPDATE_LOCATION_AND_MAP_CHANGE_EVENTS

    DIALOGUE_WITH_BG dialogueChapter02InfiniSpawn1, DIALOGUE_BG_HALLWAY, 3, 1
    YIELD

    PAUSE 20
    YIELD

    MOVE_TEMPORARY_BY_SCRIPT Beowulf, [12, 5], 4, MAP_SPRITE_RED, _ScriptedMovementBeowulf
    WAIT_UNIT_SPRITE_DECOMPRESSED

    PAUSE 18
    YIELD

    MOVE_TEMPORARY_BY_SCRIPT Waltz, [12, 5], 4, MAP_SPRITE_RED, _ScriptedMovementWaltz
    WAIT_UNIT_SPRITE_DECOMPRESSED

    PAUSE 25
    YIELD

    MAP_SCROLL [10, 0], 1
    YIELD

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    DIALOGUE dialogueChapter02InfiniSpawn2
    YIELD

    CONTINUE_FORM_MAP_SPRITE_HALT
    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    MAP_SCROLL [6, 0], 2
    YIELD

    _UnitList1 := [aUNITGroupDataChapter02Infini.ID_11]
    _UnitList1..= [aUNITGroupDataChapter02Infini.ID_10]
    _UnitList1..= [aUNITGroupDataChapter02Infini.ID_08]

    .for _Unit in _UnitList1

      LOAD_UNIT_BY_GROUP UNITGroupChapter02Infini, _Unit, [12, 5], 4, MAP_SPRITE_RED
      WAIT_UNIT_SPRITE_DECOMPRESSED

      PAUSE 10
      YIELD

    .endfor

    _UnitList2 := [aUNITGroupDataChapter02Infini.ID_09]
    _UnitList2..= [aUNITGroupDataChapter02Infini.ID_07]
    _UnitList2..= [aUNITGroupDataChapter02Infini.ID_06]
    _UnitList2..= [aUNITGroupDataChapter02Infini.ID_05]
    _UnitList2..= [aUNITGroupDataChapter02Infini.ID_04]
    _UnitList2..= [aUNITGroupDataChapter02Infini.ID_03]
    _UnitList2..= [aUNITGroupDataChapter02Infini.ID_02]

    .for _Unit in _UnitList2

      LOAD_UNIT_BY_GROUP UNITGroupChapter02Infini, _Unit, [12, 5], 4, MAP_SPRITE_RED
      WAIT_UNIT_SPRITE_DECOMPRESSED

    .endfor

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    LOAD_UNIT_BY_GROUP UNITGroupChapter02Infini, aUNITGroupDataChapter02Infini.ID_01, [12, 3], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    RUN_EVENT_CONDITION
      DEPLOY_UNIT_GROUP UNITGroupChapter02Infini

    PLAY_SFX_WORD $00E0

    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT

    _ScriptedMovementBeowulf ; 8E/8311
      MAP_RIGHT_MULTIPLE 4
      MAP_DOWN_MULTIPLE 1
      MAP_RIGHT_MULTIPLE 2
      MAP_HALT

      MAP_RIGHT_MULTIPLE 5
      MAP_PAUSE 6
      MAP_UP_MULTIPLE 2
      MAP_RIGHT_MULTIPLE 2
      MAP_END

    _ScriptedMovementWaltz ; 8E/8321
      MAP_RIGHT_MULTIPLE 6
      MAP_HALT

      MAP_RIGHT_MULTIPLE 5
      MAP_UP_MULTIPLE 1
      MAP_RIGHT_MULTIPLE 2
      MAP_END
