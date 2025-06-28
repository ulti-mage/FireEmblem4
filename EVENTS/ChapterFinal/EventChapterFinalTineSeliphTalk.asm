
  aEventChapterFinalTineSeliphTalk ; 8F/F93E

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $7B
    YIELD

    DIALOGUE dialogueChapterFinalTineSeliphTalk
    YIELD

    RUN_ASM rlClearBattleData

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT Seliph, Magic, 3

    FILL_EVENT_UNIT_SLOT Seliph, EventUnitSlot1
    RUN_ASM rlASMCStatUpDisplay
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
