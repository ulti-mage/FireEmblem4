
  aEventChapterFinalOpening ; B1/DD63

    RUN_EVENT_CONDITION
      REGISTER_UNITGROUP_MAP_SPRITES UNITGroupChapterFinalOpening

    SET_CAMERA_POSITION [48, 0]
    EVENT_3B $80

    PAUSE 2
    YIELD

    PLAY_SONG $83
    YIELD

    _UnitList1 := [aUNITGroupDataChapterFinalOpening.ID_40]
    _UnitList1..= [aUNITGroupDataChapterFinalOpening.ID_41]
    _UnitList1..= [aUNITGroupDataChapterFinalOpening.ID_42]
    _UnitList1..= [aUNITGroupDataChapterFinalOpening.ID_43]
    _UnitList1..= [aUNITGroupDataChapterFinalOpening.ID_44]
    _UnitList1..= [aUNITGroupDataChapterFinalOpening.ID_45]
    _UnitList1..= [aUNITGroupDataChapterFinalOpening.ID_46]
    _UnitList1..= [aUNITGroupDataChapterFinalOpening.ID_47]

    .for _Unit in _UnitList1

      LOAD_UNIT_BY_GROUP_SILENT UNITGroupChapterFinalOpening, _Unit

    .endfor

    FADE_IN_BY_TIMER 5
    CASTLE_NAME dialogueCastleNameVelthomer, CASLTE_NAME_RED, 150
    YIELD

    DIALOGUE_WITH_BG dialogueChapterFinalOpening1, DIALOGUE_BG_HALLWAY, 3, 2
    YIELD

    PAUSE 15
    YIELD

    RUN_ASM rlASMCUnknownB1DF12
    YIELD

    PAUSE 15
    YIELD

    MAP_SCROLL [48, 36], 4
    YIELD

    CASTLE_NAME $8D910A, CASLTE_NAME_RED, 100
    YIELD

    FADE_OUT_BY_TIMER 2
    YIELD

    _UnitList2 := [aUNITGroupDataChapterFinalOpening.ID_01]
    _UnitList2..= [aUNITGroupDataChapterFinalOpening.ID_02]
    _UnitList2..= [aUNITGroupDataChapterFinalOpening.ID_03]
    _UnitList2..= [aUNITGroupDataChapterFinalOpening.ID_04]
    _UnitList2..= [aUNITGroupDataChapterFinalOpening.ID_05]
    _UnitList2..= [aUNITGroupDataChapterFinalOpening.ID_06]
    _UnitList2..= [aUNITGroupDataChapterFinalOpening.ID_07]
    _UnitList2..= [aUNITGroupDataChapterFinalOpening.ID_08]
    _UnitList2..= [aUNITGroupDataChapterFinalOpening.ID_09]
    _UnitList2..= [aUNITGroupDataChapterFinalOpening.ID_10]
    _UnitList2..= [aUNITGroupDataChapterFinalOpening.ID_11]
    _UnitList2..= [aUNITGroupDataChapterFinalOpening.ID_12]
    _UnitList2..= [aUNITGroupDataChapterFinalOpening.ID_36]
    _UnitList2..= [aUNITGroupDataChapterFinalOpening.ID_30]
    _UnitList2..= [aUNITGroupDataChapterFinalOpening.ID_20]
    _UnitList2..= [aUNITGroupDataChapterFinalOpening.ID_18]
    _UnitList2..= [aUNITGroupDataChapterFinalOpening.ID_17]
    _UnitList2..= [aUNITGroupDataChapterFinalOpening.ID_19]
    _UnitList2..= [aUNITGroupDataChapterFinalOpening.ID_29]
    _UnitList2..= [aUNITGroupDataChapterFinalOpening.ID_35]

    .for _Unit in _UnitList2

      LOAD_UNIT_BY_GROUP_SILENT UNITGroupChapterFinalOpening, _Unit

    .endfor

    DIALOGUE_WITH_BG dialogueChapterFinalOpening2, DIALOGUE_BG_HALLWAY, 5, 2
    YIELD

    EVENT_3B $80

    PAUSE 2
    YIELD

    LOAD_UNIT_BY_GROUP UNITGroupChapterFinalOpening, aUNITGroupDataChapterFinalOpening.ID_16, [60, 45], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    FADE_IN_BY_TIMER 2

    _UnitList3 := [aUNITGroupDataChapterFinalOpening.ID_15]
    _UnitList3..= [aUNITGroupDataChapterFinalOpening.ID_14]
    _UnitList3..= [aUNITGroupDataChapterFinalOpening.ID_13]
    _UnitList3..= [aUNITGroupDataChapterFinalOpening.ID_34]
    _UnitList3..= [aUNITGroupDataChapterFinalOpening.ID_28]
    _UnitList3..= [aUNITGroupDataChapterFinalOpening.ID_33]
    _UnitList3..= [aUNITGroupDataChapterFinalOpening.ID_27]
    _UnitList3..= [aUNITGroupDataChapterFinalOpening.ID_32]
    _UnitList3..= [aUNITGroupDataChapterFinalOpening.ID_31]
    _UnitList3..= [aUNITGroupDataChapterFinalOpening.ID_26]
    _UnitList3..= [aUNITGroupDataChapterFinalOpening.ID_25]
    _UnitList3..= [aUNITGroupDataChapterFinalOpening.ID_38]
    _UnitList3..= [aUNITGroupDataChapterFinalOpening.ID_37]
    _UnitList3..= [aUNITGroupDataChapterFinalOpening.ID_22]
    _UnitList3..= [aUNITGroupDataChapterFinalOpening.ID_23]
    _UnitList3..= [aUNITGroupDataChapterFinalOpening.ID_24]
    _UnitList3..= [aUNITGroupDataChapterFinalOpening.ID_21]

    .for _Unit in _UnitList3

      LOAD_UNIT_BY_GROUP UNITGroupChapterFinalOpening, _Unit, [60, 45], 4, MAP_SPRITE_RED
      WAIT_UNIT_SPRITE_DECOMPRESSED

    .endfor

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    LOAD_UNIT_BY_GROUP UNITGroupChapterFinalOpening, aUNITGroupDataChapterFinalOpening.ID_39, [60, 43], 4, MAP_SPRITE_RED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    PAUSE 25
    YIELD

    PLAY_SFX_WORD $00E3
    MAP_SCROLL [26, 50], 4
    YIELD

    PLAY_SONG $82
    YIELD

    CASTLE_NAME dialogueCastleNameChalphy, CASLTE_NAME_BLUE, 120
    YIELD

    DIALOGUE_WITH_BG dialogueChapterFinalOpening3, DIALOGUE_BG_THRONE, 3, 2
    YIELD

    JUMP _DF00

      EVENT_DUMMY
      FADE_OUT_BY_TIMER 1
      YIELD

      RUN_EVENT_CONDITION
        DEPLOY_UNIT_GROUP UNITGroupChapterFinalOpening

      SET_CAMERA_POSITION [26, 50]
      EVENT_3B $01
      YIELD

      JUMP +

    _DF00
    RUN_EVENT_CONDITION
      DEPLOY_UNIT_GROUP UNITGroupChapterFinalOpening

    +
    RUN_EVENT_CONDITION
      SET_TALK_TARGET_IF_UNMARRIED [Arthur, Amid], [Tine, Linda]

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    END_EVENT

  rlASMCUnknownB1DF12 ; B1/DF12

    .al
    .autsiz
    .databank ?

    lda #1
    sta $7F4562
    lda #$0047
    sta $7E4EAF
    lda #$FFFF
    sta $7E4EBD
    lda #$003D
    sta $7E4EAB
    lda #6
    sta $7E4EAD
    jsl $9EF1D9
    jsl rlCreateProcHaltEvent
    rtl

    .databank 0
