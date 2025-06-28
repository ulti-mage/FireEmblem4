
  aEventChapter03SylvaleSeized ; 9D/8C52

    TEST_FLAG_IN_CHAPTER_SET Chapter03, FlagChapter03_ThraciaSpawn
    JUMP_FALSE _NoThraciaSpawn

      TEST_FLAG_IN_CHAPTER_SET Chapter03, FlagChapter03_TravantLeave
      JUMP_TRUE _Continue

        ; Eldigan died + Chagall alive + Papilio alive

        PLAY_SFX_WORD $00E0
        PAUSE 35
        YIELD

        PLAY_SONG $28
        YIELD

        MAP_SCROLL [1, 36], 3
        YIELD

        PAUSE 20
        YIELD

        MOVE_TEMPORARY_BY_SCRIPT TravantCh09, [7, 43], 4, MAP_SPRITE_RED, _ScriptedMovementTravant1
        WAIT_UNIT_SPRITE_DECOMPRESSED

        WAIT_UNTIL_MAP_SPRITES_HALTING
        YIELD

        DIALOGUE dialogueChapter03TravantLeave
        YIELD

        PAUSE 20
        YIELD

        CONTINUE_FORM_MAP_SPRITE_HALT
        WAIT_UNTIL_MAP_SPRITES_HALTING
        YIELD

      _Continue
      ; Default if: Eldigan died + Chagall alive + Papilio died (and Travant already left as a result)
      FILL_EVENT_UNIT_SLOT Sigurd, EventUnitSlot1
      SET_CAMERA_TO_EVENT_UNIT_SLOT_1
      PLAY_SFX_WORD $00E0
      PAUSE 35
      YIELD

      PLAY_SONG $77
      YIELD

      DIALOGUE_WITH_BG dialogueChapter03SylvaleSeized, DIALOGUE_BG_HALLWAY, 3, 2
      YIELD

      RUN_EVENT_CONDITION
        SET_TALK_TARGET Ethlyn, Quan

      PLAY_SFX_WORD $00E0
      PAUSE 35
      YIELD

      RESTORE_PHASE_MUSIC
      YIELD

      END_EVENT

    _NoThraciaSpawn ; 9D/8CB0
    ; Eldigan alive OR Chagall died before Eldigan
    MOVE_TEMPORARY_BY_SCRIPT TravantCh09, [7, 43], 5, MAP_SPRITE_RED, _ScriptedMovementTravant2, true
    WAIT_UNIT_SPRITE_DECOMPRESSED

    WAIT_UNTIL_MAP_SPRITES_HALTING
    YIELD

    PAUSE 40
    YIELD

    FILL_EVENT_UNIT_SLOT Sigurd, EventUnitSlot1
    MAP_SCROLL_TO_EVENT_UNIT_SLOT_1 3
    YIELD
    JUMP _Continue

    _ScriptedMovementTravant1 ; 9D/8CCB
      MAP_FACE_DOWN
      MAP_HALT

      MAP_DOWN_MULTIPLE 10
      MAP_END

    _ScriptedMovementTravant2 ; 9D/8CD0
      MAP_FACE_DOWN
      MAP_PAUSE 15
      MAP_DOWN_MULTIPLE 12
      MAP_END
