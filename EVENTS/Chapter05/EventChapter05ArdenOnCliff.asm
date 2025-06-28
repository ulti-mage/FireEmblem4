
  aEventChapter05ArdenOnCliff ; 9D/CAD4

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $64
    YIELD

    DIALOGUE dialogueChapter05ArdenOnCliff
    YIELD

    RUN_ASM rlClearBattleData

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT Arden, Skill, 5

    FILL_EVENT_UNIT_SLOT Arden, EventUnitSlot1
    RUN_ASM rlASMCStatUpDisplay
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
