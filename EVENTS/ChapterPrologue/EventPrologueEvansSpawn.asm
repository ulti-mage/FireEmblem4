
  aEventPrologueEvansSpawn ; B1/83D5

    RUN_EVENT_CONDITION
      REGISTER_UNITGROUP_MAP_SPRITES UNITGroupPrologueEvans

    MAP_SCROLL [0, 7], 4
    YIELD

    PAUSE 16
    YIELD

    DIALOGUE dialogueChapterPrologueEvansSpawn
    YIELD

    PAUSE 10
    YIELD

    LOAD_UNIT_BY_GROUP UNITGroupPrologueEvans, aUNITGroupDataPrologueEvans.ID_14, [5, 15], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED
    PAUSE 10
    YIELD

    LOAD_UNIT_BY_GROUP UNITGroupPrologueEvans, aUNITGroupDataPrologueEvans.ID_11, [5, 15], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED
    PAUSE 10
    YIELD

    LOAD_UNIT_BY_GROUP UNITGroupPrologueEvans, aUNITGroupDataPrologueEvans.ID_09, [5, 15], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED
    PAUSE 10
    YIELD

    _UnitList := [aUNITGroupDataPrologueEvans.ID_12]
    _UnitList..= [aUNITGroupDataPrologueEvans.ID_10]
    _UnitList..= [aUNITGroupDataPrologueEvans.ID_08]
    _UnitList..= [aUNITGroupDataPrologueEvans.ID_13]
    _UnitList..= [aUNITGroupDataPrologueEvans.ID_03]
    _UnitList..= [aUNITGroupDataPrologueEvans.ID_06]
    _UnitList..= [aUNITGroupDataPrologueEvans.ID_01]
    _UnitList..= [aUNITGroupDataPrologueEvans.ID_02]
    _UnitList..= [aUNITGroupDataPrologueEvans.ID_04]
    _UnitList..= [aUNITGroupDataPrologueEvans.ID_05]
    _UnitList..= [aUNITGroupDataPrologueEvans.ID_07]

    .for _Unit in _UnitList

      LOAD_UNIT_BY_GROUP UNITGroupPrologueEvans, _Unit, [5, 15], 4, MAP_SPRITE_RED
      WAIT_UNIT_SPRITE_DECOMPRESSED

    .endfor

    PAUSE 15
    YIELD

    MOVE_TEMPORARY_BY_SCRIPT VerdaneArmy1, [5, 15], 4, MAP_SPRITE_RED, _BridgeGuyMovementScript
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    PAUSE 40
    YIELD

    UNSET_FLAG_IF_IN_CHAPTER ChapterPrologue, FlagPrologue_BridgeRaised
    SET_FLAG_IF_IN_CHAPTER ChapterPrologue, FlagPrologue_BridgeLowered

    RUN_EVENT_CONDITION
      UPDATE_LOCATION_AND_MAP_CHANGE_EVENTS

    PLAY_SFX_BYTE $6B
    PAUSE 50
    YIELD

    CONTINUE_FORM_MAP_SPRITE_HALT

    LOAD_UNIT_BY_GROUP_SILENT UNITGroupPrologueEvans, aUNITGroupDataPrologueEvans.ID_15

    RUN_EVENT_CONDITION
      DEPLOY_UNIT_GROUP UNITGroupPrologueEvans

    END_EVENT

    _BridgeGuyMovementScript ; B1/84A1
      MAP_RIGHT_MULTIPLE 6
      MAP_HALT
      MAP_END
