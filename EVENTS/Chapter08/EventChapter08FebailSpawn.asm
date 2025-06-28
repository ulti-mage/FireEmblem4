
  aEventChapter08FebailSpawn ; 8F/BA54

    PLAY_SONG $63
    YIELD

    MAP_SCROLL [41, 2], 4
    YIELD

    PAUSE 20
    YIELD

    DIALOGUE_WITH_BG dialogueChapter08FebailSpawn, DIALOGUE_BG_HALLWAY, 3, 2
    YIELD

    PAUSE 20
    YIELD

    LOAD_UNIT_BY_GROUP UNITGroupChapter08Febail, aUNITGroupDataChapter08Febail.ID_01, [49, 10], 4, MAP_SPRITE_BLUE
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    RUN_EVENT_CONDITION
      DEPLOY_UNIT_GROUP_CHILD UNITGroupChapter08Febail

      .byte PermanentFlagFebailExists
      .word [Asaello, Febail]

    RUN_EVENT_CONDITION
      SET_CHILD_TALK_TARGET [Febail, Asaello], [Seliph, Seliph]

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
