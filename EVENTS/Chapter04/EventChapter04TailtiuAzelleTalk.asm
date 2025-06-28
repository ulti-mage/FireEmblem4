
  aEventChapter04TailtiuAzelleTalk ; B0/CC6D

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $7B
    YIELD

    DIALOGUE dialogueChapter04TailtiuAzelleTalk
    YIELD

    RUN_EVENT_CONDITION
      MODIFY_LOVE_POINTS Tailtiu, Azelle, 100

    RUN_ASM rlClearBattleData

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT Tailtiu, HP, 5

    FILL_EVENT_UNIT_SLOT Tailtiu, EventUnitSlot1
    RUN_ASM rlASMCStatUpDisplay
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
