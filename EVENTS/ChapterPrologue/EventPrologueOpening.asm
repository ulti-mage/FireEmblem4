
  aEventPrologueOpening ; B1/8000

    RUN_EVENT_CONDITION
      REGISTER_UNITGROUP_MAP_SPRITES UNITGroupPrologueStart

    RUN_EVENT_CONDITION
      REGISTER_CHARACTER_MAP_SPRITE Sigurd
    RUN_EVENT_CONDITION
      REGISTER_CHARACTER_MAP_SPRITE Naoise
    RUN_EVENT_CONDITION
      REGISTER_CHARACTER_MAP_SPRITE Alec

    SET_CAMERA_POSITION [26, 17]

    EVENT_3B $80

    PAUSE 2
    YIELD

    FADE_IN_BY_TIMER 4

    LOAD_UNIT_BY_GROUP UNITGroupPrologueStart, aUNITGroupDataPrologueStart.ID_24, [25, 22], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED
    LOAD_UNIT_BY_GROUP UNITGroupPrologueStart, aUNITGroupDataPrologueStart.ID_22, [25, 23], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED
    LOAD_UNIT_BY_GROUP UNITGroupPrologueStart, aUNITGroupDataPrologueStart.ID_23, [25, 23], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED
    LOAD_UNIT_BY_GROUP UNITGroupPrologueStart, aUNITGroupDataPrologueStart.ID_12, [24, 23], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    CASTLE_NAME dialogueCastleNameYngvi, CASLTE_NAME_GREEN, 150

    LOAD_UNIT_BY_GROUP UNITGroupPrologueStart, aUNITGroupDataPrologueStart.ID_18, [37, 14], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED
    LOAD_UNIT_BY_GROUP UNITGroupPrologueStart, aUNITGroupDataPrologueStart.ID_17, [36, 14], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED
    LOAD_UNIT_BY_GROUP UNITGroupPrologueStart, aUNITGroupDataPrologueStart.ID_19, [36, 14], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED
    LOAD_UNIT_BY_GROUP UNITGroupPrologueStart, aUNITGroupDataPrologueStart.ID_14, [24, 23], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED
    LOAD_UNIT_BY_GROUP UNITGroupPrologueStart, aUNITGroupDataPrologueStart.ID_16, [37, 14], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED
    LOAD_UNIT_BY_GROUP UNITGroupPrologueStart, aUNITGroupDataPrologueStart.ID_20, [36, 14], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED
    LOAD_UNIT_BY_GROUP UNITGroupPrologueStart, aUNITGroupDataPrologueStart.ID_15, [37, 14], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED
    LOAD_UNIT_BY_GROUP UNITGroupPrologueStart, aUNITGroupDataPrologueStart.ID_21, [25, 23], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED
    LOAD_UNIT_BY_GROUP UNITGroupPrologueStart, aUNITGroupDataPrologueStart.ID_25, [24, 23], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    PAUSE 25
    YIELD

    DIALOGUE_WITH_BG dialogueChapterPrologueOpening1, DIALOGUE_BG_THRONE, 3, 2
    YIELD

    PAUSE 20
    YIELD

    LOAD_UNIT_BY_GROUP UNITGroupPrologueStart, aUNITGroupDataPrologueStart.ID_27, [33, 23], 2, MAP_SPRITE_GREEN
    WAIT_UNIT_SPRITE_DECOMPRESSED

    LOAD_UNIT_BY_GROUP_SILENT UNITGroupPrologueStart, aUNITGroupDataPrologueStart.ID_06
    LOAD_UNIT_BY_GROUP_SILENT UNITGroupPrologueStart, aUNITGroupDataPrologueStart.ID_04
    LOAD_UNIT_BY_GROUP_SILENT UNITGroupPrologueStart, aUNITGroupDataPrologueStart.ID_28

    LOAD_UNIT_BY_GROUP UNITGroupPrologueStart, aUNITGroupDataPrologueStart.ID_07, [43, 19], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED
    LOAD_UNIT_BY_GROUP UNITGroupPrologueStart, aUNITGroupDataPrologueStart.ID_03, [43, 18], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    SCRIPTED_MAP_SCROLL _ScriptedMapScroll, 3
    YIELD

    LOAD_UNIT_BY_GROUP UNITGroupPrologueStart, aUNITGroupDataPrologueStart.ID_32, [47, 8], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED
    LOAD_UNIT_BY_GROUP UNITGroupPrologueStart, aUNITGroupDataPrologueStart.ID_02, [47, 14], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    CASTLE_NAME dialogueCastleNameChalphy, CASLTE_NAME_BLUE, 110
    YIELD

    DIALOGUE_WITH_BG dialogueChapterPrologueOpening2, DIALOGUE_BG_THRONE, 3, 1
    YIELD

    PAUSE 20
    YIELD

    LOAD_UNIT_DIRECT Sigurd, FS_Player, [60, 12], [60, 13], 4, MAP_SPRITE_BLUE
    WAIT_UNIT_SPRITE_DECOMPRESSED
    LOAD_UNIT_DIRECT Naoise, FS_Player, [60, 12], [59, 12], 4, MAP_SPRITE_BLUE
    WAIT_UNIT_SPRITE_DECOMPRESSED
    LOAD_UNIT_DIRECT Alec, FS_Player, [60, 12], [61, 12], 4, MAP_SPRITE_BLUE
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    PAUSE 8
    YIELD

    LOAD_UNIT_BY_GROUP UNITGroupPrologueStart, aUNITGroupDataPrologueStart.ID_26, [60, 10], 3, MAP_SPRITE_BLUE
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    JUMP _8157

    ; B1/8131

      EVENT_DUMMY

      FADE_OUT_BY_TIMER 1
      YIELD

      RUN_EVENT_CONDITION
        SET_UNIT_POSITION Sigurd, $FF, [60, 13]
      RUN_EVENT_CONDITION
        SET_UNIT_POSITION Naoise, $FF, [59, 12]
      RUN_EVENT_CONDITION
        SET_UNIT_POSITION Alec, $FF, [61, 12]

      RUN_EVENT_CONDITION
        DEPLOY_UNIT_GROUP UNITGroupPrologueStart

      SET_CAMERA_POSITION [48, 5]
      EVENT_3B 1
      YIELD

      JUMP _815A

    _8157
    RUN_EVENT_CONDITION
      DEPLOY_UNIT_GROUP UNITGroupPrologueStart

    _815A
    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    END_EVENT

    _ScriptedMapScroll ; B1/8163
      MAP_RIGHT_MULTIPLE 9
      MAP_UP_RIGHT_MULTIPLE 13
      MAP_END
