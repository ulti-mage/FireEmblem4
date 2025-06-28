
  aEventChapter07DaisyShannanAdjacent ; B2/9159

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $6F
    YIELD

    DIALOGUE dialogueChapter07DaisyShannanAdjacent
    YIELD

    RUN_ASM rlClearBattleData

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT Daisy, Skill, 3

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT Daisy, Speed, 3

    FILL_EVENT_UNIT_SLOT Daisy, EventUnitSlot1
    RUN_ASM rlASMCStatUpDisplay
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
