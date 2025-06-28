
  aEventChapter10SeliphLeneTalk ; 8F/F8BA

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $67
    YIELD

    DIALOGUE dialogueChapter10SeliphLeneTalk
    YIELD

    RUN_ASM rlClearBattleData

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT Lene, Defense, 5

    FILL_EVENT_UNIT_SLOT Lene, EventUnitSlot1
    RUN_ASM rlASMCStatUpDisplay
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
