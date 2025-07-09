
  structAITargetEntry .struct
    UnitRAMPointer    .word ? ; $00
    DeploymentOffset  .byte ? ; $02
    ItemROMPointer    .word ? ; $03
    ItemType          .byte ? ; $05
    BattleMight       .byte ? ; $06
    BattleDefense     .byte ? ; $07
    BattleResistance  .byte ? ; $08
    XPosition         .byte ? ; $09
    YPosition         .byte ? ; $0A
    ThreatRange       .byte ? ; $0B
    TerrainType       .byte ? ; $0C
  .endstruct

  structAIUnitEntry .struct
    UnitRAMPointer    .word ? ; $00
    DeploymentOffset  .byte ? ; $02
    ItemROMPointer    .word ? ; $03
    ItemType          .byte ? ; $05
    BattleMight       .byte ? ; $06
    BattleDefense     .byte ? ; $07
    BattleResistance  .byte ? ; $08
    XPosition         .byte ? ; $09
    YPosition         .byte ? ; $0A
    ThreatRange       .byte ? ; $0B
    XTargetPosition   .byte ? ; $0C
    YTargetPosition   .byte ? ; $0D
  .endstruct

  AI_00 .segment
    ; Clears wAIUnknown7E201A
    .byte $00
  .endsegment

  AI_JUMP .segment Address
    .byte $01
    .word <>\Address
  .endsegment

  AI_02 .segment Unknown
    ; Sets wAIUnknown7E2002
    .byte $02
    .byte \Unknown
  .endsegment

  MODIFY_GROUP_LEADER_FIELD_MOVEMENT .segment Multiplier
    ; If 0, use default field movement.
    ; Other values are fractions over 256 used as multipliers
    .byte $03
    .byte \Multiplier
  .endsegment

  AI_SET_IGNORED_GENERATION_ID .segment GenerationID
    .byte $04
    .byte \GenerationID
  .endsegment

  AI_05 .segment
    ; Sets $200 in wAIUnknownBitfield7E2000
    .byte $05
  .endsegment

  AI_06 .segment LocationID, Unknown
    ; Do something if castle held by foes faction
    .byte $06
    .byte \LocationID
    .byte \Unknown ; value for $7E2002
  .endsegment

  AI_07 .segment LocationID, Unknown
    ; Do something if castle held by own faction
    .byte $07
    .byte \LocationID
    .byte \Unknown ; if 5 = run AI_0B, else write to wAIUnknown7E2002
  .endsegment

  AI_TARGET_VILLAGE .segment LocationID
    .byte $08
    .byte \LocationID
  .endsegment

  AI_FLAG_IF_LEADER_ON_COORDS .segment ChapterID, EventFlag, LeaderCoordinates
    ; If flag set, skip
    ; If group leader on coords, set flag, else target coords
    .byte $09
    .word \ChapterID
    .byte \EventFlag
    .byte \LeaderCoordinates[0]
    .byte \LeaderCoordinates[1]
  .endsegment

  AI_0A .segment
    .byte $0A
  .endsegment

  AI_0B .segment
    .byte $0B
  .endsegment

  AI_SET_FORMATION .segment FormationType, FormationDirection
    .byte $0C
    .byte \FormationType
    .byte \FormationDirection
  .endsegment

  AI_TARGET_SPECIFIED_UNIT .segment CharacterID
    .byte $0D
    .word \CharacterID
  .endsegment

  AI_INTERACT_WITH_UNIT .segment CharacterID, Unknown
    .byte $0E
    .word \CharacterID
    .byte \Unknown
  .endsegment

  AI_0F .segment
    .byte $0F
  .endsegment

  AI_10 .segment
    .byte $10
  .endsegment

  AI_CHARGE_IF_LEADERLESS_BELOW_UNIT_RATIO .segment Ratio
    ; If leaderless/leader dead, skip
    ; If group has less units than ratio, run AI_18
    .byte $11
    .byte \Ratio
  .endsegment

  AI_12 .segment
    .byte $12
  .endsegment

  AI_13 .segment
    .byte $13
  .endsegment

  AI_CHECK_GROUP_COMPLETE_BY_TURN_DIVISIBLE .segment Unknown
    ; Sets flag $80 in wAIUnknownBitfield7E2000 if at least one group member is dead.
    .byte $14
    .byte \Unknown
  .endsegment

  AI_SET_CHAPTER_EVENT_FLAG .segment ChapterID, EventFlag
    ; Any chapter but the active one doesnt work
    .byte $15
    .word \ChapterID
    .byte \EventFlag
  .endsegment

  AI_UNSET_CHAPTER_EVENT_FLAG .segment ChapterID, EventFlag
    ; Any chapter but the active one doesnt work
    .byte $16
    .word \ChapterID
    .byte \EventFlag
  .endsegment

  AI_TARGET_REMAINING_VILLAGES .segment
    .byte $17
  .endsegment

  AI_TARGET_ALL_FOES .segment
    ; Except wAIIgnoredGenerationID
    .byte $18
  .endsegment

  AI_19 .segment
    .byte $19
    ; Same as last but 7 in wAIUnknown7E2002 ?
  .endsegment

  ; $1A - $1D are identical

  AI_1A .segment
    ; Unused.
    .byte $1A
  .endsegment

  AI_1B .segment
    ; Unused.
    .byte $1B
  .endsegment

  AI_1C .segment
    ; Unused.
    .byte $1C
  .endsegment

  AI_1D .segment
    .byte $1D
  .endsegment

  AI_CHARGE_IF_LEADER_BELOW_THRESHOLD .segment AlwaysThreshold, FieldedThreshold
    ; Skip if leader dead/no leader
    ; If leaders HP is above threshold, run AI_18 and AI_0F
    .byte $1E
    .byte \AlwaysThreshold
    .word \FieldedThreshold
  .endsegment

  AI_JUMP_IF_TURN_REACHED .segment Turn, Address
    .byte $1F
    .byte \Turn
    .word <>\Address
  .endsegment

  AI_JUMP_IF_CHAPTER_EVENT_FLAG_SET .segment ChapterID, EventFlag, Address
    ; Any chapter but the active one doesnt work
    .byte $20
    .word \ChapterID
    .byte \EventFlag
    .word <>\Address
  .endsegment

  AI_JUMP_IF_CHAPTER_EVENT_FLAG_UNSET .segment ChapterID, EventFlag, Address
    ; Any chapter but the active one doesnt work
    .byte $21
    .word \ChapterID
    .byte \EventFlag
    .word <>\Address
  .endsegment

  AI_22 .segment Address
    .byte $22
    .word <>\Address
  .endsegment

  AI_ASMC_CHECK .segment Routine, Address
    .byte $23
    .long \Routine
    .word <>\Address
  .endsegment

  AI_END .segment
    .byte $FF
  .endsegment
