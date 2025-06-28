
  aEventChapter06CreidneIucharAdjacent ; 91/D580

    PLAY_SFX_WORD $7FF7
    DIALOGUE dialogueChapter06CreidneIucharAdjacent
    YIELD

    RUN_EVENT_CONDITION
      MODIFY_LOVE_POINTS Creidne, Iuchar, 50

    RUN_ASM rlClearBattleData

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT Creidne, Strength, 2

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT Creidne, Luck, 3

    PAUSE 15
    YIELD

    FILL_EVENT_UNIT_SLOT Creidne, EventUnitSlot1
    RUN_ASM rlASMCStatUpDisplay
    YIELD

    PLAY_SFX_WORD $00E8

    END_EVENT
