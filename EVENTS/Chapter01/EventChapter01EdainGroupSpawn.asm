
  aEventChapter01EdainGroupSpawn ; 90/8484

    PLAY_SONG $6C
    YIELD

    RUN_EVENT_CONDITION
      REGISTER_UNITGROUP_MAP_SPRITES UNITGroupChapter01Marpha

    RUN_EVENT_CONDITION
      REGISTER_CHARACTER_MAP_SPRITE Edain

    RUN_EVENT_CONDITION
      REGISTER_CHARACTER_MAP_SPRITE Dew

    MAP_SCROLL [19, 43], 4
    YIELD

    CASTLE_NAME dialogueCastleNameMarpha, CASLTE_NAME_RED, 90
    YIELD

    MOVE_TEMPORARY_BY_SCRIPT Jamke, [24, 51], 4, MAP_SPRITE_RED, _ScriptedMovementJamke
    WAIT_UNIT_SPRITE_DECOMPRESSED

    PAUSE 10
    YIELD

    MOVE_TEMPORARY_BY_SCRIPT Edain, [24, 51], 4, MAP_SPRITE_BLUE, _ScriptedMovementEdain
    WAIT_UNIT_SPRITE_DECOMPRESSED

    PAUSE 14
    YIELD

    MOVE_TEMPORARY_BY_SCRIPT Dew, [24, 51], 4, MAP_SPRITE_BLUE, _ScriptedMovementDew
    WAIT_UNIT_SPRITE_DECOMPRESSED

    PAUSE 40
    YIELD

    MAP_SCROLL [24, 43], 1

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    DIALOGUE dialogueChapter01EdainGroupSpawn1
    YIELD

    PAUSE 15
    YIELD

    MAP_SCROLL [18, 43], 1

    CONTINUE_FORM_MAP_SPRITE_HALT

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    PAUSE 3
    YIELD

    RUN_EVENT_CONDITION
      SET_UNIT_POSITION Edain, $FF, [35, 50]

    RUN_EVENT_CONDITION
      SET_UNIT_POSITION Dew, $FF, [34, 50]

    CONTINUE_FORM_MAP_SPRITE_HALT

    PAUSE 15
    YIELD

    DIALOGUE dialogueChapter01EdainGroupSpawn2
    YIELD

    PAUSE 10
    YIELD

    CONTINUE_FORM_MAP_SPRITE_HALT

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    PAUSE 50
    YIELD

    DIALOGUE_WITH_BG dialogueChapter01EdainGroupSpawn3, DIALOGUE_BG_HALLWAY, 3, 2
    YIELD

    PAUSE 20
    YIELD

    _UnitList1 := [(aUNITGroupDataChapter01Marpha.ID_09, 20)]
    _UnitList1..= [(aUNITGroupDataChapter01Marpha.ID_07, 20)]
    _UnitList1..= [(aUNITGroupDataChapter01Marpha.ID_05, 20)]
    _UnitList1..= [(aUNITGroupDataChapter01Marpha.ID_02, 20)]
    _UnitList1..= [(aUNITGroupDataChapter01Marpha.ID_04, 20)]
    _UnitList1..= [(aUNITGroupDataChapter01Marpha.ID_06, 20)]
    _UnitList1..= [(aUNITGroupDataChapter01Marpha.ID_03, 20)]
    _UnitList1..= [(aUNITGroupDataChapter01Marpha.ID_10, 20)]
    _UnitList1..= [(aUNITGroupDataChapter01Marpha.ID_08, 24)]

    .for _Unit, _Time in _UnitList1

      LOAD_UNIT_BY_GROUP UNITGroupChapter01Marpha, _Unit, [24, 51], 4, MAP_SPRITE_RED
      WAIT_UNIT_SPRITE_DECOMPRESSED

      PAUSE _Time
      YIELD

    .endfor

    LOAD_UNIT_BY_GROUP UNITGroupChapter01Marpha, aUNITGroupDataChapter01Marpha.ID_01, [24, 51], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    _UnitList2 := [aUNITGroupDataChapter01Marpha.ID_21]
    _UnitList2..= [aUNITGroupDataChapter01Marpha.ID_20]
    _UnitList2..= [aUNITGroupDataChapter01Marpha.ID_19]
    _UnitList2..= [aUNITGroupDataChapter01Marpha.ID_18]
    _UnitList2..= [aUNITGroupDataChapter01Marpha.ID_17]
    _UnitList2..= [aUNITGroupDataChapter01Marpha.ID_16]
    _UnitList2..= [aUNITGroupDataChapter01Marpha.ID_14]
    _UnitList2..= [aUNITGroupDataChapter01Marpha.ID_13]
    _UnitList2..= [aUNITGroupDataChapter01Marpha.ID_15]
    _UnitList2..= [aUNITGroupDataChapter01Marpha.ID_12]

    .for _Unit in _UnitList2

      LOAD_UNIT_BY_GROUP UNITGroupChapter01Marpha, _Unit, [24, 51], 4, MAP_SPRITE_RED
      WAIT_UNIT_SPRITE_DECOMPRESSED

    .endfor

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    LOAD_UNIT_BY_GROUP UNITGroupChapter01Marpha, aUNITGroupDataChapter01Marpha.ID_11, [24, 49], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    PAUSE 20
    YIELD

    RUN_EVENT_CONDITION
      DEPLOY_UNIT_GROUP UNITGroupChapter01Marpha

    RUN_EVENT_CONDITION
      SET_TALK_TARGET_IF_UNMARRIED Midir, Edain

    RUN_EVENT_CONDITION
      SET_TALK_TARGET_IF_UNMARRIED Azelle, Edain

    RUN_EVENT_CONDITION
      SET_TALK_TARGET Sigurd, Edain

    RUN_EVENT_CONDITION
      SET_TALK_TARGET Edain, Ethlyn

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT

    _ScriptedMovementJamke ; 90/8621
      MAP_RIGHT_MULTIPLE 8
      MAP_UP_MULTIPLE 1
      MAP_FACE_DOWN
      MAP_HALT

      MAP_LEFT_MULTIPLE 1
      MAP_DOWN_MULTIPLE 1
      MAP_LEFT_MULTIPLE 5
      MAP_FACE_RIGHT
      MAP_HALT

      MAP_HALT

      MAP_SET_SPEED 3
      MAP_PAUSE 10
      MAP_LEFT_MULTIPLE 1
      MAP_PAUSE 60
      MAP_FACE_RIGHT
      MAP_PAUSE 100
      MAP_SET_SPEED 4
      MAP_LEFT_MULTIPLE 5
      MAP_UP_MULTIPLE 2
      MAP_LEFT_MULTIPLE 4
      MAP_END

    _ScriptedMovementEdain ; 90/8644
      MAP_RIGHT_MULTIPLE 8
      MAP_FACE_UP
      MAP_HALT

      MAP_PAUSE 12
      MAP_UP_MULTIPLE 1
      MAP_RIGHT_MULTIPLE 3
      MAP_HALT

      MAP_END

    _ScriptedMovementDew ; 90/8650
      MAP_RIGHT_MULTIPLE 7
      MAP_HALT

      MAP_PAUSE 12
      MAP_RIGHT_MULTIPLE 1
      MAP_UP_MULTIPLE 1
      MAP_RIGHT_MULTIPLE 2
      MAP_HALT

      MAP_END
