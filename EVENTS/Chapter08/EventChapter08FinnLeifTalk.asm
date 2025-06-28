
  aEventChapter08FinnLeifTalk ; 8F/F56E

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $70
    YIELD

    DIALOGUE dialogueChapter08FinnLeifTalk
    YIELD

    RUN_ASM rlClearBattleData

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT Leif, Strength, 3

    FILL_EVENT_UNIT_SLOT Leif, EventUnitSlot1
    RUN_ASM rlASMCStatUpDisplay
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
