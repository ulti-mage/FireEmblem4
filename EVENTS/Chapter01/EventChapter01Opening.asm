
    aEventChapter01Opening ; 90/82AE

      RUN_EVENT_CONDITION
        REGISTER_UNITGROUP_MAP_SPRITES UNITGroupChapter01Start

      SET_CAMERA_POSITION [7, 0]

      EVENT_3B $80

      FADE_IN_BY_TIMER 3

      CASTLE_NAME dialogueCastleNameNordion, CASLTE_NAME_YELLOW, 150
      YIELD

      MOVE_TEMPORARY_BY_SCRIPT CrossKnightCh01Cavalier, [29, 10], 4, MAP_SPRITE_YELLOW, _ScriptedMovementCrossKnight
      WAIT_UNIT_SPRITE_DECOMPRESSED

      WAIT_UNTIL_MAP_SPRITES_HALTING
      YIELD

      MOVE_TEMPORARY_BY_SCRIPT EldiganCh01, [14, 5], 4, MAP_SPRITE_YELLOW, _ScriptedMovementEldigan1
      WAIT_UNIT_SPRITE_DECOMPRESSED

      SCRIPTED_MAP_SCROLL _ScriptedMapScroll1, 1

      WAIT_UNTIL_MAP_SPRITES_HALTING
      YIELD

      PAUSE 10
      YIELD

      DIALOGUE dialogueChapter01Opening1
      YIELD

      CONTINUE_FORM_MAP_SPRITE_HALT
      PAUSE 20
      YIELD

      CONTINUE_FORM_MAP_SPRITE_HALT
      SCRIPTED_MAP_SCROLL _ScriptedMapScroll2, 1
      YIELD

      CASTLE_NAME dialogueCastleNameEvans, CASLTE_NAME_BLUE, 120

      CONTINUE_FORM_MAP_SPRITE_HALT
      DIALOGUE_WITH_BG dialogueChapter01Opening2, DIALOGUE_BG_THRONE, 3, 2
      YIELD

      PAUSE 25
      YIELD

      MOVE_TEMPORARY_BY_SCRIPT EldiganCh01, [46, 13], 4, MAP_SPRITE_YELLOW, _ScriptedMovementEldigan2
      WAIT_UNIT_SPRITE_DECOMPRESSED

      PAUSE 35
      YIELD

      PLAY_SFX_WORD $00E6
      PAUSE 90
      YIELD

      MAP_SCROLL [48, 34], 4
      YIELD

      PLAY_SONG $63
      YIELD

      CASTLE_NAME dialogueCastleNameGenoa, CASLTE_NAME_RED, 90
      YIELD

      DIALOGUE_WITH_BG dialogueChapter01Opening3, DIALOGUE_BG_HALLWAY, 3, 1
      SET_CAMERA_POSITION [48, 34]
      YIELD

      PAUSE 20
      YIELD

      LOAD_UNIT_BY_GROUP UNITGroupChapter01Start, aUNITGroupDataChapter01Start.ID_18, [57, 42], 4, MAP_SPRITE_RED
      WAIT_UNIT_SPRITE_DECOMPRESSED

      LOAD_UNIT_BY_GROUP UNITGroupChapter01Start, aUNITGroupDataChapter01Start.ID_14, [57, 40], 2, MAP_SPRITE_RED
      WAIT_UNIT_SPRITE_DECOMPRESSED

      PAUSE 10
      YIELD

      ; Ayra
      LOAD_UNIT_BY_GROUP UNITGroupChapter01Start, aUNITGroupDataChapter01Start.ID_15, [57, 42], 4, MAP_SPRITE_RED
      WAIT_UNIT_SPRITE_DECOMPRESSED

      PAUSE 10
      YIELD

      WAIT_UNTIL_MAP_SPRITES_HALTING
      YIELD

      PAUSE 20
      YIELD

      DIALOGUE dialogueChapter01Opening4
      YIELD

      _UnitList := [(aUNITGroupDataChapter01Start.ID_10, 15)]
      _UnitList..= [(aUNITGroupDataChapter01Start.ID_13, 15)]
      _UnitList..= [(aUNITGroupDataChapter01Start.ID_08, 15)]
      _UnitList..= [(aUNITGroupDataChapter01Start.ID_07, 15)]
      _UnitList..= [(aUNITGroupDataChapter01Start.ID_12, 15)]
      _UnitList..= [(aUNITGroupDataChapter01Start.ID_05, 15)]
      _UnitList..= [(aUNITGroupDataChapter01Start.ID_06, 15)]
      _UnitList..= [(aUNITGroupDataChapter01Start.ID_02, 15)]
      _UnitList..= [(aUNITGroupDataChapter01Start.ID_11, 15)]
      _UnitList..= [(aUNITGroupDataChapter01Start.ID_03, 15)]
      _UnitList..= [(aUNITGroupDataChapter01Start.ID_09, 15)]
      _UnitList..= [(aUNITGroupDataChapter01Start.ID_04, 20)]
      _UnitList..= [(aUNITGroupDataChapter01Start.ID_01, 35)]
      _UnitList..= [(aUNITGroupDataChapter01Start.ID_16, 10)]
      _UnitList..= [(aUNITGroupDataChapter01Start.ID_17, 30)]

      .for _Unit, _Time in _UnitList

        LOAD_UNIT_BY_GROUP UNITGroupChapter01Start, _Unit, [57, 42], 4, MAP_SPRITE_RED
        WAIT_UNIT_SPRITE_DECOMPRESSED

        PAUSE _Time
        YIELD

      .endfor

      MAP_SCROLL [38, 5], 4
      YIELD

      RUN_EVENT_CONDITION
        DEPLOY_UNIT_GROUP UNITGroupChapter01Start

      RUN_EVENT_CONDITION
        SET_TALK_TARGET Quan, Finn

      PLAY_SFX_WORD $00E0
      PAUSE 35
      YIELD

      END_EVENT

      _ScriptedMovementEldigan1 ; 90/8440
        MAP_DOWN_MULTIPLE 1
        MAP_RIGHT_MULTIPLE 9
        MAP_DOWN_MULTIPLE 1
        MAP_RIGHT_MULTIPLE 3
        MAP_DOWN_MULTIPLE 2
        MAP_RIGHT_MULTIPLE 1
        MAP_DOWN_MULTIPLE 1
        MAP_RIGHT_MULTIPLE 1
        MAP_HALT

        MAP_HALT

        MAP_RIGHT_MULTIPLE 7
        MAP_DOWN_MULTIPLE 3
        MAP_RIGHT_MULTIPLE 6
        MAP_UP_MULTIPLE 1
        MAP_RIGHT_MULTIPLE 3
        MAP_DOWN_MULTIPLE 1
        MAP_RIGHT_MULTIPLE 2
        MAP_FACE_UP
        MAP_PAUSE 10
        MAP_END

      _ScriptedMovementEldigan2 ; 90/8464
        MAP_LEFT_MULTIPLE 2
        MAP_UP_MULTIPLE 1
        MAP_LEFT_MULTIPLE 3
        MAP_DOWN_MULTIPLE 1
        MAP_LEFT_MULTIPLE 5
        MAP_END

      _ScriptedMovementCrossKnight ; 90/846F
        MAP_FACE_DOWN
        MAP_HALT

        MAP_DOWN_MULTIPLE 1
        MAP_HALT
        MAP_HALT
        MAP_END

      _ScriptedMapScroll1 ; 90/8476
        MAP_PAUSE 23
        MAP_RIGHT_MULTIPLE 11
        MAP_DOWN_RIGHT_MULTIPLE 3
        MAP_END

      _ScriptedMapScroll2 ; 90/847D
        MAP_PAUSE 40
        MAP_RIGHT_MULTIPLE 17
        MAP_END
