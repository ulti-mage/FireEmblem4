
    .weak

      Flag_Unknown0                     :=  0
      Flag_Unknown1                     :=  1
      Flag_Unknown2                     :=  2
      Flag_Unknown3                     :=  3
      Flag_Unknown4                     :=  4
      Flag_Unknown5                     :=  5
      Flag_Unknown6                     :=  6
      Flag_LeifAltenaTalk               :=  7
      Flag_Unknown8                     :=  8
      Flag_Unknown9                     :=  9
      Flag_Unknown10                    := 10
      Flag_SeliphAltenaTalk             := 11
      Flag_Unknown12                    := 12
      Flag_Unknown13                    := 13
      Flag_Unknown14                    := 14
      Flag_Unknown15                    := 15
      Flag_Unknown16                    := 16
      Flag_Unknown17                    := 17
      Flag_Unknown18                    := 18

      Flag_Unknown20                    := 20

      Flag_AltenaArionBattleQuote       := 24
      Flag_AltenaBattleQuote            := 25
      Flag_HannibalBattleQuote          := 26
      Flag_KanatzBattleQuote            := 27
      Flag_DistlerBattleQuote           := 28
      Flag_MusarBattleQuote             := 29
      Flag_JudahBattleQuote             := 30
      Flag_ArionBattleQuote             := 31
      Flag_TravantBattleQuote           := 32

      Flag_Unknown34                    := 34
      Flag_Unknown35                    := 35
      Flag_HannibalDied                 := 36
      Flag_TravantDied                  := 37
      Flag_AltenaDied                   := 38
      Flag_Unknown39                    := 39
      Flag_LeifAltenaTalkCheck          := 40
      Flag_Unknown41                    := 41
      Flag_SeliphAltenaTalkCheck        := 42

      Flag_Unknown45                    := 45
      Flag_Unknown46                    := 46
      Flag_Unknown47                    := 47
      Flag_MusarDied                    := 48
      Flag_Unknown49                    := 49
      Flag_LeifAltenaBattleQuote        := 50
      Flag_FinnAltenaBattleQuote        := 51
      Flag_LeifTravantBattleQuote       := 52
      Flag_FinnTravantBattleQuote       := 53
      Flag_SeliphArionBattleQuote       := 54

    .endweak

    .section Chapter09EventsSection

      aChapter09EventHeader ; 86/F4C9

        .word Chapter09
        .long aChapter09OpeningEvent
        .long aChapter09MapEvents

      aChapter09OpeningEvent ; B2/F4D1

        REGISTER_UNITGROUP_MAP_SPRITES $29

        LOAD_FACTION_GROUP 0, FG_Ch09Seliph
        LOAD_FACTION_GROUP 1, FG_Ch09Kapathogia
        LOAD_FACTION_GROUP 2, FG_Ch09Luthecia
        LOAD_FACTION_GROUP 3, FG_Ch09Grutia
        LOAD_FACTION_GROUP 4, FG_Ch09Thracia

        macroSetFactionsEnemies [0, 1]
        macroSetFactionsEnemies [0, 2]
        macroSetFactionsEnemies [0, 3]
        macroSetFactionsEnemies [0, 4]
        macroSetFactionsAllies  [1, 2]
        macroSetFactionsAllies  [1, 3]
        macroSetFactionsAllies  [1, 4]
        macroSetFactionsAllies  [2, 3]
        macroSetFactionsAllies  [2, 4]
        macroSetFactionsAllies  [3, 4]

        DEPLOY_UNIT_GROUP $29

        SET_FLAG Flag_LeifAltenaTalkCheck
        SET_FLAG Flag_SeliphAltenaTalkCheck

        CHECK_UNIT_ALIVE Oifey
          SET_FLAG Flag_Unknown34
        BREAK_STATE_CHECKS

        CHECK_UNIT_ALIVE Leif
          CHECK_UNIT_ALIVE OldFinn
            SET_FLAG Flag_Unknown35
            UNSET_FLAG Flag_LeifAltenaTalkCheck
        BREAK_STATE_CHECKS

        EVENT $FF, $0148

        END_CHAPTER_EVENTS

      aChapter09MapEvents ; 86/F52B

        CHECK_SEIZING_CASTLE Flag_Unknown0, $0000, $0001
          EC_NOP_00

        CHECK_SEIZING_CASTLE Flag_Unknown1, $0000, $0002
          EVENT Flag_Unknown13, $0152

        CHECK_SEIZING_CASTLE Flag_Unknown2, $0000, $0003
          EVENT Flag_Unknown16, $0155

        CHECK_SEIZING_CASTLE Flag_Unknown3, $0000, $0004
          EVENT $FF, $0159

        CHECK_TALK Flag_LeifAltenaTalkCheck, Leif, Altena
          EVENT Flag_LeifAltenaTalk, $014C

        CHECK_TALK Flag_SeliphAltenaTalkCheck, Seliph, Altena
          EVENT Flag_SeliphAltenaTalk, $0150

        CHECK_TALK Flag_SeliphAltenaTalkCheck, Altena, Seliph
          EVENT Flag_SeliphAltenaTalk, $0150

        EC_16 Flag_Unknown41, Charlot, Hannibal
          EVENT Flag_Unknown14, $0153

        CHECK_UNIT_IN_AREA Flag_Unknown45, $FFFF, $242A, $373E, $00
          EC_NOP_00

        CHECK_UNITS_WITHIN_DISTANCE 47, Charlot, Hannibal, $01, $FF
          EC_NOP_00

        CHECK_UNIT_DIED Flag_AltenaDied, Altena, $FFFF
          EC_NOP_00

        CHECK_UNIT_DIED Flag_HannibalDied, Hannibal, $FFFF
          EC_NOP_00

        CHECK_UNIT_DIED Flag_TravantDied, Travant2, $FFFF
          EC_NOP_00

        CHECK_UNIT_DIED Flag_MusarDied, Musar, $FFFF
          EC_NOP_00

        CHECK_UNIT_DIED_TO Flag_Unknown39, Arion1, $FFFF
          COMBATANTS_STAY_ON_MAP

        CHECK_UNIT_DIED $FF, Arion1, $FFFF
          EVENT $FF, $0158

        CHECK_PLAYER_UNCAPTURED_IF_SEIZING Flag_Unknown46, Julia
          EC_NOP_00

        CHECK_TALK $FF, Febail, Patty
          EVENT $FF, $0202

        CHECK_TALK $FF, Asaello, Daisy
          EVENT $FF, $0229

        CHECK_TALK $FF, Seliph, Hannibal
          EVENT $FF, $0203

        CHECK_TALK $FF, Lene, Coirpre
          EVENT $FF, $0204

        CHECK_TALK $FF, Laylea, Charlot
          EVENT $FF, $022C

        CHECK_TALK $FF, OldFinn, Altena
          EVENT $FF, $0205

        CHECK_TALK $FF, Hannibal, Altena
          EVENT $FF, $0206

        EC_16 $FF, Patty, Coirpre
          EVENT $FF, $0207

        CHECK_TALK $FF, Julia, Seliph
          EVENT $FF, $0208

        VISIT_VILLAGE $FF, Jeanne, $0008
          EVENT $FF, $0166

        VISIT_VILLAGE $FF, Hermina, $0008
          EVENT $FF, $0166

        CHECK_ENTERING_CASTLE_MENU Flag_Unknown49, $0020, $0002
          EVENT $FF, $0167

        VISIT_VILLAGE $FF, AnyCharacter, $0005
          EVENT $FF, $015B

        VISIT_VILLAGE $FF, AnyCharacter, $0006
          EVENT $FF, $015C

        VISIT_VILLAGE $FF, AnyCharacter, $0007
          EVENT $FF, $015D

        VISIT_VILLAGE $FF, AnyCharacter, $0008
          EVENT $FF, $015E

        VISIT_VILLAGE $FF, AnyCharacter, $0009
          EVENT $FF, $015F

        VISIT_VILLAGE $FF, AnyCharacter, $000A
          EVENT $FF, $0160

        CHECK_UNITS_FIGHTING $FF, $0000, Altena, $FFFF, Arion1
          SET_PRECOMBAT_DIALOGUE Flag_AltenaArionBattleQuote, $B3A779, $0046

        CHECK_UNITS_FIGHTING $FF, $0000, Leif, $FFFF, Altena
          SET_PRECOMBAT_DIALOGUE Flag_LeifAltenaBattleQuote, $B0E2A8, $0046

        CHECK_UNITS_FIGHTING $FF, $0000, OldFinn, $FFFF, Altena
          SET_PRECOMBAT_DIALOGUE Flag_FinnAltenaBattleQuote, $B0E317, $0046

        CHECK_UNITS_FIGHTING $FF, $0000, Leif, $FFFF, Travant2
          SET_PRECOMBAT_DIALOGUE Flag_LeifTravantBattleQuote, $B0E3EC, $0046

        CHECK_UNITS_FIGHTING $FF, $0000, OldFinn, $FFFF, Travant2
          SET_PRECOMBAT_DIALOGUE Flag_FinnTravantBattleQuote, $B0E4F7, $0046

        CHECK_UNITS_FIGHTING $FF, $0000, Seliph, $FFFF, Arion1
          SET_PRECOMBAT_DIALOGUE Flag_SeliphArionBattleQuote, $B0E58E, $0046

        CHECK_UNITS_FIGHTING $FF, $0000, $FFFF, $FFFF, Altena
          SET_BATTLE_OR_DEATH_QUOTE Flag_AltenaBattleQuote, $B3AB56, $00

        CHECK_UNITS_FIGHTING $FF, $0000, $FFFF, $FFFF, Hannibal
          SET_BATTLE_OR_DEATH_QUOTE Flag_HannibalBattleQuote, $B3AB7A, $00

        CHECK_UNITS_FIGHTING $FF, $0000, $FFFF, $FFFF, Kanatz
          SET_BATTLE_OR_DEATH_QUOTE Flag_KanatzBattleQuote, $B3ABAE, $00

        CHECK_UNITS_FIGHTING $FF, $0000, $FFFF, $FFFF, Distler
          SET_BATTLE_OR_DEATH_QUOTE Flag_DistlerBattleQuote, $B3ABEE, $00

        CHECK_UNITS_FIGHTING $FF, $0000, $FFFF, $FFFF, Musar
          SET_BATTLE_OR_DEATH_QUOTE Flag_MusarBattleQuote, $B3AC14, $00

        CHECK_UNITS_FIGHTING $FF, $0000, $FFFF, $FFFF, Judah
          SET_BATTLE_OR_DEATH_QUOTE Flag_JudahBattleQuote, $B3AC45, $00

        CHECK_UNITS_FIGHTING $FF, $0000, $FFFF, $FFFF, Arion1
          SET_BATTLE_OR_DEATH_QUOTE Flag_ArionBattleQuote, $B3AC94, $00

        CHECK_UNITS_FIGHTING $FF, $0000, $FFFF, $FFFF, Travant2
          SET_BATTLE_OR_DEATH_QUOTE Flag_TravantBattleQuote, $B3ACCC, $00

        BREAK_ACTION_EVENT_CHECKS

        CHECK_FLAG_UNSET Flag_AltenaBattleQuote
          CHECK_FLAG_IN_LIST_SET [Flag_LeifAltenaBattleQuote, Flag_FinnAltenaBattleQuote]
            SET_FLAG Flag_AltenaBattleQuote
        BREAK_STATE_CHECKS

        CHECK_FLAG_UNSET Flag_TravantBattleQuote
          CHECK_FLAG_IN_LIST_SET [Flag_LeifTravantBattleQuote, Flag_FinnTravantBattleQuote]
            SET_FLAG Flag_TravantBattleQuote
        BREAK_STATE_CHECKS

        CHECK_FLAG_UNSET Flag_ArionBattleQuote
          CHECK_FLAG_IN_LIST_SET [Flag_AltenaArionBattleQuote, Flag_SeliphArionBattleQuote]
            SET_FLAG Flag_ArionBattleQuote
        BREAK_STATE_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR $01, $04, $01, $FFFF
          EVENT Flag_Unknown4, $0149
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR $01, $01, $01, $FFFF
          EVENT Flag_Unknown5, $014A
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR $02, $02, $00, $0000
          EVENT Flag_Unknown6, $014B
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR $FF, $04, $00, $0000
          CHECK_ALL_FLAGS_IN_LIST_SET [Flag_TravantDied, Flag_LeifAltenaTalk]
            EVENT Flag_Unknown8, $014D
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR $FF, $04, $00, $0000
          CHECK_FLAG_SET Flag_AltenaDied
            CHECK_FLAG_UNSET Flag_LeifAltenaTalk
              EVENT Flag_Unknown9, $014E
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR $FF, $01, $00, $0000
          CHECK_FLAG_IN_LIST_SET [Flag_LeifAltenaTalk, Flag_Unknown9]
            CHECK_FLAG_UNSET Flag_HannibalDied
              CHECK_FLAG_UNSET Flag_Unknown0
                EVENT Flag_Unknown10, $014F
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_FLAG_SET Flag_Unknown0
          CHECK_FLAG_UNSET Flag_Unknown14
            EVENT Flag_Unknown12, $0151
        BREAK_STATE_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR $FF, $03, $00, $0000
          CHECK_FLAG_SET Flag_Unknown0
            EVENT Flag_Unknown15, $0154
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR $FF, $04, $00, $0000
          CHECK_FLAG_SET Flag_Unknown2
            EVENT Flag_Unknown17, $0156
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR $FF, $04, $00, $0000
          CHECK_ALL_FLAGS_IN_LIST_SET [Flag_Unknown45, Flag_Unknown17]
            CHECK_FLAG_UNSET Flag_Unknown39
              EVENT Flag_Unknown18, $0157
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_ALL_FLAGS_IN_LIST_SET [Flag_Unknown2, Flag_Unknown14, Flag_Unknown47]
          EVENT Flag_Unknown20, $0165
        BREAK_STATE_CHECKS

        CHECK_FLAG_SET Flag_Unknown47
          CHECK_FLAG_UNSET Flag_Unknown20
            UNSET_FLAG Flag_Unknown47
        BREAK_STATE_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR $FF, $00, $00, $0000
          CLEAR_TALK_IF_ONE_MARRIED aUnknown86F861
        BREAK_TURN_EVENT_CHECKS

        END_CHAPTER_EVENTS

      aUnknown86F861 ; 86/F861

        .byte Altena, OldFinn
        .byte Altena, Hannibal
        .byte Patty, Coirpre
        .byte Daisy, Coirpre
        .byte Patty, Charlot
        .byte Daisy, Charlot
        .word $FFFF

    .endsection Chapter09EventsSection

    .section Chapter09EventDataSection

      aChapter09EventData ; 86/F86F

        .structChapterEventData aChapter09LocationData, aChapter09MapChangeData, aUnknown86F92D, aChapter09TalkEvents, None

      aChapter09LocationData ; 86/F879

        .byte size(aChapter09LocationData._Entries) / size(word)

        _Entries .include "../TABLES/CHAPTER/Chapter09LocationData.csv.asm"

      aChapter09MeathCastle ; 86/F890

        .structChapterCastleLocationEntry Ch09_Meath, MeathName, [52, 2], $FC, $F8D6

      aChapter09KapathogiaCastle ; 86/F898

        .structChapterCastleLocationEntry Ch09_Kapathogia, KapathogiaName, [32, 17], $FC, None

      aChapter09LutheciaCastle ; 86/F8A0

        .structChapterCastleLocationEntry Ch09_Luthecia, LutheciaName, [10, 27], $FC, None

      aChapter09GrutiaCastle ; 86/F8A8

        .structChapterCastleLocationEntry Ch09_Grutia, GrutiaName, [18, 54], $FC, None

      aChapter09ThraciaCastle ; 86/F8B0

        .structChapterCastleLocationEntry Ch09_Thracia, ThraciaName, [52, 41], $00, None

      aChapter09Village1 ; 86/F8B8

        .structChapterVillageLocationEntry Ch09_Village1, [12, 7]

      aChapter09Village2 ; 86/F8BD

        .structChapterVillageLocationEntry Ch09_Village2, [12, 5]

      aChapter09Village3 ; 86/F8C2

        .structChapterVillageLocationEntry Ch09_Village3, [12, 3]

      aChapter09Village4 ; 86/F8C7

        .structChapterVillageLocationEntry Ch09_Village4, [9, 7]

      aChapter09VillageBarrierRing ; 86/F8CC

        .structChapterVillageLocationEntry Ch09_VillageBarrierRing, [9, 5]

      aChapter09Village5 ; 86/F8D1

        .structChapterVillageLocationEntry Ch09_Village5, [9, 3]

      aChapter09ShopData ; 86/F8D6

        .byte PI_SteelSword3
        .byte PI_SilverSword2
        .byte PI_SlimSword3
        .byte PI_EarthSword
        .byte PI_Wingclipper1
        .byte PI_SilverLance1
        .byte PI_SilverLance2
        .byte PI_Javelin1
        .byte PI_Javelin2
        .byte PI_SilverBow1
        .byte PI_Elfire
        .byte PI_Elwind
        .byte PI_WarpStaff
        .byte PI_RestoreStaff
        .byte PI_Wind2
        .word $FFFF

      aChapter09MapChangeData ; 86/F8E7

        .structChapterMapChangeEntry Chapter09, 43, [5, 6], aChapter09MapChangeTopLeftRampart
        .structChapterMapChangeEntry Chapter09, 43, [18, 51], aChapter09MapChangeGrutiaTopRampart
        .structChapterMapChangeEntry Chapter09, 43, [17, 57], aChapter09MapChangeGrutiaBottomRampart
        .structChapterMapChangeEntry Chapter09, 44, [24, 54], aChapter09MapChangeGrutiaRightRampart
        .word $FFFF

      aChapter09MapChangeTopLeftRampart ; 86/F905

        .byte 2
        .byte 2

        .word $0069, $00AE
        .word $033A, $033B

      aChapter09MapChangeGrutiaTopRampart ; 86/F90F

        .byte 1
        .byte 2

        .word $0122
        .word $0362

      aChapter09MapChangeGrutiaBottomRampart ; 86/F915

        .byte 2
        .byte 3

        .word $01BC, $05BD
        .word $01DC, $06B7
        .word $00AF, $0221

      aChapter09MapChangeGrutiaRightRampart ; 86/F923

        .byte 1
        .byte 4

        .word $0A30
        .word $0650
        .word $04AD
        .word $08AD

      aUnknown86F92D ; 86/F92D

        .word <>aUnknown86F931
        .word <>aUnknown86F941

      aUnknown86F931 ; 86/F931

        .word $021E
        .word $0220
        .word $0221
        .word $0223
        .word $0224
        .word $0225
        .word $0226
        .word $FFFF

      aUnknown86F941 ; 86/F941

        .word $021F
        .word $0220
        .word $0222
        .word $0223
        .word $0224
        .word $0225
        .word $0226
        .word $FFFF

      aChapter09TalkEvents ; 86/F951

        .structChapterTalkEventEntry Chapter09, 40, Leif, Altena
        .structChapterTalkEventEntry Chapter09, 41, Coirpre, Hannibal
        .structChapterTalkEventEntry Chapter09, 41, Charlot, Hannibal
        .structChapterTalkEventEntry Chapter09, 42, Seliph, Altena
        .structChapterTalkEventEntry Chapter09, 42, Altena, Seliph
        .word $FFFF

      aFactionGroupData31 ; 86/F97B

        .structFactionGroupData FactionSeliph, BattleHUDColorBlue, BattleBannerChalphy, None, aFactionGroupData31._Locations, None

        _Locations ; 86/F984
        .word Ch09_Meath
        .word $FFFF

      aFactionGroupData32 ; 86/F988

        .structFactionGroupData FactionKapathogia, BattleHUDColorDarkRed, BattleBannerThracia, None, aFactionGroupData32._Locations, aFactionGroupData32._GroupAI

        _Locations ; 86/F991
        .word Ch09_Kapathogia
        .word $FFFF

        _GroupAI ; 86/F995
        .long aFactionGroup32AI1
        .long aFactionGroup32AI2
        .word $FFFF

      aFactionGroupData33 ; 86/F99D

        .structFactionGroupData FactionLuthecia, BattleHUDColorDarkRed, BattleBannerThracia, None, aFactionGroupData33._Locations, aFactionGroupData33._GroupAI

        _Locations ; 86/F9A6
        .word Ch09_Luthecia
        .word $FFFF

        _GroupAI ; 86/F9AA
        .long aFactionGroup33AI1
        .long aFactionGroup33AI2
        .long aFactionGroup33AI3
        .word $FFFF

      aFactionGroupData34 ; 86/F9B5

        .structFactionGroupData FactionGrutia, BattleHUDColorDarkRed, BattleBannerThracia, None, aFactionGroupData34._Locations, aFactionGroupData34._GroupAI

        _Locations ; 86/F9BE
        .word Ch09_Grutia
        .word $FFFF

        _GroupAI ; 86/F9C2
        .long aFactionGroup34AI1
        .long aFactionGroup34AI2
        .long aFactionGroup34AI3
        .long aFactionGroup34AI4
        .word $FFFF

      aFactionGroupData35 ; 86/F9D0

        .structFactionGroupData FactionThracia, BattleHUDColorDarkRed, BattleBannerThracia, None, aFactionGroupData35._Locations, aFactionGroupData35._GroupAI

        _Locations ; 86/F9D9
        .word Ch09_Thracia
        .word $FFFF

        _GroupAI ; 86/F9DD
        .long aFactionGroup35AI1
        .long aFactionGroup35AI2
        .long aFactionGroup35AI3
        .long aFactionGroup35AI4
        .long aFactionGroup35AI5
        .long aFactionGroup35AI6
        .long aFactionGroup35AI7
        .word $FFFF

      aFactionGroup32AI1 ; 86/F9F4

        AI_SET_FORMATION $02, $01
        AI_SET_IGNORED_GENERATION_ID GEN_ID_Charlot_Coirpre
        AI_JUMP_IF_CHAPTER_EVENT_FLAG_SET Chapter09, 10, +

          AI_0A
          AI_END

        +
        AI_CHARGE_IF_LEADERLESS_BELOW_UNIT_RATIO floor(0.3 * 256)
        AI_CHARGE_IF_LEADER_BELOW_THRESHOLD floor(0.3 * 256), 1 * 256
        AI_06 Ch09_Meath, $01
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup32AI2 ; 86/FA0C

        AI_07 Ch09_Kapathogia, $04
        AI_END

      aFactionGroup33AI1 ; 86/FA10

        AI_07 Ch09_Luthecia, $04
        AI_END

      aFactionGroup33AI2 ; 86/FA14

        AI_0A
        AI_END

      aFactionGroup33AI3 ; 86/FA16

        AI_TARGET_REMAINING_VILLAGES
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup34AI1 ; 86/FA19

        AI_END

      aFactionGroup34AI2 ; 86/FA1A

        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup34AI3 ; 86/FA1C

        AI_0B
        AI_END

      aFactionGroup34AI4 ; 86/FA1E

        AI_07 Ch09_Grutia, $04
        AI_END

      aFactionGroup35AI1 ; 86/FA22

        MODIFY_GROUP_LEADER_FIELD_MOVEMENT 0
        AI_SET_FORMATION $03, $00
        AI_JUMP_IF_CHAPTER_EVENT_FLAG_SET Chapter09, 8, ++

          AI_JUMP_IF_CHAPTER_EVENT_FLAG_SET Chapter09, 7, +

            AI_06 Ch09_Meath, $01
            AI_TARGET_ALL_FOES
            AI_END

          +
          AI_12
          AI_END

        +
        AI_02 $03
        AI_INTERACT_WITH_UNIT Seliph, $0C
        AI_END

      aFactionGroup35AI2 ; 86/FA41

        MODIFY_GROUP_LEADER_FIELD_MOVEMENT 0
        AI_SET_FORMATION $03, $00
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup35AI3 ; 86/FA48

        MODIFY_GROUP_LEADER_FIELD_MOVEMENT 0
        AI_SET_FORMATION $03, $00
        AI_CHARGE_IF_LEADERLESS_BELOW_UNIT_RATIO floor(0.3 * 256)
        AI_CHARGE_IF_LEADER_BELOW_THRESHOLD floor(0.3 * 256), 1 * 256
        AI_06 Ch09_Luthecia, $01
        AI_06 Ch09_Kapathogia, $01
        AI_06 Ch09_Meath, $01
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup35AI4 ; 86/FA5E

        MODIFY_GROUP_LEADER_FIELD_MOVEMENT 0
        AI_SET_FORMATION $03, $00
        AI_CHARGE_IF_LEADERLESS_BELOW_UNIT_RATIO floor(0.3 * 256)
        AI_CHARGE_IF_LEADER_BELOW_THRESHOLD floor(0.3 * 256), 1 * 256
        AI_06 Ch09_Kapathogia, $01
        AI_06 Ch09_Meath, $01
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup35AI5 ; 86/FA71

        MODIFY_GROUP_LEADER_FIELD_MOVEMENT 0
        AI_SET_FORMATION $03, $00
        AI_CHARGE_IF_LEADERLESS_BELOW_UNIT_RATIO floor(0.3 * 256)
        AI_CHARGE_IF_LEADER_BELOW_THRESHOLD floor(0.3 * 256), 1 * 256
        AI_06 Ch09_Meath, $01
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup35AI6 ; 86/FA81

        MODIFY_GROUP_LEADER_FIELD_MOVEMENT 0
        AI_CHARGE_IF_LEADERLESS_BELOW_UNIT_RATIO floor(0.3 * 256)
        AI_CHARGE_IF_LEADER_BELOW_THRESHOLD floor(0.3 * 256), 1 * 256
        AI_SET_FORMATION $03, $00
        AI_JUMP_IF_CHAPTER_EVENT_FLAG_SET Chapter09, 45, +

          AI_0B
          AI_END

        +
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup35AI7 ; 86/FA96

        AI_07 Ch09_Thracia, $04
        AI_END

    .endsection Chapter09EventDataSection
