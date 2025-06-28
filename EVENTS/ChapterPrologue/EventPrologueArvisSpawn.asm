
  aEventPrologueArvisSpawn ; B1/84A5

    RUN_EVENT_CONDITION
      REGISTER_CHARACTER_MAP_SPRITE ArvisChPrologue

    PLAY_SFX_WORD $00E1
    PAUSE 55
    YIELD

    PLAY_SONG $74
    YIELD

    MAP_SCROLL [24, 0], 4
    YIELD

    LOAD_UNIT_DIRECT ArvisChPrologue, FS_PrologueArvis, [30, 0], [32, 3], 4, MAP_SPRITE_GREEN, true, 1
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    DIALOGUE dialogueChapterPrologueArvisSpawn
    YIELD

    END_EVENT
