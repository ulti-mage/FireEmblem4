
    .weak
      
      Flag_Unknown0                     :=  0
      Flag_Unknown1                     :=  1

      Flag_Unknown3                     :=  3
      Flag_Unknown4                     :=  4
      Flag_Unknown5                     :=  5
      Flag_Unknown6                     :=  6
      Flag_Unknown7                     :=  7
      Flag_Unknown8                     :=  8

      Flag_Unknown11                    := 11
      Flag_Unknown12                    := 12
      Flag_Unknown13                    := 13

      Flag_Unknown16                    := 16

      Flag_IshtarBattleQuote            := 23
      Flag_FebailBattleQuote            := 24
      Flag_PattyFebailBattleQuote       := 25
      Flag_MuhammadBattleQuote          := 26
      Flag_OvoBattleQuote               := 27
      Flag_BanbaBattleQuote             := 28
      Flag_Unknown29                    := 29
      Flag_FotlaBattleQuote             := 30
      Flag_Unknown31                    := 31
      Flag_EriuBattleQuote              := 32
      Flag_Unknown33                    := 33
      Flag_BloomBattleQuote             := 34
      Flag_CoulterBattleQuote           := 35
      Flag_MaykovBattleQuote            := 36

      Flag_Unknown40                    := 40
      Flag_Unknown41                    := 41
      Flag_Unknown42                    := 42
      Flag_Unknown43                    := 43
      Flag_Unknown44                    := 44
      Flag_Unknown45                    := 45
      Flag_Unknown46                    := 46
      Flag_Unknown47                    := 47
      Flag_Unknown48                    := 48
      Flag_IshtarDied                   := 49

      Flag_Unknown51                    := 51
      Flag_Unknown52                    := 52

      Flag_Unknown54                    := 54
      Flag_Unknown55                    := 55
      Flag_Unknown56                    := 56
      Flag_Unknown57                    := 57
      Flag_AmidOnTree                   := 58
      Flag_LindaOnTree                  := 59
      Flag_FebailBloomBattleQuote       := 60
      Flag_TineIshtarBattleQuote        := 61
      Flag_TineBloomBattleQuote         := 62
      Flag_SeliphBloomBattleQuote       := 63
      Flag_Unknown64                    := 64

    .endweak

    .section Chapter08EventsSection

      aChapter08EventHeader ; 86/EE73

        .word Chapter08
        .long aChapter08OpeningEvent
        .long aChapter08MapEvents

      aChapter08OpeningEvent ; B2/EE7B

        REGISTER_UNITGROUP_MAP_SPRITES $25

        LOAD_FACTION_GROUP 0, FG_Ch08Seliph
        LOAD_FACTION_GROUP 1, FG_Ch08Connacht
        LOAD_FACTION_GROUP 2, FG_Ch08Munster1
        LOAD_FACTION_GROUP 3, FG_Ch08Meath

        macroSetFactionsEnemies [0, 1]
        macroSetFactionsEnemies [0, 2]
        macroSetFactionsEnemies [0, 3]
        macroSetFactionsAllies  [1, 2]
        macroSetFactionsAllies  [1, 3]
        macroSetFactionsAllies  [2, 3]

        DEPLOY_UNIT_GROUP $25

        CHECK_UNIT_ALIVE Leif
          SET_FLAG Flag_Unknown44
        BREAK_STATE_CHECKS

        CHECK_UNIT_ALIVE OldFinn
          SET_FLAG Flag_Unknown45
        BREAK_STATE_CHECKS

        CHECK_UNIT_ALIVE Nanna
          SET_FLAG Flag_Unknown46
        BREAK_STATE_CHECKS

        CHECK_UNIT_ALIVE Jeanne
          SET_FLAG Flag_Unknown64
        BREAK_STATE_CHECKS

        EVENT $FF, $0124

        END_CHAPTER_EVENTS

      aChapter08MapEvents ; 86/EEC9

        CHECK_SEIZING_CASTLE Flag_Unknown0, $0000, $0002
          EVENT $FF, $012B

        CHECK_SEIZING_CASTLE Flag_Unknown1, $0000, $0004
          EVENT $FF, $0130

        CHECK_UNIT_DIED $FF, $FFFF, $0000
          SET_PERMANENT_FLAG 89

        CHECK_UNIT_IN_AREA Flag_Unknown40, Altena, $282E, $282E, $FF
          EC_NOP_00

        CHECK_UNIT_IN_AREA Flag_Unknown51, Leif, $2631, $2A34, $FF
          EVENT $FF, $0143

        CHECK_UNIT_IN_AREA Flag_Unknown51, Leif, $2829, $2829, $FF
          EVENT $FF, $0143

        CHECK_UNIT_IN_AREA Flag_Unknown52, Fee, $2F11, $3413, $FF
          EVENT $FF, $0144

        CHECK_UNITS_WITHIN_DISTANCE Flag_Unknown54, Muirne, Seliph, $01, $FF
          EC_NOP_00

        CHECK_UNIT_IN_AREA Flag_LindaOnTree, Linda, $2C14, $2C14, $FF
          EVENT 56, $0146

        CHECK_UNIT_IN_AREA Flag_AmidOnTree, Amid, $2619, $2619, $FF
          EC_NOP_00

        EC_16 Flag_Unknown41, Seliph, Ced
          EVENT Flag_Unknown16, $0132

        EC_16 Flag_Unknown42, Patty, Febail
          EVENT $FF, $0131

        EC_16 Flag_Unknown42, Daisy, Asaello
          EVENT $FF, $0131

        CHECK_UNIT_DIED Flag_Unknown43, Altena, $FFFF
          SET_PERMANENT_FLAG 37

        CHECK_UNIT_DIED_TO $FF, Ishtar, $FFFF
          COMBATANTS_STAY_ON_MAP

        CHECK_UNIT_DIED Flag_IshtarDied, Ishtar, $FFFF
          EVENT Flag_Unknown48, $0139

        CHECK_PLAYER_UNCAPTURED_IF_SEIZING Flag_Unknown47, Julia
          EC_NOP_00

        EC_16 $FF, Febail, Seliph
          EVENT $FF, $01F9

        CHECK_TALK $FF, Hermina, Hawk
          EVENT $FF, $01FA

        CHECK_TALK $FF, Fee, Ced
          EVENT $FF, $01FB

        CHECK_TALK $FF, Nanna, Ares
          EVENT $FF, $01FC

        CHECK_TALK $FF, Ced, Seliph
          EVENT $FF, $01FD

        EC_16 $FF, Seliph, Tine
          EVENT $FF, $01FE

        CHECK_TALK $FF, Julia, Seliph
          EVENT $FF, $01FF

        EC_16 $FF, Arthur, Fee
          EVENT $FF, $0200

        CHECK_TALK $FF, OldFinn, Leif
          EVENT $FF, $0201

        RESCUE_CIVILIAN FlagAlways, AnyCharacter, 0
          EVENT $FF, $013A

        RESCUE_CIVILIAN FlagAlways, AnyCharacter, 1
          EVENT $FF, $013B

        RESCUE_CIVILIAN FlagAlways, AnyCharacter, 2
          EVENT $FF, $013C

        RESCUE_CIVILIAN FlagAlways, AnyCharacter, 3
          EVENT $FF, $013D

        RESCUE_CIVILIAN FlagAlways, AnyCharacter, 4
          EVENT $FF, $013E

        RESCUE_CIVILIAN FlagAlways, AnyCharacter, 5
          EVENT $FF, $013F

        VISIT_VILLAGE $FF, Asaello, $0008
          EVENT $FF, $0142

        VISIT_VILLAGE $FF, AnyCharacter, $0005
          EVENT $FF, $0133

        VISIT_VILLAGE $FF, AnyCharacter, $0006
          EVENT $FF, $0134

        VISIT_VILLAGE $FF, AnyCharacter, $0007
          EVENT $FF, $0135

        VISIT_VILLAGE $FF, AnyCharacter, $0008
          EVENT $FF, $0136

        VISIT_VILLAGE $FF, AnyCharacter, $0009
          EVENT $FF, $0137

        VISIT_VILLAGE $FF, AnyCharacter, $000A
          EVENT $FF, $0138

        CHECK_SPECIAL_CRIT $FF, $0003, Banba2
          SET_BATTLE_OR_DEATH_QUOTE Flag_Unknown29, $8FDEAE, $00

        CHECK_SPECIAL_CRIT $FF, $0003, Fotla2
          SET_BATTLE_OR_DEATH_QUOTE Flag_Unknown31, $8FDEF4, $00

        CHECK_SPECIAL_CRIT $FF, $0003, Eriu2
          SET_BATTLE_OR_DEATH_QUOTE Flag_Unknown33, $8FDF39, $00

        CHECK_UNITS_FIGHTING $FF, $0000, Patty, $FFFF, Febail
          SET_BATTLE_OR_DEATH_QUOTE Flag_PattyFebailBattleQuote, $8FDE4E, $00

        CHECK_UNITS_FIGHTING $FF, $0000, Daisy, $FFFF, Asaello
          SET_BATTLE_OR_DEATH_QUOTE Flag_PattyFebailBattleQuote, $8FDE4E, $00

        CHECK_UNITS_FIGHTING $FF, $0000, Febail, $FFFF, Bloom2
          SET_PRECOMBAT_DIALOGUE Flag_FebailBloomBattleQuote, $B0E09C, $0046

        CHECK_UNITS_FIGHTING $FF, $0000, Asaello, $FFFF, Bloom2
          SET_PRECOMBAT_DIALOGUE Flag_FebailBloomBattleQuote, $B0E09C, $0046

        CHECK_UNITS_FIGHTING $FF, $0000, Tine, $FFFF, Ishtar
          SET_PRECOMBAT_DIALOGUE Flag_TineIshtarBattleQuote, $B0E115, $0046

        CHECK_UNITS_FIGHTING $FF, $0000, Linda, $FFFF, Ishtar
          SET_PRECOMBAT_DIALOGUE Flag_TineIshtarBattleQuote, $B0E115, $0046

        CHECK_UNITS_FIGHTING_1TO2RANGE $FF, $0000, Tine, $FFFF, Bloom2
          SET_PRECOMBAT_DIALOGUE Flag_TineBloomBattleQuote, $B0E181, $0046

        CHECK_UNITS_FIGHTING_1TO2RANGE $FF, $0000, Linda, $FFFF, Bloom2
          SET_PRECOMBAT_DIALOGUE Flag_TineBloomBattleQuote, $B0E181, $0046

        CHECK_UNITS_FIGHTING_1TO2RANGE $FF, $0000, Seliph, $FFFF, Bloom2
          SET_PRECOMBAT_DIALOGUE Flag_SeliphBloomBattleQuote, $B0E1E8, $0046

        CHECK_UNITS_FIGHTING $FF, $0000, $FFFF, $FFFF, Febail
          SET_BATTLE_OR_DEATH_QUOTE Flag_FebailBattleQuote, $8FDE2E, $00

        CHECK_UNITS_FIGHTING $FF, $0000, $FFFF, $FFFF, Asaello
          SET_BATTLE_OR_DEATH_QUOTE Flag_FebailBattleQuote, $8FDE2E, $00

        CHECK_UNITS_FIGHTING $FF, $0000, $FFFF, $FFFF, Ishtar
          SET_BATTLE_OR_DEATH_QUOTE Flag_IshtarBattleQuote, $8FDE09, $00

        CHECK_UNITS_FIGHTING $FF, $0000, $FFFF, $FFFF, Muhammad
          SET_BATTLE_OR_DEATH_QUOTE Flag_MuhammadBattleQuote, $8FDE71, $00

        CHECK_UNITS_FIGHTING $FF, $0000, $FFFF, $FFFF, Ovo
          SET_BATTLE_OR_DEATH_QUOTE Flag_OvoBattleQuote, $8FDE8B, $00

        CHECK_UNITS_FIGHTING $FF, $0000, $FFFF, $FFFF, Banba2
          SET_BATTLE_OR_DEATH_QUOTE Flag_BanbaBattleQuote, $8FDEDB, $00

        CHECK_UNITS_FIGHTING $FF, $0000, $FFFF, $FFFF, Fotla2
          SET_BATTLE_OR_DEATH_QUOTE Flag_FotlaBattleQuote, $8FDF21, $00

        CHECK_UNITS_FIGHTING $FF, $0000, $FFFF, $FFFF, Eriu2
          SET_BATTLE_OR_DEATH_QUOTE Flag_EriuBattleQuote, $8FDF68, $00

        CHECK_UNITS_FIGHTING $FF, $0000, $FFFF, $FFFF, Bloom2
          SET_BATTLE_OR_DEATH_QUOTE Flag_BloomBattleQuote, $8FDF83, $00

        CHECK_UNITS_FIGHTING $FF, $0000, $FFFF, $FFFF, Coulter
          SET_BATTLE_OR_DEATH_QUOTE Flag_CoulterBattleQuote, $8FDFAF, $00

        CHECK_UNITS_FIGHTING $FF, $0000, $FFFF, $FFFF, Maykov
          SET_BATTLE_OR_DEATH_QUOTE Flag_MaykovBattleQuote, $8FDFD0, $00

        BREAK_ACTION_EVENT_CHECKS

        CHECK_FLAG_UNSET Flag_BloomBattleQuote
          CHECK_FLAG_IN_LIST_SET [Flag_FebailBloomBattleQuote, Flag_TineBloomBattleQuote, Flag_SeliphBloomBattleQuote]
            SET_FLAG Flag_BloomBattleQuote
        BREAK_STATE_CHECKS

        CHECK_FLAG_UNSET Flag_IshtarBattleQuote
          CHECK_FLAG_SET Flag_TineIshtarBattleQuote
            SET_FLAG Flag_IshtarBattleQuote
        BREAK_STATE_CHECKS

        CHECK_FLAG_UNSET Flag_FebailBattleQuote
          CHECK_FLAG_SET Flag_PattyFebailBattleQuote
            SET_FLAG Flag_FebailBattleQuote
        BREAK_STATE_CHECKS

        CHECK_FLAG_UNSET Flag_BanbaBattleQuote
          CHECK_FLAG_SET Flag_Unknown29
            SET_FLAG Flag_BanbaBattleQuote
        BREAK_STATE_CHECKS

        CHECK_FLAG_UNSET Flag_FotlaBattleQuote
          CHECK_FLAG_SET Flag_Unknown31
            SET_FLAG Flag_FotlaBattleQuote
        BREAK_STATE_CHECKS

        CHECK_FLAG_UNSET Flag_EriuBattleQuote
          CHECK_FLAG_SET Flag_Unknown33
            SET_FLAG Flag_EriuBattleQuote
        BREAK_STATE_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR $01, $01, $01, $FFFF
          EVENT Flag_Unknown3, $0125
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR $01, $01, $02, $FFFF
          EVENT Flag_Unknown4, $0126
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR $01, $01, $07, $FFFF
          EVENT Flag_Unknown5, $0127
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR $03, $01, $00, $0000
          EVENT Flag_Unknown6, $0128
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR $05, $01, $00, $0000
          EVENT Flag_Unknown7, $0129
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR $0C, $01, $00, $0000
          CHECK_UNIT_ALIVE Ishtar
            EVENT Flag_Unknown8, $012A
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR $FF, $02, $00, $0000
          CHECK_FLAG_SET 0
            EVENT Flag_Unknown11, $012D
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR $FF, $03, $03, $FFFF
          CHECK_FLAG_SET 40
            EVENT Flag_Unknown12, $012E
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR $FF, $03, $00, $0000
          CHECK_FLAG_SET 16
            CHECK_UNIT_ALIVE Maykov
              EVENT Flag_Unknown13, $012F
          BREAK_STATE_CHECKS
        BREAK_TURN_EVENT_CHECKS

        CHECK_UNITS_MARRIED $19, $FF
          SET_FLAG Flag_Unknown55
        BREAK_STATE_CHECKS

        CHECK_UNITS_MARRIED $2A, $FF
          SET_FLAG Flag_Unknown55
        BREAK_STATE_CHECKS

        CHECK_FLAG_SET 11
          CHECK_FLAG_SET Flag_Unknown54
            EC_39 89
              EVENT Flag_Unknown55, $0145
        BREAK_STATE_CHECKS

        CHECK_FLAG_SET Flag_Unknown54
          CHECK_FLAG_UNSET Flag_Unknown55
            UNSET_FLAG Flag_Unknown54
        BREAK_STATE_CHECKS

        CHECK_ALL_FLAGS_IN_LIST_SET [Flag_Unknown56, Flag_AmidOnTree]
          EVENT Flag_Unknown57, $0147
        BREAK_STATE_CHECKS

        CHECK_FLAG_SET Flag_AmidOnTree
          CHECK_FLAG_UNSET Flag_Unknown57
            UNSET_FLAG Flag_AmidOnTree
        BREAK_STATE_CHECKS

        CHECK_TURN_PHASE_AI_ACTOR $FF, $00, $00, $0000
          CLEAR_TALK_IF_ONE_MARRIED aUnknown86F2D7
        BREAK_TURN_EVENT_CHECKS

        END_CHAPTER_EVENTS

      aUnknown86F2D7 ; 86/F2D7

        .byte Fee, Arthur
        .byte Hermina, Arthur
        .byte Fee, Amid
        .byte Hermina, Amid
        .byte Tine, Seliph
        .byte Linda, Seliph
        .word $FFFF

    .endsection Chapter08EventsSection

    .section Chapter08EventDataSection

      aChapter08EventData ; 86/F2E5

        .structChapterEventData aChapter08LocationData, aChapter08MapChangeData, aUnknown86F370, aChapter08TalkEvents, None

      aChapter08LocationData ; 86/F2EF

        .byte size(aChapter08LocationData._Entries) / size(word)

        _Entries .include "../TABLES/CHAPTER/Chapter08LocationData.csv.asm"

      aChapter08UlsterCastle ; 86/F306

        .structChapterCastleLocationEntry Ch08_Ulster, UlsterName, [3, 35], $FC, aChapter08ShopData

      aChapter08LeonsterCastle ; 86/F30E

        .structChapterCastleLocationEntry Ch08_Leonster, LeonsterName, [8, 6], $FC, None

      aChapter08ConnachtCastle ; 86/F316

        .structChapterCastleLocationEntry Ch08_Connacht, ConnachtName, [49, 8], $FC, None

      aChapter08MunsterCastle ; 86/F31E

        .structChapterCastleLocationEntry Ch08_Munster, MunsterName, [44, 28], $FC, None

      aChapter08MeathCastle ; 86/F326

        .structChapterCastleLocationEntry Ch08_Meath, MeathName, [37, 57], $00, None

      aChapter08Village1 ; 86/F32E

        .structChapterVillageLocationEntry Ch08_Village1, [26, 22]

      aChapter08VillagePowerRing ; 86/F333

        .structChapterVillageLocationEntry Ch08_VillagePowerRing, [33, 2]

      aChapter08Village2 ; 86/F338

        .structChapterVillageLocationEntry Ch08_Village2, [39, 23]

      aChapter08Village3 ; 86/F33D

        .structChapterVillageLocationEntry Ch08_Village3, [46, 6]

      aChapter08Village4 ; 86/F342

        .structChapterVillageLocationEntry Ch08_Village4, [56, 28]

      aChapter08VillageThiefBand ; 86/F347

        .structChapterVillageLocationEntry Ch08_VillageThiefBand, [53, 44]

      aChapter08ShopData ; 86/F34C

        .byte PI_SteelSword2
        .byte PI_SlimSword1
        .byte PI_ThunderSword
        .byte PI_Armorslayer1
        .byte PI_SteelLance1
        .byte PI_SteelLance2
        .byte PI_SteelLance3
        .byte PI_SilverAxe
        .byte PI_IronBow1
        .byte PI_SteelBow2
        .byte PI_Fire1
        .byte PI_Thunder2
        .byte PI_Wind1
        .byte PI_MendStaff1
        .byte PI_SilenceStaff

        .byte PI_IronSword6
        .byte PI_IronLance4
        .byte PI_IronBow2
        .byte PI_Light1
        .byte PI_HealStaff3
        .byte PI_MendStaff3
        .word $FFFF

      aChapter08MapChangeData ; 86/F363

        .structChapterMapChangeEntry Chapter08, 50, [49, 16], aChapter08MapChangeConnachtBridge
        .word $FFFF

      aChapter08MapChangeConnachtBridge ; 86/F36C

        .byte 1
        .byte 1

        .word $00BE

      aUnknown86F370 ; 86/F370

        .word <>aUnknown86F374
        .word <>aUnknown86F384

      aUnknown86F374 ; 86/F374

        .word $0215
        .word $0216
        .word $0217
        .word $0218
        .word $021A
        .word $021B
        .word $021C
        .word $FFFF

      aUnknown86F384 ; 86/F384

        .word $0215
        .word $0216
        .word $0217
        .word $0219
        .word $021A
        .word $021B
        .word $021D
        .word $FFFF

      aChapter08TalkEvents ; 86/F394

        .structChapterTalkEventEntry Chapter08, 41, Seliph, Ced, 0
        .structChapterTalkEventEntry Chapter08, 41, Seliph, Hawk, 0
        .structChapterTalkEventEntry Chapter08, 42, Patty, Febail, 0
        .structChapterTalkEventEntry Chapter08, 42, Daisy, Asaello, 0
        .word $FFFF

      aFactionGroupData2D ; 86/F3B6

        .structFactionGroupData FactionSeliph, BattleHUDColorBlue, BattleBannerChalphy, None, aFactionGroupData2D._Locations, None

        _Locations ; 86/F3BF
        .word Ch08_Ulster
        .word Ch08_Leonster
        .word $FFFF

      aFactionGroupData2E ; 86/F3C5

        .structFactionGroupData FactionConnacht, BattleHUDColorBrown, BattleBannerFreege, None, aFactionGroupData2E._Locations, aFactionGroupData2E._GroupAI

        _Locations ; 86/F3CE
        .word Ch08_Connacht
        .word $FFFF

        _GroupAI ; 86/F3D2
        .long aFactionGroup2EAI1
        .long aFactionGroup2EAI2
        .long aFactionGroup2EAI3
        .long aFactionGroup2EAI4
        .long aFactionGroup2EAI5
        .long aFactionGroup2EAI6
        .long aFactionGroup2EAI7
        .long aFactionGroup2EAI8
        .word $FFFF

      aFactionGroupData2F ; 86/F3EC

        .structFactionGroupData FactionMunster, BattleHUDColorBrown, BattleBannerFreege, None, aFactionGroupData2F._Locations, aFactionGroupData2F._GroupAI

        _Locations ; 86/F3F5
        .word Ch08_Munster
        .word $FFFF

        _GroupAI ; 86/F3F9
        .long aFactionGroup2FAI1
        .long aFactionGroup2FAI2
        .long aFactionGroup2FAI3
        .word $FFFF

      aFactionGroupData46 ; 86/F404

        .structFactionGroupData FactionMunster, BattleHUDColorBrown, BattleBannerSilesse, None, aFactionGroupData46._Locations, aFactionGroupData46._GroupAI

        _Locations ; 86/F40D
        .word Ch08_Munster
        .word $FFFF

        _GroupAI ; 86/F411
        .long aFactionGroup2FAI1
        .long aFactionGroup2FAI2
        .long aFactionGroup2FAI3
        .word $FFFF

      aFactionGroupData30 ; 86/F41C

        .structFactionGroupData FactionMeath, BattleHUDColorBrown, BattleBannerThracia, None, aFactionGroupData30._Locations, aFactionGroupData30._GroupAI

        _Locations ; 86/F425
        .word Ch08_Meath
        .word $FFFF

        _GroupAI ; 86/F429
        .long aFactionGroup30AI1
        .long aFactionGroup30AI2
        .long aFactionGroup30AI3
        .long aFactionGroup30AI4
        .long aFactionGroup30AI5
        .long aFactionGroup30AI6
        .long aFactionGroup30AI7
        .long aFactionGroup30AI8
        .word $FFFF

      aFactionGroup2EAI1 ; 86/F443

        AI_SET_FORMATION $0C, $03
        AI_CHARGE_IF_LEADERLESS_BELOW_UNIT_RATIO floor(0.3 * 256)
        AI_CHARGE_IF_LEADER_BELOW_THRESHOLD floor(0.3 * 256), 1 * 256
        AI_06 Ch08_Ulster, $01
        AI_06 Ch08_Leonster, $01
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup2EAI2 ; 86/F454

        AI_SET_FORMATION $08, $03
        AI_CHARGE_IF_LEADERLESS_BELOW_UNIT_RATIO floor(0.3 * 256)
        AI_CHARGE_IF_LEADER_BELOW_THRESHOLD floor(0.3 * 256), 1 * 256
        AI_06 Ch08_Leonster, $01
        AI_06 Ch08_Ulster, $01
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup2EAI3 ; 86/F465

        AI_SET_FORMATION $05, $03
        AI_0B
        AI_END

      aFactionGroup2EAI4 ; 86/F46A

        AI_SET_IGNORED_GENERATION_ID GEN_ID_Daisy_Patty
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup2EAI5 ; 86/F46E

        AI_0B
        AI_END

      aFactionGroup2EAI6 ; 86/F470

        AI_07 Ch08_Connacht, $05
        AI_END

      aFactionGroup2EAI7 ; 86/F474

        AI_1D
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup2EAI8 ; 86/F477

        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup2FAI1 ; 86/F479

        AI_07 Ch08_Munster, $05
        AI_END

      aFactionGroup2FAI2 ; 86/F47D

        AI_FLAG_IF_LEADER_ON_COORDS Chapter08, 31, [49, 10]
        AI_END

      aFactionGroup2FAI3 ; 86/F484

        AI_END

      aFactionGroup30AI1 ; 86/F485

        AI_CHARGE_IF_LEADERLESS_BELOW_UNIT_RATIO floor(0.3 * 256)
        AI_CHARGE_IF_LEADER_BELOW_THRESHOLD floor(0.3 * 256), 1 * 256
        MODIFY_GROUP_LEADER_FIELD_MOVEMENT 0
        AI_SET_FORMATION $03, $00
        AI_06 Ch08_Leonster, $01
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup30AI2 ; 86/F495

        AI_CHECK_GROUP_COMPLETE_BY_TURN_DIVISIBLE 1
        AI_SET_FORMATION $03, $00
        AI_0A
        AI_END

      aFactionGroup30AI3 ; 86/F49C

        MODIFY_GROUP_LEADER_FIELD_MOVEMENT 0
        AI_SET_FORMATION $03, $00
        AI_JUMP_IF_CHAPTER_EVENT_FLAG_SET Chapter08, 40, +

          AI_02 $06
          AI_FLAG_IF_LEADER_ON_COORDS Chapter08, 40, [46, 40]
          AI_0B
          AI_END

        +
        AI_12
        AI_END

      aFactionGroup30AI4 ; 86/F4B3

        AI_0B
        AI_END

      aFactionGroup30AI5 ; 86/F4B5

        AI_07 Ch08_Meath, $04
        AI_END

      aFactionGroup30AI6 ; 86/F4B9

        AI_TARGET_REMAINING_VILLAGES
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup30AI7 ; 86/F4BC

        AI_JUMP_IF_CHAPTER_EVENT_FLAG_SET Chapter08, 0, +

          AI_0B
          AI_END

        +
        AI_TARGET_REMAINING_VILLAGES
        AI_TARGET_ALL_FOES
        AI_END

      aFactionGroup30AI8 ; 86/F4C7

        AI_0A
        AI_END

    .endsection Chapter08EventDataSection
