
  aEventChapter08NannaAresTalk ; 8F/F441

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $62
    YIELD

    DIALOGUE dialogueChapter08NannaAresTalk
    YIELD

    RUN_ASM rlClearBattleData

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT Nanna, Strength, 2

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT Nanna, Defense, 2

    FILL_EVENT_UNIT_SLOT Nanna, EventUnitSlot1
    RUN_ASM rlASMCStatUpDisplay
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
