
  aEventChapterFinalJuliaVelthomerVisit ; B1/E558

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $06
    YIELD

    RUN_EVENT_CONDITION
      GIVE_UNIT_PID_EQUIP Julia, PI_Naga

    DIALOGUE_WITH_BG dialogueChapterFinalJuliaVelthomerVisit, DIALOGUE_BG_HALLWAY, 3, 3
    YIELD

    PLAY_SFX_WORD $00E7
    PAUSE 15
    YIELD

    FILL_EVENT_UNIT_SLOT Julia, EventUnitSlot1
    RUN_ASM rlASMCChapterFinalNagaObtainShine
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT

  rlASMCChapterFinalNagaObtainShine ; B1/E583

    .al
    .autsiz
    .databank ?

    jsl $9ED42A
    jsl rlCreateProcHaltEvent
    rtl

    .databank 0
