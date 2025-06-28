
  aEventChapterFinalMuirneAsaelloTalk ; 8F/FA2B

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $65
    YIELD

    DIALOGUE dialogueChapterFinalMuirneAsaelloTalk
    YIELD

    RUN_ASM rlClearBattleData

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT Asaello, HP, 5

    FILL_EVENT_UNIT_SLOT Asaello, EventUnitSlot1
    RUN_ASM rlASMCStatUpDisplay
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
