
  aEventChapterFinalBelhallaSpawn ; B1/E2E5

    RUN_EVENT_CONDITION
      REGISTER_UNITGROUP_MAP_SPRITES UNITGroupChapterFinalBelhalla

    RUN_EVENT_CONDITION
      REGISTER_UNITGROUP_MAP_SPRITES UNITGroupChapterFinalVelthomer

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $83
    YIELD

    RUN_EVENT_CONDITION
      REMOVE_AREA_RESTRICTION 5

    MAP_SCROLL [35, 16], 4
    YIELD

    CASTLE_NAME dialogueCastleNameBelhalla, CASLTE_NAME_RED, 90
    YIELD

    FADE_OUT_BY_TIMER 2
    YIELD

    SET_FLAG_IF_IN_CHAPTER ChapterFinal, FlagChapterFinal_RemoveFriegeRampart

    RUN_EVENT_CONDITION
      UPDATE_LOCATION_AND_MAP_CHANGE_EVENTS

    _UnitList1 := [aUNITGroupDataChapterFinalBelhalla.ID_14]
    _UnitList1..= [aUNITGroupDataChapterFinalBelhalla.ID_15]
    _UnitList1..= [aUNITGroupDataChapterFinalBelhalla.ID_16]
    _UnitList1..= [aUNITGroupDataChapterFinalBelhalla.ID_17]
    _UnitList1..= [aUNITGroupDataChapterFinalBelhalla.ID_18]
    _UnitList1..= [aUNITGroupDataChapterFinalBelhalla.ID_19]
    _UnitList1..= [aUNITGroupDataChapterFinalBelhalla.ID_20]
    _UnitList1..= [aUNITGroupDataChapterFinalBelhalla.ID_21]
    _UnitList1..= [aUNITGroupDataChapterFinalBelhalla.ID_22]
    _UnitList1..= [aUNITGroupDataChapterFinalBelhalla.ID_23]
    _UnitList1..= [aUNITGroupDataChapterFinalBelhalla.ID_24]
    _UnitList1..= [aUNITGroupDataChapterFinalBelhalla.ID_25]
    _UnitList1..= [aUNITGroupDataChapterFinalBelhalla.ID_26]
    _UnitList1..= [aUNITGroupDataChapterFinalBelhalla.ID_27]
    _UnitList1..= [aUNITGroupDataChapterFinalBelhalla.ID_28]
    _UnitList1..= [aUNITGroupDataChapterFinalBelhalla.ID_29]

    .for _Unit in _UnitList1

      LOAD_UNIT_BY_GROUP_SILENT UNITGroupChapterFinalBelhalla, _Unit

    .endfor

    DIALOGUE_WITH_BG dialogueChapterFinalBelhallaSpawn1, DIALOGUE_BG_HALLWAY, 3, 2
    YIELD

    _UnitList2 := [(aUNITGroupDataChapterFinalBelhalla.ID_12, 8)]
    _UnitList2..= [(aUNITGroupDataChapterFinalBelhalla.ID_11, 8)]
    _UnitList2..= [(aUNITGroupDataChapterFinalBelhalla.ID_08, 8)]
    _UnitList2..= [(aUNITGroupDataChapterFinalBelhalla.ID_09, 8)]
    _UnitList2..= [(aUNITGroupDataChapterFinalBelhalla.ID_10, 8)]
    _UnitList2..= [(aUNITGroupDataChapterFinalBelhalla.ID_13, 8)]
    _UnitList2..= [(aUNITGroupDataChapterFinalBelhalla.ID_05, 8)]
    _UnitList2..= [(aUNITGroupDataChapterFinalBelhalla.ID_06, 8)]
    _UnitList2..= [(aUNITGroupDataChapterFinalBelhalla.ID_07, 4)]
    _UnitList2..= [(aUNITGroupDataChapterFinalBelhalla.ID_03, 4)]
    _UnitList2..= [(aUNITGroupDataChapterFinalBelhalla.ID_04, 4)]
    _UnitList2..= [(aUNITGroupDataChapterFinalBelhalla.ID_02, None)]

    .for _Unit, _Time in _UnitList2

      LOAD_UNIT_BY_GROUP UNITGroupChapterFinalBelhalla, _Unit, [42, 24], 4, MAP_SPRITE_RED
      WAIT_UNIT_SPRITE_DECOMPRESSED

      .if _Time != None

        PAUSE _Time
        YIELD

      .endif

    .endfor

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    LOAD_UNIT_BY_GROUP UNITGroupChapterFinalBelhalla, aUNITGroupDataChapterFinalBelhalla.ID_01, [42, 22], 5, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    RUN_EVENT_CONDITION
      DEPLOY_UNIT_GROUP UNITGroupChapterFinalBelhalla

    MAP_SCROLL [48, 0], 4
    YIELD

    PAUSE 30
    YIELD

    DIALOGUE_WITH_BG dialogueChapterFinalBelhallaSpawn2, DIALOGUE_BG_HALLWAY, 3, 1
    YIELD

    PAUSE 20
    YIELD

    LOAD_UNIT_BY_GROUP UNITGroupChapterFinalVelthomer, aUNITGroupDataChapterFinalVelthomer.ID_08, [61, 6], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    _UnitList3 := [aUNITGroupDataChapterFinalVelthomer.ID_06]
    _UnitList3..= [aUNITGroupDataChapterFinalVelthomer.ID_07]
    _UnitList3..= [aUNITGroupDataChapterFinalVelthomer.ID_05]
    _UnitList3..= [aUNITGroupDataChapterFinalVelthomer.ID_03]
    _UnitList3..= [aUNITGroupDataChapterFinalVelthomer.ID_04]
    _UnitList3..= [aUNITGroupDataChapterFinalVelthomer.ID_02]

    .for _Unit in _UnitList3

      LOAD_UNIT_BY_GROUP UNITGroupChapterFinalVelthomer, _Unit, [61, 6], 4, MAP_SPRITE_RED
      WAIT_UNIT_SPRITE_DECOMPRESSED

    .endfor

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    LOAD_UNIT_BY_GROUP UNITGroupChapterFinalVelthomer, aUNITGroupDataChapterFinalVelthomer.ID_01, [61, 4], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    RUN_EVENT_CONDITION
      DEPLOY_UNIT_GROUP UNITGroupChapterFinalVelthomer

    RUN_EVENT_CONDITION
      GIVE_UNIT_PID_FORCED Julia, PI_Circlet

    RUN_ASM rlASMCGiveJuliaLightIfNoWeapon

    END_EVENT
