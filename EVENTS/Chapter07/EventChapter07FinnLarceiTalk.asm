
  aEventChapter07FinnLarceiTalk ; 8F/F3A3

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $60
    YIELD

    DIALOGUE dialogueChapter07FinnLarceiTalk
    YIELD

    RUN_ASM rlClearBattleData

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT Larcei, Skill, 5

    FILL_EVENT_UNIT_SLOT Larcei, EventUnitSlot1
    RUN_ASM rlASMCStatUpDisplay
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
