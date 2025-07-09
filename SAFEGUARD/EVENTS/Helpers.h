
  EventUnitSlot1 = 1
  EventUnitSlot2 = 2

  FlagAlways = $FF

  AnyFactionSlot  = -1
  AnyCharacter    = -1
  AnyLocation     = -1
  AnyTurn         = -1
  AnyAI           = -1


  DIALOGUE_BG_FOUNTAIN  = 0
  DIALOGUE_BG_GATE      = 1
  DIALOGUE_BG_ALLEY     = 2
  DIALOGUE_BG_THRONE    = 3
  DIALOGUE_BG_HALLWAY   = 4
  DIALOGUE_BG_CLOISTER  = 5


  ; for SET_FACTION_HOSTILITY

  HOSTILITY_ENEMIES = 1
  HOSTILITY_ALLIES  = 2
  HOSTILITY_NEUTRAL = 3

  ; for CASTLE_NAME

  CASLTE_NAME_BLUE   = 0
  CASLTE_NAME_RED    = 1
  CASLTE_NAME_GREEN  = 2
  CASLTE_NAME_YELLOW = 3

  ; Unit loading

  MAP_SPRITE_BLUE   = 2
  MAP_SPRITE_RED    = 4
  MAP_SPRITE_GREEN  = 6
  MAP_SPRITE_YELLOW = 8

  ; For unit movement and map scrolling
  ; Maps only support directions, speed and end

  MAP_LEFT .segment
    .byte 1
  .endsegment

  MAP_RIGHT .segment
    .byte 2
  .endsegment

  MAP_UP .segment
    .byte 3
  .endsegment

  MAP_DOWN .segment
    .byte 4
  .endsegment

  MAP_UP_LEFT .segment
    .byte 5
  .endsegment

  MAP_DOWN_LEFT .segment
    .byte 6
  .endsegment

  MAP_UP_RIGHT .segment
    .byte 7
  .endsegment

  MAP_DOWN_RIGHT .segment
    .byte 8
  .endsegment

  MAP_LEFT_MULTIPLE .segment Count 
    .byte 1 + 9 ; $0A
    .byte \Count
  .endsegment

  MAP_RIGHT_MULTIPLE .segment Count
    .byte 2 + 9 ; $0B
    .byte \Count
  .endsegment

  MAP_UP_MULTIPLE .segment Count
    .byte 3 + 9 ; $0C
    .byte \Count
  .endsegment

  MAP_DOWN_MULTIPLE .segment Count
    .byte 4 + 9 ; $0D
    .byte \Count
  .endsegment

  MAP_UP_LEFT_MULTIPLE .segment Count
    .byte 5 + 9 ; $0E
    .byte \Count
  .endsegment

  MAP_DOWN_LEFT_MULTIPLE .segment Count
    .byte 6 + 9 ; $0F
    .byte \Count
  .endsegment

  MAP_UP_RIGHT_MULTIPLE .segment Count
    .byte 7 + 9 ; $10
    .byte \Count
  .endsegment

  MAP_DOWN_RIGHT_MULTIPLE .segment Count
    .byte 8 + 9 ; $11
    .byte \Count
  .endsegment

  MAP_PAUSE .segment Time
    .byte 9 + 9 ; $12
    .byte \Time
  .endsegment

  MAP_END .segment
    .byte $80
  .endsegment

  MAP_HALT .segment
    ; If all scripted moving units are halting, continue
    ; executing events.
    .byte $81
  .endsegment

  MAP_82 .segment
    ; Placeholder, may have arguments
    .byte $82
  .endsegment

  MAP_83 .segment
    ; Placeholder, may have arguments
    .byte $83
  .endsegment

  MAP_SET_SPEED .segment Speed
    ; 1 is slow, 5 is fast
    .byte $84
    .byte \Speed
  .endsegment

  MAP_FACE_LEFT .segment
    .byte 1 + 4 + $80 ; $85
  .endsegment

  MAP_FACE_RIGHT .segment
    .byte 2 + 4 + $80 ; $86
  .endsegment

  MAP_FACE_UP .segment
    .byte 3 + 4 + $80 ; $87
  .endsegment

  MAP_FACE_DOWN .segment
    .byte 4 + 4 + $80 ; $88
  .endsegment


  SCRIPTED_BATTLE .segment DefenderID, DefenderInventorySlot, AttackerID, BattleQuote, DefeatQuote
    .word \DefenderID
    .word \DefenderInventorySlot
    .word \AttackerID
    .byte 0
    .long \BattleQuote
    .long \DefeatQuote
  .endsegment

  SB_END .segment
    .word $FFFF
  .endsegment
