
  aEventChapter09LutheciaSeized ; B1/D7F7

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $77
    YIELD

    TEST_FLAG_IN_CHAPTER_SET Chapter09, FlagChapter09_KapathogiaSeizedCheck
    JUMP_TRUE _NoCoirpre

      TEST_FLAG_IN_CHAPTER_SET 9, FlagChapter09_HannibalDiedCheck
      JUMP_TRUE _NoCoirpre

        TEST_PERMANENT_FLAG_SET PermanentFlagCoirpreExists
        JUMP_TRUE +

          RUN_EVENT_CONDITION
            REGISTER_CHARACTER_MAP_SPRITE Charlot

          JUMP ++

          +
          RUN_EVENT_CONDITION
            REGISTER_CHARACTER_MAP_SPRITE Coirpre

        +
        DIALOGUE_WITH_BG dialogueChapter09LutheciaSeized, DIALOGUE_BG_HALLWAY, 3, 2
        YIELD

        TEST_PERMANENT_FLAG_SET PermanentFlagCoirpreExists
        JUMP_TRUE +

          LOAD_UNIT_DIRECT Charlot, FS_Player, [10, 29], [10, 29], 4, MAP_SPRITE_BLUE
          WAIT_UNIT_SPRITE_DECOMPRESSED

          JUMP ++

          +
          LOAD_UNIT_DIRECT Coirpre, FS_Player, [10, 29], [10, 29], 4, MAP_SPRITE_BLUE
          WAIT_UNIT_SPRITE_DECOMPRESSED

        +
        WAIT_UNIT_SPRITE_DECOMPRESSED

        WAIT_UNTIL_MAP_SPRITES_HALTING
        YIELD

        RUN_EVENT_CONDITION
          SET_TALK_TARGET_IF_UNMARRIED [Patty, Daisy], [Coirpre, Charlot]

        JUMP +

    _NoCoirpre ; B1/D851
    DIALOGUE_WITH_BG dialogueChapter09LutheciaSeizedNoCoirpre, DIALOGUE_BG_HALLWAY, 3, 2
    YIELD

    +
    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
