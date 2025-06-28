
  aEventChapterFinalEnding ; B1/E58C

    RUN_EVENT_CONDITION
      SAVE_CHAPTER_TURNCOUNT

    PLAY_SFX_WORD $00E2
    PAUSE 10
    YIELD

    FADE_OUT_BY_TIMER 4
    YIELD

    RUN_EVENT_CONDITION
      DELETE_FACTIONS_AI FS_ChFinalThracia, 1

    RUN_EVENT_CONDITION
      DELETE_FACTIONS_AI FS_ChFinalVelthomer, 1

    SET_FLAG_IF_IN_CHAPTER ChapterFinal, FlagChapterFinal_RemoveBelhallaRampart

    RUN_EVENT_CONDITION
      UPDATE_LOCATION_AND_MAP_CHANGE_EVENTS

    RUN_ASM rlASMCSetUpEpilogue
    RUN_ASM rlASMCEpilogueHideSeliphWifeAndJulia

    PLAY_SONG $7E
    YIELD

    PAUSE 5
    YIELD

    DIALOGUE_WITH_BG dialogueEpilogue_Belhalla, DIALOGUE_BG_CLOISTER, 3, 3
    SET_CAMERA_POSITION [35, 17]
    YIELD

    PAUSE 40
    YIELD

    RUN_ASM rlASMCEpilogueIsaachEntrance
    JUMP_FALSE _NewThracia

      WAIT_UNTIL_MAP_SPRITES_HALTING
      YIELD

      PLAY_SFX_WORD $00E2
      PAUSE 15
      YIELD

      FADE_OUT_BY_TIMER 4
      YIELD

      PLAY_SONG $91
      YIELD

      PAUSE 10
      YIELD

      DIALOGUE_WITH_BG dialogueEpilogue_Isaach, DIALOGUE_BG_CLOISTER, 3, 3
      YIELD

      RUN_ASM rlASMCEpilogueIsaachExit
      WAIT_UNTIL_MAP_SPRITES_HALTING
      YIELD

    _NewThracia ; B1/E5EB
    RUN_ASM rlASMCEpilogueNewThraciaEntrance
    JUMP_FALSE _Agustria

      WAIT_UNTIL_MAP_SPRITES_HALTING
      YIELD

      PLAY_SFX_WORD $00E2
      PAUSE 15
      YIELD

      FADE_OUT_BY_TIMER 4
      YIELD

      PLAY_SONG $92
      YIELD

      PAUSE 10
      YIELD

      DIALOGUE_WITH_BG dialogueEpilogue_NewThracia, DIALOGUE_BG_CLOISTER, 3, 3
      YIELD

      RUN_ASM rlASMCEpilogueNewThraciaExit
      WAIT_UNTIL_MAP_SPRITES_HALTING
      YIELD

    _Agustria ; B1/E613
    RUN_ASM rlASMCEpilogueAgustriaEntrance
    JUMP_FALSE _Verdane

      WAIT_UNTIL_MAP_SPRITES_HALTING
      YIELD

      PLAY_SFX_WORD $00E2
      PAUSE 15
      YIELD

      FADE_OUT_BY_TIMER 4
      YIELD

      PLAY_SONG $55
      YIELD

      PAUSE 10
      YIELD

      DIALOGUE_WITH_BG dialogueEpilogue_Agustria, DIALOGUE_BG_CLOISTER, 3, 3
      YIELD

      RUN_ASM rlASMCEpilogueAgustriaExit
      WAIT_UNTIL_MAP_SPRITES_HALTING
      YIELD

    _Verdane ; B1/E63B
    RUN_ASM rlASMCEpilogueVerdaneEntrance
    JUMP_FALSE _Yngvi

      WAIT_UNTIL_MAP_SPRITES_HALTING
      YIELD

      PLAY_SFX_WORD $00E2
      PAUSE 15
      YIELD

      FADE_OUT_BY_TIMER 4
      YIELD

      PLAY_SONG $93
      YIELD

      PAUSE 10
      YIELD

      DIALOGUE_WITH_BG dialogueEpilogue_Verdane, DIALOGUE_BG_CLOISTER, 3, 3
      YIELD

      RUN_ASM rlASMCEpilogueVerdaneExit
      WAIT_UNTIL_MAP_SPRITES_HALTING
      YIELD

    _Yngvi ; B1/E663
    RUN_ASM rlASMCEpilogueYngviEntrance
    JUMP_FALSE _Friege

      WAIT_UNTIL_MAP_SPRITES_HALTING
      YIELD

      PLAY_SFX_WORD $00E2
      PAUSE 15
      YIELD

      FADE_OUT_BY_TIMER 4
      YIELD

      PLAY_SONG $94
      YIELD

      PAUSE 10
      YIELD

      DIALOGUE_WITH_BG dialogueEpilogue_Yngvi, DIALOGUE_BG_CLOISTER, 3, 3
      YIELD

      RUN_ASM rlASMCEpilogueYngviExit
      WAIT_UNTIL_MAP_SPRITES_HALTING
      YIELD

    _Friege ; B1/E68B
    RUN_ASM rlASMCEpilogueFriegeEntrance
    JUMP_FALSE _Dozel

      WAIT_UNTIL_MAP_SPRITES_HALTING
      YIELD

      PLAY_SFX_WORD $00E2
      PAUSE 15
      YIELD

      FADE_OUT_BY_TIMER 4
      YIELD

      PLAY_SONG $95
      YIELD

      PAUSE 10
      YIELD

      DIALOGUE_WITH_BG dialogueEpilogue_Friege, DIALOGUE_BG_CLOISTER, 3, 3
      YIELD

      RUN_ASM rlASMCEpilogueFriegeExit
      WAIT_UNTIL_MAP_SPRITES_HALTING
      YIELD

    _Dozel ; B1/E6B3
    RUN_ASM rlASMCEpilogueDozelEntrance
    JUMP_FALSE _Edda

      WAIT_UNTIL_MAP_SPRITES_HALTING
      YIELD

      PLAY_SFX_WORD $00E2
      PAUSE 15
      YIELD

      FADE_OUT_BY_TIMER 4
      YIELD

      PLAY_SONG $96
      YIELD

      PAUSE 10
      YIELD

      DIALOGUE_WITH_BG dialogueEpilogue_Dozel, DIALOGUE_BG_CLOISTER, 3, 3
      YIELD

      RUN_ASM rlASMCEpilogueDozelExit
      WAIT_UNTIL_MAP_SPRITES_HALTING
      YIELD

    _Edda ; B1/E6DB
    RUN_ASM rlASMCEpilogueEddaEntrance
    JUMP_FALSE _Velthomer

      WAIT_UNTIL_MAP_SPRITES_HALTING
      YIELD

      PLAY_SFX_WORD $00E2
      PAUSE 15
      YIELD

      FADE_OUT_BY_TIMER 4
      YIELD

      PLAY_SONG $97
      YIELD

      PAUSE 10
      YIELD

      DIALOGUE_WITH_BG dialogueEpilogue_Edda, DIALOGUE_BG_CLOISTER, 3, 3
      YIELD

      RUN_ASM rlASMCEpilogueEddaExit
      WAIT_UNTIL_MAP_SPRITES_HALTING
      YIELD

    _Velthomer ; B1/E703
    RUN_ASM rlASMCEpilogueVelthomerEntrance
    JUMP_FALSE _Chalphy

      WAIT_UNTIL_MAP_SPRITES_HALTING
      YIELD

      PLAY_SFX_WORD $00E2
      PAUSE 15
      YIELD

      FADE_OUT_BY_TIMER 4
      YIELD

      PLAY_SONG $98
      YIELD

      PAUSE 10
      YIELD

      DIALOGUE_WITH_BG dialogueEpilogue_Velthomer, DIALOGUE_BG_CLOISTER, 3, 3
      YIELD

      RUN_ASM rlASMCEpilogueVelthomerExit
      WAIT_UNTIL_MAP_SPRITES_HALTING
      YIELD

    _Chalphy ; B1/E72B
    RUN_ASM rlASMCEpilogueChalphyEntrance
    JUMP_FALSE _Silesse

      WAIT_UNTIL_MAP_SPRITES_HALTING
      YIELD

      PLAY_SFX_WORD $00E2
      PAUSE 15
      YIELD

      FADE_OUT_BY_TIMER 4
      YIELD

      PLAY_SONG $99
      YIELD

      PAUSE 10
      YIELD

      DIALOGUE_WITH_BG dialogueEpilogue_Chalphy, DIALOGUE_BG_CLOISTER, 3, 3
      YIELD

      RUN_ASM rlASMCEpilogueChalphyExit
      WAIT_UNTIL_MAP_SPRITES_HALTING
      YIELD

    _Silesse ; B1/E753
    RUN_ASM rlASMCEpilogueSilesseEntrance
    JUMP_FALSE _End

      WAIT_UNTIL_MAP_SPRITES_HALTING
      YIELD

      PLAY_SFX_WORD $00E2
      PAUSE 15
      YIELD

      FADE_OUT_BY_TIMER 4
      YIELD

      PLAY_SONG $56
      YIELD

      PAUSE 10
      YIELD

      DIALOGUE_WITH_BG dialogueEpilogue_Silesse, DIALOGUE_BG_CLOISTER, 3, 3
      YIELD

      RUN_ASM rlASMCEpilogueSilesseExit
      WAIT_UNTIL_MAP_SPRITES_HALTING
      YIELD

    _End ; B1/E77B
    PLAY_SFX_WORD $00E2
    PAUSE 15
    YIELD

    FADE_OUT_BY_TIMER 4
    YIELD

    PLAY_SONG $9A
    YIELD

    PAUSE 10
    YIELD

    DIALOGUE_WITH_BG dialogueEpilogue_Ending, DIALOGUE_BG_CLOISTER, 5, 4
    YIELD

    RUN_EVENT_CONDITION
      REMOVE_CHAPTER_STRUCT ChapterFinal

    PAUSE 20
    YIELD

    RUN_ASM rlASMCUnknownB1E7A1

    END_EVENT

  rlASMCUnknownB1E7A1 ; B1/E7A1

    .al
    .autsiz
    .databank ?

    jsl $8DA288
    rtl

    .databank 0
