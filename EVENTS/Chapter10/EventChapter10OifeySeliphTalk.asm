
  aEventChapter10OifeySeliphTalk ; 8F/F765

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $68
    YIELD

    DIALOGUE dialogueChapter10OifeySeliphTalk
    YIELD

    RUN_ASM rlClearBattleData

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT Oifey, HP, 3

    FILL_EVENT_UNIT_SLOT Oifey, EventUnitSlot1
    RUN_ASM rlASMCStatUpDisplay
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
