
  aEventChapter08Village3Asaello ; 8F/C061

    PLAY_SFX_WORD $7FF7
    DIALOGUE dialogueChapter08Village3Asaello
    YIELD

    RUN_ASM rlClearBattleData

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT Asaello, Strength, 3

    FILL_EVENT_UNIT_SLOT Asaello, EventUnitSlot1
    RUN_ASM rlASMCStatUpDisplay
    YIELD

    PLAY_SFX_WORD $00E8
    END_EVENT
