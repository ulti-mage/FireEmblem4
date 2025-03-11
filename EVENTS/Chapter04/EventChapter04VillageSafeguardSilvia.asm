
  aEventChapter04VillageSafeguardSilvia ; 8E/9AD6

    PLAY_SFX_WORD $7FF7
    FILL_EVENT_UNIT_SLOT Silvia, EventUnitSlot1
    MAP_SCROLL_TO_EVENT_UNIT_SLOT_1 4
    YIELD

    DIALOGUE dialogueChapter04VillageSafeguardSilvia1
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $47
    YIELD

    RUN_ASM rlASMCSilviaDance
    YIELD

    DIALOGUE dialogueChapter04VillageSafeguardSilvia2
    YIELD

    RUN_ASM rlASMCSilviaDance
    YIELD

    DIALOGUE dialogueChapter04VillageSafeguardSilvia3
    YIELD

    RUN_ASM rlASMCSilviaDance
    YIELD

    DIALOGUE dialogueChapter04VillageSafeguardSilvia4
    YIELD

    RUN_ASM rlASMCSilviaDance
    YIELD

    PLAY_SFX_WORD $7FF7
    DIALOGUE dialogueChapter04VillageSafeguardSilvia5
    YIELD

    RUN_EVENT_CONDITION
      GIVE_UNIT_PID Silvia, PI_Safeguard

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT

  rlASMCSilviaDance ; 8E/9B2A

    .al
    .autsiz
    .databank ?

    jsl $9EEFF1
    jsl $829478
    rtl

    .databank 0
