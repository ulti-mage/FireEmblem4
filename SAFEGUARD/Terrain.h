
  TerrainPeak            = $00
  TerrainThicket         = $01
  TerrainCliff           = $02
  TerrainPlains          = $03
  TerrainForest          = $04
  TerrainSea             = $05
  TerrainRiver           = $06
  TerrainMountain        = $07
  TerrainDesert          = $08
  TerrainCastle          = $09 ; the guarding spot
  TerrainFort            = $0A ; a weird tile that looks like a blockade
  TerrainHouse           = $0B ; unused?
  TerrainCastleGate      = $0C
  TerrainRampart         = $0D ; blockades in Ch2 and castle walls
  TerrainSand            = $0E
  TerrainBridge          = $0F
  TerrainSwamp           = $10 ; unused
  TerrainCastleGate2     = $11 ; unsure
  TerrainVillage         = $12
  TerrainVillageRuins    = $13
  TerrainStore           = $14 ; unused
  TerrainRuins2          = $15 ; unused?
  TerrainChurch          = $16
  TerrainShrine          = $17 ; unused
  TerrainBragiTower      = $18
  TerrainRoad            = $19

  structTerrainEntry .struct Peak, Thicket, Cliff, Plains, Forest, Sea, River, Mountain, Desert, Castle, Fort, House, CastleGate, Rampart, Sand, Bridge, Swamp, CastleGate2, Village, VillageRuins, Store, Ruins2, Church, Shrine, BragiTower, Road
    Peak         .char \Peak         ; $00
    Thicket      .char \Thicket      ; $02
    Cliff        .char \Cliff        ; $04
    Plains       .char \Plains       ; $06
    Forest       .char \Forest       ; $08
    Sea          .char \Sea          ; $0A
    River        .char \River        ; $0C
    Mountain     .char \Mountain     ; $0E
    Desert       .char \Desert       ; $10
    Castle       .char \Castle       ; $12
    Fort         .char \Fort         ; $14
    House        .char \House        ; $16
    CastleGate   .char \CastleGate   ; $18
    Rampart      .char \Rampart      ; $1A
    Sand         .char \Sand         ; $1C
    Bridge       .char \Bridge       ; $1E
    Swamp        .char \Swamp        ; $20
    CastleGate2  .char \CastleGate2  ; $22
    Village      .char \Village      ; $24
    VillageRuins .char \VillageRuins ; $26
    Store        .char \Store        ; $28
    Ruins2       .char \Ruins2       ; $2A
    Church       .char \Church       ; $2C
    Shrine       .char \Shrine       ; $2E
    BragiTower   .char \BragiTower   ; $30
    Road         .char \Road         ; $32
  .endstruct
