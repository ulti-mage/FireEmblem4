
  aEventChapter08FeeCedTalk ; 8F/F415

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $56
    YIELD

    DIALOGUE dialogueChapter08FeeCedTalk
    YIELD

    RUN_ASM rlClearBattleData

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT Ced, Luck, 1

    FILL_EVENT_UNIT_SLOT Ced, EventUnitSlot1
    RUN_ASM rlASMCStatUpDisplay
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT


