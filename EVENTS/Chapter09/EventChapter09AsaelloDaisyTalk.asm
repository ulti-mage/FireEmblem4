
  aEventChapter09AsaelloDaisyTalk ; 8F/FD48

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $75
    YIELD

    DIALOGUE dialogueChapter09AsaelloDaisyTalk
    YIELD

    RUN_ASM rlClearBattleData

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT Daisy, Luck, 1

    FILL_EVENT_UNIT_SLOT Daisy, EventUnitSlot1
    RUN_ASM rlASMCStatUpDisplay
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
