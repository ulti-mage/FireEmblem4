
  aEventChapter05Opening ; 9D/BEBB

    RUN_EVENT_CONDITION
      REGISTER_UNITGROUP_MAP_SPRITES UNITGroupChapter05Start

    SET_CAMERA_POSITION [47, 0]
    EVENT_3B $80
    PAUSE 2
    YIELD

    MOVE_TEMPORARY_BY_SCRIPT Byron, [63, 7], 4, MAP_SPRITE_GREEN, _ScriptedMovementByron
    WAIT_UNIT_SPRITE_DECOMPRESSED

    FADE_IN_BY_TIMER 4
    PAUSE 220
    YIELD

    MAP_SCROLL [41, 0], 1
    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    LOAD_UNIT_BY_GROUP_SILENT UNITGroupChapter05Start, aUNITGroupDataChapter05Start.ID_40
    CONTINUE_FORM_MAP_SPRITE_HALT
    DIALOGUE dialogueChapter05Opening1
    YIELD

    PAUSE 20
    YIELD

    MAP_SCROLL [47, 0], 2
    YIELD

    CASTLE_NAME dialogueCastleNameLubeck, CASLTE_NAME_RED, 150

    MOVE_TEMPORARY_BY_SCRIPT Slayder, [63, 8], 4, MAP_SPRITE_RED, _ScriptedMovementSlayder
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $63
    YIELD

    FADE_OUT_BY_TIMER 2
    YIELD

    _UnitList1 := [aUNITGroupDataChapter05Start.ID_23]
    _UnitList1..= [aUNITGroupDataChapter05Start.ID_24]
    _UnitList1..= [aUNITGroupDataChapter05Start.ID_25]
    _UnitList1..= [aUNITGroupDataChapter05Start.ID_26]
    _UnitList1..= [aUNITGroupDataChapter05Start.ID_27]
    _UnitList1..= [aUNITGroupDataChapter05Start.ID_28]
    _UnitList1..= [aUNITGroupDataChapter05Start.ID_29]
    _UnitList1..= [aUNITGroupDataChapter05Start.ID_30]
    _UnitList1..= [aUNITGroupDataChapter05Start.ID_31]
    _UnitList1..= [aUNITGroupDataChapter05Start.ID_32]
    _UnitList1..= [aUNITGroupDataChapter05Start.ID_33]
    _UnitList1..= [aUNITGroupDataChapter05Start.ID_34]
    _UnitList1..= [aUNITGroupDataChapter05Start.ID_35]
    _UnitList1..= [aUNITGroupDataChapter05Start.ID_15]
    _UnitList1..= [aUNITGroupDataChapter05Start.ID_16]
    _UnitList1..= [aUNITGroupDataChapter05Start.ID_17]
    _UnitList1..= [aUNITGroupDataChapter05Start.ID_18]
    _UnitList1..= [aUNITGroupDataChapter05Start.ID_19]
    _UnitList1..= [aUNITGroupDataChapter05Start.ID_20]
    _UnitList1..= [aUNITGroupDataChapter05Start.ID_21]
    _UnitList1..= [aUNITGroupDataChapter05Start.ID_22]
    _UnitList1..= [aUNITGroupDataChapter05Start.ID_36]
    _UnitList1..= [aUNITGroupDataChapter05Start.ID_37]
    _UnitList1..= [aUNITGroupDataChapter05Start.ID_38]
    _UnitList1..= [aUNITGroupDataChapter05Start.ID_39]
    _UnitList1..= [aUNITGroupDataChapter05Start.ID_14]
    _UnitList1..= [aUNITGroupDataChapter05Start.ID_12]
    _UnitList1..= [aUNITGroupDataChapter05Start.ID_10]
    _UnitList1..= [aUNITGroupDataChapter05Start.ID_08]
    _UnitList1..= [aUNITGroupDataChapter05Start.ID_06]
    _UnitList1..= [aUNITGroupDataChapter05Start.ID_09]

    .for _Unit in _UnitList1

      LOAD_UNIT_BY_GROUP_SILENT UNITGroupChapter05Start, _Unit

    .endfor

    DIALOGUE_WITH_BG dialogueChapter05Opening2, DIALOGUE_BG_HALLWAY, 3, 2
    YIELD

    PAUSE 10
    YIELD

    _UnitList2 := [aUNITGroupDataChapter05Start.ID_07]
    _UnitList2..= [aUNITGroupDataChapter05Start.ID_11]
    _UnitList2..= [aUNITGroupDataChapter05Start.ID_13]
    _UnitList2..= [aUNITGroupDataChapter05Start.ID_05]

    .for _Unit in _UnitList2

      LOAD_UNIT_BY_GROUP UNITGroupChapter05Start, _Unit, [55, 8], 4, MAP_SPRITE_RED
      WAIT_UNIT_SPRITE_DECOMPRESSED

    .endfor

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    PAUSE 10
    YIELD

    DIALOGUE_WITH_BG dialogueChapter05Opening3, DIALOGUE_BG_HALLWAY, 3, 1
    YIELD

    PAUSE 10
    YIELD

    _UnitList3 := [(aUNITGroupDataChapter05Start.ID_47, 16)]
    _UnitList3..= [(aUNITGroupDataChapter05Start.ID_48, 16)]
    _UnitList3..= [(aUNITGroupDataChapter05Start.ID_45, 14)]
    _UnitList3..= [(aUNITGroupDataChapter05Start.ID_46, 14)]
    _UnitList3..= [(aUNITGroupDataChapter05Start.ID_43, 12)]
    _UnitList3..= [(aUNITGroupDataChapter05Start.ID_44, 10)]

    .for _Unit, _Time in _UnitList3

      LOAD_UNIT_BY_GROUP UNITGroupChapter05Start, _Unit, [55, 8], 4, MAP_SPRITE_RED
      WAIT_UNIT_SPRITE_DECOMPRESSED

      PAUSE _Time
      YIELD

    .endfor

    LOAD_UNIT_BY_GROUP UNITGroupChapter05Start, aUNITGroupDataChapter05Start.ID_42, [55, 8], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    LOAD_UNIT_BY_GROUP UNITGroupChapter05Start, aUNITGroupDataChapter05Start.ID_41, [55, 8], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    PAUSE 10
    YIELD

    DIALOGUE_WITH_BG dialogueChapter05Opening4, DIALOGUE_BG_HALLWAY, 3, 1
    YIELD

    PAUSE 20
    YIELD

    LOAD_UNIT_BY_GROUP UNITGroupChapter05Start, aUNITGroupDataChapter05Start.ID_02, [55, 8], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    LOAD_UNIT_BY_GROUP UNITGroupChapter05Start, aUNITGroupDataChapter05Start.ID_03, [55, 8], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    LOAD_UNIT_BY_GROUP UNITGroupChapter05Start, aUNITGroupDataChapter05Start.ID_04, [55, 8], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    LOAD_UNIT_BY_GROUP UNITGroupChapter05Start, aUNITGroupDataChapter05Start.ID_01, [55, 6], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $66
    YIELD

    MAP_SCROLL [16, 4], 4
    YIELD

    CASTLE_NAME dialogueCastleNameZaxon, CASLTE_NAME_BLUE, 90
    YIELD

    DIALOGUE_WITH_BG dialogueChapter05Opening5, DIALOGUE_BG_THRONE, 3, 1
    YIELD

    JUMP _C09D

      ; 9D/C08C

      EVENT_DUMMY
      FADE_OUT_BY_TIMER 1
      YIELD

      RUN_EVENT_CONDITION
        DEPLOY_UNIT_GROUP UNITGroupChapter05Start

      SET_CAMERA_POSITION [16, 4]
      EVENT_3B $01
      YIELD

      JUMP _C0A0

    _C09D
    RUN_EVENT_CONDITION
      DEPLOY_UNIT_GROUP UNITGroupChapter05Start

    _C0A0
    RUN_EVENT_CONDITION
      SET_TALK_TARGET Edain, Brigid

    SET_FLAG_IF_IN_CHAPTER Chapter05, FlagChapter05_SigurdAidaTalk
    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    END_EVENT

    _ScriptedMovementByron ; 9D/C0B0
      MAP_LEFT_MULTIPLE 5
      MAP_UP_MULTIPLE 3
      MAP_LEFT_MULTIPLE 5
      MAP_SET_SPEED 3
      MAP_LEFT_MULTIPLE 3
      MAP_SET_SPEED 2
      MAP_LEFT_MULTIPLE 2
      MAP_PAUSE 20
      MAP_HALT
      MAP_END

    _ScriptedMovementSlayder ; 9D/C0C2
      MAP_LEFT_MULTIPLE 8
      MAP_FACE_UP
      MAP_PAUSE 10
      MAP_END
