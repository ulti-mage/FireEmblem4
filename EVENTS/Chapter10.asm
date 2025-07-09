
    .weak

      FlagChapter10_ChronosSeizedCheck            :=  0
      FlagChapter10_RadosSeizedCheck              :=  1
      FlagChapter10_MiletosSeizedCheck            :=  2
      FlagChapter10_ChalphySeizedCheck            :=  3
      FlagChapter10_RiddellLeisurelyCharge        :=  4

      FlagChapter10_MiletosSpawn                  := 13

      FlagChapter10_ChalphySpawn                  := 15
      FlagChapter10_SeliphPalmarchTalk            := 16

      FlagChapter10_JuliusKilledUnit              := 18
      FlagChapter10_IshtarKilledUnit              := 19

      FlagChapter10_ArvisBattleQuote              := 34
      FlagChapter10_RiddellBattleQuote            := 35
      FlagChapter10_HildaBattleQuote              := 36
      FlagChapter10_MorriganBattleQuote           := 37
      FlagChapter10_IshtarBattleQuote             := 38
      FlagChapter10_JuliusBattleQuote             := 39
      FlagChapter10_ZagamBattleQuote              := 40
      FlagChapter10_SeliphArvisBattleQuote        := 41

      FlagChapter10_SeliphPalmarchTalkCheck       := 43
      FlagChapter10_RemoveRampart                 := 44
      FlagChapter10_LowerBridge                   := 45
      FlagChapter10_JuliusKilledUnitCheck         := 46
      FlagChapter10_IshtarKilledUnitCheck         := 47
      FlagChapter10_KillingMinigameCompleted      := 48
      FlagChapter10_SeliphKilledArvis             := 49
      FlagChapter10_SeliphAtSeaCheck              := 50
      FlagChapter10_SeliphAtSea                   := 51
      FlagChapter10_TineLinda_HildaBattleQuote    := 52
      FlagChapter10_SeliphHildaBattleQuote        := 53

      FS_Player                                   :=  0
      FS_Ch10Civilians                            :=  1
      FS_Ch10Chronos                              :=  2
      FS_Ch10Rados                                :=  3
      FS_Ch10Miletos                              :=  4
      FS_Ch10Chalphy                              :=  5

    .endweak

    .section Chapter10EventsSection

      aChapter10EventHeader ; B0/8000

        .word Chapter10
        .long aChapter10OpeningEvent
        .long aChapter10MapEvents

      aChapter10OpeningEvent ; B0/8008

        UNDEPLOY_UNIT Julia

        LOAD_FACTION_GROUP FS_Player,        FG_Ch10Seliph
        LOAD_FACTION_GROUP FS_Ch10Civilians, FG_Ch10Civilians
        LOAD_FACTION_GROUP FS_Ch10Chronos,   FG_Ch10Chronos
        LOAD_FACTION_GROUP FS_Ch10Rados,     FG_Ch10Rados
        LOAD_FACTION_GROUP FS_Ch10Miletos,   FG_Ch10Miletos
        LOAD_FACTION_GROUP FS_Ch10Chalphy,   FG_Ch10Chalphy

        macroSetFactionsAllies  [FS_Player,        FS_Ch10Civilians]
        macroSetFactionsEnemies [FS_Player,        FS_Ch10Chronos]
        macroSetFactionsEnemies [FS_Player,        FS_Ch10Rados]
        macroSetFactionsEnemies [FS_Player,        FS_Ch10Miletos]
        macroSetFactionsEnemies [FS_Player,        FS_Ch10Chalphy]
        macroSetFactionsEnemies [FS_Ch10Civilians, FS_Ch10Chronos]
        macroSetFactionsEnemies [FS_Ch10Civilians, FS_Ch10Rados]
        macroSetFactionsEnemies [FS_Ch10Civilians, FS_Ch10Miletos]
        macroSetFactionsEnemies [FS_Ch10Civilians, FS_Ch10Chalphy]
        macroSetFactionsAllies  [FS_Ch10Chronos,   FS_Ch10Rados]
        macroSetFactionsAllies  [FS_Ch10Chronos,   FS_Ch10Miletos]
        macroSetFactionsAllies  [FS_Ch10Chronos,   FS_Ch10Chalphy]
        macroSetFactionsAllies  [FS_Ch10Rados,     FS_Ch10Miletos]
        macroSetFactionsAllies  [FS_Ch10Rados,     FS_Ch10Chalphy]
        macroSetFactionsAllies  [FS_Ch10Miletos,   FS_Ch10Chalphy]

        EVENT FlagAlways, EventChapter10Opening

        END_CHAPTER_EVENTS

      aChapter10MapEvents ; B0/805F

        CHECK_SEIZING_CASTLE FlagChapter10_ChronosSeizedCheck, FS_Player, Ch10_Chronos
          EVENT FlagAlways, EventChapter10ChronosSeized

        CHECK_SEIZING_CASTLE FlagChapter10_RadosSeizedCheck, FS_Player, Ch10_Rados
          EVENT FlagAlways, EventChapter10RadosSeized

        CHECK_SEIZING_CASTLE FlagChapter10_MiletosSeizedCheck, FS_Player, Ch10_Miletos
          EVENT FlagAlways, EventChapter10MiletosSeized

        CHECK_SEIZING_CASTLE FlagChapter10_ChalphySeizedCheck, FS_Player, Ch10_Chalphy
          EVENT FlagAlways, EventChapter10Ending

        CHECK_TALK FlagChapter10_SeliphPalmarchTalkCheck, Seliph, Palmarch
          EVENT FlagChapter10_SeliphPalmarchTalk, EventChapter10SeliphPalmarchTalk

        CHECK_UNIT_DIED_TO FlagChapter10_SeliphKilledArvis, ArvisCh10, Seliph
          EC_NOP_00

        CHECK_UNIT_IN_AREA FlagChapter10_SeliphAtSeaCheck, Seliph, pack([37, 4]), pack([38, 7])
          EC_NOP_00

        CHECK_UNIT_IN_AREA FlagChapter10_SeliphAtSeaCheck, Seliph, pack([12, 18]), pack([15, 18])
          EC_NOP_00

        CHECK_UNIT_IN_AREA FlagChapter10_SeliphAtSeaCheck, Seliph, pack([24, 13]), pack([27, 13])
          EC_NOP_00

        CHECK_UNIT_DIED_TO FlagChapter10_JuliusKilledUnitCheck, AnyCharacter, JuliusCh10
          SET_FLAG FlagChapter10_KillingMinigameCompleted

        CHECK_UNIT_DIED_TO FlagChapter10_IshtarKilledUnitCheck, AnyCharacter, IshtarCh10
          SET_FLAG FlagChapter10_KillingMinigameCompleted

        CHECK_UNIT_DIED_TO FlagAlways, HildaCh10, AnyCharacter
          COMBATANTS_STAY_ON_MAP

        CHECK_UNIT_DIED FlagAlways, HildaCh10, AnyCharacter
          EVENT FlagAlways, EventChapter10HildaDied

        CHECK_UNIT_DIED_TO FlagAlways, IshtarCh10, AnyCharacter
          COMBATANTS_STAY_ON_MAP

        CHECK_UNIT_DIED FlagChapter10_KillingMinigameCompleted, IshtarCh10, AnyCharacter
          EVENT FlagAlways, EventChapter10IshtarDied

        CHECK_UNIT_DIED_TO FlagAlways, JuliusCh10, AnyCharacter
          COMBATANTS_STAY_ON_MAP

        CHECK_UNIT_DIED FlagChapter10_KillingMinigameCompleted, JuliusCh10, AnyCharacter
          EVENT FlagAlways, EventChapter10JuliusDied

        CHECK_TALK FlagAlways, Leif, Altena
          EVENT FlagAlways, EventChapter10LeifAltenaTalk

        CHECK_TALK FlagAlways, Shannan, Seliph
          EVENT FlagAlways, EventChapter10ShannanSeliphTalk

        CHECK_TALK FlagAlways, Oifey, Seliph
          EVENT FlagAlways, EventChapter10OifeySeliphTalk

        CHECK_CHILD_TALK FlagAlways, Coirpre, Altena
          EVENT FlagAlways, EventChapter10CoirpreCharlot_AltenaTalk

        CHECK_CHILD_TALK FlagAlways, Deimne, Daisy
          EVENT FlagAlways, EventChapter10LesterDeimne_PattyDaisyTalk

        CHECK_CHILD_TALK FlagAlways, Nanna, Leif
          EVENT FlagAlways, EventChapter10NannaJeanne_LeifTalk

        CHECK_CHILD_TALK FlagAlways, Asaello, Muirne
          EVENT FlagAlways, EventChapter10FebailAsaello_LanaMuirneTalk

        CHECK_TALK FlagAlways, Seliph, Lene
          EVENT FlagAlways, EventChapter10SeliphLeneTalk

        CHECK_TALK FlagAlways, Seliph, Fee
          EVENT FlagAlways, EventChapter10SeliphFeeTalk

        CHECK_TALK FlagAlways, Seliph, Tine
          EVENT FlagAlways, EventChapter10SeliphTineTalk

        RESCUE_CIVILIAN FlagAlways, AnyCharacter, 0
          EVENT FlagAlways, EventChapter10CivilianRescued1

        RESCUE_CIVILIAN FlagAlways, AnyCharacter, 1
          EVENT FlagAlways, EventChapter10CivilianRescued2

        RESCUE_CIVILIAN FlagAlways, AnyCharacter, 2
          EVENT FlagAlways, EventChapter10CivilianRescued3

        RESCUE_CIVILIAN FlagAlways, AnyCharacter, 3
          EVENT FlagAlways, EventChapter10CivilianRescued4

        RESCUE_CIVILIAN FlagAlways, AnyCharacter, 4
          EVENT FlagAlways, EventChapter10CivilianRescued5

        RESCUE_CIVILIAN FlagAlways, AnyCharacter, 5
          EVENT FlagAlways, EventChapter10CivilianRescued6

        VISIT_VILLAGE FlagAlways, AnyCharacter, Ch10_Village1
          EVENT FlagAlways, EventChapter10Village1

        VISIT_VILLAGE FlagAlways, AnyCharacter, Ch10_Village2
          EVENT FlagAlways, EventChapter10Village2

        VISIT_VILLAGE FlagAlways, AnyCharacter, Ch10_Village3
          EVENT FlagAlways, EventChapter10Village3

        VISIT_VILLAGE FlagAlways, AnyCharacter, Ch10_VillageMagicRing
          EVENT FlagAlways, EventChapter10VillageMagicRing

        VISIT_VILLAGE FlagAlways, AnyCharacter, Ch10_Village4
          EVENT FlagAlways, EventChapter10Village4

        VISIT_VILLAGE FlagAlways, AnyCharacter, Ch10_Village5
          EVENT FlagAlways, EventChapter10Village5

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, Seliph, AnyFactionSlot, ArvisCh10
          SET_PRECOMBAT_DIALOGUE FlagChapter10_SeliphArvisBattleQuote, dialogueChapter10SeliphArvisBattleQuote, $74

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, Tine, AnyFactionSlot, HildaCh10
          SET_PRECOMBAT_DIALOGUE FlagChapter10_TineLinda_HildaBattleQuote, dialogueChapter10TineLinda_HildaBattleQuote, $46

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, Linda, AnyFactionSlot, HildaCh10
          SET_PRECOMBAT_DIALOGUE FlagChapter10_TineLinda_HildaBattleQuote, dialogueChapter10TineLinda_HildaBattleQuote, $46

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, Seliph, AnyFactionSlot, HildaCh10
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter10_SeliphHildaBattleQuote, dialogueChapter10SeliphHildaBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, Riddell
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter10_RiddellBattleQuote, dialogueChapter10RiddellBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, HildaCh10
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter10_HildaBattleQuote, dialogueChapter10HildaBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, Morrigan
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter10_MorriganBattleQuote, dialogueChapter10MorriganBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, JuliusCh10
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter10_JuliusBattleQuote, dialogueChapter10JuliusBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, IshtarCh10
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter10_IshtarBattleQuote, dialogueChapter10IshtarBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, Zagam
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter10_ZagamBattleQuote, dialogueChapter10ZagamBattleQuote, 0

        CHECK_UNITS_FIGHTING FlagAlways, FS_Player, AnyCharacter, AnyFactionSlot, ArvisCh10
          SET_BATTLE_OR_DEATH_QUOTE FlagChapter10_ArvisBattleQuote, dialogueChapter10ArvisBattleQuote, 0

        BREAK_ACTION_EVENT_CHECKS

        CHECK_FLAG_UNSET FlagChapter10_HildaBattleQuote
          CHECK_FLAG_IN_LIST_SET [FlagChapter10_TineLinda_HildaBattleQuote, FlagChapter10_SeliphHildaBattleQuote]
            SET_FLAG FlagChapter10_HildaBattleQuote
        BREAK_STATE_CHECKS

        CHECK_FLAG_UNSET FlagChapter10_ArvisBattleQuote
          CHECK_FLAG_SET FlagChapter10_SeliphArvisBattleQuote
            SET_FLAG FlagChapter10_ArvisBattleQuote
        BREAK_STATE_CHECKS

        CHECK_FLAG_SET FlagChapter10_JuliusKilledUnitCheck
          CHECK_UNIT_DIED FlagAlways, AnyCharacter, AnyCharacter
            EVENT FlagChapter10_JuliusKilledUnit, EventChapter10JuliusKilledUnit
          BREAK_ACTION_EVENT_CHECKS
        BREAK_STATE_CHECKS

        CHECK_FLAG_SET FlagChapter10_IshtarKilledUnitCheck
          CHECK_UNIT_DIED FlagAlways, AnyCharacter, AnyCharacter
            EVENT FlagChapter10_IshtarKilledUnit, EventChapter10IshtarKilledUnit
          BREAK_ACTION_EVENT_CHECKS
        BREAK_STATE_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_Ch10Rados, 1, AnyCharacter
          EVENT FlagChapter10_RiddellLeisurelyCharge, EventChapter10RiddellLeisurelyCharge
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_Ch10Miletos
          CHECK_ALL_FLAGS_IN_LIST_SET [FlagChapter10_RadosSeizedCheck, FlagChapter10_ChronosSeizedCheck]
            EVENT FlagChapter10_MiletosSpawn, EventChapter10MiletosSpawn
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_Ch10Chalphy
          CHECK_FLAG_SET FlagChapter10_MiletosSeizedCheck
            EVENT FlagChapter10_ChalphySpawn, EventChapter10ChalphySpawn
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_ALL_FLAGS_IN_LIST_SET [FlagChapter10_SeliphKilledArvis, FlagChapter10_SeliphAtSeaCheck]
          EVENT FlagChapter10_SeliphAtSea, EventChapter10SeliphAtSea
        BREAK_STATE_CHECKS

        CHECK_FLAG_SET FlagChapter10_SeliphAtSeaCheck
          CHECK_FLAG_UNSET FlagChapter10_SeliphAtSea
            UNSET_FLAG FlagChapter10_SeliphAtSeaCheck
        BREAK_STATE_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR AnyTurn, FS_Player
          CLEAR_TALK_IF_ONE_MARRIED aChapter10ClearTalksIfMarriedTable
        BREAK_TURN_EVENT_CHECKS

        END_CHAPTER_EVENTS

      aChapter10ClearTalksIfMarriedTable ; B0/8327

        .byte Daisy, Deimne
        .byte Leif, Nanna
        .byte Muirne, Asaello
        .word $FFFF

    .endsection Chapter10EventsSection

    .section Chapter10EventDataSection

      aChapter10EventData ; B0/832F

        .structChapterEventData aChapter10LocationData, aChapter10MapChangeData, aUnknownB083BF, aChapter10TalkEvents, aUnknownB0847A

      aChapter10LocationData ; B0/8339

        .byte size(aChapter10LocationData._Entries) / size(word)

        _Entries .include "../TABLES/CHAPTER/Chapter10LocationData.csv.asm"

      aChapter10PerulukeCastle ; B0/8350

        .structChapterCastleLocationEntry Ch10_Peruluke, PerlucosName, [57, 34], $FC, aChapter10ShopData

      aChapter10ChronosCastle ; B0/8358

        .structChapterCastleLocationEntry Ch10_Chronos, ChronosName, [36, 48], $FC, None

      aChapter10RadosCastle ; B0/8360

        .structChapterCastleLocationEntry Ch10_Rados, RadosName, [5, 56], $FC, None

      aChapter10MiletosCastle ; B0/8368

        .structChapterCastleLocationEntry Ch10_Miletos, MiletosName, [9, 26], $FC, None

      aChapter10ChalphyCastle ; B0/8370

        .structChapterCastleLocationEntry Ch10_Chalphy, ChalphyName, [15, 4], $00, None

      aChapter10Village1 ; B0/8378

        .structChapterVillageLocationEntry Ch10_Village1, [45, 54]

      aChapter10Village2 ; B0/837D

        .structChapterVillageLocationEntry Ch10_Village2, [39, 44]

      aChapter10Village3 ; B0/8382

        .structChapterVillageLocationEntry Ch10_Village3, [20, 51]

      aChapter10VillageMagicRing ; B0/8387

        .structChapterVillageLocationEntry Ch10_VillageMagicRing, [4, 52]

      aChapter10Village4 ; B0/838C

        .structChapterVillageLocationEntry Ch10_Village4, [25, 32]

      aChapter10Village5 ; B0/8391

        .structChapterVillageLocationEntry Ch10_Village5, [29, 31]

      aChapter10ShopData ; B0/8396

        .byte PI_IronBlade2
        .byte PI_WindSword
        .byte PI_RecoverStaff1
        .byte PI_PhysicStaff1
        .byte PI_RescueStaff
        .byte PI_SleepStaff
        .byte PI_PhysicStaff2
        .word $FFFF

      aChapter10MapChangeData ; B0/839F

        .structChapterMapChangeEntry Chapter10, FlagChapter10_RemoveRampart, [21, 42], aChapter10MapChangeRampart
        .structChapterMapChangeEntry Chapter10, FlagChapter10_LowerBridge, [5, 20], aChapter10MapChangeBridge
        .word $FFFF

      aChapter10MapChangeRampart ; B0/83AF

        .byte 2
        .byte 2

        .word $033A, $033B
        .word $035A, $035B

      aChapter10MapChangeBridge ; B0/83B9

        .byte 1
        .byte 2

        .word $009C
        .word $00BB

      aUnknownB083BF ; B0/83BF

        .word <>aUnknownB083C3
        .word <>aUnknownB083D3

      aUnknownB083C3 ; B0/83C3

        .word $0227
        .word $0228
        .word $022A
        .word $022B
        .word $022C
        .word $022E
        .word $022F
        .word $FFFF

      aUnknownB083D3 ; B0/83D3

        .word $0227
        .word $0229
        .word $022A
        .word $022B
        .word $022D
        .word $022E
        .word $022F
        .word $FFFF

      aChapter10TalkEvents ; B0/83E3

        .structChapterTalkEventEntry Chapter10, FlagChapter10_SeliphPalmarchTalkCheck, Seliph, Palmarch
        .word $FFFF

      aFactionGroupData36 ; B0/83ED

        .structFactionGroupData FactionSeliph, BattleHUDColorBlue, BattleBannerChalphy, None, aFactionGroupData36._Locations, None

        _Locations ; B0/83F6
        .word Ch10_Peruluke
        .word $FFFF

      aFactionGroupData38 ; B0/83FA

        .structFactionGroupData FactionChronos, BattleHUDColorOrange, BattleBannerFreege, None, aFactionGroupData38._Locations, aFactionGroupData38._GroupAI

        _Locations ; B0/8403
        .word Ch10_Chronos
        .word $FFFF

        _GroupAI ; B0/8407
        .long aFactionGroup38AI1
        .long aFactionGroup38AI2
        .long aFactionGroup38AI3
        .word $FFFF

      aFactionGroupData39 ; B0/8412

        .structFactionGroupData FactionRados, BattleHUDColorOrange, BattleBannerFreege, None, aFactionGroupData39._Locations, aFactionGroupData39._GroupAI

        _Locations ; B0/841B
        .word Ch10_Rados
        .word $FFFF

        _GroupAI ; B0/841F
        .long aFactionGroup39AI1
        .long aFactionGroup39AI2
        .word $FFFF

      aFactionGroupData3A ; B0/8427

        .structFactionGroupData FactionMiletos, BattleHUDColorOrange, BattleBannerLoptr, None, aFactionGroupData3A._Locations, aFactionGroupData3A._GroupAI

        _Locations ; B0/8430
        .word Ch10_Miletos
        .word $FFFF

        _GroupAI ; B0/8434
        .long aFactionGroup3AAI1
        .long aFactionGroup3AAI2
        .long aFactionGroup3AAI3
        .long aFactionGroup3AAI3
        .long aFactionGroup3AAI5
        .long aFactionGroup3AAI6
        .word $FFFF

      aFactionGroupData3B ; B0/8448

        .structFactionGroupData FactionChalphy2, BattleHUDColorDarkBlue, BattleBannerVelthomer, None, aFactionGroupData3B._Locations, aFactionGroupData3B._GroupAI

        _Locations ; B0/8451
        .word Ch10_Chalphy
        .word $FFFF

        _GroupAI ; B0/8455
        .long aFactionGroup3BAI1
        .long aFactionGroup3BAI2
        .long aFactionGroup3BAI3
        .long aFactionGroup3BAI4
        .long aFactionGroup3BAI5
        .long aFactionGroup3BAI6
        .word $FFFF

      aFactionGroupData37 ; B0/8469

        .structFactionGroupData $FF, BattleHUDColorOrange, BattleBannerDefault, None, None, aFactionGroupData37._GroupAI

        _GroupAI ; B0/8472
        .long aFactionGroup37AI1
        .long aFactionGroup37AI2
        .word $FFFF

      aUnknownB0847A ; B0/847A

        .word $FFFF
        .word $FFFF
        .word $FFFF
        .word $FFFF
        .word $FFFF
        .word $020A

      aFactionGroup38AI1 ; B0/8486

        AI_SET_FORMATION $02, $00
        AI_0A
        AI_END

      aFactionGroup38AI2 ; B0/848B

        AI_0B
        AI_END

      aFactionGroup38AI3 ; B0/848D

        AI_07 Ch10_Chronos, $04
        AI_END

      aFactionGroup37AI1 ; B0/8491

        AI_0B
        AI_END

      aFactionGroup37AI2 ; B0/8493

        AI_13
        AI_END

      aFactionGroup39AI1 ; B0/8495

        AI_SET_FORMATION $09, $01
        MODIFY_GROUP_LEADER_FIELD_MOVEMENT 0.5 * 256
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup39AI2 ; B0/849C

        AI_07 Ch10_Rados, $05
        AI_END

      aFactionGroup3AAI1 ; B0/84A0

        AI_0A
        AI_END

      aFactionGroup3AAI2 ; B0/84A2

        AI_0A
        AI_END

      aFactionGroup3AAI3 ; B0/84A4

        AI_07 Ch10_Miletos, $04
        AI_END

      aFactionGroup3AAI5 ; B0/84A8

        AI_TARGET_REMAINING_VILLAGES
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup3AAI6 ; B0/84AB

        AI_0B
        AI_END

      aFactionGroup3BAI1 ; B0/84AD

        AI_SET_FORMATION $07, $02
        AI_0A
        AI_END

      aFactionGroup3BAI2 ; B0/84B2

        AI_SET_FORMATION $07, $02
        AI_0A
        AI_END

      aFactionGroup3BAI3 ; B0/84B7

        AI_SET_FORMATION $07, $02
        AI_0A
        AI_END

      aFactionGroup3BAI4 ; B0/84BC

        AI_TARGET_SPECIFIED_UNIT Palmarch
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup3BAI5 ; B0/84C1

        AI_07 Ch10_Chalphy, $05
        AI_END

      aFactionGroup3BAI6 ; B0/84C5

        AI_0A
        AI_END

    .endsection Chapter10EventDataSection
