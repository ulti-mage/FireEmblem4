
  aEventChapter02BeowulfLachesisTalk ; B2/F9FB

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $60
    YIELD

    DIALOGUE dialogueChapter02BeowulfLachesisTalk
    YIELD

    RUN_EVENT_CONDITION
      MODIFY_LOVE_POINTS Lachesis, Beowulf, 100

    RUN_ASM rlClearBattleData

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT Lachesis, Strength, 2

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT Lachesis, Skill, 2

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT Lachesis, Defense, 1

    FILL_EVENT_UNIT_SLOT Lachesis, EventUnitSlot1
    RUN_ASM $91BD94
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
