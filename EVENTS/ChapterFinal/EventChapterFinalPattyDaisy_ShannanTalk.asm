
  aEventChapterFinalPattyDaisy_ShannanTalk ; 8F/FBCD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $6F
    YIELD

    DIALOGUE dialogueChapterFinalPattyDaisy_ShannanTalk
    YIELD

    RUN_ASM rlClearBattleData

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT Shannan, Speed, 3

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT Shannan, HP, 3

    FILL_EVENT_UNIT_SLOT Shannan, EventUnitSlot1
    RUN_ASM rlASMCStatUpDisplay
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
