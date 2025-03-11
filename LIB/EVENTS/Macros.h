
  macroSetFactionsEnemies .segment FactionSlots
    SET_FACTION_HOSTILITY HOSTILITY_ENEMIES, \FactionSlots
  .endsegment

  macroSetFactionsAllies .segment FactionSlots
    SET_FACTION_HOSTILITY HOSTILITY_ALLIES, \FactionSlots
  .endsegment

  macroSetFactionsNeutral .segment FactionSlots
    SET_FACTION_HOSTILITY HOSTILITY_NEUTRAL, \FactionSlots
  .endsegment


  macroSetUnitToCoordinates .segment CharacterID, Coordinates
    SET_UNIT_POSITION \CharacterID, $FF, \Coordinates
  .endsegment

  macroSetUnitResidingInCastle .segment CharacterID, CastleID
    SET_UNIT_POSITION \CharacterID, \CastleID, [0, 0]
  .endsegment

  ; A better way to do this is with event condition command 61

