
  aEventChapter08AmidOnTree ; 8F/C0F6

    PLAY_SFX_WORD $7FF7
    DIALOGUE dialogueChapter08AmidOnTree
    YIELD

    RUN_ASM rlClearBattleData

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT Amid, Resistance, 3

    FILL_EVENT_UNIT_SLOT Amid, EventUnitSlot1
    RUN_ASM rlASMCStatUpDisplay
    YIELD

    PLAY_SFX_WORD $00E8

    END_EVENT
