
  aEventChapter06SchmidtSpawn ; 91/D29E

    RUN_EVENT_CONDITION
      REGISTER_UNITGROUP_MAP_SPRITES UNITGroupChapter06Ribaut

    SET_FLAG_IF_IN_CHAPTER Chapter06, FlagChapter06_SofalaTalkCheck
    SET_FLAG_IF_IN_CHAPTER Chapter06, FlagChapter06_IsaachTalkCheck

    MAP_SCROLL [20, 50], 4
    YIELD

    CASTLE_NAME dialogueCastleNameRibaut, CASLTE_NAME_RED, 90
    YIELD

    FADE_OUT_BY_TIMER 1
    YIELD

    RUN_EVENT_CONDITION
      macroSetFactionsEnemies [FS_Player, FS_Ch06Sofala]

    RUN_EVENT_CONDITION
      macroSetFactionsEnemies [FS_Player, FS_Ch06Isaach]

    RUN_EVENT_CONDITION
      UPDATE_LOCATION_AND_MAP_CHANGE_EVENTS

    DIALOGUE_WITH_BG dialogueChapter06SchmidtSpawn1, DIALOGUE_BG_HALLWAY, 3, 1
    YIELD

    _UnitList := [(aUNITGroupDataChapter06Ribaut.ID_12, 20)]
    _UnitList..= [(aUNITGroupDataChapter06Ribaut.ID_11, 18)]
    _UnitList..= [(aUNITGroupDataChapter06Ribaut.ID_10, 18)]
    _UnitList..= [(aUNITGroupDataChapter06Ribaut.ID_09, 16)]
    _UnitList..= [(aUNITGroupDataChapter06Ribaut.ID_08, 14)]
    _UnitList..= [(aUNITGroupDataChapter06Ribaut.ID_07, 14)]
    _UnitList..= [(aUNITGroupDataChapter06Ribaut.ID_06, 12)]
    _UnitList..= [(aUNITGroupDataChapter06Ribaut.ID_05, 12)]
    _UnitList..= [(aUNITGroupDataChapter06Ribaut.ID_04, 10)]
    _UnitList..= [(aUNITGroupDataChapter06Ribaut.ID_03, 10)]
    _UnitList..= [(aUNITGroupDataChapter06Ribaut.ID_02, 18)]
    _UnitList..= [(aUNITGroupDataChapter06Ribaut.ID_01, None)]

    .for _Unit, _Time in _UnitList

      LOAD_UNIT_BY_GROUP UNITGroupChapter06Ribaut, _Unit, [26, 61], 4, MAP_SPRITE_RED
      WAIT_UNIT_SPRITE_DECOMPRESSED

      .if _Time != None

        PAUSE _Time
        YIELD

      .endif

    .endfor

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    PAUSE 20
    YIELD

    MAP_SCROLL [31, 20], 4
    YIELD

    DIALOGUE dialogueChapter06SchmidtSpawn2
    YIELD

    MAP_SCROLL [45, 27], 4
    YIELD

    DIALOGUE dialogueChapter06SchmidtSpawn3
    YIELD

    RUN_EVENT_CONDITION
      DEPLOY_UNIT_GROUP UNITGroupChapter06Ribaut

    END_EVENT
