
  aEventChapter08MuirneSeliphAdjacent ; 8F/C0A4

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $5F
    YIELD

    DIALOGUE dialogueChapter08MuirneSeliphAdjacent
    YIELD

    RUN_EVENT_CONDITION
      MODIFY_LOVE_POINTS Muirne, Seliph, 100

    RUN_ASM rlClearBattleData

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT Muirne, Luck, 5

    FILL_EVENT_UNIT_SLOT Muirne, EventUnitSlot1
    RUN_ASM rlASMCStatUpDisplay
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
