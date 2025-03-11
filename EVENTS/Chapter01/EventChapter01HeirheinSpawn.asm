
  aEventChapter01HeirheinSpawn ; 90/86EA

    RUN_EVENT_CONDITION
      REGISTER_UNITGROUP_MAP_SPRITES UNITGroupChapter01Heirhein

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $22
    YIELD

    SET_FLAG_IF_IN_CHAPTER Chapter01, FlagChapter01_CrossKnightTalk
    MAP_SCROLL [14, 0], 4
    YIELD

    _UnitList := [(aUNITGroupDataChapter01Heirhein.ID_10, aUNITGroupDataChapter01Heirhein.ID_11, aUNITGroupDataChapter01Heirhein.ID_12)]
    _UnitList..= [(aUNITGroupDataChapter01Heirhein.ID_07, aUNITGroupDataChapter01Heirhein.ID_08, aUNITGroupDataChapter01Heirhein.ID_09)]
    _UnitList..= [(aUNITGroupDataChapter01Heirhein.ID_04, aUNITGroupDataChapter01Heirhein.ID_05, aUNITGroupDataChapter01Heirhein.ID_06)]

    .for _Unit1, _Unit2, _Unit3 in _UnitList

      LOAD_UNIT_BY_GROUP UNITGroupChapter01Heirhein, _Unit1, [22, 0], 4, MAP_SPRITE_RED
      WAIT_UNIT_SPRITE_DECOMPRESSED
      LOAD_UNIT_BY_GROUP UNITGroupChapter01Heirhein, _Unit2, [23, 0], 4, MAP_SPRITE_RED
      WAIT_UNIT_SPRITE_DECOMPRESSED
      LOAD_UNIT_BY_GROUP UNITGroupChapter01Heirhein, _Unit3, [21, 0], 4, MAP_SPRITE_RED
      WAIT_UNIT_SPRITE_DECOMPRESSED

      PAUSE 15
      YIELD

    .endfor

    LOAD_UNIT_BY_GROUP UNITGroupChapter01Heirhein, aUNITGroupDataChapter01Heirhein.ID_02, [23, 0], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED
    LOAD_UNIT_BY_GROUP UNITGroupChapter01Heirhein, aUNITGroupDataChapter01Heirhein.ID_03, [21, 0], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    PAUSE 20
    YIELD

    LOAD_UNIT_BY_GROUP UNITGroupChapter01Heirhein, aUNITGroupDataChapter01Heirhein.ID_01, [22, 0], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    RUN_EVENT_CONDITION
      DEPLOY_UNIT_GROUP UNITGroupChapter01Heirhein

    DIALOGUE dialogueChapter01HeirheinSpawn1
    YIELD

    MAP_SCROLL [20, 2], 3
    YIELD

    DIALOGUE dialogueChapter01HeirheinSpawn2
    YIELD

    MOVE_TEMPORARY_BY_SCRIPT CrossKnight, [29, 10], 5, MAP_SPRITE_YELLOW, _ScriptedMovementCrossKnight
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    RUN_EVENT_CONDITION
      REMOVE_UNIT CrossKnight

    PAUSE 10
    YIELD

    CONTINUE_FORM_MAP_SPRITE_HALT

    PAUSE 30
    YIELD

    MAP_SCROLL [12, 0], 2
    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    END_EVENT

    _ScriptedMovementCrossKnight ; 90/87B1
      MAP_HALT
      MAP_LEFT_MULTIPLE 1
      MAP_UP_MULTIPLE 1
      MAP_LEFT_MULTIPLE 2
      MAP_UP_MULTIPLE 2
      MAP_LEFT_MULTIPLE 3
      MAP_UP_MULTIPLE 1
      MAP_LEFT_MULTIPLE 9
      MAP_UP_MULTIPLE 1
      MAP_PAUSE 10
      MAP_END
