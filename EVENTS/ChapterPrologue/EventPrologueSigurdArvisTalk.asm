
  aEventPrologueSigurdArvisTalk ; B1/85AD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $74
    YIELD

    RUN_EVENT_CONDITION
      GIVE_UNIT_PID Sigurd, PI_SilverSword1

    TEST_FLAG_IN_CHAPTER_SET ChapterPrologue, FlagPrologue_AzelleDied
    JUMP_TRUE _AzelleDead

      DIALOGUE dialogueChapterPrologueArvisSigurdTalkAzelleAlive
      YIELD
      JUMP _Continue

    _AzelleDead
    DIALOGUE dialogueChapterPrologueArvisSigurdTalkAzelleDead
    YIELD

    _Continue
    FILL_EVENT_UNIT_SLOT ArvisChPrologue, EventUnitSlot1
    MOVE_TEMPORARY_TO_COORDS ArvisChPrologue, [-1, -1], [29, 0], 4, EventUnitSlot1, MAP_SPRITE_GREEN, true
    WAIT_UNIT_SPRITE_DECOMPRESSED
    WAIT_UNIT_SPRITE_DECOMPRESSED

    RUN_EVENT_CONDITION
      REMOVE_UNIT ArvisChPrologue

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
