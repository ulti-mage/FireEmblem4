
  aEventChapter10CoirpreCharlot_AltenaTalk ; 8F/F791

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $81
    YIELD

    DIALOGUE dialogueChapter10CoirpreCharlot_AltenaTalk
    YIELD

    RUN_ASM rlClearBattleData

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT Altena, Resistance, 5

    FILL_EVENT_UNIT_SLOT Altena, EventUnitSlot1
    RUN_ASM rlASMCStatUpDisplay
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
