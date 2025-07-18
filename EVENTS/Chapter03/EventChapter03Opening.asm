
  aEventChapter03Opening ; 9D/8703

    SET_CAMERA_POSITION [33, 24]
    EVENT_3B $80
    FADE_IN_BY_TIMER 3
    CASTLE_NAME dialogueCastleNameMadino, CASLTE_NAME_RED, 150
    YIELD

    DIALOGUE_WITH_BG dialogueChapter03Opening1, DIALOGUE_BG_HALLWAY, 3, 2
    YIELD

    PAUSE 20
    YIELD

    PLAY_SFX_WORD $00E3
    MAP_SCROLL [0, 36], 4
    YIELD

    PLAY_SONG $6B
    YIELD

    CASTLE_NAME dialogueCastleNameSylvale, CASLTE_NAME_YELLOW, 90
    YIELD

    DIALOGUE_WITH_BG dialogueChapter03Opening2, DIALOGUE_BG_HALLWAY, 3, 2
    YIELD

    PAUSE 20
    YIELD

    PLAY_SFX_WORD $00E4
    MAP_SCROLL [44, 0], 4
    YIELD

    PLAY_SONG $23
    YIELD

    CASTLE_NAME dialogueCastleNameOrgahil, CASLTE_NAME_RED, 90
    YIELD

    DIALOGUE_WITH_BG dialogueChapter03Opening3, DIALOGUE_BG_HALLWAY, 5, 2
    YIELD

    PAUSE 20
    YIELD

    DIALOGUE_WITH_BG dialogueChapter03Opening4, DIALOGUE_BG_GATE, 3, 3
    YIELD

    PAUSE 20
    YIELD

    PLAY_SFX_WORD $00E5
    MAP_SCROLL [28, 50], 4
    YIELD

    PLAY_SONG $6B
    YIELD

    CASTLE_NAME dialogueCastleNameAgusti, CASLTE_NAME_BLUE, 90
    YIELD

    DIALOGUE_WITH_BG dialogueChapter03Opening5, DIALOGUE_BG_HALLWAY, 3, 1
    YIELD

    JUMP _8790

      ; 9D/8782

      EVENT_DUMMY
      FADE_OUT_BY_TIMER 1
      YIELD

      SET_CAMERA_POSITION [28, 50]
      EVENT_3B 1
      YIELD
      JUMP _8790

    _8790
    RUN_EVENT_CONDITION
      SET_TALK_TARGET_IF_UNMARRIED Lex, Ayra

    RUN_EVENT_CONDITION
      SET_TALK_TARGET_IF_UNMARRIED Chulainn, Ayra

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    END_EVENT
