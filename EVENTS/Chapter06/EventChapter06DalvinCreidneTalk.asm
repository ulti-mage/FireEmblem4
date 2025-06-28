
  aEventChapter06DalvinCreidneTalk ; 8F/F0B7

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $75
    YIELD

    DIALOGUE dialogueChapter06DalvinCreidneTalk
    YIELD

    RUN_ASM rlClearBattleData

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT Creidne, Luck, 1

    FILL_EVENT_UNIT_SLOT Creidne, EventUnitSlot1
    RUN_ASM rlASMCStatUpDisplay
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
