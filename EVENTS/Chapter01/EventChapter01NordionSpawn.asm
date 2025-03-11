
  aEventChapter01NordionSpawn ; 90/87C5

    RUN_EVENT_CONDITION
      REGISTER_UNITGROUP_MAP_SPRITES UNITGroupChapter01Nordion

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $55
    YIELD

    MAP_SCROLL [10, 0], 4
    YIELD

    PAUSE 20
    YIELD

    FADE_OUT_BY_TIMER 1
    YIELD

    RUN_EVENT_CONDITION
      macroSetFactionsEnemies [FS_Ch01Nordion, FS_Ch01Heirhein]

    RUN_EVENT_CONDITION
      macroSetFactionsAllies [FS_Player, FS_Ch01Nordion]

    RUN_EVENT_CONDITION
      UPDATE_LOCATION_AND_MAP_CHANGE_EVENTS

    DIALOGUE_WITH_BG dialogueChapter01NordionSpawn1, DIALOGUE_BG_THRONE, 3, 1
    YIELD

    PAUSE 20
    YIELD

    _UnitList := [(aUNITGroupDataChapter01Nordion.ID_08,20)]
    _UnitList..= [(aUNITGroupDataChapter01Nordion.ID_09,20)]
    _UnitList..= [(aUNITGroupDataChapter01Nordion.ID_07,20)]
    _UnitList..= [(aUNITGroupDataChapter01Nordion.ID_05,20)]
    _UnitList..= [(aUNITGroupDataChapter01Nordion.ID_06,20)]
    _UnitList..= [(aUNITGroupDataChapter01Nordion.ID_04,20)]
    _UnitList..= [(aUNITGroupDataChapter01Nordion.ID_02,20)]
    _UnitList..= [(aUNITGroupDataChapter01Nordion.ID_03,24)]

    .for _Unit, _Time in _UnitList

      LOAD_UNIT_BY_GROUP UNITGroupChapter01Nordion, _Unit, [14, 5], 4, MAP_SPRITE_GREEN
      WAIT_UNIT_SPRITE_DECOMPRESSED

      PAUSE _Time
      YIELD

    .endfor

    LOAD_UNIT_BY_GROUP UNITGroupChapter01Nordion, aUNITGroupDataChapter01Nordion.ID_01, [14, 5], 4, MAP_SPRITE_GREEN
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    DIALOGUE dialogueChapter01NordionSpawn2
    YIELD

    RUN_EVENT_CONDITION
      DEPLOY_UNIT_GROUP UNITGroupChapter01Nordion

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $1D
    YIELD

    END_EVENT
