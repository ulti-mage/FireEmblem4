
  aEventChapter05SigurdByronTalk ; 9D/C0C8

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $62
    YIELD

    RUN_EVENT_CONDITION
      GIVE_UNIT_PID_EQUIP Sigurd, PI_Tyrfing

    DIALOGUE dialogueChapter05SigurdByronTalk
    YIELD

    FACTION_UNIT_DEATH FS_Ch05Byron
    YIELD

    RUN_EVENT_CONDITION
      REMOVE_UNIT Byron

    FILL_EVENT_UNIT_SLOT Sigurd, EventUnitSlot1
    RUN_ASM rlASMCTyrfingObtainShine
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT

  rlASMCTyrfingObtainShine ; 9D/C0FA

    .al
    .autsiz
    .databank ?

    jsl $9ED42A
    jsl $829478
    rtl

    .databank 0
