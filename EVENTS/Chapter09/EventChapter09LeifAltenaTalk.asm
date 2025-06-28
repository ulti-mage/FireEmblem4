
  aEventChapter09LeifAltenaTalk ; B1/D648

    RUN_EVENT_CONDITION
      REGISTER_UNITGROUP_MAP_SPRITES UNITGroupChapter09Travant

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $62
    YIELD

    DIALOGUE dialogueChapter09LeifAltenaTalk1
    YIELD

    FILL_EVENT_UNIT_SLOT Altena, EventUnitSlot1
    MOVE_TEMPORARY_TO_COORDS_FOLLOW Altena, [-1, -1], [52, 43], 4, EventUnitSlot1, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    RUN_EVENT_CONDITION
      SET_UNIT_IN_CASTLE Altena, Ch09_Thracia

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $81
    YIELD

    FADE_OUT_BY_TIMER 2
    YIELD

    _UnitList1 := [aUNITGroupDataChapter09Travant.ID_06]
    _UnitList1..= [aUNITGroupDataChapter09Travant.ID_07]
    _UnitList1..= [aUNITGroupDataChapter09Travant.ID_08]
    _UnitList1..= [aUNITGroupDataChapter09Travant.ID_09]
    _UnitList1..= [aUNITGroupDataChapter09Travant.ID_10]

    .for _Unit in _UnitList1

      LOAD_UNIT_BY_GROUP_SILENT UNITGroupChapter09Travant, _Unit

    .endfor

    DIALOGUE_WITH_BG dialogueChapter09LeifAltenaTalk2, DIALOGUE_BG_HALLWAY, 3, 2
    YIELD

    _UnitList2 := [(aUNITGroupDataChapter09Travant.ID_05, 18)]
    _UnitList2..= [(aUNITGroupDataChapter09Travant.ID_03, 18)]
    _UnitList2..= [(aUNITGroupDataChapter09Travant.ID_04, 18)]
    _UnitList2..= [(aUNITGroupDataChapter09Travant.ID_02, 28)]
    _UnitList2..= [(aUNITGroupDataChapter09Travant.ID_01, None)]

    .for _Unit, _Time in _UnitList2

      LOAD_UNIT_BY_GROUP UNITGroupChapter09Travant, _Unit, [52, 43], 4, MAP_SPRITE_RED
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

    RUN_EVENT_CONDITION
      DEPLOY_UNIT_GROUP UNITGroupChapter09Travant

    FILL_EVENT_UNIT_SLOT Leif, EventUnitSlot1
    MAP_SCROLL_TO_EVENT_UNIT_SLOT_1 4
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
