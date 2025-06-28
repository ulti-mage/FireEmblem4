
  aEventChapter08LindaOnTree ; 8F/C0D7

    PLAY_SFX_WORD $7FF7
    DIALOGUE dialogueChapter08LindaOnTree
    YIELD

    RUN_ASM rlClearBattleData

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT Linda, Resistance, 3

    FILL_EVENT_UNIT_SLOT Linda, EventUnitSlot1
    RUN_ASM rlASMCStatUpDisplay
    YIELD

    PLAY_SFX_WORD $00E8

    END_EVENT
