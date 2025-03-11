
    .weak

      Flag_Unknown0                     :=  0
      Flag_Unknown1                     :=  1
      Flag_Unknown2                     :=  2

      Flag_Unknown4                     :=  4

      Flag_Unknown13                    := 13

      Flag_Unknown15                    := 15
      Flag_SeliphPalmarchTalk           := 16

      Flag_Unknown18                    := 18
      Flag_Unknown19                    := 19

      Flag_ArvisBattleQuote             := 34
      Flag_RiddellBattleQuote           := 35
      Flag_HildaBattleQuote             := 36
      Flag_MorriganBattleQuote          := 37
      Flag_IshtarBattleQuote            := 38
      Flag_JuliusBattleQuote            := 39
      Flag_ZagamBattleQuote             := 40
      Flag_SeliphArvisBattleQuote       := 41

      Flag_SeliphPalmarchTalkCheck      := 43

      Flag_Unknown46                    := 46
      Flag_Unknown47                    := 47
      Flag_Unknown48                    := 48
      Flag_Unknown49                    := 49
      Flag_SeliphAtSea                  := 50
      Flag_Unknown51                    := 51
      Flag_TineHildaBattleQuote         := 52
      Flag_SeliphHildaBattleQuote       := 53

    .endweak

    .section Chapter10EventsSection

      aChapter10EventHeader ; B0/8000

        .word Chapter10
        .long aChapter10OpeningEvent
        .long aChapter10MapEvents

      aChapter10OpeningEvent ; B0/8008

        UNDEPLOY_UNIT $002B

        LOAD_FACTION_GROUP 0, FG_Ch10Seliph
        LOAD_FACTION_GROUP 1, FG_37
        LOAD_FACTION_GROUP 2, FG_Ch10Chronos
        LOAD_FACTION_GROUP 3, FG_Ch10Rados
        LOAD_FACTION_GROUP 4, FG_Ch10Miletos
        LOAD_FACTION_GROUP 5, FG_Ch10Chalphy

        macroSetFactionsAllies  [0, 1]
        macroSetFactionsEnemies [0, 2]
        macroSetFactionsEnemies [0, 3]
        macroSetFactionsEnemies [0, 4]
        macroSetFactionsEnemies [0, 5]
        macroSetFactionsEnemies [1, 2]
        macroSetFactionsEnemies [1, 3]
        macroSetFactionsEnemies [1, 4]
        macroSetFactionsEnemies [1, 5]
        macroSetFactionsAllies  [2, 3]
        macroSetFactionsAllies  [2, 4]
        macroSetFactionsAllies  [2, 5]
        macroSetFactionsAllies  [3, 4]
        macroSetFactionsAllies  [3, 5]
        macroSetFactionsAllies  [4, 5]

        EVENT $FF, $016A

        END_CHAPTER_EVENTS

      aChapter10MapEvents ; B0/805F

        CHECK_SEIZING_CASTLE 0, $0000, $0001
          EVENT $FF, $0172

        CHECK_SEIZING_CASTLE 1, $0000, $0002
          EVENT $FF, $0173

        CHECK_SEIZING_CASTLE 2, $0000, $0003
          EVENT $FF, $0175

        CHECK_SEIZING_CASTLE 3, $0000, $0004
          EVENT $FF, $0178

        CHECK_TALK Flag_SeliphPalmarchTalkCheck, Seliph, Palmarch
          EVENT Flag_SeliphPalmarchTalk, $0177

        CHECK_UNIT_DIED_TO Flag_Unknown49, Arvis3, Seliph
          EC_NOP_00

        CHECK_UNIT_IN_AREA Flag_SeliphAtSea, Seliph, $0425, $0726, $FF
          EC_NOP_00

        CHECK_UNIT_IN_AREA Flag_SeliphAtSea, Seliph, $120C, $120F, $FF
          EC_NOP_00

        CHECK_UNIT_IN_AREA Flag_SeliphAtSea, Seliph, $0D18, $0D1B, $FF
          EC_NOP_00

        CHECK_UNIT_DIED_TO Flag_Unknown46, $FFFF, Julius
          SET_FLAG Flag_Unknown48

        CHECK_UNIT_DIED_TO Flag_Unknown47, $FFFF, Ishtar2
          SET_FLAG Flag_Unknown48

        CHECK_UNIT_DIED_TO $FF, Hilda1, $FFFF
          COMBATANTS_STAY_ON_MAP

        CHECK_UNIT_DIED $FF, Hilda1, $FFFF
          EVENT $FF, $0184

        CHECK_UNIT_DIED_TO $FF, Ishtar2, $FFFF
          COMBATANTS_STAY_ON_MAP

        CHECK_UNIT_DIED Flag_Unknown48, Ishtar2, $FFFF
          EVENT $FF, $017C

        CHECK_UNIT_DIED_TO $FF, Julius, $FFFF
          COMBATANTS_STAY_ON_MAP

        CHECK_UNIT_DIED Flag_Unknown48, Julius, $FFFF
          EVENT $FF, $017B

        CHECK_TALK $FF, Leif, Altena
          EVENT $FF, $0209

        CHECK_TALK $FF, Shannan, Seliph
          EVENT $FF, $020A

        CHECK_TALK $FF, Oifey, Seliph
          EVENT $FF, $020B

        EC_16 $FF, Coirpre, Altena
          EVENT $FF, $020C

        EC_16 $FF, Deimne, Daisy
          EVENT $FF, $020D

        EC_16 $FF, Nanna, Leif
          EVENT $FF, $020E

        EC_16 $FF, Asaello, Muirne
          EVENT $FF, $020F

        CHECK_TALK $FF, Seliph, Lene
          EVENT $FF, $0210

        CHECK_TALK $FF, Seliph, Fee
          EVENT $FF, $0211

        CHECK_TALK $FF, Seliph, Tine
          EVENT $FF, $0212

        RESCUE_CIVILIAN FlagAlways, AnyCharacter, 0
          EVENT $FF, $016C

        RESCUE_CIVILIAN FlagAlways, AnyCharacter, 1
          EVENT $FF, $016D

        RESCUE_CIVILIAN FlagAlways, AnyCharacter, 2
          EVENT $FF, $016E

        RESCUE_CIVILIAN FlagAlways, AnyCharacter, 3
          EVENT $FF, $016F

        RESCUE_CIVILIAN FlagAlways, AnyCharacter, 4
          EVENT $FF, $0170

        RESCUE_CIVILIAN FlagAlways, AnyCharacter, 5
          EVENT $FF, $0171

        VISIT_VILLAGE $FF, AnyCharacter, $0005
          EVENT $FF, $017E

        VISIT_VILLAGE $FF, AnyCharacter, $0006
          EVENT $FF, $017F

        VISIT_VILLAGE $FF, AnyCharacter, $0007
          EVENT $FF, $0180

        VISIT_VILLAGE $FF, AnyCharacter, $0008
          EVENT $FF, $0181

        VISIT_VILLAGE $FF, AnyCharacter, $0009
          EVENT $FF, $0182

        VISIT_VILLAGE $FF, AnyCharacter, $000A
          EVENT $FF, $0183

        CHECK_UNITS_FIGHTING $FF, $0000, Seliph, $FFFF, Arvis3
          SET_PRECOMBAT_DIALOGUE Flag_SeliphArvisBattleQuote, $B3CA04, $0074

        CHECK_UNITS_FIGHTING $FF, $0000, Tine, $FFFF, Hilda1
          SET_PRECOMBAT_DIALOGUE Flag_TineHildaBattleQuote, $B0E61E, $0046

        CHECK_UNITS_FIGHTING $FF, $0000, Linda, $FFFF, Hilda1
          SET_PRECOMBAT_DIALOGUE Flag_TineHildaBattleQuote, $B0E61E, $0046

        CHECK_UNITS_FIGHTING $FF, $0000, Seliph, $FFFF, Hilda1
          SET_BATTLE_OR_DEATH_QUOTE Flag_SeliphHildaBattleQuote, $B0E72D, $00

        CHECK_UNITS_FIGHTING $FF, $0000, $FFFF, $FFFF, Riddell
          SET_BATTLE_OR_DEATH_QUOTE Flag_RiddellBattleQuote, $B3CA88, $00

        CHECK_UNITS_FIGHTING $FF, $0000, $FFFF, $FFFF, Hilda1
          SET_BATTLE_OR_DEATH_QUOTE Flag_HildaBattleQuote, $B3CAAE, $00

        CHECK_UNITS_FIGHTING $FF, $0000, $FFFF, $FFFF, Morrigan
          SET_BATTLE_OR_DEATH_QUOTE Flag_MorriganBattleQuote, $B3CADE, $00

        CHECK_UNITS_FIGHTING $FF, $0000, $FFFF, $FFFF, Julius
          SET_BATTLE_OR_DEATH_QUOTE Flag_JuliusBattleQuote, $B3CB05, $00

        CHECK_UNITS_FIGHTING $FF, $0000, $FFFF, $FFFF, Ishtar2
          SET_BATTLE_OR_DEATH_QUOTE Flag_IshtarBattleQuote, $B3CB28, $00

        CHECK_UNITS_FIGHTING $FF, $0000, $FFFF, $FFFF, Zagam
          SET_BATTLE_OR_DEATH_QUOTE Flag_ZagamBattleQuote, $B3CC23, $00

        CHECK_UNITS_FIGHTING $FF, $0000, $FFFF, $FFFF, Arvis3
          SET_BATTLE_OR_DEATH_QUOTE Flag_ArvisBattleQuote, $B3CC48, $00

        BREAK_ACTION_EVENT_CHECKS

        CHECK_FLAG_UNSET Flag_HildaBattleQuote
          CHECK_FLAG_IN_LIST_SET [Flag_TineHildaBattleQuote, Flag_SeliphHildaBattleQuote]
            SET_FLAG Flag_HildaBattleQuote
        BREAK_STATE_CHECKS

        CHECK_FLAG_UNSET Flag_ArvisBattleQuote
          CHECK_FLAG_SET Flag_SeliphArvisBattleQuote
            SET_FLAG Flag_ArvisBattleQuote
        BREAK_STATE_CHECKS

        CHECK_FLAG_SET Flag_Unknown46
          CHECK_UNIT_DIED $FF, $FFFF, $FFFF
            EVENT Flag_Unknown18, $0179
          BREAK_ACTION_EVENT_CHECKS
        BREAK_STATE_CHECKS

        CHECK_FLAG_SET Flag_Unknown47
          CHECK_UNIT_DIED $FF, $FFFF, $FFFF
            EVENT Flag_Unknown19, $017A
          BREAK_ACTION_EVENT_CHECKS
        BREAK_STATE_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR $FF, $03, $01, $FFFF
          EVENT Flag_Unknown4, $016B
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR $FF, $04, $00, $0000
          CHECK_ALL_FLAGS_IN_LIST_SET [Flag_Unknown1, Flag_Unknown0]
            EVENT Flag_Unknown13, $0174
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR $FF, $05, $00, $0000
          CHECK_FLAG_SET Flag_Unknown2
            EVENT Flag_Unknown15, $0176
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_ALL_FLAGS_IN_LIST_SET [Flag_Unknown49, Flag_SeliphAtSea]
          EVENT Flag_Unknown51, $0189
        BREAK_STATE_CHECKS

        CHECK_FLAG_SET Flag_SeliphAtSea
          CHECK_FLAG_UNSET Flag_Unknown51
            UNSET_FLAG Flag_SeliphAtSea
        BREAK_STATE_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR $FF, $00, $00, $0000
          CLEAR_TALK_IF_ONE_MARRIED aUnknownB08327
        BREAK_TURN_EVENT_CHECKS

        END_CHAPTER_EVENTS

      aUnknownB08327 ; B0/8327

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

        .structChapterMapChangeEntry Chapter10, 44, [21, 42], aChapter10MapChangeRampart
        .structChapterMapChangeEntry Chapter10, 45, [5, 20], aChapter10MapChangeBridge
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

        .structChapterTalkEventEntry Chapter10, 43, Seliph, Palmarch
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
