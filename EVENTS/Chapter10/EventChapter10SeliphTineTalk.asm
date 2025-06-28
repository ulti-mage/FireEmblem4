
  aEventChapter10SeliphTineTalk ; 8F/F912

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $7B
    YIELD

    DIALOGUE dialogueChapter10SeliphTineTalk
    YIELD

    RUN_ASM rlClearBattleData

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT Tine, Magic, 5

    FILL_EVENT_UNIT_SLOT Tine, EventUnitSlot1
    RUN_ASM rlASMCStatUpDisplay
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
