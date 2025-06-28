
  aEventChapter06Opening ; 91/CE2B

    RUN_EVENT_CONDITION
      REGISTER_UNITGROUP_MAP_SPRITES UNITGroupChapter06Ganeishire

    RUN_EVENT_CONDITION
      REGISTER_CHARACTER_MAP_SPRITE Seliph

    _UnitList1 := [(PermanentFlagLarceiExists,   Creidne, Larcei)]
    _UnitList1..= [(PermanentFlagLanaExists,     Muirne,  Lana)]
    _UnitList1..= [(PermanentFlagScathachExists, Dalvin,  Scathach)]

    .for _Flag, _Substitute, _Child in _UnitList1

      TEST_PERMANENT_FLAG_SET _Flag
      JUMP_TRUE +

        RUN_EVENT_CONDITION
          REGISTER_CHARACTER_MAP_SPRITE _Substitute

        JUMP ++

        +
        RUN_EVENT_CONDITION
          REGISTER_CHARACTER_MAP_SPRITE _Child

        +

    .endfor

    SET_CAMERA_POSITION [48, 8]
    EVENT_3B $80
    PAUSE 2
    YIELD

    FADE_IN_BY_TIMER 3
    CASTLE_NAME dialogueCastleNameGaneishire, CASLTE_NAME_RED, 120
    YIELD

    FADE_OUT_BY_TIMER 2
    YIELD

    _UnitList2 := [aUNITGroupDataChapter06Ganeishire.ID_13]
    _UnitList2..= [aUNITGroupDataChapter06Ganeishire.ID_14]
    _UnitList2..= [aUNITGroupDataChapter06Ganeishire.ID_15]
    _UnitList2..= [aUNITGroupDataChapter06Ganeishire.ID_16]
    _UnitList2..= [aUNITGroupDataChapter06Ganeishire.ID_17]
    _UnitList2..= [aUNITGroupDataChapter06Ganeishire.ID_18]
    _UnitList2..= [aUNITGroupDataChapter06Ganeishire.ID_19]
    _UnitList2..= [aUNITGroupDataChapter06Ganeishire.ID_20]
    _UnitList2..= [aUNITGroupDataChapter06Ganeishire.ID_21]
    _UnitList2..= [aUNITGroupDataChapter06Ganeishire.ID_22]
    _UnitList2..= [aUNITGroupDataChapter06Ganeishire.ID_23]
    _UnitList2..= [aUNITGroupDataChapter06Ganeishire.ID_24]

    .for _Unit in _UnitList2

      LOAD_UNIT_BY_GROUP_SILENT UNITGroupChapter06Ganeishire, _Unit

    .endfor

    DIALOGUE_WITH_BG dialogueChapter06Opening1, DIALOGUE_BG_HALLWAY, 3, 2
    YIELD

    PAUSE 10
    YIELD

    MOVE_TEMPORARY_BY_SCRIPT Danann, [56, 16], 4, MAP_SPRITE_RED, _ScriptedMovementDanann
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    _UnitList3 := [(aUNITGroupDataChapter06Ganeishire.ID_10, 8)]
    _UnitList3..= [(aUNITGroupDataChapter06Ganeishire.ID_05, 8)]
    _UnitList3..= [(aUNITGroupDataChapter06Ganeishire.ID_07, 6)]

    .for _Unit, _Time in _UnitList3

      LOAD_UNIT_BY_GROUP UNITGroupChapter06Ganeishire, _Unit, [56, 16], 4, MAP_SPRITE_RED
      WAIT_UNIT_SPRITE_DECOMPRESSED

      PAUSE _Time
      YIELD

    .endfor

    _UnitList4 := [aUNITGroupDataChapter06Ganeishire.ID_06]
    _UnitList4..= [aUNITGroupDataChapter06Ganeishire.ID_09]
    _UnitList4..= [aUNITGroupDataChapter06Ganeishire.ID_08]
    _UnitList4..= [aUNITGroupDataChapter06Ganeishire.ID_12]
    _UnitList4..= [aUNITGroupDataChapter06Ganeishire.ID_11]

    .for _Unit in _UnitList4

      LOAD_UNIT_BY_GROUP UNITGroupChapter06Ganeishire, _Unit, [56, 16], 4, MAP_SPRITE_RED
      WAIT_UNIT_SPRITE_DECOMPRESSED

    .endfor

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    _UnitList5 := [aUNITGroupDataChapter06Ganeishire.ID_03]
    _UnitList5..= [aUNITGroupDataChapter06Ganeishire.ID_04]
    _UnitList5..= [aUNITGroupDataChapter06Ganeishire.ID_02]

    .for _Unit in _UnitList5

      LOAD_UNIT_BY_GROUP UNITGroupChapter06Ganeishire, _Unit, [56, 16], 4, MAP_SPRITE_RED
      WAIT_UNIT_SPRITE_DECOMPRESSED

    .endfor

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    LOAD_UNIT_BY_GROUP UNITGroupChapter06Ganeishire, aUNITGroupDataChapter06Ganeishire.ID_01, [56, 14], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    PAUSE 25
    YIELD

    PLAY_SFX_WORD $00E6
    MAP_SCROLL [0, 0], 4
    YIELD

    PLAY_SONG $6B
    YIELD

    CASTLE_NAME dialogueCastleNameTirnanog, CASLTE_NAME_BLUE, 170
    MOVE_TEMPORARY_BY_SCRIPT Dalvin, [17, 7], 4, MAP_SPRITE_BLUE, _ScriptedMovementDalvin
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    DIALOGUE_WITH_BG dialogueChapter06Opening2, DIALOGUE_BG_THRONE, 3, 2
    YIELD

    _UnitList6 := [(PermanentFlagSeliphExists,   Sigurd,  Seliph)]
    _UnitList6..= [(PermanentFlagScathachExists, Dalvin,  Scathach)]
    _UnitList6..= [(PermanentFlagLarceiExists,   Creidne, Larcei)]
    _UnitList6..= [(PermanentFlagLanaExists,     Muirne,  Lana)]

    .for _Flag, _Substitute, _Child in _UnitList6

      TEST_PERMANENT_FLAG_SET _Flag
      JUMP_TRUE +

        RUN_EVENT_CONDITION
          SET_UNIT_POSITION _Substitute, Ch06_Tirnanog

        JUMP ++

        +
        RUN_EVENT_CONDITION
          SET_UNIT_POSITION _Child, Ch06_Tirnanog

      +

    .endfor
 
    _UnitList7 := [(PermanentFlagScathachExists, Dalvin,  Scathach, [6, 7], 8)]
    _UnitList7..= [(PermanentFlagLarceiExists,   Creidne, Larcei,   [6, 5], None)]
    _UnitList7..= [(PermanentFlagSeliphExists,   Sigurd,  Seliph,   [6, 6], 4)]
    _UnitList7..= [(PermanentFlagLanaExists,     Muirne,  Lana,     [5, 6], None)]

    .for _Flag, _Substitute, _Child, _Destination, _Time in _UnitList7

      TEST_PERMANENT_FLAG_SET _Flag
      JUMP_TRUE +

        LOAD_UNIT_DIRECT _Substitute, FS_Player, [5, 5], _Destination, 4, MAP_SPRITE_BLUE
        WAIT_UNIT_SPRITE_DECOMPRESSED
        JUMP ++

        +
        LOAD_UNIT_DIRECT _Child, FS_Player, [5, 5], _Destination, 4, MAP_SPRITE_BLUE
        WAIT_UNIT_SPRITE_DECOMPRESSED

      +
      WAIT_UNIT_SPRITE_DECOMPRESSED

      .if _Time != None

        PAUSE _Time
        YIELD

      .endif

    .endfor

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    JUMP _D0BA

      EVENT_DUMMY
      FADE_OUT_BY_TIMER 1
      YIELD

      _UnitList8 := [(PermanentFlagSeliphExists,   Sigurd,  Seliph,   [6, 6])]
      _UnitList8..= [(PermanentFlagScathachExists, Dalvin,  Scathach, [6, 7])]
      _UnitList8..= [(PermanentFlagLarceiExists,   Creidne, Larcei,   [6, 5])]
      _UnitList8..= [(PermanentFlagLanaExists,     Muirne,  Lana,     [5, 6])]

      .for _Flag, _Substitute, _Child, _Destination in _UnitList8

        TEST_PERMANENT_FLAG_SET _Flag
        JUMP_TRUE +

          RUN_EVENT_CONDITION
            SET_UNIT_POSITION _Substitute, $FF, _Destination

          JUMP ++

          +
          RUN_EVENT_CONDITION
            SET_UNIT_POSITION _Child, $FF, _Destination

        +
      .endfor

      RUN_EVENT_CONDITION
        DEPLOY_UNIT_GROUP UNITGroupChapter06Ganeishire

      SET_CAMERA_POSITION [0, 0]
      EVENT_3B $01
      YIELD

      JUMP _D0BD

    _D0BA
    RUN_EVENT_CONDITION
      DEPLOY_UNIT_GROUP UNITGroupChapter06Ganeishire

    _D0BD
    RUN_EVENT_CONDITION
      SET_CHILD_TALK_TARGET [Scathach, Dalvin], [Larcei, Creidne]

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    END_EVENT

    _ScriptedMovementDanann ; 91/D0CC
      MAP_DOWN_MULTIPLE 2
      MAP_LEFT_MULTIPLE 2
      MAP_DOWN_MULTIPLE 1
      MAP_LEFT_MULTIPLE 1
      MAP_DOWN_MULTIPLE 3
      MAP_END

    _ScriptedMovementDalvin ; 91/D0D7
      MAP_PAUSE 25
      MAP_LEFT_MULTIPLE 12
      MAP_UP_MULTIPLE 2
      MAP_PAUSE 10
      MAP_END
