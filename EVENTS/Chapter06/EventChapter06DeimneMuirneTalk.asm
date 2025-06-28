
  aEventChapter06DeimneMuirneTalk ; 8F/F08B

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $60
    YIELD

    DIALOGUE dialogueChapter06DeimneMuirneTalk
    YIELD

    RUN_ASM rlClearBattleData

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT Muirne, Luck, 1

    FILL_EVENT_UNIT_SLOT Muirne, EventUnitSlot1
    RUN_ASM rlASMCStatUpDisplay
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
