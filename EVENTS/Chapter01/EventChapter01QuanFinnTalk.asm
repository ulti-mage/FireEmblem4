
  aEventChapter01QuanFinnTalk ; B2/F884

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $70
    YIELD

    DIALOGUE dialogueChapter01QuanFinnTalk
    YIELD

    RUN_ASM rlClearBattleData

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT Finn, Strength, 1

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT Finn, Skill, 1

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT Finn, Defense, 1

    FILL_EVENT_UNIT_SLOT Finn, EventUnitSlot1
    RUN_ASM rlASMCStatUpDisplay
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
