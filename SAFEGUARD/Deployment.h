
  DeploymentAllegianceMask      = $03

  DeploymentStateGuardingCastle = bits($0004)
  DeploymentStateGrayed         = bits($0008)
  DeploymentStateCanto          = bits($0010)
  DeploymentStateDefeated       = bits($0020)
    ; Sets when a unit dies or they are defeated in the arena
  DeploymentStateHidden         = bits($0040)
  DeploymentStateAlive          = bits($0080)
  DeploymentFormationID         = $1F00 >> 8
  DeploymentStateAsleep         = bits($2000)
  ; $4000 ; not used?
  ; $8000 ; not used?


  Factionless         = 7
  NoDeploymentOffset  = $FF

  structFactionHeader .struct GroupID, LocationID, HostileFactions, AlliedFactions, UnitCount
    GroupID         .byte \GroupID         ; $00
    LocationID      .byte \LocationID      ; $01
    HostileFactions .byte \HostileFactions ; $02
    AlliedFactions  .byte \AlliedFactions  ; $03
    UnitCount       .byte \UnitCount       ; $04
  .endstruct


  structFactionGroupData .struct FactionNameID, BattleHUDColorID, BattleBannerID, UnitsPointer, LocationsPointer, GroupAIPointers
    FactionNameID     .byte \FactionNameID      ; $00
    BattleHUDColorID  .byte \BattleHUDColorID   ; $01
    BattleBannerID    .byte \BattleBannerID     ; $02
    UnitsPointer      .word <>\UnitsPointer     ; $03
    LocationsPointer  .word <>\LocationsPointer ; $05
    GroupAIPointers   .word <>\GroupAIPointers  ; $07
  .endstruct

  structUNITEntry .struct CharacterID, DestinationX, DestinationY, GroupLeaderFlag, AI, FactionSlot, FormationID
    .if (\CharacterID === ?)
      CharacterID           .word ? ; $00
      .union
        DestinationCoords   .word ? ; $02
        .struct
          DestinationX      .byte ? ; $02
          DestinationY      .byte ? ; $03
        .endstruct
      .endunion
      GroupLeaderFlag       .byte ? ; $04
      AI                    .byte ? ; $05
      FactionSlot           .byte ? ; $06
      FormationID           .byte ? ; $07
    .else
      CharacterID           .word \CharacterID      ; $00
      DestinationX          .byte \DestinationX     ; $02
      DestinationY          .byte \DestinationY     ; $03
      GroupLeaderFlag       .byte \GroupLeaderFlag  ; $04
      AI                    .byte \AI               ; $05
      FactionSlot           .byte \FactionSlot      ; $06
      FormationID           .byte \FormationID      ; $07
    .endif
  .endstruct
