
  aEventChapter10Opening ; 8D/863F

    RUN_EVENT_CONDITION
      REGISTER_UNITGROUP_MAP_SPRITES UNITGroupChapter10Opening1

    RUN_EVENT_CONDITION
      REGISTER_UNITGROUP_MAP_SPRITES UNITGroupChapter10Opening2

    SET_CAMERA_POSITION [28, 42]
    EVENT_3B $80

    _UnitList1 := [aUNITGroupDataChapter10Opening1.ID_22]
    _UnitList1..= [aUNITGroupDataChapter10Opening1.ID_23]
    _UnitList1..= [aUNITGroupDataChapter10Opening1.ID_24]
    _UnitList1..= [aUNITGroupDataChapter10Opening1.ID_25]
    _UnitList1..= [aUNITGroupDataChapter10Opening1.ID_01]
    _UnitList1..= [aUNITGroupDataChapter10Opening1.ID_02]
    _UnitList1..= [aUNITGroupDataChapter10Opening1.ID_03]
    _UnitList1..= [aUNITGroupDataChapter10Opening1.ID_04]
    _UnitList1..= [aUNITGroupDataChapter10Opening1.ID_05]
    _UnitList1..= [aUNITGroupDataChapter10Opening1.ID_06]
    _UnitList1..= [aUNITGroupDataChapter10Opening1.ID_07]
    _UnitList1..= [aUNITGroupDataChapter10Opening1.ID_08]
    _UnitList1..= [aUNITGroupDataChapter10Opening1.ID_09]
    _UnitList1..= [aUNITGroupDataChapter10Opening1.ID_10]
    _UnitList1..= [aUNITGroupDataChapter10Opening1.ID_11]
    _UnitList1..= [aUNITGroupDataChapter10Opening1.ID_12]
    _UnitList1..= [aUNITGroupDataChapter10Opening1.ID_13]
    _UnitList1..= [aUNITGroupDataChapter10Opening1.ID_14]
    _UnitList1..= [aUNITGroupDataChapter10Opening1.ID_15]
    _UnitList1..= [aUNITGroupDataChapter10Opening1.ID_20]
    _UnitList1..= [aUNITGroupDataChapter10Opening1.ID_17]
    _UnitList1..= [aUNITGroupDataChapter10Opening1.ID_19]
    _UnitList1..= [aUNITGroupDataChapter10Opening1.ID_18]

    .for _Unit in _UnitList1

      LOAD_UNIT_BY_GROUP_SILENT UNITGroupChapter10Opening1, _Unit

    .endfor

    FADE_IN_BY_TIMER 2
    YIELD

    LOAD_UNIT_BY_GROUP UNITGroupChapter10Opening1, aUNITGroupDataChapter10Opening1.ID_21, [36, 50], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    PAUSE 1
    YIELD

    LOAD_UNIT_BY_GROUP UNITGroupChapter10Opening1, aUNITGroupDataChapter10Opening1.ID_16, [36, 50], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    CASTLE_NAME dialogueCastleNameChronos, CASLTE_NAME_RED, 150
    YIELD

    DIALOGUE_WITH_BG dialogueChapter10Opening1, DIALOGUE_BG_HALLWAY, 3, 2
    SET_CAMERA_POSITION [31, 42]
    YIELD

    PAUSE 20
    YIELD

    MAP_SCROLL [31, 35], 2
    YIELD

    PAUSE 10
    YIELD

    DIALOGUE dialogueChapter10Opening2
    YIELD

    PAUSE 15
    YIELD

    MAP_SCROLL [0, 50], 4
    YIELD

    CASTLE_NAME dialogueCastleNameRados, CASLTE_NAME_RED, 100
    YIELD

    FADE_OUT_BY_TIMER 2
    YIELD

    _UnitList2 := [aUNITGroupDataChapter10Opening2.ID_15]
    _UnitList2..= [aUNITGroupDataChapter10Opening2.ID_14]
    _UnitList2..= [aUNITGroupDataChapter10Opening2.ID_13]
    _UnitList2..= [aUNITGroupDataChapter10Opening2.ID_12]
    _UnitList2..= [aUNITGroupDataChapter10Opening2.ID_11]

    .for _Unit in _UnitList2

      LOAD_UNIT_BY_GROUP_SILENT UNITGroupChapter10Opening2, _Unit

    .endfor

    DIALOGUE_WITH_BG dialogueChapter10Opening3, DIALOGUE_BG_HALLWAY, 3, 2
    YIELD

    _UnitList3 := [(aUNITGroupDataChapter10Opening2.ID_10, 25)]
    _UnitList3..= [(aUNITGroupDataChapter10Opening2.ID_08, 25)]
    _UnitList3..= [(aUNITGroupDataChapter10Opening2.ID_07, 25)]
    _UnitList3..= [(aUNITGroupDataChapter10Opening2.ID_09, 25)]
    _UnitList3..= [(aUNITGroupDataChapter10Opening2.ID_05, 25)]
    _UnitList3..= [(aUNITGroupDataChapter10Opening2.ID_04, 25)]
    _UnitList3..= [(aUNITGroupDataChapter10Opening2.ID_06, 25)]
    _UnitList3..= [(aUNITGroupDataChapter10Opening2.ID_02, 25)]
    _UnitList3..= [(aUNITGroupDataChapter10Opening2.ID_03, 25)]
    _UnitList3..= [(aUNITGroupDataChapter10Opening2.ID_01, None)]

    .for _Unit, _Time in _UnitList3

      LOAD_UNIT_BY_GROUP UNITGroupChapter10Opening2, _Unit, [5, 58], 4, MAP_SPRITE_RED
      WAIT_UNIT_SPRITE_DECOMPRESSED

      .if _Time != None

        PAUSE _Time
        YIELD

      .endif

    .endfor

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    _UnitList4 := [aUNITGroupDataChapter10Opening2.ID_18]
    _UnitList4..= [aUNITGroupDataChapter10Opening2.ID_19]
    _UnitList4..= [aUNITGroupDataChapter10Opening2.ID_17]

    .for _Unit in _UnitList4

      LOAD_UNIT_BY_GROUP UNITGroupChapter10Opening2, _Unit, [5, 58], 4, MAP_SPRITE_RED
      WAIT_UNIT_SPRITE_DECOMPRESSED

    .endfor

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    LOAD_UNIT_BY_GROUP UNITGroupChapter10Opening2, aUNITGroupDataChapter10Opening2.ID_16, [5, 56], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    PAUSE 20
    YIELD

    MAP_SCROLL [48, 27], 4
    YIELD

    CASTLE_NAME dialogueCastleNamePeruluke, CASLTE_NAME_BLUE, 100
    YIELD

    DIALOGUE_WITH_BG dialogueChapter10Opening4, DIALOGUE_BG_ALLEY, 5, 3
    YIELD

    PAUSE 35
    YIELD

    PLAY_SONG $6B
    YIELD

    PAUSE 25
    YIELD

    DIALOGUE_WITH_BG dialogueChapter10Opening5, DIALOGUE_BG_THRONE, 3, 3
    YIELD

    RUN_EVENT_CONDITION
      DEPLOY_UNIT_GROUP UNITGroupChapter10Opening1

    RUN_EVENT_CONDITION
      DEPLOY_UNIT_GROUP UNITGroupChapter10Opening2

    RUN_EVENT_CONDITION
      SET_TALK_TARGET Leif, Altena

    RUN_EVENT_CONDITION
      SET_TALK_TARGET Shannan, Seliph

    RUN_EVENT_CONDITION
      SET_TALK_TARGET_IF_UNMARRIED [Lester, Deimne], [Patty, Daisy]

    RUN_EVENT_CONDITION
      SET_TALK_TARGET_IF_UNMARRIED [Nanna, Jeanne], [Leif, Leif]

    RUN_EVENT_CONDITION
      SET_TALK_TARGET_IF_UNMARRIED [Febail, Asaello], [Lana, Muirne]

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    END_EVENT
