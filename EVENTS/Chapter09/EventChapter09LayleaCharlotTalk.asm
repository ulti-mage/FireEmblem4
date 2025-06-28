
  aEventChapter09LayleaCharlotTalk ; 8F/FDCC

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $48
    YIELD

    DIALOGUE dialogueChapter09LayleaCharlotTalk
    YIELD

    RUN_ASM rlClearBattleData

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT Charlot, Luck, 1

    FILL_EVENT_UNIT_SLOT Charlot, EventUnitSlot1
    RUN_ASM rlASMCStatUpDisplay
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
