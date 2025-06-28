
  aEventChapter08JuliaSeliphTalk ; 8F/F4E9

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $54
    YIELD

    DIALOGUE dialogueChapter08JuliaSeliphTalk
    YIELD

    RUN_ASM rlClearBattleData

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT Seliph, Luck, 1

    FILL_EVENT_UNIT_SLOT Seliph, EventUnitSlot1
    RUN_ASM rlASMCStatUpDisplay
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
