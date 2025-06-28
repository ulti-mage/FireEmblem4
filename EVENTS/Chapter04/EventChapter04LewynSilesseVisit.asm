
  aEventChapter04LewynSilesseVisit ; 8E/998D

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $62
    YIELD

    RUN_EVENT_CONDITION
      GIVE_UNIT_PID_EQUIP Lewyn, PI_Forseti

    DIALOGUE_WITH_BG dialogueChapter04LewynSilesseVisit, DIALOGUE_BG_THRONE, 3, 2
    YIELD

    PAUSE 10
    YIELD

    FILL_EVENT_UNIT_SLOT Lewyn, EventUnitSlot1
    RUN_ASM rlASMCChapter04ForsetiObtainShine
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT

  rlASMCChapter04ForsetiObtainShine ; 8E/99BC

    .al
    .autsiz
    .databank ?

    jsl $9ED42A
    jsl $829478
    rtl

    .databank 0
