
  aEventChapter03EthlynQuanTalk ; B0/CC03

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $70
    YIELD

    DIALOGUE dialogueChapter03EthlynQuanTalk
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    RUN_EVENT_CONDITION
      GIVE_UNIT_PID_EQUIP Quan, PI_GaeBolg

    FILL_EVENT_UNIT_SLOT Quan, EventUnitSlot1
    RUN_ASM $B0CFDE
    YIELD

    END_EVENT
