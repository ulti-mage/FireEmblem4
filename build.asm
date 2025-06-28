
.cpu "65816"

  crossbankRawMissing   := 0
  crossbankRawRemaining := b""

  crossbankRaw .segment Block
    crossbankRawMissing   := $10000 - (* & $FFFF)
    crossbankRawRemaining := \Block[crossbankRawMissing:]
    .text \Block[:crossbankRawMissing]
  .endsegment

  crossbankRawRemainder .segment
    .text crossbankRawRemaining
  .endsegment

  crossbank .namespace

    Remainder := b""

    start .function Filename: binary, Address=None

      .if ( Address == None )
        Address := *
      .endif

      Remainder ::= Filename[$8000 - (Address & $FFFF):]
      .text Filename[:$8000 - (Address & $FFFF)]

    .endfunction

    end .segment

      .text crossbank.Remainder

    .endsegment

  .endnamespace ; crossbank


  ; Bugfix idea:
  ; remove the first CMP in rsUnknown86B6BE, so AI units without
  ; the groupleader flag respect the ignored generation ID.
  ; Ayras AI is supposed to ignore Sigurd, but since she isnt a group
  ; leader she goes after him anyway.


  .include "SRC/BaseRom.asm"
  .include "LIB/LibraryHelpers.h"
  .include "LIB/IORegisters.h"
  .include "LIB/WRAM.h"
  .include "LIB/Constants.h"
  .include "LIB/Macros.h"
  .include "LIB/MenuText.h"
  .include "LIB/Procs.h"
  .include "LIB/Events.h"
  .include "LIB/AI.h"
  .include "LIB/Palettes.h"
  .include "LIB/Dialogue.h"
  .include "LIB/Sprites.h"
  .include "LIB/Tiles.h"
  .include "LIB/DMA.h"
  .include "LIB/HDMA.h"
  .include "LIB/PermanentFlags.h"
  .include "LIB/SRAM.h"
  .include "LIB/Save.h"

  .include "LIB/Functions.h"

    ROM = binary("fe4.sfc")

  .include "SRC/Debug.asm"
  .include "SRC/Proc.asm"
  .include "SRC/HDMA.asm"
  .include "SRC/Decompressor.asm"
  .include "SRC/Dialogue.asm"
  .include "SRC/ActiveSpriteEngine.asm"
  .include "SRC/Save.asm"
  .include "SRC/Epilogue.asm"
  .include "SRC/Events.asm"

  .include "SRC/Bank80.asm"
  .include "SRC/Bank81.asm"
  .include "SRC/Bank82.asm"
  .include "SRC/Bank84.asm"
  .include "SRC/Bank85.asm"
  .include "SRC/Bank87.asm"
  .include "SRC/Bank89.asm"
  .include "SRC/Bank8A.asm"
  .include "SRC/Bank8B.asm"
  .include "SRC/Bank91.asm"


  .include "EVENTS/ChapterPrologue.asm"
  .include "EVENTS/Chapter01.asm"
  .include "EVENTS/Chapter02.asm"
  .include "EVENTS/Chapter03.asm"
  .include "EVENTS/Chapter04.asm"
  .include "EVENTS/Chapter05.asm"
  .include "EVENTS/Chapter06.asm"
  .include "EVENTS/Chapter07.asm"
  .include "EVENTS/Chapter08.asm"
  .include "EVENTS/Chapter09.asm"
  .include "EVENTS/Chapter10.asm"
  .include "EVENTS/ChapterFinal.asm"
  .include "EVENTS/ChapterEpilogue.asm"

    * = $008223
    .logical $808223

      .dsection Code808223Section

      ; 80/823F

    .here

    * = $009D4F
    .logical $809D4F

      .dsection Code809D4FSection

      ; 80/9DD9

    .here

    * = $00A096
    .logical $80A096

      .dsection Code80A096Section

      ; 80/A1AB

    .here

    * = $00A5E9
    .logical $80A5E9

      .dsection Code80A5E9Section

      ; 80/A678

    .here

    * = $00A6C3
    .logical $80A6C3

      .dsection Code80A6C3Section

      ; 80/A773

    .here

    * = $00A899
    .logical $80A899

      .dsection Code80A899Section

      ; 80/A9F2

    .here

    * = $00AA02
    .logical $80AA02

      .dsection DecompressorSection

      ; 80/AD24

    .here

    * = $00C1CB
    .logical $80C1CB

      .dsection Code80C1CBSection

      ; 80/C212

    .here

    * = $00E42B
    .logical $80E42B

      .dsection Code80E42BSection

      ; 80/E586

    .here

    * = $018000
    .logical $818000

      .dsection ActiveSpriteEngineSection

      ; 8188b0

    .here

    * = $018ECB
    .logical $818ECB

      .dsection Code818ECBSection

      ; 81/8FA1

    .here

    * = $01B483
    .logical $81B483

      .dsection Code81B483Section

      ; 81/B4C5

    .here

    * = $01C000
    .logical $81C000

      aUNITGroupPointers                  .include "TABLES/EVENTUNIT/UNITGroupPointers.csv.asm"
      aUNITGroupDataPrologueStart         .binclude "TABLES/EVENTUNIT/UNITGroupDataPrologueStart.csv.asm"
      aUNITGroupDataPrologueEvans         .binclude "TABLES/EVENTUNIT/UNITGroupDataPrologueEvans.csv.asm"
      aUNITGroupDataChapter01Start        .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter01Start.csv.asm"
      aUNITGroupDataChapter01Marpha       .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter01Marpha.csv.asm"
      aUNITGroupDataChapter01Heirhein     .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter01Heirhein.csv.asm"
      aUNITGroupDataChapter01Nordion      .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter01Nordion.csv.asm"
      aUNITGroupDataChapter01Verdane      .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter01Verdane.csv.asm"
      aUNITGroupDataChapter01Brigands     .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter01Brigands.csv.asm"
      aUNITGroupDataChapter02Start        .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter02Start.csv.asm"
      aUNITGroupDataChapter02Yellows      .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter02Yellows.csv.asm"
      aUNITGroupDataChapter02Infini       .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter02Infini.csv.asm"
      aUNITGroupDataChapter02Mackily      .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter02Mackily.csv.asm"
      aUNITGroupDataChapter02Agusti       .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter02Agusti.csv.asm"
      aUNITGroupDataChapter03Start        .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter03Start.csv.asm"
      aUNITGroupDataChapter03Sylvale      .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter03Sylvale.csv.asm"
      aUNITGroupDataChapter03Thracia      .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter03Thracia.csv.asm"
      aUNITGroupDataChapter03Orgahil      .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter03Orgahil.csv.asm"
      aUNITGroupDataChapter03DozelFriege  .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter03DozelFriege.csv.asm"
      aUNITGroupDataChapter04Start        .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter04Start.csv.asm"
      aUNITGroupDataChapter04Donovan      .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter04Donovan.csv.asm"
      aUNITGroupDataChapter04Pamela       .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter04Pamela.csv.asm"
      aUNITGroupDataChapter04Annand       .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter04Annand.csv.asm"
      aUNITGroupDataChapter04Andrey       .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter04Andrey.csv.asm"
      aUNITGroupDataChapter04Zaxon        .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter04Zaxon.csv.asm"
      aUNITGroupDataChapter05Start        .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter05Start.csv.asm"
      aUNITGroupDataChapter05Leonster     .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter05Leonster.csv.asm"
      aUNITGroupDataChapter05Phinora      .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter05Phinora.csv.asm"
      aUNITGroupDataChapter05Velthomer    .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter05Velthomer.csv.asm"
      aUNITGroupDataChapter05Belhalla     .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter05Belhalla.csv.asm"
      aUNITGroupDataChapter05Thracia      .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter05Thracia.csv.asm"
      aUNITGroupDataChapter06Start        .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter06Start.csv.asm"
      aUNITGroupDataChapter06Ganeishire   .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter06Ganeishire.csv.asm"
      aUNITGroupDataChapter06Ribaut       .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter06Ribaut.csv.asm"
      aUNITGroupDataChapter07Start        .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter07Start.csv.asm"
      aUNITGroupDataChapter07Opening      .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter07Opening.csv.asm"
      aUNITGroupDataChapter07Melgen       .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter07Melgen.csv.asm"
      aUNITGroupDataChapter07Ulster       .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter07Ulster.csv.asm"
      aUNITGroupDataChapter08Start        .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter08Start.csv.asm"
      aUNITGroupDataChapter08Opening      .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter08Opening.csv.asm"
      aUNITGroupDataChapter08Meath        .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter08Meath.csv.asm"
      aUNITGroupDataChapter08Febail       .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter08Febail.csv.asm"
      aUNITGroupDataChapter09Start        .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter09Start.csv.asm"
      aUNITGroupDataChapter09Opening      .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter09Opening.csv.asm"
      aUNITGroupDataChapter09Travant      .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter09Travant.csv.asm"
      aUNITGroupDataChapter09Grutia       .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter09Grutia.csv.asm"
      aUNITGroupDataChapter09Thracia      .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter09Thracia.csv.asm"
      aUNITGroupDataChapter10Opening1     .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter10Opening1.csv.asm"
      aUNITGroupDataChapter10Opening2     .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter10Opening2.csv.asm"
      aUNITGroupDataChapter10Miletos      .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter10Miletos.csv.asm"
      aUNITGroupDataChapter10Chalphy      .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter10Chalphy.csv.asm"
      aUNITGroupDataChapterFinalOpening   .binclude "TABLES/EVENTUNIT/UNITGroupDataChapterFinalOpening.csv.asm"
      aUNITGroupDataChapterFinalDozel     .binclude "TABLES/EVENTUNIT/UNITGroupDataChapterFinalDozel.csv.asm"
      aUNITGroupDataChapterFinalYngvi     .binclude "TABLES/EVENTUNIT/UNITGroupDataChapterFinalYngvi.csv.asm"
      aUNITGroupDataChapterFinalFriege    .binclude "TABLES/EVENTUNIT/UNITGroupDataChapterFinalFriege.csv.asm"
      aUNITGroupDataChapterFinalVelthomer .binclude "TABLES/EVENTUNIT/UNITGroupDataChapterFinalVelthomer.csv.asm"
      aUNITGroupDataChapterFinalBelhalla  .binclude "TABLES/EVENTUNIT/UNITGroupDataChapterFinalBelhalla.csv.asm"
      aUNITGroupDataChapterFinalThracia   .binclude "TABLES/EVENTUNIT/UNITGroupDataChapterFinalThracia.csv.asm"
      aUNITGroupDataChapterFinalUnused    .binclude "TABLES/EVENTUNIT/UNITGroupDataChapterFinalUnused.csv.asm"

      ; 81ebbc

    .here

    * = $028000
    .logical $828000

      .dsection ProcEngineSection
      .dsection ProcCodeSection
      .dsection Code828299Section

      ; 82/83B5

    .here

    * = $028A30
    .logical $828A30

      .dsection Code828A30Section

      ; 82/8B2B

    .here

    * = $028F3F
    .logical $828F3F

      .dsection Code828F3FSection

      ; 82/90B0

    .here

    * = $02921E
    .logical $82921E

      .dsection Code82921ESection

      ; 82/9245

    .here

    * = $02C000
    .logical $82C000

      .dsection HDMAEngineSection
      .dsection HDMACodeSection

      ; 82/C26D

    .here

    * = $02E41B
    .logical $82E41B

      .dsection Code82E41BSection

      ; 82/E5FF

    .here

    * = $02E747
    .logical $82E747

      .dsection Code82E747Section

      ; 82/EA43

    .here

    * = $02ECB9
    .logical $82ECB9

      .dsection Code82ECB9Section

      ; 82/ED1D

    .here

    * = $02EDE7
    .logical $82EDE7

      .dsection Code82EDE7Section

      ; 82/F207

    .here

    * = $02F4DE
    .logical $82F4DE

      .dsection Code82F4DEESection

      ; 82/F4F9

    .here

    * = $02F567
    .logical $82F567

      .dsection Code82F567Section

      ; 82/F7A2

    .here

    * = $02F866
    .logical $82F866

      .dsection Code82F866Section

    .here

    * = $038000
    .logical $838000

      aMainDataOffsets .block ; 83/8000

        CharacterNameOffsets    .word <>aCharacterNameOffsets     - aMainDataOffsets ; $00
        CharacterDataOffsets    .word <>aCharacterDataOffsets     - aMainDataOffsets ; $02
        ClassNameOffsets        .word <>aClassNameOffsets         - aMainDataOffsets ; $04
        ClassDataOffsets        .word <>aClassDataOffsets         - aMainDataOffsets ; $06
        MovementCostOffsets     .word <>aMovementCostOffsets      - aMainDataOffsets ; $08
        TerrainAvoidOffsets     .word <>aTerrainAvoidOffsets      - aMainDataOffsets ; $0A
        ItemNameOffsets         .word <>aItemNameOffsets          - aMainDataOffsets ; $0C
        ItemDescriptionOffsets  .word <>aItemDescriptionOffsets   - aMainDataOffsets ; $0E
        ItemDataOffsets         .word <>aItemDataOffsets          - aMainDataOffsets ; $10
                                .word <>aUnknown83D8E6            - aMainDataOffsets ; $12
        FactionNameOffsets      .word <>aFactionNameOffsets       - aMainDataOffsets ; $14
      .bend

      aClassWeaknessTable .binclude "TABLES/CLASS/ClassWeakness.asm"                                      ; 83/8016
      aClassMapSpriteAssignmentOffsets .binclude "TABLES/OFFSET/ClassMapSpriteAssignmentOffsets.csv.asm"  ; 83/805E
      aClassMapSpriteAssignment .include "TABLES/CLASS/ClassMapSpriteAssignment.asm"                      ; 83/80EE
      aPromotionTable .binclude "TABLES/CHARACTER/PromotionTable.asm"                                     ; 83/833C
      aTerrainNameOffsets .include "TABLES/OFFSET/TerrainNameOffsets.csv.asm"                             ; 83/837B
      aTerrainNames .binclude "TEXT/MENUTEXT/TerrainNames.asm"                                            ; 83/83AF
      aMaleLoveDataIDs .include "TABLES/CHARACTER/MaleLoveDataIDs.csv.asm"                                ; 83/848D
        .sint -1
      aFemaleLoveDataIDs .include "TABLES/CHARACTER/FemaleLoveDataIDs.csv.asm"                            ; 83/84DB
        .sint -1
      aLoveBaseOffsets .include "TABLES/OFFSET/LoveBaseOffsets.csv.asm"                                   ; 83/850F
      aGen1LoveBases .binclude "TABLES/CHARACTER/Gen1LoveBases.csv.asm"                                   ; 83/8541
      aGen2LoveBases .binclude "TABLES/CHARACTER/Gen2LoveBases.csv.asm"                                   ; 83/85C8
      aLoveGrowthOffsets  .include "TABLES/OFFSET/LoveGrowthOffsets.csv.asm"                              ; 83/8738
      aGen1LoveGrowths .binclude "TABLES/CHARACTER/Gen1LoveGrowths.csv.asm"                               ; 83/876A
      aGen2LoveGrowths .binclude "TABLES/CHARACTER/Gen2LoveGrowths.csv.asm"                               ; 83/87F1
      aUnknown838961 .binclude "TABLES/Unknown838961.asm"                                                 ; 83/8961
      aChildrenDataOffsets .binclude "TABLES/OFFSET/ChildrenDataOffsets.csv.asm"                          ; 83/8993
      aChildrenData .binclude "TABLES/CHARACTER/ChildrenData.csv.asm"                                     ; 83/89A5
      aHolyBloodGrowthBoostsOffsets .binclude "TABLES/OFFSET/HolyBloodDataOffsets.csv.asm"                ; 83/89C9
      aHolyBloodData .binclude "TABLES/ITEM/HolyBloodData.csv.asm"                                        ; 83/89E3
      aClassNameOffsets .include "TABLES/OFFSET/ClassNameOffsets.csv.asm"                                 ; 83/8AB3
      aClassNames .binclude "TEXT/MENUTEXT/ClassNames.asm"                                                ; 83/8B43
      aClassDataOffsets .include "TABLES/OFFSET/ClassDataOffsets.csv.asm"                                 ; 83/8F35
      aClassData .binclude "TABLES/CLASS/ClassData.csv.asm"                                               ; 83/8FC5
      aMovementCostOffsets .include "TABLES/OFFSET/MovementCostOffsets.csv.asm"                           ; 83/987D
      aMovementCost .binclude "TABLES/TERRAIN/MovementCost.csv.asm"                                       ; 83/989B
      aTerrainAvoidOffsets .include "TABLES/OFFSET/TerrainAvoidOffsets.csv.asm"                           ; 83/9A21
      aTerrainAvoid .binclude "TABLES/TERRAIN/TerrainAvoid.csv.asm"                                       ; 83/9A25
      aCharacterNameOffsets .include "TABLES/OFFSET/CharacterNameOffsets.csv.asm"                         ; 83/9A59
      aCharacterNames .binclude "TEXT/MENUTEXT/CharacterNames.asm"                                        ; 83/9ECD
      aCharacterDataOffsets .include "TABLES/OFFSET/CharacterDataOffsets.csv.asm"                         ; 83/ADF5
      aCharacterData .binclude "TABLES/CHARACTER/CharacterData.csv.asm"                                   ; 83/B267
      aUnknown83D8E6 .word 0                                                                              ; 83/D8E6
      aFactionNameOffsets .include "TABLES/OFFSET/FactionNameOffsets.csv.asm"                             ; 83/D8E8
      aFactionNames .binclude "TEXT/MENUTEXT/FactionNames.asm"                                            ; 83/D956
      aItemNameOffsets .include "TABLES/OFFSET/ItemNameOffsets.csv.asm"                                   ; 83/DC12
      aItemNames .binclude "TEXT/MENUTEXT/ItemNames.asm"                                                  ; 83/DD26
      aItemDescriptionOffsets .include "TABLES/OFFSET/ItemDescriptionOffsets.csv.asm"                     ; 83/E2E8
      aItemDescriptions .binclude "TEXT/MENUTEXT/ItemDescriptions.asm"                                    ; 83/E3FC
      aItemDataOffsets .include "TABLES/OFFSET/ItemDataOffsets.csv.asm"                                   ; 83/E9D0
      aItemData .binclude "TABLES/ITEM/ItemData.csv.asm"                                                  ; 83/EAE4
      aPlayerItemTable .include "TABLES/ITEM/PlayerItemTable.csv.asm"                                     ; 83/F489
      .sint -1
      aCastleNameOffsets .include "TABLES/OFFSET/CastleNameOffsets.csv.asm"                               ; 83/F517
      aCastleNames .binclude "TEXT/MENUTEXT/CastleNames.asm"                                              ; 83/F573

      rlSwapToMainDataBank ; 83/F7C1

        .al
        .autsiz
        .databank ?

        phk
        plb
        rtl

        .databank 0

        .fill $838000 + $8000 - *, 0

    .here

    * = $048000
    .logical $848000

      .dsection Code848000Section

      ; 84/822D

    .here

    * = $048397
    .logical $848397

      .dsection Code848397Section

      ; 84/862C

    .here

    * = $048C31
    .logical $848C31

      .dsection Code848C31Section

      ; 84/8CFE

    .here

    * = $048F17
    .logical $848F17

      .dsection Code848F17Section

      ; 84/99B5

    .here

    * = $049AE5
    .logical $849AE5

      .dsection Code849AE5Section

      ; 84/9FB9

    .here

    * = $049FC4
    .logical $849FC4

      .dsection Code849FC4Section

      ; 84/A282

    .here

    * = $04A333
    .logical $84A333

      .dsection Code84A333Section

      ; 84/ABB0

    .here

    * = $04ACE7
    .logical $84ACE7

      .dsection Code84ACE7Section

      ; 84/AF17

    .here

    * = $04B1B8
    .logical $84B1B8

      .dsection Code84B1B8Section

      ; 84/B32B

    .here

    * = $04B3E4
    .logical $84B3E4

      .dsection Code84B3E4Section

      ; 84/B508

    .here

    * = $04B8C1
    .logical $84B8C1

      .dsection Code84B8C1Section

      ; 84/B9A3

    .here

    * = $04BAA1
    .logical $84BAA1

      .dsection Code84BAA1Section

      ; 84/BB54

    .here

    * = $04BB9A
    .logical $84BB9A

      .dsection Code84BB9ASection

      ; 84/C0BD

    .here

    * = $04C15F
    .logical $84C15F

      .dsection Code84C15FSection

      ; 84/C398

    .here

    * = $04C461
    .logical $84C461

      .dsection Code84C461Section

      ; 84/C5D7

    .here

    * = $04C65E
    .logical $84C65E

      .dsection Code84C65ESection

      ; 84/CC5D

    .here

    * = $04CCB4
    .logical $84CCB4

      .dsection Code84CCB4Section

      ; 84/CD35

    .here

    * = $04CFBF
    .logical $84CFBF

      .dsection Code84CFBFSection

      ; 84/D03E

    .here

    * = $04D271
    .logical $84D271

      .dsection Code84D271Section

      ; 84/D2BA

    .here

    * = $04D4C7
    .logical $84D4C7

      .dsection Code84D4C7Section

      ; 84/EB24

    .here

    * = $04EC80
    .logical $84EC80

      .dsection Code84EC80Section

      ; 84/F75C

    .here

    * = $04F939
    .logical $84F939

      .dsection Code84F939Section

      ; 84/FE98

    .here

    * = $05A895
    .logical $85A895

      .dsection DialogueBoxHDMASection

      ; 85/AB19

    .here

    * = $068000
    .logical $868000

      .dsection Code868000Section

      ; 86/9CCC

    .here

    * = $06C4C4
    .logical $86C4C4

      .dsection Code86C4C4Section

      ; 86/C575

    .here

    * = $06C739
    .logical $86C739

      aChapterEventPointers .include "TABLES/CHAPTER/ChapterEventPointers.csv.asm" ; 86/C739
      aChapterEventDataPointers .include "TABLES/CHAPTER/ChapterEventDataPointers.csv.asm" ; 86/C760
      aFactionGroupPointers .include "TABLES/CHAPTER/FactionGroupPointers.csv.asm" ; 86/C784

      .dsection Chapter01EventsSection
      .dsection Chapter01EventDataSection
      .dsection Chapter02EventsSection
      .dsection Chapter02EventDataSection
      .dsection Chapter03EventsSection
      .dsection Chapter03EventDataSection
      .dsection Chapter04EventsSection
      .dsection Chapter04EventDataSection
      .dsection Chapter05EventsSection
      .dsection Chapter05EventDataSection
      .dsection Chapter07EventsSection
      .dsection Chapter07EventDataSection
      .dsection Chapter08EventsSection
      .dsection Chapter08EventDataSection
      .dsection Chapter09EventsSection
      .dsection Chapter09EventDataSection
      .dsection ChapterEpilogueEventsSection

      .fill $868000 + $8000 - *, 0

    .here

    * = $07A19D
    .logical $87A19D

      .dsection Code87A19DSection

      ; 87/AE88

    .here

    * = $07BB50
    .logical $87BB50

      .dsection Code87BB50Section

      ; 87/BE98

    .here

    * = $07DF12
    .logical $87DF12

      .dsection Code87DF12Section

      ; 87/E6D3

    .here

    * = $07E98D
    .logical $87E98D

      .dsection Code87E98DSection

      ; 87/E9E0

    .here

    * = $07EA87
    .logical $87EA87

      .dsection Code87EA87Section

      ; 87/EBC8

    .here

    * = $07EC42
    .logical $87EC42

      .dsection Code87EC42Section

      ; 87/EF46

    .here

    * = $07EF61
    .logical $87EF61

      .dsection Code87EF61Section

      ; 87/F321

    .here

    * = $07F3A7
    .logical $87F3A7

      .dsection Code87F3A7Section

      ; 87/F4A7

    .here

    * = $07F515
    .logical $87F515

      .dsection Code87F515Section

      ; 87/F559

    .here

    * = $08D365
    .logical $88D365

      aMapMovementShortSpritePointers .binclude "TABLES/CLASS/MapMovementShortSpritePointers.csv.asm" ; 88/D365
      aMapMovementTallSpritePointers  .binclude "TABLES/CLASS/MapMovementTallSpritePointers.csv.asm"  ; 88/D428

      ; 88/D488

    .here

    * = $0990DA
    .logical $8990DA

      .dsection Code8990DASection

      ; 89/9140

    .here

    * = $099FDC
    .logical $899FDC

      .dsection Code899FDCSection

      ; 89/A085

    .here

    * = $09A150
    .logical $89A150

      .dsection Code89A150Section

      ; 89/A18C

    .here

    * = $0AB317
    .logical $8AB317

      .dsection Code8AB317Section

      ; 8A/B3FE

    .here

    * = $0AB4F9
    .logical $8AB4F9

      aPortraitGraphicPointers .include "TABLES/PortraitGraphicPointers.csv.asm" ; 8A/B4F9
      aPortraitPalettePointers .include "TABLES/PortraitPalettePointers.csv.asm" ; 8A/B7E1

      ; 8A/BAC9

    .here

    * = $0B8345
    .logical $8B8345

      .dsection Code8B8345Section

      ; 8b83a7

    .here

    * = $0B88CE
    .logical $8B88CE

      .dsection WorldMapHighlightCodeSection

      ; 8b8a58

    .here

    * = $0B9A88
    .logical $8B9A88

      aPortraitDataIDs .include "TABLES/CHARACTER/PortraitDataIDs.csv.asm" ; 8B/9A88
      aClassPortraitDataIDs .include "TABLES/CLASS/ClassPortraitDataIDs.csv.asm" ; 8B/9FF8

      ; 8B/A088
      ; 4 different HDMA structs

    .here

    * = $0BCDD8
    .logical $8BCDD8

      .dsection Code8BCDD8Section

      ; 8B/CE29

    .here

    * = $0D863F
    .logical $8D863F

      .include "EVENTS/Chapter10/EventChapter10Opening.asm"
      .include "EVENTS/Chapter10/EventChapter10RiddellLeisurelyCharge.asm"
      .include "EVENTS/Chapter10/EventChapter10CivilianRescued1.asm"
      .include "EVENTS/Chapter10/EventChapter10CivilianRescued2.asm"
      .include "EVENTS/Chapter10/EventChapter10CivilianRescued3.asm"
      .include "EVENTS/Chapter10/EventChapter10CivilianRescued4.asm"
      .include "EVENTS/Chapter10/EventChapter10CivilianRescued5.asm"
      .include "EVENTS/Chapter10/EventChapter10CivilianRescued6.asm"
      .include "EVENTS/Chapter10/EventChapter10ChronosSeized.asm"
      .include "EVENTS/Chapter10/EventChapter10RadosSeized.asm"
      .include "EVENTS/Chapter10/EventChapter10MiletosSpawn.asm"
      .include "EVENTS/Chapter10/EventChapter10MiletosSeized.asm"
      .include "EVENTS/Chapter10/EventChapter10ChalphySpawn.asm"
      .include "EVENTS/Chapter10/EventChapter10SeliphPalmarchTalk.asm"
      .include "EVENTS/Chapter10/EventChapter10Ending.asm"
      .include "EVENTS/Chapter10/EventChapter10JuliusKilledUnit.asm"
      .include "EVENTS/Chapter10/EventChapter10IshtarKilledUnit.asm"
      .include "EVENTS/Chapter10/EventChapter10JuliusDied.asm"
      .include "EVENTS/Chapter10/EventChapter10IshtarDied.asm"
      .include "EVENTS/Chapter10/EventChapter10Village1.asm"
      .include "EVENTS/Chapter10/EventChapter10Village2.asm"
      .include "EVENTS/Chapter10/EventChapter10Village3.asm"
      .include "EVENTS/Chapter10/EventChapter10VillageMagicRing.asm"
      .include "EVENTS/Chapter10/EventChapter10Village4.asm"
      .include "EVENTS/Chapter10/EventChapter10Village5.asm"
      .include "EVENTS/Chapter10/EventChapter10HildaDied.asm"
      .include "EVENTS/Chapter10/EventChapter10_185.asm"
      .include "EVENTS/Chapter10/EventChapter10SeliphAtSea.asm"
      .include "EVENTS/Chapter10/EventChapter10_18A.asm"

      dialogueChapter10WorldMap1 .include "TEXT/DIALOGUE/Chapter10/WorldMap1.dialogue.txt" ; 8D8DC4
      dialogueChapter10WorldMap2 .include "TEXT/DIALOGUE/Chapter10/WorldMap2.dialogue.txt" ; 8D8E19

      dialogueEventDebug8D9093 .include "TEXT/DIALOGUE/General/EventDebug8D9093.dialogue.txt" ; 8D9093
      dialogueEventDebug8D90A6 .include "TEXT/DIALOGUE/General/EventDebug8D90A6.dialogue.txt" ; 8D90A6

      dialogueCastleNameMadino .include "TEXT/DIALOGUE/CastleNames/Madino.dialogue.txt"
      dialogueCastleNameSylvale .include "TEXT/DIALOGUE/CastleNames/Sylvale.dialogue.txt"
      dialogueCastleNameInfini .include "TEXT/DIALOGUE/CastleNames/Infini.dialogue.txt"
      dialogueCastleNameAgusti .include "TEXT/DIALOGUE/CastleNames/Agusti.dialogue.txt"
      dialogueCastleNameHeirhein .include "TEXT/DIALOGUE/CastleNames/Heirhein.dialogue.txt"
      dialogueCastleNameMackily .include "TEXT/DIALOGUE/CastleNames/Mackily.dialogue.txt"
      dialogueCastleNameNordion .include "TEXT/DIALOGUE/CastleNames/Nordion.dialogue.txt"
      dialogueCastleNameVelthomer .include "TEXT/DIALOGUE/CastleNames/Velthomer.dialogue.txt"
      dialogueCastleNameFriege .include "TEXT/DIALOGUE/CastleNames/Friege.dialogue.txt"
      dialogueCastleNameBelhalla .include "TEXT/DIALOGUE/CastleNames/Belhalla.dialogue.txt"
      dialogueCastleNameDozel .include "TEXT/DIALOGUE/CastleNames/Dozel.dialogue.txt"
      dialogueCastleNameEdda .include "TEXT/DIALOGUE/CastleNames/Edda.dialogue.txt" ; Unused.
      dialogueCastleNameChalphy .include "TEXT/DIALOGUE/CastleNames/Chalphy.dialogue.txt"
      dialogueCastleNameYngvi .include "TEXT/DIALOGUE/CastleNames/Yngvi.dialogue.txt"
      dialogueCastleNameLeonster .include "TEXT/DIALOGUE/CastleNames/Leonster.dialogue.txt"
      dialogueCastleNameConnacht .include "TEXT/DIALOGUE/CastleNames/Connacht.dialogue.txt"
      dialogueCastleNameMunster .include "TEXT/DIALOGUE/CastleNames/Munster.dialogue.txt"
      dialogueCastleNameMelgen .include "TEXT/DIALOGUE/CastleNames/Melgen.dialogue.txt"
      dialogueCastleNameUlster .include "TEXT/DIALOGUE/CastleNames/Ulster.dialogue.txt"
      dialogueCastleNameOrgahil .include "TEXT/DIALOGUE/CastleNames/Orgahil.dialogue.txt"
      dialogueCastleNameTofa .include "TEXT/DIALOGUE/CastleNames/Tofa.dialogue.txt"
      dialogueCastleNameSailane .include "TEXT/DIALOGUE/CastleNames/Sailane.dialogue.txt"
      dialogueCastleNameZaxon .include "TEXT/DIALOGUE/CastleNames/Zaxon.dialogue.txt"
      dialogueCastleNameSilesse .include "TEXT/DIALOGUE/CastleNames/Silesse.dialogue.txt"
      dialogueCastleNameLubeck .include "TEXT/DIALOGUE/CastleNames/Lubeck.dialogue.txt"
      dialogueCastleNameTirnanog .include "TEXT/DIALOGUE/CastleNames/Tirnanog.dialogue.txt"
      dialogueCastleNameGaneishire .include "TEXT/DIALOGUE/CastleNames/Ganeishire.dialogue.txt"
      dialogueCastleNameSofala .include "TEXT/DIALOGUE/CastleNames/Sofala.dialogue.txt" ; Unused.
      dialogueCastleNameIsaach .include "TEXT/DIALOGUE/CastleNames/Isaach.dialogue.txt" ; Unused.
      dialogueCastleNameRibaut .include "TEXT/DIALOGUE/CastleNames/Ribaut.dialogue.txt"
      dialogueCastleNamePhinora .include "TEXT/DIALOGUE/CastleNames/Phinora.dialogue.txt"
      dialogueCastleNameAed .include "TEXT/DIALOGUE/CastleNames/Aed.dialogue.txt"
      dialogueCastleNameDahna .include "TEXT/DIALOGUE/CastleNames/Dahna.dialogue.txt"
      dialogueCastleNameVerdane .include "TEXT/DIALOGUE/CastleNames/Verdane.dialogue.txt"
      dialogueCastleNameEvans .include "TEXT/DIALOGUE/CastleNames/Evans.dialogue.txt"
      dialogueCastleNameGenoa .include "TEXT/DIALOGUE/CastleNames/Genoa.dialogue.txt"
      dialogueCastleNameMarpha .include "TEXT/DIALOGUE/CastleNames/Marpha.dialogue.txt"
      dialogueCastleNameMiletos .include "TEXT/DIALOGUE/CastleNames/Miletos.dialogue.txt"
      dialogueCastleNamePeruluke .include "TEXT/DIALOGUE/CastleNames/Peruluke.dialogue.txt"
      dialogueCastleNameChronos .include "TEXT/DIALOGUE/CastleNames/Chronos.dialogue.txt"
      dialogueCastleNameRados .include "TEXT/DIALOGUE/CastleNames/Rados.dialogue.txt"
      dialogueCastleNameMeath .include "TEXT/DIALOGUE/CastleNames/Meath.dialogue.txt"
      dialogueCastleNameKapathogia .include "TEXT/DIALOGUE/CastleNames/Kapathogia.dialogue.txt"
      dialogueCastleNameLuthecia .include "TEXT/DIALOGUE/CastleNames/Luthecia.dialogue.txt"
      dialogueCastleNameThracia .include "TEXT/DIALOGUE/CastleNames/Thracia.dialogue.txt"
      dialogueCastleNameGrutia .include "TEXT/DIALOGUE/CastleNames/Grutia.dialogue.txt"

      aDialogueCharacterNames .binclude "TABLES/DIALOGUE/DialogueCharacterNames.csv.asm"

      dialogueCharacterNameSigurd .include "TEXT/DIALOGUE/CharacterNames/Sigurd.dialogue.txt" ; 8D928B
      dialogueCharacterNameNaoise .include "TEXT/DIALOGUE/CharacterNames/Naoise.dialogue.txt" ; 8D9291
      dialogueCharacterNameAlec .include "TEXT/DIALOGUE/CharacterNames/Alec.dialogue.txt" ; 8D9298
      dialogueCharacterNameArden .include "TEXT/DIALOGUE/CharacterNames/Arden.dialogue.txt" ; 8D929D
      dialogueCharacterNameFinn .include "TEXT/DIALOGUE/CharacterNames/Finn.dialogue.txt" ; 8D92A3
      dialogueCharacterNameQuan .include "TEXT/DIALOGUE/CharacterNames/Quan.dialogue.txt" ; 8D92A8
      dialogueCharacterNameMidir .include "TEXT/DIALOGUE/CharacterNames/Midir.dialogue.txt" ; 8D92AE
      dialogueCharacterNameLewyn .include "TEXT/DIALOGUE/CharacterNames/Lewyn.dialogue.txt" ; 8D92B5
      dialogueCharacterNameChulainn .include "TEXT/DIALOGUE/CharacterNames/Chulainn.dialogue.txt" ; 8D92BB
      dialogueCharacterNameAzelle .include "TEXT/DIALOGUE/CharacterNames/Azelle.dialogue.txt" ; 8D92C0
      dialogueCharacterNameJamke .include "TEXT/DIALOGUE/CharacterNames/Jamke.dialogue.txt" ; 8D92C5
      dialogueCharacterNameClaud .include "TEXT/DIALOGUE/CharacterNames/Claud.dialogue.txt" ; 8D92CB
      dialogueCharacterNameBeowulf .include "TEXT/DIALOGUE/CharacterNames/Beowulf.dialogue.txt" ; 8D92D1
      dialogueCharacterNameLex .include "TEXT/DIALOGUE/CharacterNames/Lex.dialogue.txt" ; 8D92DB
      dialogueCharacterNameDew .include "TEXT/DIALOGUE/CharacterNames/Dew.dialogue.txt" ; 8D92E1
      dialogueCharacterNameDeirdre .include "TEXT/DIALOGUE/CharacterNames/Deirdre.dialogue.txt" ; 8D92E6
      dialogueCharacterNameEthlyn .include "TEXT/DIALOGUE/CharacterNames/Ethlyn.dialogue.txt" ; 8D92ED
      dialogueCharacterNameLachesis .include "TEXT/DIALOGUE/CharacterNames/Lachesis.dialogue.txt" ; 8D92F3
      dialogueCharacterNameAyra .include "TEXT/DIALOGUE/CharacterNames/Ayra.dialogue.txt" ; 8D92F9
      dialogueCharacterNameErinys .include "TEXT/DIALOGUE/CharacterNames/Erinys.dialogue.txt" ; 8D92FE
      dialogueCharacterNameTailtiu .include "TEXT/DIALOGUE/CharacterNames/Tailtiu.dialogue.txt" ; 8D9304
      dialogueCharacterNameSilvia .include "TEXT/DIALOGUE/CharacterNames/Silvia.dialogue.txt" ; 8D930B
      dialogueCharacterNameEdain .include "TEXT/DIALOGUE/CharacterNames/Edain.dialogue.txt" ; 8D9312
      dialogueCharacterNameBrigid .include "TEXT/DIALOGUE/CharacterNames/Brigid.dialogue.txt" ; 8D9319
      dialogueCharacterNameSeliph .include "TEXT/DIALOGUE/CharacterNames/Seliph.dialogue.txt" ; 8D9320
      dialogueCharacterNameShannan .include "TEXT/DIALOGUE/CharacterNames/Shannan.dialogue.txt" ; 8D9325
      dialogueCharacterNameDalvin .include "TEXT/DIALOGUE/CharacterNames/Dalvin.dialogue.txt" ; 8D932B
      dialogueCharacterNameAsaello .include "TEXT/DIALOGUE/CharacterNames/Asaello.dialogue.txt" ; 8D9332
      dialogueCharacterNameLeif .include "TEXT/DIALOGUE/CharacterNames/Leif.dialogue.txt" ; 8D9338
      dialogueCharacterNameIuchar .include "TEXT/DIALOGUE/CharacterNames/Iuchar.dialogue.txt" ; 8D933D
      dialogueCharacterNameCharlot .include "TEXT/DIALOGUE/CharacterNames/Charlot.dialogue.txt" ; 8D9342
      dialogueCharacterNameHawk .include "TEXT/DIALOGUE/CharacterNames/Hawk.dialogue.txt" ; 8D9349
      dialogueCharacterNameTristan .include "TEXT/DIALOGUE/CharacterNames/Tristan.dialogue.txt" ; 8D934E
      dialogueCharacterNameAdultFinn .include "TEXT/DIALOGUE/CharacterNames/AdultFinn.dialogue.txt" ; 8D9355
      dialogueCharacterNameDeimne .include "TEXT/DIALOGUE/CharacterNames/Deimne.dialogue.txt" ; 8D935A
      dialogueCharacterNameHannibal .include "TEXT/DIALOGUE/CharacterNames/Hannibal.dialogue.txt" ; 8D9360
      dialogueCharacterNameAres .include "TEXT/DIALOGUE/CharacterNames/Ares.dialogue.txt" ; 8D9367
      dialogueCharacterNameAmid .include "TEXT/DIALOGUE/CharacterNames/Amid.dialogue.txt" ; 8D936C
      dialogueCharacterNameOifey .include "TEXT/DIALOGUE/CharacterNames/Oifey.dialogue.txt" ; 8D9375
      dialogueCharacterNameDaisy .include "TEXT/DIALOGUE/CharacterNames/Daisy.dialogue.txt" ; 8D937B
      dialogueCharacterNameCreidne .include "TEXT/DIALOGUE/CharacterNames/Creidne.dialogue.txt" ; 8D9381
      dialogueCharacterNameMuirne .include "TEXT/DIALOGUE/CharacterNames/Muirne.dialogue.txt" ; 8D9387
      dialogueCharacterNameJulia .include "TEXT/DIALOGUE/CharacterNames/Julia.dialogue.txt" ; 8D938B
      dialogueCharacterNameAltena .include "TEXT/DIALOGUE/CharacterNames/Altena.dialogue.txt" ; 8D9390
      dialogueCharacterNameHermina .include "TEXT/DIALOGUE/CharacterNames/Hermina.dialogue.txt" ; 8D9396
      dialogueCharacterNameLinda .include "TEXT/DIALOGUE/CharacterNames/Linda.dialogue.txt" ; 8D939C
      dialogueCharacterNameLaylea .include "TEXT/DIALOGUE/CharacterNames/Laylea.dialogue.txt" ; 8D93A1
      dialogueCharacterNameJeanne .include "TEXT/DIALOGUE/CharacterNames/Jeanne.dialogue.txt" ; 8D93A7
      dialogueCharacterNameScathach .include "TEXT/DIALOGUE/CharacterNames/Scathach.dialogue.txt" ; 8D93AD
      dialogueCharacterNameFebail .include "TEXT/DIALOGUE/CharacterNames/Febail.dialogue.txt" ; 8D93B4
      dialogueCharacterNameIucharba .include "TEXT/DIALOGUE/CharacterNames/Iucharba.dialogue.txt" ; 8D93BA
      dialogueCharacterNameCoirpre .include "TEXT/DIALOGUE/CharacterNames/Coirpre.dialogue.txt" ; 8D93C0
      dialogueCharacterNameCed .include "TEXT/DIALOGUE/CharacterNames/Ced.dialogue.txt" ; 8D93C6
      dialogueCharacterNameDiarmuid .include "TEXT/DIALOGUE/CharacterNames/Diarmuid.dialogue.txt" ; 8D93CB
      dialogueCharacterNameLester .include "TEXT/DIALOGUE/CharacterNames/Lester.dialogue.txt" ; 8D93D2
      dialogueCharacterNameArthur .include "TEXT/DIALOGUE/CharacterNames/Arthur.dialogue.txt" ; 8D93D8
      dialogueCharacterNamePatty .include "TEXT/DIALOGUE/CharacterNames/Patty.dialogue.txt" ; 8D93DE
      dialogueCharacterNameLarcei .include "TEXT/DIALOGUE/CharacterNames/Larcei.dialogue.txt" ; 8D93E3
      dialogueCharacterNameLana .include "TEXT/DIALOGUE/CharacterNames/Lana.dialogue.txt" ; 8D93E9
      dialogueCharacterNameFee .include "TEXT/DIALOGUE/CharacterNames/Fee.dialogue.txt" ; 8D93ED
      dialogueCharacterNameTine .include "TEXT/DIALOGUE/CharacterNames/Tine.dialogue.txt" ; 8D93F2
      dialogueCharacterNameLene .include "TEXT/DIALOGUE/CharacterNames/Lene.dialogue.txt" ; 8D93F8
      dialogueCharacterNameNanna .include "TEXT/DIALOGUE/CharacterNames/Nanna.dialogue.txt" ; 8D93FD

      aDialogueItemNames .binclude "TABLES/DIALOGUE/DialogueItemNames.csv.asm"

      dialogueItemNameIronSword .include "TEXT/DIALOGUE/ItemNames/IronSword.dialogue.txt" ; 8D9514
      dialogueItemNameSteelSword .include "TEXT/DIALOGUE/ItemNames/SteelSword.dialogue.txt" ; 8D951B
      dialogueItemNameSilverSword .include "TEXT/DIALOGUE/ItemNames/SilverSword.dialogue.txt" ; 8D9523
      dialogueItemNameIronBlade .include "TEXT/DIALOGUE/ItemNames/IronBlade.dialogue.txt" ; 8D952A
      dialogueItemNameSteelBlade .include "TEXT/DIALOGUE/ItemNames/SteelBlade.dialogue.txt" ; 8D9532
      dialogueItemNameSilverBlade .include "TEXT/DIALOGUE/ItemNames/SilverBlade.dialogue.txt" ; 8D953B
      dialogueItemNameMiracleSword .include "TEXT/DIALOGUE/ItemNames/MiracleSword.dialogue.txt" ; 8D9543
      dialogueItemNameThiefSword .include "TEXT/DIALOGUE/ItemNames/ThiefSword.dialogue.txt" ; 8D954B
      dialogueItemNameBarrierBlade .include "TEXT/DIALOGUE/ItemNames/BarrierBlade.dialogue.txt" ; 8D9554
      dialogueItemNameBerserkSword .include "TEXT/DIALOGUE/ItemNames/BerserkSword.dialogue.txt" ; 8D955C
      dialogueItemNameBraveSword .include "TEXT/DIALOGUE/ItemNames/BraveSword.dialogue.txt" ; 8D9565
      dialogueItemNameSilenceSword .include "TEXT/DIALOGUE/ItemNames/SilenceSword.dialogue.txt" ; 8D956E
      dialogueItemNameSleepSword .include "TEXT/DIALOGUE/ItemNames/SleepSword.dialogue.txt" ; 8D957A
      dialogueItemNameSlimSword .include "TEXT/DIALOGUE/ItemNames/SlimSword.dialogue.txt" ; 8D9583
      dialogueItemNameSafeguard .include "TEXT/DIALOGUE/ItemNames/Safeguard.dialogue.txt" ; 8D958B
      dialogueItemNameFireSword .include "TEXT/DIALOGUE/ItemNames/FireSword.dialogue.txt" ; 8D9593
      dialogueItemNameEarthSword .include "TEXT/DIALOGUE/ItemNames/EarthSword.dialogue.txt" ; 8D959B
      dialogueItemNameThunderSword .include "TEXT/DIALOGUE/ItemNames/ThunderSword.dialogue.txt" ; 8D95A3
      dialogueItemNameWindSword .include "TEXT/DIALOGUE/ItemNames/WindSword.dialogue.txt" ; 8D95AC
      dialogueItemNameLightBrand .include "TEXT/DIALOGUE/ItemNames/LightBrand.dialogue.txt" ; 8D95B3
      dialogueItemNameMystletainn .include "TEXT/DIALOGUE/ItemNames/Mystletainn.dialogue.txt" ; 8D95BE
      dialogueItemNameTyrfing .include "TEXT/DIALOGUE/ItemNames/Tyrfing.dialogue.txt" ; 8D95C7
      dialogueItemNameBalmung .include "TEXT/DIALOGUE/ItemNames/Balmung.dialogue.txt" ; 8D95D0
      dialogueItemNameArmorslayer .include "TEXT/DIALOGUE/ItemNames/Armorslayer.dialogue.txt" ; 8D95D7
      dialogueItemNameWingclipper .include "TEXT/DIALOGUE/ItemNames/Wingclipper.dialogue.txt" ; 8D95E0
      dialogueItemNameBrokenSword .include "TEXT/DIALOGUE/ItemNames/BrokenSword.dialogue.txt" ; 8D95E8
      dialogueItemNameIronLance .include "TEXT/DIALOGUE/ItemNames/IronLance.dialogue.txt" ; 8D95F0
      dialogueItemNameSteelLance .include "TEXT/DIALOGUE/ItemNames/SteelLance.dialogue.txt" ; 8D95F7
      dialogueItemNameSilverLance .include "TEXT/DIALOGUE/ItemNames/SilverLance.dialogue.txt" ; 8D95FF
      dialogueItemNameJavelin .include "TEXT/DIALOGUE/ItemNames/Javelin.dialogue.txt" ; 8D9606
      dialogueItemNameRidersbane .include "TEXT/DIALOGUE/ItemNames/Ridersbane.dialogue.txt" ; 8D960B
      dialogueItemNameBraveLance .include "TEXT/DIALOGUE/ItemNames/BraveLance.dialogue.txt" ; 8D9613
      dialogueItemNameSlimLance .include "TEXT/DIALOGUE/ItemNames/SlimLance.dialogue.txt" ; 8D961C
      dialogueItemNameGungnir .include "TEXT/DIALOGUE/ItemNames/Gungnir.dialogue.txt" ; 8D9624
      dialogueItemNameGaeBolg .include "TEXT/DIALOGUE/ItemNames/GaeBolg.dialogue.txt" ; 8D962B
      dialogueItemNameBrokenLance .include "TEXT/DIALOGUE/ItemNames/BrokenLance.dialogue.txt" ; 8D9632
      dialogueItemNameIronAxe .include "TEXT/DIALOGUE/ItemNames/IronAxe.dialogue.txt" ; 8D963A
      dialogueItemNameSteelAxe .include "TEXT/DIALOGUE/ItemNames/SteelAxe.dialogue.txt" ; 8D9641
      dialogueItemNameSilverAxe .include "TEXT/DIALOGUE/ItemNames/SilverAxe.dialogue.txt" ; 8D9649
      dialogueItemNameBraveAxe .include "TEXT/DIALOGUE/ItemNames/BraveAxe.dialogue.txt" ; 8D9650
      dialogueItemNameHelswath .include "TEXT/DIALOGUE/ItemNames/Helswath.dialogue.txt" ; 8D9659
      dialogueItemNameHandAxe .include "TEXT/DIALOGUE/ItemNames/HandAxe.dialogue.txt" ; 8D9660
      dialogueItemNameBrokenAxe .include "TEXT/DIALOGUE/ItemNames/BrokenAxe.dialogue.txt" ; 8D9665
      dialogueItemNameIronBow .include "TEXT/DIALOGUE/ItemNames/IronBow.dialogue.txt" ; 8D966D
      dialogueItemNameSteelBow .include "TEXT/DIALOGUE/ItemNames/SteelBow.dialogue.txt" ; 8D9674
      dialogueItemNameSilverBow .include "TEXT/DIALOGUE/ItemNames/SilverBow.dialogue.txt" ; 8D967C
      dialogueItemNameBraveBow .include "TEXT/DIALOGUE/ItemNames/BraveBow.dialogue.txt" ; 8D9683
      dialogueItemNameKillerBow .include "TEXT/DIALOGUE/ItemNames/KillerBow.dialogue.txt" ; 8D968C
      dialogueItemNameYewfelle .include "TEXT/DIALOGUE/ItemNames/Yewfelle.dialogue.txt" ; 8D9693
      dialogueItemNameBrokenBow .include "TEXT/DIALOGUE/ItemNames/BrokenBow.dialogue.txt" ; 8D969A
      dialogueItemNameBallista .include "TEXT/DIALOGUE/ItemNames/Ballista.dialogue.txt" ; 8D96A2
      dialogueItemNameIronBallista .include "TEXT/DIALOGUE/ItemNames/IronBallista.dialogue.txt" ; 8D96AA
      dialogueItemNameKillerBallista .include "TEXT/DIALOGUE/ItemNames/KillerBallista.dialogue.txt" ; 8D96B3
      dialogueItemNameGreatBallista .include "TEXT/DIALOGUE/ItemNames/GreatBallista.dialogue.txt" ; 8D96BB
      dialogueItemNameFire .include "TEXT/DIALOGUE/ItemNames/Fire.dialogue.txt" ; 8D96C4
      dialogueItemNameElfire .include "TEXT/DIALOGUE/ItemNames/Elfire.dialogue.txt" ; 8D96CB
      dialogueItemNameBolganone .include "TEXT/DIALOGUE/ItemNames/Bolganone.dialogue.txt" ; 8D96D4
      dialogueItemNameValflame .include "TEXT/DIALOGUE/ItemNames/Valflame.dialogue.txt" ; 8D96DB
      dialogueItemNameMeteor .include "TEXT/DIALOGUE/ItemNames/Meteor.dialogue.txt" ; 8D96E4
      dialogueItemNameThunder .include "TEXT/DIALOGUE/ItemNames/Thunder.dialogue.txt" ; 8D96EA
      dialogueItemNameElthunder .include "TEXT/DIALOGUE/ItemNames/Elthunder.dialogue.txt" ; 8D96F3
      dialogueItemNameThoron .include "TEXT/DIALOGUE/ItemNames/Thoron.dialogue.txt" ; 8D96FE
      dialogueItemNameMjolnir .include "TEXT/DIALOGUE/ItemNames/Mjolnir.dialogue.txt" ; 8D9704
      dialogueItemNameBolting .include "TEXT/DIALOGUE/ItemNames/Bolting.dialogue.txt" ; 8D970D
      dialogueItemNameWind .include "TEXT/DIALOGUE/ItemNames/Wind.dialogue.txt" ; 8D9716
      dialogueItemNameElwind .include "TEXT/DIALOGUE/ItemNames/Elwind.dialogue.txt" ; 8D971C
      dialogueItemNameTornado .include "TEXT/DIALOGUE/ItemNames/Tornado.dialogue.txt" ; 8D9724
      dialogueItemNameForseti .include "TEXT/DIALOGUE/ItemNames/Forseti.dialogue.txt" ; 8D972B
      dialogueItemNameBlizzard .include "TEXT/DIALOGUE/ItemNames/Blizzard.dialogue.txt" ; 8D9733
      dialogueItemNameLight .include "TEXT/DIALOGUE/ItemNames/Light.dialogue.txt" ; 8D973A
      dialogueItemNameNosferatu .include "TEXT/DIALOGUE/ItemNames/Nosferatu.dialogue.txt" ; 8D9742
      dialogueItemNameAura .include "TEXT/DIALOGUE/ItemNames/Aura.dialogue.txt" ; 8D9748
      dialogueItemNameNaga .include "TEXT/DIALOGUE/ItemNames/Naga.dialogue.txt" ; 8D974D
      dialogueItemNameJormungandr .include "TEXT/DIALOGUE/ItemNames/Jormungandr.dialogue.txt" ; 8D9752
      dialogueItemNameFenrir .include "TEXT/DIALOGUE/ItemNames/Fenrir.dialogue.txt" ; 8D975B
      dialogueItemNameHel .include "TEXT/DIALOGUE/ItemNames/Hel.dialogue.txt" ; 8D9762
      dialogueItemNameLoptous .include "TEXT/DIALOGUE/ItemNames/Loptous.dialogue.txt" ; 8D9766
      dialogueItemNameBrokenTome .include "TEXT/DIALOGUE/ItemNames/BrokenTome.dialogue.txt" ; 8D976D
      dialogueItemNameHealStaff .include "TEXT/DIALOGUE/ItemNames/HealStaff.dialogue.txt" ; 8D9777
      dialogueItemNameMendStaff .include "TEXT/DIALOGUE/ItemNames/MendStaff.dialogue.txt" ; 8D977F
      dialogueItemNameRecoverStaff .include "TEXT/DIALOGUE/ItemNames/RecoverStaff.dialogue.txt" ; 8D9788
      dialogueItemNamePhysicStaff .include "TEXT/DIALOGUE/ItemNames/PhysicStaff.dialogue.txt" ; 8D9791
      dialogueItemNameFortify .include "TEXT/DIALOGUE/ItemNames/Fortify.dialogue.txt" ; 8D979A
      dialogueItemNameReturnStaff .include "TEXT/DIALOGUE/ItemNames/ReturnStaff.dialogue.txt" ; 8D97A3
      dialogueItemNameWarpStaff .include "TEXT/DIALOGUE/ItemNames/WarpStaff.dialogue.txt" ; 8D97AC
      dialogueItemNameRescueStaff .include "TEXT/DIALOGUE/ItemNames/RescueStaff.dialogue.txt" ; 8D97B4
      dialogueItemNameCharmStaff .include "TEXT/DIALOGUE/ItemNames/CharmStaff.dialogue.txt" ; 8D97BE
      dialogueItemNameRestoreStaff .include "TEXT/DIALOGUE/ItemNames/RestoreStaff.dialogue.txt" ; 8D97C7
      dialogueItemNameValkyrieStaff .include "TEXT/DIALOGUE/ItemNames/ValkyrieStaff.dialogue.txt" ; 8D97CF
      dialogueItemNameSilenceStaff .include "TEXT/DIALOGUE/ItemNames/SilenceStaff.dialogue.txt" ; 8D97D9
      dialogueItemNameSleepStaff .include "TEXT/DIALOGUE/ItemNames/SleepStaff.dialogue.txt" ; 8D97E5
      dialogueItemNameBerserkStaff .include "TEXT/DIALOGUE/ItemNames/BerserkStaff.dialogue.txt" ; 8D97EE
      dialogueItemNameThiefStaff .include "TEXT/DIALOGUE/ItemNames/ThiefStaff.dialogue.txt" ; 8D97F7
      dialogueItemNameBrokenStaff .include "TEXT/DIALOGUE/ItemNames/BrokenStaff.dialogue.txt" ; 8D97FF
      dialogueItemNameRenewalBand .include "TEXT/DIALOGUE/ItemNames/RenewalBand.dialogue.txt" ; 8D9807
      dialogueItemNameParagonBand .include "TEXT/DIALOGUE/ItemNames/ParagonBand.dialogue.txt" ; 8D9810
      dialogueItemNameThiefBand .include "TEXT/DIALOGUE/ItemNames/ThiefBand.dialogue.txt" ; 8D9819
      dialogueItemNameMiracleBand .include "TEXT/DIALOGUE/ItemNames/MiracleBand.dialogue.txt" ; 8D9822
      dialogueItemNamePursuitRing .include "TEXT/DIALOGUE/ItemNames/PursuitRing.dialogue.txt" ; 8D982B
      dialogueItemNameRecoverRing .include "TEXT/DIALOGUE/ItemNames/RecoverRing.dialogue.txt" ; 8D9834
      dialogueItemNameBargainBand .include "TEXT/DIALOGUE/ItemNames/BargainBand.dialogue.txt" ; 8D983D
      dialogueItemNameKnightRing .include "TEXT/DIALOGUE/ItemNames/KnightRing.dialogue.txt" ; 8D9846
      dialogueItemNameReturnBand .include "TEXT/DIALOGUE/ItemNames/ReturnBand.dialogue.txt" ; 8D984E
      dialogueItemNameSpeedRing .include "TEXT/DIALOGUE/ItemNames/SpeedRing.dialogue.txt" ; 8D9857
      dialogueItemNameMagicRing .include "TEXT/DIALOGUE/ItemNames/MagicRing.dialogue.txt" ; 8D9860
      dialogueItemNamePowerRing .include "TEXT/DIALOGUE/ItemNames/PowerRing.dialogue.txt" ; 8D9869
      dialogueItemNameShieldRing .include "TEXT/DIALOGUE/ItemNames/ShieldRing.dialogue.txt" ; 8D9871
      dialogueItemNameBarrierRing .include "TEXT/DIALOGUE/ItemNames/BarrierRing.dialogue.txt" ; 8D987A
      dialogueItemNameLegRing .include "TEXT/DIALOGUE/ItemNames/LegRing.dialogue.txt" ; 8D9882
      dialogueItemNameSkillRing .include "TEXT/DIALOGUE/ItemNames/SkillRing.dialogue.txt" ; 8D988A

      aDialogueClassNames .binclude "TABLES/DIALOGUE/DialogueClassNames.csv.asm"

      dialogueClassNameCavalier .include "TEXT/DIALOGUE/ClassNames/Cavalier.dialogue.txt" ; 8D9922
      dialogueClassNameLanceKnight .include "TEXT/DIALOGUE/ClassNames/LanceKnight.dialogue.txt" ; 8D992B
      dialogueClassNameBowKnight .include "TEXT/DIALOGUE/ClassNames/BowKnight.dialogue.txt" ; 8D9933
      dialogueClassNameAxeKnight .include "TEXT/DIALOGUE/ClassNames/AxeKnight.dialogue.txt" ; 8D993B
      dialogueClassNameFreeKnight .include "TEXT/DIALOGUE/ClassNames/FreeKnight.dialogue.txt" ; 8D9943
      dialogueClassNameTroubadour .include "TEXT/DIALOGUE/ClassNames/Troubadour.dialogue.txt" ; 8D994B
      dialogueClassNameKnightLord .include "TEXT/DIALOGUE/ClassNames/KnightLord.dialogue.txt" ; 8D9953
      dialogueClassNameDukeKnight .include "TEXT/DIALOGUE/ClassNames/DukeKnight.dialogue.txt" ; 8D995B
      dialogueClassNameMasterKnight .include "TEXT/DIALOGUE/ClassNames/MasterKnight.dialogue.txt" ; 8D9964
      dialogueClassNamePaladin .include "TEXT/DIALOGUE/ClassNames/Paladin.dialogue.txt" ; 8D996D
      dialogueClassNameArchKnight .include "TEXT/DIALOGUE/ClassNames/ArchKnight.dialogue.txt" ; 8D9974
      dialogueClassNameRanger .include "TEXT/DIALOGUE/ClassNames/Ranger.dialogue.txt" ; 8D997B
      dialogueClassNameMageKnight .include "TEXT/DIALOGUE/ClassNames/MageKnight.dialogue.txt" ; 8D9985
      dialogueClassNameGreatKnight .include "TEXT/DIALOGUE/ClassNames/GreatKnight.dialogue.txt" ; 8D998D
      dialogueClassNamePegasusRider .include "TEXT/DIALOGUE/ClassNames/PegasusRider.dialogue.txt" ; 8D9996
      dialogueClassNamePegasusKnight .include "TEXT/DIALOGUE/ClassNames/PegasusKnight.dialogue.txt" ; 8D99A0
      dialogueClassNameFalconKnight .include "TEXT/DIALOGUE/ClassNames/FalconKnight.dialogue.txt" ; 8D99A9
      dialogueClassNameDragonrider .include "TEXT/DIALOGUE/ClassNames/Dragonrider.dialogue.txt" ; 8D99B3
      dialogueClassNameDragonknight .include "TEXT/DIALOGUE/ClassNames/Dragonknight.dialogue.txt" ; 8D99BD
      dialogueClassNameDragonmaster .include "TEXT/DIALOGUE/ClassNames/Dragonmaster.dialogue.txt" ; 8D99C6
      dialogueClassNameArcher .include "TEXT/DIALOGUE/ClassNames/Archer.dialogue.txt" ; 8D99D0
      dialogueClassNameMyrmidon .include "TEXT/DIALOGUE/ClassNames/Myrmidon.dialogue.txt" ; 8D99D9
      dialogueClassNameSwordmaster .include "TEXT/DIALOGUE/ClassNames/Swordmaster.dialogue.txt" ; 8D99E3
      dialogueClassNameSniper .include "TEXT/DIALOGUE/ClassNames/Sniper.dialogue.txt" ; 8D99EC
      dialogueClassNameHero .include "TEXT/DIALOGUE/ClassNames/Hero.dialogue.txt" ; 8D99F3
      dialogueClassNameGeneral .include "TEXT/DIALOGUE/ClassNames/General.dialogue.txt" ; 8D99FB
      dialogueClassNameEmperor .include "TEXT/DIALOGUE/ClassNames/Emperor.dialogue.txt" ; 8D9A02
      dialogueClassNameBaron .include "TEXT/DIALOGUE/ClassNames/Baron.dialogue.txt" ; 8D9A09
      dialogueClassNameSoldier .include "TEXT/DIALOGUE/ClassNames/Soldier.dialogue.txt" ; 8D9A0E
      dialogueClassNameSpearSoldier .include "TEXT/DIALOGUE/ClassNames/SpearSoldier.dialogue.txt" ; 8D9A15
      dialogueClassNameAxeSoldier .include "TEXT/DIALOGUE/ClassNames/AxeSoldier.dialogue.txt" ; 8D9A1F
      dialogueClassNameBowSoldier .include "TEXT/DIALOGUE/ClassNames/BowSoldier.dialogue.txt" ; 8D9A29
      dialogueClassNameSwordSoldier .include "TEXT/DIALOGUE/ClassNames/SwordSoldier.dialogue.txt" ; 8D9A30
      dialogueClassNameLanceArmor .include "TEXT/DIALOGUE/ClassNames/LanceArmor.dialogue.txt" ; 8D9A3A
      dialogueClassNameAxeArmor .include "TEXT/DIALOGUE/ClassNames/AxeArmor.dialogue.txt" ; 8D9A40
      dialogueClassNameBowArmor .include "TEXT/DIALOGUE/ClassNames/BowArmor.dialogue.txt" ; 8D9A49
      dialogueClassNameSwordArmor .include "TEXT/DIALOGUE/ClassNames/SwordArmor.dialogue.txt" ; 8D9A51
      dialogueClassNameBarbarian .include "TEXT/DIALOGUE/ClassNames/Barbarian.dialogue.txt" ; 8D9A5A
      dialogueClassNameFighter .include "TEXT/DIALOGUE/ClassNames/Fighter.dialogue.txt" ; 8D9A62
      dialogueClassNameBrigand .include "TEXT/DIALOGUE/ClassNames/Brigand.dialogue.txt" ; 8D9A6C
      dialogueClassNameWarrior .include "TEXT/DIALOGUE/ClassNames/Warrior.dialogue.txt" ; 8D9A76
      dialogueClassNameHunter .include "TEXT/DIALOGUE/ClassNames/Hunter.dialogue.txt" ; 8D9A7D
      dialogueClassNamePirate .include "TEXT/DIALOGUE/ClassNames/Pirate.dialogue.txt" ; 8D9A83
      dialogueClassNameJuniorLord .include "TEXT/DIALOGUE/ClassNames/JuniorLord.dialogue.txt" ; 8D9A8A
      dialogueClassNameWarMage .include "TEXT/DIALOGUE/ClassNames/WarMage.dialogue.txt" ; 8D9A93
      dialogueClassNamePrince .include "TEXT/DIALOGUE/ClassNames/Prince.dialogue.txt" ; 8D9A9D
      dialogueClassNamePrincess .include "TEXT/DIALOGUE/ClassNames/Princess.dialogue.txt" ; 8D9AA3
      dialogueClassNameWarMageF .include "TEXT/DIALOGUE/ClassNames/WarMageF.dialogue.txt" ; 8D9AAA
      dialogueClassNameQueen .include "TEXT/DIALOGUE/ClassNames/Queen.dialogue.txt" ; 8D9AB4
      dialogueClassNameDancer .include "TEXT/DIALOGUE/ClassNames/Dancer.dialogue.txt" ; 8D9ABA
      dialogueClassNamePriest .include "TEXT/DIALOGUE/ClassNames/Priest.dialogue.txt" ; 8D9AC3
      dialogueClassNameMage .include "TEXT/DIALOGUE/ClassNames/Mage.dialogue.txt" ; 8D9ACA
      dialogueClassNameFireMage .include "TEXT/DIALOGUE/ClassNames/FireMage.dialogue.txt" ; 8D9ACF
      dialogueClassNameThunderMage .include "TEXT/DIALOGUE/ClassNames/ThunderMage.dialogue.txt" ; 8D9AD8
      dialogueClassNameWindMage .include "TEXT/DIALOGUE/ClassNames/WindMage.dialogue.txt" ; 8D9AE4
      dialogueClassNameHighPriest .include "TEXT/DIALOGUE/ClassNames/HighPriest.dialogue.txt" ; 8D9AED
      dialogueClassNameBishop .include "TEXT/DIALOGUE/ClassNames/Bishop.dialogue.txt" ; 8D9AF6
      dialogueClassNameSage .include "TEXT/DIALOGUE/ClassNames/Sage.dialogue.txt" ; 8D9AFD
      dialogueClassNameBard .include "TEXT/DIALOGUE/ClassNames/Bard.dialogue.txt" ; 8D9B02
      dialogueClassNamePriestess .include "TEXT/DIALOGUE/ClassNames/Priestess.dialogue.txt" ; 8D9B07
      dialogueClassNameDarkMage .include "TEXT/DIALOGUE/ClassNames/DarkMage.dialogue.txt" ; 8D9B0E
      dialogueClassNameDarkBishop .include "TEXT/DIALOGUE/ClassNames/DarkBishop.dialogue.txt" ; 8D9B16
      dialogueClassNameThief .include "TEXT/DIALOGUE/ClassNames/Thief.dialogue.txt" ; 8D9B1D
      dialogueClassNameRogue .include "TEXT/DIALOGUE/ClassNames/Rogue.dialogue.txt" ; 8D9B22
      dialogueClassNameCivilian .include "TEXT/DIALOGUE/ClassNames/Civilian.dialogue.txt" ; 8D9B2C
      dialogueClassNameChild .include "TEXT/DIALOGUE/ClassNames/Child.dialogue.txt" ; 8D9B33
      dialogueClassNameBallistician .include "TEXT/DIALOGUE/ClassNames/Ballistician.dialogue.txt" ; 8D9B3A
      dialogueClassNameIronBallistician .include "TEXT/DIALOGUE/ClassNames/IronBallistician.dialogue.txt" ; 8D9B42
      dialogueClassNameKillerBallistician .include "TEXT/DIALOGUE/ClassNames/KillerBallistician.dialogue.txt" ; 8D9B4B
      dialogueClassNameGreatBallistician .include "TEXT/DIALOGUE/ClassNames/GreatBallistician.dialogue.txt" ; 8D9B53
      dialogueClassNameDarkPrince .include "TEXT/DIALOGUE/ClassNames/DarkPrince.dialogue.txt" ; 8D9B5C

      ; 8d9b65

    .here

    * = $0D9FB1
    .logical $8D9FB1

      dialogueGen1HomeCastleSeized .include "TEXT/DIALOGUE/General/Gen1HomeCastleSeized.dialogue.txt" ; 8D9FB1
      dialogueGen2HomeCastleSeized .include "TEXT/DIALOGUE/General/Gen2HomeCastleSeized.dialogue.txt" ; 8D9FED
      dialogueSigurdDeathReaction .include "TEXT/DIALOGUE/General/SigurdDeathReaction.dialogue.txt" ; 8DA022
      dialogueSeliphDeathReaction .include "TEXT/DIALOGUE/General/SeliphDeathReaction.dialogue.txt" ; 8DA047

      ; 8da06a

    .here

    * = $0DB63D
    .logical $8DB63D

      .dsection EpilogueDialogueWorldMapCodeSection

      ; 8D/C964

    .here

    * = $0DDCA7
    .logical $8DDCA7

      dialogueChapterEpilogueWorldMapSilesse .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMapSilesse.dialogue.txt" ; 8DDCA7
      dialogueChapterEpilogueWorldMap_Silesse_NoInheritors .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Silesse_NoInheritors.dialogue.txt" ; 8DDCB3
      dialogueChapterEpilogueWorldMap_Silesse_Inherited .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Silesse_Inherited.dialogue.txt" ; 8DDE0C
      dialogueChapterEpilogueWorldMap_Silesse_Piece_Start .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Silesse_Piece_Start.dialogue.txt" ; 8DDEE5
      dialogueChapterEpilogueWorldMap_Silesse_Piece_End .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Silesse_Piece_End.dialogue.txt" ; 8DDEF0
      dialogueChapterEpilogueWorldMap_Silesse_Piece_RulerNoLover .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Silesse_Piece_RulerNoLover.dialogue.txt" ; 8DDF0B
      dialogueChapterEpilogueWorldMap_Silesse_Piece_RulersLover .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Silesse_Piece_RulersLover.dialogue.txt" ; 8DDF15
      dialogueChapterEpilogueWorldMap_Silesse_Piece_RulersSister .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Silesse_Piece_RulersSister.dialogue.txt" ; 8DDF36
      dialogueChapterEpilogueWorldMap_Silesse_Piece_CedHawk .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Silesse_Piece_CedHawk.dialogue.txt" ; 8DDF4E
      dialogueChapterEpilogueWorldMap_Silesse_Piece_CedHawksLover .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Silesse_Piece_CedHawksLover.dialogue.txt" ; 8DDF73
      dialogueChapterEpilogueWorldMap_Silesse_Piece_FeeHermina .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Silesse_Piece_FeeHermina.dialogue.txt" ; 8DDF86

      dialogueChapterEpilogueWorldMapNewThracia .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMapNewThracia.dialogue.txt" ; 8DDFA2
      dialogueChapterEpilogueWorldMap_NewThracia_NoInheritors .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_NewThracia_NoInheritors.dialogue.txt" ; 8DDFAE
      dialogueChapterEpilogueWorldMap_NewThracia_Inherited .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_NewThracia_Inherited.dialogue.txt" ; 8DE0E8
      dialogueChapterEpilogueWorldMap_Piece_NewThracia_EndLeifAndAltenaAlive .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Piece_NewThracia_EndLeifAndAltenaAlive.dialogue.txt" ; 8DE1FE
      dialogueChapterEpilogueWorldMap_Piece_NewThracia_LeifNoLover .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Piece_NewThracia_LeifNoLover.dialogue.txt" ; 8DE285
      dialogueChapterEpilogueWorldMap_Piece_NewThracia_Start .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Piece_NewThracia_Start.dialogue.txt" ; 8DE28F
      dialogueChapterEpilogueWorldMap_Piece_NewThracia_LeifsLover .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Piece_NewThracia_LeifsLover.dialogue.txt" ; 8DE295
      dialogueChapterEpilogueWorldMap_Piece_NewThracia_Finn .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Piece_NewThracia_Finn.dialogue.txt" ; 8DE2B6
      dialogueChapterEpilogueWorldMap_Piece_NewThracia_Hannibal .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Piece_NewThracia_Hannibal.dialogue.txt" ; 8DE2D2
      dialogueChapterEpilogueWorldMap_Piece_NewThracia_CharlotCoirpre .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Piece_NewThracia_CharlotCoirpre.dialogue.txt" ; 8DE2EE
      dialogueChapterEpilogueWorldMap_Piece_NewThracia_CharlotCoirpresLover .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Piece_NewThracia_CharlotCoirpresLover.dialogue.txt" ; 8DE312
      dialogueChapterEpilogueWorldMap_Piece_NewThracia_Asaello .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Piece_NewThracia_Asaello.dialogue.txt" ; 8DE325
      dialogueChapterEpilogueWorldMap_Piece_NewThracia_AsaellosLover .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Piece_NewThracia_AsaellosLover.dialogue.txt" ; 8DE34A
      dialogueChapterEpilogueWorldMap_Piece_NewThracia_Daisy .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Piece_NewThracia_Daisy.dialogue.txt" ; 8DE35D
      dialogueChapterEpilogueWorldMap_Piece_NewThracia_EndNoInheritors .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Piece_NewThracia_EndNoInheritors.dialogue.txt" ; 8DE381
      dialogueChapterEpilogueWorldMap_Piece_NewThracia_EndInherited .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Piece_NewThracia_EndInherited.dialogue.txt" ; 8DE39F

      dialogueChapterEpilogueWorldMapIsaach .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMapIsaach.dialogue.txt" ; 8DE3C7
      dialogueChapterEpilogueWorldMap_Isaach_NoInheritors .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Isaach_NoInheritors.dialogue.txt" ; 8DE3D3
      dialogueChapterEpilogueWorldMap_Isaach_Inherited .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Isaach_Inherited.dialogue.txt" ; 8DE517
      dialogueChapterEpilogueWorldMap_Isaach_Piece_NoInheritorsSubstitutes .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Isaach_Piece_NoInheritorsSubstitutes.dialogue.txt" ; 8DE686
      dialogueChapterEpilogueWorldMap_Isaach_Piece_NoInheritorsChildren .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Isaach_Piece_NoInheritorsChildren.dialogue.txt" ; 8DE6A4
      dialogueChapterEpilogueWorldMap_Isaach_Piece_RulerNoLover .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Isaach_Piece_RulerNoLover.dialogue.txt" ; 8DE6D3
      dialogueChapterEpilogueWorldMap_Isaach_Piece_RulersLover .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Isaach_Piece_RulersLover.dialogue.txt" ; 8DE6DD
      dialogueChapterEpilogueWorldMap_Isaach_Piece_ScathachDalvin .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Isaach_Piece_ScathachDalvin.dialogue.txt" ; 8DE6FE
      dialogueChapterEpilogueWorldMap_Isaach_Piece_ScathachDalvinsLover .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Isaach_Piece_ScathachDalvinsLover.dialogue.txt" ; 8DE71B
      dialogueChapterEpilogueWorldMap_Isaach_Piece_LarceiCreidne .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Isaach_Piece_LarceiCreidne.dialogue.txt" ; 8DE730
      dialogueChapterEpilogueWorldMap_Isaach_Piece_EndNoInheritors .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Isaach_Piece_EndNoInheritors.dialogue.txt" ; 8DE745
      dialogueChapterEpilogueWorldMap_Isaach_Piece_EndInherited .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Isaach_Piece_EndInherited.dialogue.txt" ; 8DE755
      dialogueChapterEpilogueWorldMap_Isaach_Piece_Deimne .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Isaach_Piece_Deimne.dialogue.txt" ; 8DE75D
      dialogueChapterEpilogueWorldMap_Isaach_Piece_DeimnesLover .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Isaach_Piece_DeimnesLover.dialogue.txt" ; 8DE77D
      dialogueChapterEpilogueWorldMap_Isaach_Piece_Muirne .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Isaach_Piece_Muirne.dialogue.txt" ; 8DE792

      dialogueChapterEpilogueWorldMapAgustria .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMapAgustria.dialogue.txt" ; 8DE7A8
      dialogueChapterEpilogueWorldMap_Agustria_NoInheritors .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Agustria_NoInheritors.dialogue.txt" ; 8DE7EE
      dialogueChapterEpilogueWorldMap_Agustria_Inherited .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Agustria_Inherited.dialogue.txt" ; 8DE90C
      dialogueChapterEpilogueWorldMap_Agustria_Piece_RulerNoLover .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Agustria_Piece_RulerNoLover.dialogue.txt" ; 8DEA1B
      dialogueChapterEpilogueWorldMap_Agustria_Piece_Start .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Agustria_Piece_Start.dialogue.txt" ; 8DEA25
      dialogueChapterEpilogueWorldMap_Agustria_Piece_RulersLover .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Agustria_Piece_RulersLover.dialogue.txt" ; 8DEA36
      dialogueChapterEpilogueWorldMap_Agustria_Piece_LayleaLene .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Agustria_Piece_LayleaLene.dialogue.txt" ; 8DEA52
      dialogueChapterEpilogueWorldMap_Agustria_Piece_DiarmuidTristan .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Agustria_Piece_DiarmuidTristan.dialogue.txt" ; 8DEA67
      dialogueChapterEpilogueWorldMap_Agustria_Piece_DiarmuidTristansLover .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Agustria_Piece_DiarmuidTristansLover.dialogue.txt" ; 8DEA87
      dialogueChapterEpilogueWorldMap_Agustria_Piece_NannaJeanne .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Agustria_Piece_NannaJeanne.dialogue.txt" ; 8DEA9C
      dialogueChapterEpilogueWorldMap_Agustria_Piece_End .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Agustria_Piece_End.dialogue.txt" ; 8DEAB1

      dialogueChapterEpilogueWorldMapVerdane .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMapVerdane.dialogue.txt" ; 8DEAD6
      dialogueChapterEpilogueWorldMap_Verdane_NoInheritors .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Verdane_NoInheritors.dialogue.txt" ; 8DEBAE
      dialogueChapterEpilogueWorldMap_Verdane_Inherited .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Verdane_Inherited.dialogue.txt" ; 8DECAA
      dialogueChapterEpilogueWorldMap_Verdane_Piece_JamkesSonNoLover .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Verdane_Piece_JamkesSonNoLover.dialogue.txt" ; 8DED99
      dialogueChapterEpilogueWorldMap_Verdane_Piece_JamkesSonLover .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Verdane_Piece_JamkesSonLover.dialogue.txt" ; 8DEDA3

      dialogueChapterEpilogueWorldMapGrannvale .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMapGrannvale.dialogue.txt" ; 8DEDC4
      dialogueChapterEpilogueWorldMap_Grannvale_Piece_PrepareQueen .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Grannvale_Piece_PrepareQueen.dialogue.txt" ; 8DEF0A
      dialogueChapterEpilogueWorldMap_Grannvale_Piece_SoloQueen .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Grannvale_Piece_SoloQueen.dialogue.txt" ; 8DEF1A
      dialogueChapterEpilogueWorldMap_Grannvale_Piece_QueenAndJulia .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Grannvale_Piece_QueenAndJulia.dialogue.txt" ; 8DEF52
      dialogueChapterEpilogueWorldMap_Grannvale_Piece_NoQueenAndJulia .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Grannvale_Piece_NoQueenAndJulia.dialogue.txt" ; 8DEFBD
      dialogueChapterEpilogueWorldMap_Grannvale_Piece_Start .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Grannvale_Piece_Start.dialogue.txt" ; 8DEFFB
      dialogueChapterEpilogueWorldMap_Grannvale_Piece_Velthomer_Ruler .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Grannvale_Piece_Velthomer_Ruler.dialogue.txt" ; 8DF062
      dialogueChapterEpilogueWorldMap_Grannvale_Piece_Velthomer_AzellesSonLover .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Grannvale_Piece_Velthomer_AzellesSonLover.dialogue.txt" ; 8DF08D
      dialogueChapterEpilogueWorldMap_Grannvale_Piece_Velthomer_AzellesChildren .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Grannvale_Piece_Velthomer_AzellesChildren.dialogue.txt" ; 8DF0A2
      dialogueChapterEpilogueWorldMap_Grannvale_Piece_Friege_Ruler .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Grannvale_Piece_Friege_Ruler.dialogue.txt" ; 8DF0BC
      dialogueChapterEpilogueWorldMap_Grannvale_Piece_Friege_RulersLover .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Grannvale_Piece_Friege_RulersLover.dialogue.txt" ; 8DF0E8
      dialogueChapterEpilogueWorldMap_Grannvale_Piece_Friege_RulersSister .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Grannvale_Piece_Friege_RulersSister.dialogue.txt" ; 8DF0FD
      dialogueChapterEpilogueWorldMap_Grannvale_Piece_Edda_Ruler .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Grannvale_Piece_Edda_Ruler.dialogue.txt" ; 8DF117
      dialogueChapterEpilogueWorldMap_Grannvale_Piece_Edda_RulersLover .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Grannvale_Piece_Edda_RulersLover.dialogue.txt" ; 8DF142
      dialogueChapterEpilogueWorldMap_Grannvale_Piece_Edda_RulersSister .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Grannvale_Piece_Edda_RulersSister.dialogue.txt" ; 8DF157
      dialogueChapterEpilogueWorldMap_Grannvale_Piece_Dozel_Ruler .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Grannvale_Piece_Dozel_Ruler.dialogue.txt" ; 8DF171
      dialogueChapterEpilogueWorldMap_Grannvale_Piece_Dozel_RulersLover .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Grannvale_Piece_Dozel_RulersLover.dialogue.txt" ; 8DF19C
      dialogueChapterEpilogueWorldMap_Grannvale_Piece_Dozel_RulersSister .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Grannvale_Piece_Dozel_RulersSister.dialogue.txt" ; 8DF1B1
      dialogueChapterEpilogueWorldMap_Grannvale_Piece_Dozel_Iuchar .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Grannvale_Piece_Dozel_Iuchar.dialogue.txt" ; 8DF1CB
      dialogueChapterEpilogueWorldMap_Grannvale_Piece_Dozel_IucharsLover .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Grannvale_Piece_Dozel_IucharsLover.dialogue.txt" ; 8DF1EA
      dialogueChapterEpilogueWorldMap_Grannvale_Piece_Dozel_Iucharba .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Grannvale_Piece_Dozel_Iucharba.dialogue.txt" ; 8DF1FF
      dialogueChapterEpilogueWorldMap_Grannvale_Piece_Dozel_IucharbasLover .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Grannvale_Piece_Dozel_IucharbasLover.dialogue.txt" ; 8DF220
      dialogueChapterEpilogueWorldMap_Grannvale_Piece_Yngvi_Ruler .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Grannvale_Piece_Yngvi_Ruler.dialogue.txt" ; 8DF235
      dialogueChapterEpilogueWorldMap_Grannvale_Piece_Yngvi_RulersLover .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Grannvale_Piece_Yngvi_RulersLover.dialogue.txt" ; 8DF262
      dialogueChapterEpilogueWorldMap_Grannvale_Piece_Yngvi_RulersSister .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Grannvale_Piece_Yngvi_RulersSister.dialogue.txt" ; 8DF277
      dialogueChapterEpilogueWorldMap_Grannvale_Piece_Yngvi_Lester .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Grannvale_Piece_Yngvi_Lester.dialogue.txt" ; 8DF291
      dialogueChapterEpilogueWorldMap_Grannvale_Piece_Yngvi_LestersLover .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Grannvale_Piece_Yngvi_LestersLover.dialogue.txt" ; 8DF2B1
      dialogueChapterEpilogueWorldMap_Grannvale_Piece_Yngvi_Lana .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Grannvale_Piece_Yngvi_Lana.dialogue.txt" ; 8DF2C6
      dialogueChapterEpilogueWorldMap_Grannvale_Piece_Chalphy_Oifey .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Grannvale_Piece_Chalphy_Oifey.dialogue.txt" ; 8DF2E0
      dialogueChapterEpilogueWorldMap_Grannvale_Piece_Chalphy_OifeysLover .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Grannvale_Piece_Chalphy_OifeysLover.dialogue.txt" ; 8DF314
      dialogueChapterEpilogueWorldMap_Grannvale_Piece_Unknown8DF329 .include "TEXT/DIALOGUE/EpilogueWorldMap/WorldMap_Grannvale_Piece_Unknown8DF329.dialogue.txt" ; 8DF329

      dialogueChapter07LeifSeliphTalk .include "TEXT/DIALOGUE/Chapter07/LeifSeliphTalk.dialogue.txt" ; 8DF32D
      dialogueChapter07DiarmuidNannaTalk .include "TEXT/DIALOGUE/Chapter07/DiarmuidNannaTalk.dialogue.txt" ; 8DF6F8
      dialogueChapter07TristanJeanneTalk .include "TEXT/DIALOGUE/Chapter07/TristanJeanneTalk.dialogue.txt" ; 8DF8FB
      dialogueChapter07TineSeliphTalk .include "TEXT/DIALOGUE/Chapter07/TineSeliphTalk.dialogue.txt" ; 8DFAFB

      aWorldMapEvents .binclude "TABLES/CHAPTER/WorldMapEvents.csv.asm"

      .include "EVENTS/ChapterPrologue/EventPrologueWorldMap.asm"
      .include "EVENTS/Chapter01/EventChapter01WorldMap.asm"
      .include "EVENTS/Chapter02/EventChapter02WorldMap.asm"
      .include "EVENTS/Chapter03/EventChapter03WorldMap.asm"
      .include "EVENTS/Chapter04/EventChapter04WorldMap.asm"
      .include "EVENTS/Chapter05/EventChapter05WorldMap.asm"
      .include "EVENTS/Chapter06/EventChapter06WorldMap.asm"
      .include "EVENTS/Chapter07/EventChapter07WorldMap.asm"
      .include "EVENTS/Chapter08/EventChapter08WorldMap.asm"
      .include "EVENTS/Chapter09/EventChapter09WorldMap.asm"
      .include "EVENTS/Chapter10/EventChapter10WorldMap.asm"
      .include "EVENTS/ChapterFinal/EventChapterFinalWorldMap.asm"
      .include "EVENTS/ChapterEpilogue/EventChapterEpilogueWorldMap.asm"

      .fill $8D8000 + $8000 - *, 0

    .here

    * = $0E8000
    .logical $8E8000

      .include "EVENTS/Chapter02/EventChapter02Opening.asm"
      .include "EVENTS/Chapter02/EventChapter02InfiniBrigandsSpawn.asm"
      .include "EVENTS/Chapter02/EventChapter02ElliotCharge.asm"
      .include "EVENTS/Chapter02/EventChapter02PhilipDefend.asm"
      .include "EVENTS/Chapter02/EventChapter02LewynSilviaSpawn.asm"
      .include "EVENTS/Chapter02/EventChapter02InfiniSpawn.asm"
      .include "EVENTS/Chapter02/EventChapter02WaltzCharge.asm"
      .include "EVENTS/Chapter02/EventChapter02SigurdLachesisTalk.asm"
      .include "EVENTS/Chapter02/EventChapter02BeowulfTalkNoMoney.asm"
      .include "EVENTS/Chapter02/EventChapter02BeowulfTalkSuccess.asm"
      .include "EVENTS/Chapter02/EventChapter02MackilySpawn.asm"
      .include "EVENTS/Chapter02/EventChapter02ChulainnRecruitmentEvans.asm"
      .include "EVENTS/Chapter02/EventChapter02AgustiSpawn.asm"
      .include "EVENTS/Chapter02/EventChapter02LewynErinysTalk.asm"
      .include "EVENTS/Chapter02/EventChapter02Ending.asm"
      .include "EVENTS/Chapter02/EventChapter02Village8.asm"
      .include "EVENTS/Chapter02/EventChapter02VillageBargainBand.asm"
      .include "EVENTS/Chapter02/EventChapter02VillageArmorslayer.asm"
      .include "EVENTS/Chapter02/EventChapter02Village5.asm"
      .include "EVENTS/Chapter02/EventChapter02Village2.asm"
      .include "EVENTS/Chapter02/EventChapter02Village4.asm"
      .include "EVENTS/Chapter02/EventChapter02Village6.asm"
      .include "EVENTS/Chapter02/EventChapter02Village7.asm"
      .include "EVENTS/Chapter02/EventChapter02_05B.asm"
      .include "EVENTS/Chapter02/EventChapter02_05C.asm"
      .include "EVENTS/Chapter02/EventChapter02ChulainnRecruitmentHeirhein.asm"
      .include "EVENTS/Chapter02/EventChapter02ChulainnRecruitmentInfini.asm"
      .include "EVENTS/Chapter02/EventChapter02ChulainnRecruitmentMackily.asm"
      .include "EVENTS/Chapter02/EventChapter02ChulainnRecruitmentNordion.asm"
      .include "EVENTS/Chapter02/EventChapter02HeirheinSeized.asm"
      .include "EVENTS/Chapter02/EventChapter02ErinysGroupArrive.asm"
      .include "EVENTS/Chapter02/EventChapter02InfiniSeized.asm"
      .include "EVENTS/Chapter02/EventChapter02_064.asm"
      .include "EVENTS/Chapter02/EventChapter02MackilyWorried.asm"
      .include "EVENTS/Chapter02/EventChapter02Village1.asm"
      .include "EVENTS/Chapter02/EventChapter02Village3.asm"
      .include "EVENTS/Chapter02/EventChapter02QuanDied.asm"
      .include "EVENTS/Chapter02/EventChapter02EthlynDied.asm"
      .include "EVENTS/Chapter02/EventChapter02FinnDied.asm"
      .include "EVENTS/Chapter02/EventChapter02MackilySeized.asm"
      .include "EVENTS/Chapter02/EventChapter02_06C.asm"
      .include "EVENTS/Chapter02/EventChapter02_06D.asm"
      .include "EVENTS/Chapter02/EventChapter02_06E.asm"
      .include "EVENTS/Chapter02/EventChapter02_06F.asm"
      .include "EVENTS/Chapter02/EventChapter02MountainArmorTalk.asm"
      .include "EVENTS/Chapter02/EventChapter02ArdenPursuitRing.asm"

      dialogueChapter02WorldMap1 .include "TEXT/DIALOGUE/Chapter02/WorldMap1.dialogue.txt" ; 8E8AC1
      dialogueChapter02WorldMap2 .include "TEXT/DIALOGUE/Chapter02/WorldMap2.dialogue.txt" ; 8E8B27
      dialogueChapter02WorldMap3 .include "TEXT/DIALOGUE/Chapter02/WorldMap3.dialogue.txt" ; 8E8B84
      dialogueChapter02WorldMap4 .include "TEXT/DIALOGUE/Chapter02/WorldMap4.dialogue.txt" ; 8E8C1B

      dialogueChapter03WorldMap1 .include "TEXT/DIALOGUE/Chapter03/WorldMap1.dialogue.txt" ; 8E8CB7
      dialogueChapter03WorldMap2 .include "TEXT/DIALOGUE/Chapter03/WorldMap2.dialogue.txt" ; 8E8D17
      dialogueChapter03WorldMap3 .include "TEXT/DIALOGUE/Chapter03/WorldMap3.dialogue.txt" ; 8E8DAB
      dialogueChapter03WorldMap4 .include "TEXT/DIALOGUE/Chapter03/WorldMap4.dialogue.txt" ; 8E8E3F
      dialogueChapter03WorldMap5 .include "TEXT/DIALOGUE/Chapter03/WorldMap5.dialogue.txt" ; 8E8EA5

      .include "EVENTS/Chapter04/EventChapter04Opening.asm"
      .include "EVENTS/Chapter04/EventChapter04CuvuliCharge.asm"
      .include "EVENTS/Chapter04/EventChapter04DaccarAndreyPreparing.asm"
      .include "EVENTS/Chapter04/EventChapter04RaiseBridge.asm"
      .include "EVENTS/Chapter04/EventChapter04LowerBridge.asm"
      .include "EVENTS/Chapter04/EventChapter04PamelaSpawn.asm"
      .include "EVENTS/Chapter04/EventChapter04AnnandSpawn.asm"
      .include "EVENTS/Chapter04/EventChapter04AnnandPamelaCloseByTalk.asm"
      .include "EVENTS/Chapter04/EventChapter04_09E.asm"
      .include "EVENTS/Chapter04/EventChapter04AndreySpawn.asm"
      .include "EVENTS/Chapter04/EventChapter04AnnandDeathAndreyResponse.asm"
      .include "EVENTS/Chapter04/EventChapter04AnnandDeathPlayerResponses.asm"
      .include "EVENTS/Chapter04/EventChapter04AndreyLeave.asm"
      .include "EVENTS/Chapter04/EventChapter04ZaxonSpawn.asm"
      .include "EVENTS/Chapter04/EventChapter04DonovanSpawn.asm"
      .include "EVENTS/Chapter04/EventChapter04SilesseSeized.asm"
      .include "EVENTS/Chapter04/EventChapter04SilesseSeizedDaccarResponse.asm"
      .include "EVENTS/Chapter04/EventChapter04LewynSilesseVisit.asm"
      .include "EVENTS/Chapter04/EventChapter04Ending.asm"
      .include "EVENTS/Chapter04/EventChapter04CivilianRescuedA.asm"
      .include "EVENTS/Chapter04/EventChapter04CivilianRescuedB.asm"
      .include "EVENTS/Chapter04/EventChapter04Village7.asm"
      .include "EVENTS/Chapter04/EventChapter04Village4.asm"
      .include "EVENTS/Chapter04/EventChapter04Village5.asm"
      .include "EVENTS/Chapter04/EventChapter04Village3.asm"
      .include "EVENTS/Chapter04/EventChapter04Village2.asm"
      .include "EVENTS/Chapter04/EventChapter04VillageSafeguardAnyone.asm"
      .include "EVENTS/Chapter04/EventChapter04Village6.asm"
      .include "EVENTS/Chapter04/EventChapter04Village1.asm"
      .include "EVENTS/Chapter04/EventChapter04TofaSeized.asm"
      .include "EVENTS/Chapter04/EventChapter04_0B4.asm"
      .include "EVENTS/Chapter04/EventChapter04LamiaCharge.asm"
      .include "EVENTS/Chapter04/EventChapter04VillageSafeguardSilvia.asm"
      .include "EVENTS/Chapter04/EventChapter04ErinysSilviaAdjacent.asm"
      .include "EVENTS/Chapter04/EventChapter04_0B8.asm"
      .include "EVENTS/Chapter04/EventChapter04_0B9.asm"

      .sint -1

      dialogueChapter04OpeningLewynDead .include "TEXT/DIALOGUE/Chapter04/OpeningLewynDead.dialogue.txt" ; 8E9B61
      dialogueChapter04OpeningErinysDead .include "TEXT/DIALOGUE/Chapter04/OpeningErinysDead.dialogue.txt" ; 8EA228
      dialogueChapter04OpeningLewynErinysAlive .include "TEXT/DIALOGUE/Chapter04/OpeningLewynErinysAlive.dialogue.txt" ; 8EA432
      dialogueChapter04OpeningQuanEthlynFinnLeave .include "TEXT/DIALOGUE/Chapter04/OpeningQuanEthlynFinnLeave.dialogue.txt" ; 8EA626
      dialogueChapter04OpeningQuanEthlynLeave .include "TEXT/DIALOGUE/Chapter04/OpeningQuanEthlynLeave.dialogue.txt" ; 8EA793
      dialogueChapter04OpeningFinnLeave .include "TEXT/DIALOGUE/Chapter04/OpeningFinnLeave.dialogue.txt" ; 8EA88A
      dialogueChapter04Opening2 .include "TEXT/DIALOGUE/Chapter04/Opening2.dialogue.txt" ; 8EA962
      dialogueChapter04CuvuliCharge .include "TEXT/DIALOGUE/Chapter04/CuvuliCharge.dialogue.txt" ; 8EAA84
      dialogueChapter04CuvuliBattleQuote .include "TEXT/DIALOGUE/Chapter04/CuvuliBattleQuote.dialogue.txt" ; 8EAADC
      dialogueChapter04DithorbaBattleQuote .include "TEXT/DIALOGUE/Chapter04/DithorbaBattleQuote.dialogue.txt" ; 8EAAF7
      dialogueChapter04DaccarAndreyPreparing .include "TEXT/DIALOGUE/Chapter04/DaccarAndreyPreparing.dialogue.txt" ; 8EAB32
      dialogueChapter04RaiseBridge .include "TEXT/DIALOGUE/Chapter04/RaiseBridge.dialogue.txt" ; 8EAC65
      dialogueChapter04LowerBridge .include "TEXT/DIALOGUE/Chapter04/LowerBridge.dialogue.txt" ; 8EACDD
      dialogueChapter04MyosBattleQuote .include "TEXT/DIALOGUE/Chapter04/MyosBattleQuote.dialogue.txt" ; 8EAD16
      dialogueChapter04PamelaSpawn .include "TEXT/DIALOGUE/Chapter04/PamelaSpawn.dialogue.txt" ; 8EAD46
      dialogueChapter04AnnandSpawn .include "TEXT/DIALOGUE/Chapter04/AnnandSpawn.dialogue.txt" ; 8EADF1
      dialogueChapter04AnnandPamelaCloseByTalk .include "TEXT/DIALOGUE/Chapter04/AnnandPamelaCloseByTalk.dialogue.txt" ; 8EAF8D
      dialogueChapter04AndreySpawn .include "TEXT/DIALOGUE/Chapter04/AndreySpawn.dialogue.txt" ; 8EB0C6
      dialogueChapter04ZaxonAnnandBattleQuote .include "TEXT/DIALOGUE/Chapter04/ZaxonAnnandBattleQuote.dialogue.txt" ; 8EB1AE
      dialogueChapter04PamelaBattleQuote .include "TEXT/DIALOGUE/Chapter04/PamelaBattleQuote.dialogue.txt" ; 8EB1D3
      dialogueChapter04SilesseAndreyBattleQuote .include "TEXT/DIALOGUE/Chapter04/SilesseAndreyBattleQuote.dialogue.txt" ; 8EB1EB
      dialogueChapter04AnnandDeathAndreyResponse .include "TEXT/DIALOGUE/Chapter04/AnnandDeathAndreyResponse.dialogue.txt" ; 8EB220
      dialogueChapter04AnnandDeathLahnaResponse .include "TEXT/DIALOGUE/Chapter04/AnnandDeathLahnaResponse.dialogue.txt" ; 8EB2A2
      dialogueChapter04AnnandDeathLewynResponse .include "TEXT/DIALOGUE/Chapter04/AnnandDeathLewynResponse.dialogue.txt" ; 8EB2DD
      dialogueChapter04AnnandDeathErinysResponse .include "TEXT/DIALOGUE/Chapter04/AnnandDeathErinysResponse.dialogue.txt" ; 8EB305
      dialogueChapter04AndreyLeave .include "TEXT/DIALOGUE/Chapter04/AndreyLeave.dialogue.txt" ; 8EB352
      dialogueChapter04ZaxonSpawn1 .include "TEXT/DIALOGUE/Chapter04/ZaxonSpawn1.dialogue.txt" ; 8EB38E
      dialogueChapter04ZaxonSpawn2 .include "TEXT/DIALOGUE/Chapter04/ZaxonSpawn2.dialogue.txt" ; 8EB44F
      dialogueChapter04ZaxonSpawn3 .include "TEXT/DIALOGUE/Chapter04/ZaxonSpawn3.dialogue.txt" ; 8EB4D2
      dialogueChapter04ZaxonSpawn4 .include "TEXT/DIALOGUE/Chapter04/ZaxonSpawn4.dialogue.txt" ; 8EB5BD
      dialogueChapter04DonovanSpawn .include "TEXT/DIALOGUE/Chapter04/DonovanSpawn.dialogue.txt" ; 8EB714
      dialogueChapter04DonovanBattleQuote .include "TEXT/DIALOGUE/Chapter04/DonovanBattleQuote.dialogue.txt" ; 8EB77E
      dialogueChapter04SilesseSeizedDaccarAlive .include "TEXT/DIALOGUE/Chapter04/SilesseSeizedDaccarAlive.dialogue.txt" ; 8EB793
      dialogueChapter04SilesseSeizedDaccarDead .include "TEXT/DIALOGUE/Chapter04/SilesseSeizedDaccarDead.dialogue.txt" ; 8EB97A
      dialogueChapter04DaccarResponsePamelaDeadLamiaDead .include "TEXT/DIALOGUE/Chapter04/DaccarResponsePamelaDeadLamiaDead.dialogue.txt" ; 8EBAD4
      dialogueChapter04DaccarResponsePamelaDeadLamiaAlive .include "TEXT/DIALOGUE/Chapter04/DaccarResponsePamelaDeadLamiaAlive.dialogue.txt" ; 8EBB20
      dialogueChapter04DaccarResponsePamelaAliveLamiaDead .include "TEXT/DIALOGUE/Chapter04/DaccarResponsePamelaAliveLamiaDead.dialogue.txt" ; 8EBB2C
      dialogueChapter04DaccarResponsePamelaAliveLamiaAlive .include "TEXT/DIALOGUE/Chapter04/DaccarResponsePamelaAliveLamiaAlive.dialogue.txt" ; 8EBB38
      dialogueChapter04Piece_LamiaChargeOrder .include "TEXT/DIALOGUE/Chapter04/Piece_LamiaChargeOrder.dialogue.txt" ; 8EBB4A
      dialogueChapter04Piece_PamelaChargeOrder .include "TEXT/DIALOGUE/Chapter04/Piece_PamelaChargeOrder.dialogue.txt" ; 8EBB7D
      dialogueChapter04LamiaCharge .include "TEXT/DIALOGUE/Chapter04/LamiaCharge.dialogue.txt" ; 8EBBB1
      dialogueChapter04LewynSilesseVisit .include "TEXT/DIALOGUE/Chapter04/LewynSilesseVisit.dialogue.txt" ; 8EBBE2
      dialogueChapter04DaccarBattleQuote .include "TEXT/DIALOGUE/Chapter04/DaccarBattleQuote.dialogue.txt" ; 8EC033
      dialogueChapter04LamiaBattleQuote .include "TEXT/DIALOGUE/Chapter04/LamiaBattleQuote.dialogue.txt" ; 8EC06A
      dialogueChapter04Ending .include "TEXT/DIALOGUE/Chapter04/Ending.dialogue.txt" ; 8EC086
      dialogueChapter04CivilianRescuedA .include "TEXT/DIALOGUE/Chapter04/CivilianRescuedA.dialogue.txt" ; 8EC3B5
      dialogueChapter04CivilianRescuedB .include "TEXT/DIALOGUE/Chapter04/CivilianRescuedB.dialogue.txt" ; 8EC3D0
      dialogueChapter04Village7 .include "TEXT/DIALOGUE/Chapter04/Village7.dialogue.txt" ; 8EC3F8
      dialogueChapter04Village4 .include "TEXT/DIALOGUE/Chapter04/Village4.dialogue.txt" ; 8EC476
      dialogueChapter04Village5 .include "TEXT/DIALOGUE/Chapter04/Village5.dialogue.txt" ; 8EC537
      dialogueChapter04Village3 .include "TEXT/DIALOGUE/Chapter04/Village3.dialogue.txt" ; 8EC5B5
      dialogueChapter04Village2 .include "TEXT/DIALOGUE/Chapter04/Village2.dialogue.txt" ; 8EC643
      dialogueChapter04VillageSafeguardAnyone .include "TEXT/DIALOGUE/Chapter04/VillageSafeguardAnyone.dialogue.txt" ; 8EC6B0
      dialogueChapter04Village6 .include "TEXT/DIALOGUE/Chapter04/Village6.dialogue.txt" ; 8EC731
      dialogueChapter04Village1Default .include "TEXT/DIALOGUE/Chapter04/Village1Default.dialogue.txt" ; 8EC798
      dialogueChapter04Village1BridgeLowered .include "TEXT/DIALOGUE/Chapter04/Village1BridgeLowered.dialogue.txt" ; 8EC81E
      
      dialogueChapter04TofaSeized .include "TEXT/DIALOGUE/Chapter04/TofaSeized.dialogue.txt" ; 8EC84D
      dialogueChapter04WorldMap1 .include "TEXT/DIALOGUE/Chapter04/WorldMap1.dialogue.txt" ; 8ECA72
      dialogueChapter04WorldMap2 .include "TEXT/DIALOGUE/Chapter04/WorldMap2.dialogue.txt" ; 8ECAE4
      dialogueChapter04WorldMapUnused .include "TEXT/DIALOGUE/Chapter04/WorldMapUnused.dialogue.txt" ; 8ECD3D
      
      dialogueChapter05WorldMap .include "TEXT/DIALOGUE/Chapter05/WorldMap.dialogue.txt" ; 8ECD41
      
      dialogueChapter06WorldMap1 .include "TEXT/DIALOGUE/Chapter06/WorldMap1.dialogue.txt" ; 8ED010
      dialogueChapter06WorldMap2 .include "TEXT/DIALOGUE/Chapter06/WorldMap2.dialogue.txt" ; 8ED0D7
      dialogueChapter06WorldMap3 .include "TEXT/DIALOGUE/Chapter06/WorldMap3.dialogue.txt" ; 8ED160
      dialogueChapter06WorldMap4 .include "TEXT/DIALOGUE/Chapter06/WorldMap4.dialogue.txt" ; 8ED21D
      dialogueChapter06WorldMap5 .include "TEXT/DIALOGUE/Chapter06/WorldMap5.dialogue.txt" ; 8ED24F
      dialogueChapter06WorldMap6 .include "TEXT/DIALOGUE/Chapter06/WorldMap6.dialogue.txt" ; 8ED3A3

      dialogueChapter07WorldMap1 .include "TEXT/DIALOGUE/Chapter07/WorldMap1.dialogue.txt" ; 8ED4BD
      dialogueChapter07WorldMap2 .include "TEXT/DIALOGUE/Chapter07/WorldMap2.dialogue.txt" ; 8ED67D
      dialogueChapter07WorldMap3 .include "TEXT/DIALOGUE/Chapter07/WorldMap3.dialogue.txt" ; 8ED72E

      dialogueDeathQuoteGen1PlayerSigurd .include "TEXT/DIALOGUE/DeathQuote/Gen1Player/Sigurd.dialogue.txt" ; 8ED7DE
      dialogueDeathQuoteGen1PlayerNaoise .include "TEXT/DIALOGUE/DeathQuote/Gen1Player/Naoise.dialogue.txt" ; 8ED7FF
      dialogueDeathQuoteGen1PlayerAlec .include "TEXT/DIALOGUE/DeathQuote/Gen1Player/Alec.dialogue.txt" ; 8ED835
      dialogueDeathQuoteGen1PlayerArden .include "TEXT/DIALOGUE/DeathQuote/Gen1Player/Arden.dialogue.txt" ; 8ED863
      dialogueDeathQuoteGen1PlayerFinn .include "TEXT/DIALOGUE/DeathQuote/Gen1Player/Finn.dialogue.txt" ; 8ED897
      dialogueDeathQuoteGen1PlayerQuan .include "TEXT/DIALOGUE/DeathQuote/Gen1Player/Quan.dialogue.txt" ; 8ED8D4
      dialogueDeathQuoteGen1PlayerQuanLeave .include "TEXT/DIALOGUE/DeathQuote/Gen1Player/QuanLeave.dialogue.txt" ; 8ED8F0
      dialogueDeathQuoteLoverMidirUnused .include "TEXT/DIALOGUE/DeathQuote/Lover/MidirUnused.dialogue.txt" ; 8ED946
      dialogueDeathQuoteGen1PlayerMidir .include "TEXT/DIALOGUE/DeathQuote/Gen1Player/Midir.dialogue.txt" ; 8ED977
      dialogueDeathQuoteGen1PlayerLewyn .include "TEXT/DIALOGUE/DeathQuote/Gen1Player/Lewyn.dialogue.txt" ; 8ED99C
      dialogueDeathQuoteGen1PlayerChulainn .include "TEXT/DIALOGUE/DeathQuote/Gen1Player/Chulainn.dialogue.txt" ; 8ED9D8
      dialogueDeathQuoteLoverAzelle .include "TEXT/DIALOGUE/DeathQuote/Lover/Azelle.dialogue.txt" ; 8ED9FB
      dialogueDeathQuoteGen1PlayerAzelle .include "TEXT/DIALOGUE/DeathQuote/Gen1Player/Azelle.dialogue.txt" ; 8EDA2C
      dialogueDeathQuoteLoverJamke .include "TEXT/DIALOGUE/DeathQuote/Lover/Jamke.dialogue.txt" ; 8EDA51
      dialogueDeathQuoteGen1PlayerJamke .include "TEXT/DIALOGUE/DeathQuote/Gen1Player/Jamke.dialogue.txt" ; 8EDA76
      dialogueDeathQuoteGen1PlayerClaud .include "TEXT/DIALOGUE/DeathQuote/Gen1Player/Claud.dialogue.txt" ; 8EDA8F
      dialogueDeathQuoteGen1PlayerBeowulf .include "TEXT/DIALOGUE/DeathQuote/Gen1Player/Beowulf.dialogue.txt" ; 8EDABE
      dialogueDeathQuoteGen1PlayerLex .include "TEXT/DIALOGUE/DeathQuote/Gen1Player/Lex.dialogue.txt" ; 8EDAE6
      dialogueDeathQuoteGen1PlayerDew .include "TEXT/DIALOGUE/DeathQuote/Gen1Player/Dew.dialogue.txt" ; 8EDB25
      dialogueDeathQuoteGen1PlayerDeirdre .include "TEXT/DIALOGUE/DeathQuote/Gen1Player/Deirdre.dialogue.txt" ; 8EDB48
      dialogueDeathQuoteGen1PlayerDeirdreReturn .include "TEXT/DIALOGUE/DeathQuote/Gen1Player/DeirdreReturn.dialogue.txt" ; 8EDB6D
      dialogueDeathQuoteGen1PlayerEthlyn .include "TEXT/DIALOGUE/DeathQuote/Gen1Player/Ethlyn.dialogue.txt" ; 8EDBD1
      dialogueDeathQuoteGen1PlayerEthlynLeave .include "TEXT/DIALOGUE/DeathQuote/Gen1Player/EthlynLeave.dialogue.txt" ; 8EDBF5
      dialogueDeathQuoteGen1PlayerLachesis .include "TEXT/DIALOGUE/DeathQuote/Gen1Player/Lachesis.dialogue.txt" ; 8EDC48
      dialogueDeathQuoteLoverAyra .include "TEXT/DIALOGUE/DeathQuote/Lover/Ayra.dialogue.txt" ; 8EDC63
      dialogueDeathQuoteGen1PlayerAyra .include "TEXT/DIALOGUE/DeathQuote/Gen1Player/Ayra.dialogue.txt" ; 8EDC92
      dialogueDeathQuoteGen1PlayerErinys .include "TEXT/DIALOGUE/DeathQuote/Gen1Player/Erinys.dialogue.txt" ; 8EDCAB
      dialogueDeathQuoteLoverTailtiu .include "TEXT/DIALOGUE/DeathQuote/Lover/Tailtiu.dialogue.txt" ; 8EDCCC
      dialogueDeathQuoteGen1PlayerTailtiu .include "TEXT/DIALOGUE/DeathQuote/Gen1Player/Tailtiu.dialogue.txt" ; 8EDCEC
      dialogueDeathQuoteLoverSilvia .include "TEXT/DIALOGUE/DeathQuote/Lover/Silvia.dialogue.txt" ; 8EDD02
      dialogueDeathQuoteGen1PlayerSilvia .include "TEXT/DIALOGUE/DeathQuote/Gen1Player/Silvia.dialogue.txt" ; 8EDD2D
      dialogueDeathQuoteLoverEdain .include "TEXT/DIALOGUE/DeathQuote/Lover/Edain.dialogue.txt" ; 8EDD46
      dialogueDeathQuoteGen1PlayerEdain .include "TEXT/DIALOGUE/DeathQuote/Gen1Player/Edain.dialogue.txt" ; 8EDD78
      dialogueDeathQuoteGen1PlayerBrigid .include "TEXT/DIALOGUE/DeathQuote/Gen1Player/Brigid.dialogue.txt" ; 8EDD9E

      dialogueDeathQuoteGen2PlayerSeliph .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/Seliph.dialogue.txt" ; 8EDDB7

      dialogueDeathQuoteGen1EnemyNPCJamke .include "TEXT/DIALOGUE/DeathQuote/Gen1EnemyNPC/Jamke.dialogue.txt" ; 8EDDCE

      dialogueDeathQuoteGen2PlayerShannan .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/Shannan.dialogue.txt" ; 8EDDDF
      dialogueDeathQuoteGen2PlayerDalvin .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/Dalvin.dialogue.txt" ; 8EDDF9
      dialogueDeathQuoteGen2PlayerAsaello .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/Asaello.dialogue.txt" ; 8EDE0D
      dialogueDeathQuoteGen2PlayerLeif .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/Leif.dialogue.txt" ; 8EDE21
      dialogueDeathQuoteGen2PlayerIuchar .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/Iuchar.dialogue.txt" ; 8EDE37
      dialogueDeathQuoteGen2PlayerCharlot .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/Charlot.dialogue.txt" ; 8EDE5C
      dialogueDeathQuoteGen2PlayerHawk .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/Hawk.dialogue.txt" ; 8EDE6F
      dialogueDeathQuoteGen2PlayerTristan .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/Tristan.dialogue.txt" ; 8EDE9B
      dialogueDeathQuoteGen2PlayerAdultFinn .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/AdultFinn.dialogue.txt" ; 8EDEB9
      dialogueDeathQuoteGen2PlayerDeimne .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/Deimne.dialogue.txt" ; 8EDEEB
      dialogueDeathQuoteGen2PlayerHannibal .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/Hannibal.dialogue.txt" ; 8EDF0A
      dialogueDeathQuoteGen2PlayerAres .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/Ares.dialogue.txt" ; 8EDF2C
      dialogueDeathQuoteGen2PlayerAmid .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/Amid.dialogue.txt" ; 8EDF48
      dialogueDeathQuoteGen2PlayerOifey .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/Oifey.dialogue.txt" ; 8EDF63
      dialogueDeathQuoteGen2PlayerDaisy .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/Daisy.dialogue.txt" ; 8EDF94
      dialogueDeathQuoteGen2PlayerCreidne .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/Creidne.dialogue.txt" ; 8EDFAB
      dialogueDeathQuoteLoverMuirne .include "TEXT/DIALOGUE/DeathQuote/Lover/Muirne.dialogue.txt" ; 8EDFC3
      dialogueDeathQuoteGen2PlayerMuirne .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/Muirne.dialogue.txt" ; 8EDFD8
      dialogueDeathQuoteLoverJulia .include "TEXT/DIALOGUE/DeathQuote/Lover/Julia.dialogue.txt" ; 8EDFEE
      dialogueDeathQuoteGen2PlayerJulia .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/Julia.dialogue.txt" ; 8EE004
      dialogueDeathQuoteGen1PlayerJuliaReturn .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/JuliaReturn.dialogue.txt" ; 8EE02E
      dialogueDeathQuoteGen2PlayerJuliaEvil .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/JuliaEvil.dialogue.txt" ; 8EE091
      dialogueDeathQuoteGen2PlayerAltena .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/Altena.dialogue.txt" ; 8EE0C8
      dialogueDeathQuoteLoverHermina .include "TEXT/DIALOGUE/DeathQuote/Lover/Hermina.dialogue.txt" ; 8EE0DA
      dialogueDeathQuoteGen2PlayerHermina .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/Hermina.dialogue.txt" ; 8EE0ED
      dialogueDeathQuoteGen2PlayerLinda .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/Linda.dialogue.txt" ; 8EE105
      dialogueDeathQuoteLoverLaylea .include "TEXT/DIALOGUE/DeathQuote/Lover/Laylea.dialogue.txt" ; 8EE118
      dialogueDeathQuoteGen2PlayerLaylea .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/Laylea.dialogue.txt" ; 8EE12C
      dialogueDeathQuoteGen2PlayerJeanne .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/Jeanne.dialogue.txt" ; 8EE141
      dialogueDeathQuoteGen2PlayerIucharba .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/Iucharba.dialogue.txt" ; 8EE161
      dialogueDeathQuoteGen2PlayerScathach .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/Scathach.dialogue.txt" ; 8EE177
      dialogueDeathQuoteGen2PlayerFebail .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/Febail.dialogue.txt" ; 8EE19C
      dialogueDeathQuoteGen2PlayerCoirpre .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/Coirpre.dialogue.txt" ; 8EE1B4
      dialogueDeathQuoteGen2PlayerCed .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/Ced.dialogue.txt" ; 8EE1E0
      dialogueDeathQuoteGen2PlayerDiarmuid .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/Diarmuid.dialogue.txt" ; 8EE209
      dialogueDeathQuoteGen2PlayerLester .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/Lester.dialogue.txt" ; 8EE227
      dialogueDeathQuoteGen2PlayerArthur .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/Arthur.dialogue.txt" ; 8EE245
      dialogueDeathQuoteGen2PlayerPatty .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/Patty.dialogue.txt" ; 8EE25F
      dialogueDeathQuoteLoverLarcei .include "TEXT/DIALOGUE/DeathQuote/Lover/Larcei.dialogue.txt" ; 8EE279
      dialogueDeathQuoteGen2PlayerLarcei .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/Larcei.dialogue.txt" ; 8EE295
      dialogueDeathQuoteLoverLana .include "TEXT/DIALOGUE/DeathQuote/Lover/Lana.dialogue.txt" ; 8EE2AB
      dialogueDeathQuoteGen2PlayerLana .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/Lana.dialogue.txt" ; 8EE2CE
      dialogueDeathQuoteLoverFee .include "TEXT/DIALOGUE/DeathQuote/Lover/Fee.dialogue.txt" ; 8EE2E8
      dialogueDeathQuoteGen2PlayerFee .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/Fee.dialogue.txt" ; 8EE304
      dialogueDeathQuoteLoverTine .include "TEXT/DIALOGUE/DeathQuote/Lover/Tine.dialogue.txt" ; 8EE31A
      dialogueDeathQuoteGen2PlayerTine .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/Tine.dialogue.txt" ; 8EE337
      dialogueDeathQuoteLoverLene .include "TEXT/DIALOGUE/DeathQuote/Lover/Lene.dialogue.txt" ; 8EE34E
      dialogueDeathQuoteGen2PlayerLene .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/Lene.dialogue.txt" ; 8EE362
      dialogueDeathQuoteGen2PlayerNanna .include "TEXT/DIALOGUE/DeathQuote/Gen2Player/Nanna.dialogue.txt" ; 8EE377

      dialogueDeathQuoteGen1EnemyNPCDiMaggio .include "TEXT/DIALOGUE/DeathQuote/Gen1EnemyNPC/DiMaggio.dialogue.txt" ; 8EE397
      dialogueDeathQuoteGen1EnemyNPCGerrard .include "TEXT/DIALOGUE/DeathQuote/Gen1EnemyNPC/Gerrard.dialogue.txt" ; 8EE3AF
      dialogueDeathQuoteGen1EnemyNPCCimbaeth .include "TEXT/DIALOGUE/DeathQuote/Gen1EnemyNPC/Cimbaeth.dialogue.txt" ; 8EE3EA
      dialogueDeathQuoteGen1EnemyNPCMunnir .include "TEXT/DIALOGUE/DeathQuote/Gen1EnemyNPC/Munnir.dialogue.txt" ; 8EE403
      dialogueDeathQuoteGen1EnemyNPCSandima .include "TEXT/DIALOGUE/DeathQuote/Gen1EnemyNPC/Sandima.dialogue.txt" ; 8EE426
      dialogueDeathQuoteGen1EnemyNPCAyra .include "TEXT/DIALOGUE/DeathQuote/Gen1EnemyNPC/Ayra.dialogue.txt" ; 8EE453
      dialogueDeathQuoteGen1EnemyNPCElliotCh01 .include "TEXT/DIALOGUE/DeathQuote/Gen1EnemyNPC/ElliotCh01.dialogue.txt" ; 8EE46B
      dialogueDeathQuoteGen1EnemyNPCElliotCh02 .include "TEXT/DIALOGUE/DeathQuote/Gen1EnemyNPC/ElliotCh02.dialogue.txt" ; 8EE4A0
      dialogueDeathQuoteGen1EnemyNPCPhilip .include "TEXT/DIALOGUE/DeathQuote/Gen1EnemyNPC/Philip.dialogue.txt" ; 8EE4CB
      dialogueDeathQuoteGen1EnemyNPCBordeaux .include "TEXT/DIALOGUE/DeathQuote/Gen1EnemyNPC/Bordeaux.dialogue.txt" ; 8EE4F2
      dialogueDeathQuoteGen1EnemyNPCMacBeth .include "TEXT/DIALOGUE/DeathQuote/Gen1EnemyNPC/MacBeth.dialogue.txt" ; 8EE50F
      dialogueDeathQuoteGen1EnemyNPCWaltz .include "TEXT/DIALOGUE/DeathQuote/Gen1EnemyNPC/Waltz.dialogue.txt" ; 8EE52C
      dialogueDeathQuoteGen1EnemyNPCBeowulf .include "TEXT/DIALOGUE/DeathQuote/Gen1EnemyNPC/Beowulf.dialogue.txt" ; 8EE556
      dialogueDeathQuoteGen1EnemyNPCClement .include "TEXT/DIALOGUE/DeathQuote/Gen1EnemyNPC/Clement.dialogue.txt" ; 8EE572
      dialogueDeathQuoteGen1EnemyNPCErinys .include "TEXT/DIALOGUE/DeathQuote/Gen1EnemyNPC/Erinys.dialogue.txt" ; 8EE58D
      dialogueDeathQuoteGen1EnemyNPCZane .include "TEXT/DIALOGUE/DeathQuote/Gen1EnemyNPC/Zane.dialogue.txt" ; 8EE5B6
      dialogueDeathQuoteGen1EnemyNPCChagallCh02 .include "TEXT/DIALOGUE/DeathQuote/Gen1EnemyNPC/ChagallCh02.dialogue.txt" ; 8EE5DC
      dialogueDeathQuoteGen1EnemyNPCJacobi .include "TEXT/DIALOGUE/DeathQuote/Gen1EnemyNPC/Jacobi.dialogue.txt" ; 8EE603
      dialogueDeathQuoteGen1EnemyNPCEldiganCh03 .include "TEXT/DIALOGUE/DeathQuote/Gen1EnemyNPC/EldiganCh03.dialogue.txt" ; 8EE61A
      dialogueDeathQuoteGen1EnemyNPCPapilio .include "TEXT/DIALOGUE/DeathQuote/Gen1EnemyNPC/Papilio.dialogue.txt" ; 8EE63D
      dialogueDeathQuoteGen1EnemyNPCChagallCh03 .include "TEXT/DIALOGUE/DeathQuote/Gen1EnemyNPC/ChagallCh03.dialogue.txt" ; 8EE664
      dialogueDeathQuoteGen1EnemyNPCPizare .include "TEXT/DIALOGUE/DeathQuote/Gen1EnemyNPC/Pizare.dialogue.txt" ; 8EE688
      dialogueDeathQuoteGen1EnemyNPCDuvall .include "TEXT/DIALOGUE/DeathQuote/Gen1EnemyNPC/Duvall.dialogue.txt" ; 8EE6B1
      dialogueDeathQuoteGen1EnemyNPCCuvuli .include "TEXT/DIALOGUE/DeathQuote/Gen1EnemyNPC/Cuvuli.dialogue.txt" ; 8EE6C6
      dialogueDeathQuoteGen1EnemyNPCDithorba .include "TEXT/DIALOGUE/DeathQuote/Gen1EnemyNPC/Dithorba.dialogue.txt" ; 8EE6E9
      dialogueDeathQuoteGen1EnemyNPCMyos .include "TEXT/DIALOGUE/DeathQuote/Gen1EnemyNPC/Myos.dialogue.txt" ; 8EE707
      dialogueDeathQuoteGen1EnemyNPCAnnand .include "TEXT/DIALOGUE/DeathQuote/Gen1EnemyNPC/Annand.dialogue.txt" ; 8EE722
      dialogueDeathQuoteGen1EnemyNPCPamela .include "TEXT/DIALOGUE/DeathQuote/Gen1EnemyNPC/Pamela.dialogue.txt" ; 8EE748
      dialogueDeathQuoteGen1EnemyNPCDonovan .include "TEXT/DIALOGUE/DeathQuote/Gen1EnemyNPC/Donovan.dialogue.txt" ; 8EE75D
      dialogueDeathQuoteGen1EnemyNPCDaccar .include "TEXT/DIALOGUE/DeathQuote/Gen1EnemyNPC/Daccar.dialogue.txt" ; 8EE77F
      dialogueDeathQuoteGen1EnemyNPCLamia .include "TEXT/DIALOGUE/DeathQuote/Gen1EnemyNPC/Lamia.dialogue.txt" ; 8EE7A4
      dialogueDeathQuoteGen1EnemyNPCByron .include "TEXT/DIALOGUE/DeathQuote/Gen1EnemyNPC/Byron.dialogue.txt" ; 8EE7B9
      dialogueDeathQuoteGen1EnemyNPCSlayder .include "TEXT/DIALOGUE/DeathQuote/Gen1EnemyNPC/Slayder.dialogue.txt" ; 8EE7D3
      dialogueDeathQuoteGen1EnemyNPCAndreyCh05 .include "TEXT/DIALOGUE/DeathQuote/Gen1EnemyNPC/AndreyCh05.dialogue.txt" ; 8EE7EC
      dialogueDeathQuoteGen1EnemyNPCLombardCh05 .include "TEXT/DIALOGUE/DeathQuote/Gen1EnemyNPC/LombardCh05.dialogue.txt" ; 8EE81B
      dialogueDeathQuoteGen1EnemyNPCVaja .include "TEXT/DIALOGUE/DeathQuote/Gen1EnemyNPC/Vaja.dialogue.txt" ; 8EE851
      dialogueDeathQuoteGen1EnemyNPCMagorn .include "TEXT/DIALOGUE/DeathQuote/Gen1EnemyNPC/Magorn.dialogue.txt" ; 8EE877
      dialogueDeathQuoteGen1EnemyNPCReptorCh05 .include "TEXT/DIALOGUE/DeathQuote/Gen1EnemyNPC/ReptorCh05.dialogue.txt" ; 8EE895
      dialogueDeathQuoteGen1EnemyNPCReptorCh05PreBetrayal .include "TEXT/DIALOGUE/DeathQuote/Gen1EnemyNPC/ReptorCh05PreBetrayal.dialogue.txt" ; 8EE8BE
      dialogueDeathQuoteGen1EnemyNPCEthlyn .include "TEXT/DIALOGUE/DeathQuote/Gen1EnemyNPC/Ethlyn.dialogue.txt" ; 8EE8DB
      dialogueDeathQuoteGen1EnemyNPCQuan .include "TEXT/DIALOGUE/DeathQuote/Gen1EnemyNPC/Quan.dialogue.txt" ; 8EE909

      dialogueDeathQuoteGen2EnemyNPCHarold .include "TEXT/DIALOGUE/DeathQuote/Gen2EnemyNPC/Harold.dialogue.txt" ; 8EE935
      dialogueDeathQuoteGen2EnemyNPCIucharba .include "TEXT/DIALOGUE/DeathQuote/Gen2EnemyNPC/Iucharba.dialogue.txt" ; 8EE96D
      dialogueDeathQuoteGen2EnemyNPCIuchar .include "TEXT/DIALOGUE/DeathQuote/Gen2EnemyNPC/Iuchar.dialogue.txt" ; 8EE98E
      dialogueDeathQuoteGen2EnemyNPCSchmidt .include "TEXT/DIALOGUE/DeathQuote/Gen2EnemyNPC/Schmidt.dialogue.txt" ; 8EE9C8
      dialogueDeathQuoteGen2EnemyNPCDanann .include "TEXT/DIALOGUE/DeathQuote/Gen2EnemyNPC/Danann.dialogue.txt" ; 8EE9E5
      dialogueDeathQuoteGen2EnemyNPCKutuzov .include "TEXT/DIALOGUE/DeathQuote/Gen2EnemyNPC/Kutuzov.dialogue.txt" ; 8EEA05
      dialogueDeathQuoteGen2EnemyNPCLiza .include "TEXT/DIALOGUE/DeathQuote/Gen2EnemyNPC/Liza.dialogue.txt" ; 8EEA27
      dialogueDeathQuoteGen2EnemyNPCIshtoreLizaDead .include "TEXT/DIALOGUE/DeathQuote/Gen2EnemyNPC/IshtoreLizaDead.dialogue.txt" ; 8EEA40
      dialogueDeathQuoteGen2EnemyNPCIshtoreLizaAlive .include "TEXT/DIALOGUE/DeathQuote/Gen2EnemyNPC/IshtoreLizaAlive.dialogue.txt" ; 8EEA5A
      dialogueDeathQuoteGen2EnemyNPCJavarro .include "TEXT/DIALOGUE/DeathQuote/Gen2EnemyNPC/Javarro.dialogue.txt" ; 8EEA7C
      dialogueDeathQuoteGen2EnemyNPCBramsel .include "TEXT/DIALOGUE/DeathQuote/Gen2EnemyNPC/Bramsel.dialogue.txt" ; 8EEA96
      dialogueDeathQuoteGen2EnemyNPCBanbaCh07 .include "TEXT/DIALOGUE/DeathQuote/Gen2EnemyNPC/BanbaCh07.dialogue.txt" ; 8EEABF
      dialogueDeathQuoteGen2EnemyNPCFotlaCh07 .include "TEXT/DIALOGUE/DeathQuote/Gen2EnemyNPC/FotlaCh07.dialogue.txt" ; 8EEADC
      dialogueDeathQuoteGen2EnemyNPCEriuCh07 .include "TEXT/DIALOGUE/DeathQuote/Gen2EnemyNPC/EriuCh07.dialogue.txt" ; 8EEAF9
      dialogueDeathQuoteGen2EnemyNPCTine .include "TEXT/DIALOGUE/DeathQuote/Gen2EnemyNPC/Tine.dialogue.txt" ; 8EEB16
      dialogueDeathQuoteGen2EnemyNPCBloomCh07 .include "TEXT/DIALOGUE/DeathQuote/Gen2EnemyNPC/BloomCh07.dialogue.txt" ; 8EEB28
      dialogueDeathQuoteGen2EnemyNPCIshtarCh08 .include "TEXT/DIALOGUE/DeathQuote/Gen2EnemyNPC/IshtarCh08.dialogue.txt" ; 8EEB5E
      dialogueDeathQuoteGen2EnemyNPCFebail .include "TEXT/DIALOGUE/DeathQuote/Gen2EnemyNPC/Febail.dialogue.txt" ; 8EEB7A
      dialogueDeathQuoteGen2EnemyNPCMuhammad .include "TEXT/DIALOGUE/DeathQuote/Gen2EnemyNPC/Muhammad.dialogue.txt" ; 8EEB9C
      dialogueDeathQuoteGen2EnemyNPCOvo .include "TEXT/DIALOGUE/DeathQuote/Gen2EnemyNPC/Ovo.dialogue.txt" ; 8EEBD2
      dialogueDeathQuoteGen2EnemyNPCBanbaCh08 .include "TEXT/DIALOGUE/DeathQuote/Gen2EnemyNPC/BanbaCh08.dialogue.txt" ; 8EEBE7
      dialogueDeathQuoteGen2EnemyNPCFotlaCh08 .include "TEXT/DIALOGUE/DeathQuote/Gen2EnemyNPC/FotlaCh08.dialogue.txt" ; 8EEC0C
      dialogueDeathQuoteGen2EnemyNPCEriuCh08 .include "TEXT/DIALOGUE/DeathQuote/Gen2EnemyNPC/EriuCh08.dialogue.txt" ; 8EEC28
      dialogueDeathQuoteGen2EnemyNPCBloomCh08 .include "TEXT/DIALOGUE/DeathQuote/Gen2EnemyNPC/BloomCh08.dialogue.txt" ; 8EEC4B
      dialogueDeathQuoteGen2EnemyNPCCoulter .include "TEXT/DIALOGUE/DeathQuote/Gen2EnemyNPC/Coulter.dialogue.txt" ; 8EEC67
      dialogueDeathQuoteGen2EnemyNPCMaykov .include "TEXT/DIALOGUE/DeathQuote/Gen2EnemyNPC/Maykov.dialogue.txt" ; 8EEC87
      dialogueDeathQuoteGen2EnemyNPCAltena .include "TEXT/DIALOGUE/DeathQuote/Gen2EnemyNPC/Altena.dialogue.txt" ; 8EECA4
      dialogueDeathQuoteGen2EnemyNPCHannibal .include "TEXT/DIALOGUE/DeathQuote/Gen2EnemyNPC/Hannibal.dialogue.txt" ; 8EECC5
      dialogueDeathQuoteGen2EnemyNPCKanatz .include "TEXT/DIALOGUE/DeathQuote/Gen2EnemyNPC/Kanatz.dialogue.txt" ; 8EECE6
      dialogueDeathQuoteGen2EnemyNPCDistler .include "TEXT/DIALOGUE/DeathQuote/Gen2EnemyNPC/Distler.dialogue.txt" ; 8EED08
      dialogueDeathQuoteGen2EnemyNPCMusar .include "TEXT/DIALOGUE/DeathQuote/Gen2EnemyNPC/Musar.dialogue.txt" ; 8EED2E
      dialogueDeathQuoteGen2EnemyNPCJudah .include "TEXT/DIALOGUE/DeathQuote/Gen2EnemyNPC/Judah.dialogue.txt" ; 8EED4C
      dialogueDeathQuoteGen2EnemyNPCArionCh09 .include "TEXT/DIALOGUE/DeathQuote/Gen2EnemyNPC/ArionCh09.dialogue.txt" ; 8EED7E
      dialogueDeathQuoteGen2EnemyNPCTravantCh09 .include "TEXT/DIALOGUE/DeathQuote/Gen2EnemyNPC/TravantCh09.dialogue.txt" ; 8EEDAF
      dialogueDeathQuoteGen2EnemyNPCRiddell .include "TEXT/DIALOGUE/DeathQuote/Gen2EnemyNPC/Riddell.dialogue.txt" ; 8EEDD7
      dialogueDeathQuoteGen2EnemyNPCHildaCh10 .include "TEXT/DIALOGUE/DeathQuote/Gen2EnemyNPC/HildaCh10.dialogue.txt" ; 8EEDF4
      dialogueDeathQuoteGen2EnemyNPCMorrigan .include "TEXT/DIALOGUE/DeathQuote/Gen2EnemyNPC/Morrigan.dialogue.txt" ; 8EEE24
      dialogueDeathQuoteGen2EnemyNPCJuliusCh10 .include "TEXT/DIALOGUE/DeathQuote/Gen2EnemyNPC/JuliusCh10.dialogue.txt" ; 8EEE4A
      dialogueDeathQuoteGen2EnemyNPCIshtarCh10 .include "TEXT/DIALOGUE/DeathQuote/Gen2EnemyNPC/IshtarCh10.dialogue.txt" ; 8EEE67
      dialogueDeathQuoteGen2EnemyNPCZagam .include "TEXT/DIALOGUE/DeathQuote/Gen2EnemyNPC/Zagam.dialogue.txt" ; 8EEE7C
      dialogueDeathQuoteGen2EnemyNPCArvisCh10 .include "TEXT/DIALOGUE/DeathQuote/Gen2EnemyNPC/ArvisCh10.dialogue.txt" ; 8EEEA1
      dialogueDeathQuoteGen2EnemyNPCArvisCh10Unused .include "TEXT/DIALOGUE/DeathQuote/Gen2EnemyNPC/ArvisCh10Unused.dialogue.txt" ; 8EEEBF
      dialogueDeathQuoteGen2EnemyNPCRoberto .include "TEXT/DIALOGUE/DeathQuote/Gen2EnemyNPC/Roberto.dialogue.txt" ; 8EEEE9
      dialogueDeathQuoteGen2EnemyNPCBoyce .include "TEXT/DIALOGUE/DeathQuote/Gen2EnemyNPC/Boyce.dialogue.txt" ; 8EEF05
      dialogueDeathQuoteGen2EnemyNPCRodan .include "TEXT/DIALOGUE/DeathQuote/Gen2EnemyNPC/Rodan.dialogue.txt" ; 8EEF22
      dialogueDeathQuoteGen2EnemyNPCJuphiel .include "TEXT/DIALOGUE/DeathQuote/Gen2EnemyNPC/Juphiel.dialogue.txt" ; 8EEF3F
      dialogueDeathQuoteGen2EnemyNPCFisher .include "TEXT/DIALOGUE/DeathQuote/Gen2EnemyNPC/Fisher.dialogue.txt" ; 8EEF66
      dialogueDeathQuoteGen2EnemyNPCBrian .include "TEXT/DIALOGUE/DeathQuote/Gen2EnemyNPC/Brian.dialogue.txt" ; 8EEF7E
      dialogueDeathQuoteGen2EnemyNPCDagon .include "TEXT/DIALOGUE/DeathQuote/Gen2EnemyNPC/Dagon.dialogue.txt" ; 8EEFBA
      dialogueDeathQuoteGen2EnemyNPCHildaChFinal .include "TEXT/DIALOGUE/DeathQuote/Gen2EnemyNPC/HildaChFinal.dialogue.txt" ; 8EEFE1
      dialogueDeathQuoteGen2EnemyNPCScipio .include "TEXT/DIALOGUE/DeathQuote/Gen2EnemyNPC/Scipio.dialogue.txt" ; 8EF012
      dialogueDeathQuoteGen2EnemyNPCBaran .include "TEXT/DIALOGUE/DeathQuote/Gen2EnemyNPC/Baran.dialogue.txt" ; 8EF02D
      dialogueDeathQuoteGen2EnemyNPCMeng .include "TEXT/DIALOGUE/DeathQuote/Gen2EnemyNPC/Meng.dialogue.txt" ; 8EF054
      dialogueDeathQuoteGen2EnemyNPCMabel .include "TEXT/DIALOGUE/DeathQuote/Gen2EnemyNPC/Mabel.dialogue.txt" ; 8EF073
      dialogueDeathQuoteGen2EnemyNPCBleg .include "TEXT/DIALOGUE/DeathQuote/Gen2EnemyNPC/Bleg.dialogue.txt" ; 8EF096
      dialogueDeathQuoteGen2EnemyNPCArionChFinal .include "TEXT/DIALOGUE/DeathQuote/Gen2EnemyNPC/ArionChFinal.dialogue.txt" ; 8EF0B5
      dialogueDeathQuoteGen2EnemyNPCIshtarChFinal .include "TEXT/DIALOGUE/DeathQuote/Gen2EnemyNPC/IshtarChFinal.dialogue.txt" ; 8EF0CD
      dialogueDeathQuoteGen2EnemyNPCManfroy .include "TEXT/DIALOGUE/DeathQuote/Gen2EnemyNPC/Manfroy.dialogue.txt" ; 8EF0EB
      dialogueDeathQuoteGen2EnemyNPCJuliusChFinalDefault .include "TEXT/DIALOGUE/DeathQuote/Gen2EnemyNPC/JuliusChFinalDefault.dialogue.txt" ; 8EF111
      dialogueDeathQuoteGen2EnemyNPCJuliusChFinalJulia .include "TEXT/DIALOGUE/DeathQuote/Gen2EnemyNPC/JuliusChFinalJulia.dialogue.txt" ; 8EF134
      dialogueDeathQuoteGen2EnemyNPCJuliusChFinalSeliph .include "TEXT/DIALOGUE/DeathQuote/Gen2EnemyNPC/JuliusChFinalSeliph.dialogue.txt" ; 8EF165

      aGen1PlayerDeathQuotes .binclude "TABLES/CHARACTER/Gen1PlayerDeathQuoteTable.csv.asm" ; 8E/F1DA
      .word 0
      aGen2PlayerDeathQuotes .binclude "TABLES/CHARACTER/Gen2PlayerDeathQuoteTable.csv.asm" ; 8E/F248
      .word 0
      aLoverDeathQuotes .binclude "TABLES/CHARACTER/LoverDeathQuoteTable.csv.asm" ; 8E/F2E6
      .word 0
      aGen1EnemyNPCDeathQuotes .binclude "TABLES/CHARACTER/Gen1EnemyNPCDeathQuoteTable.csv.asm" ; 8E/F328
      .word 0
      aGen2EnemyNPCDeathQuotes .binclude "TABLES/CHARACTER/Gen2EnemyNPCDeathQuoteTable.csv.asm" ; 8E/F3CE
      .word 0

      .fill $8E8000 + $8000 - *, 0

    .here

    * = $0F8000
    .logical $8F8000

      aUnknown8F8000 ; 8F/8000

        .word $AA24
        .word $B66C
        .word $5349

      rlUnknown8F8006 ; 8F/8006

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx
        lda $8F8004
        beq _CLC

          lda #0
          ldx #$8D56

            -
            clc
            adc $800000,x
            inc x
            inc x
            cpx #$8E2D
            bcc -

          cmp $8F8000
          bne _SEC

          lda #0
          ldx #$8017

            -
            clc
            adc $870000,x
            inc x
            inc x
            cpx #$80AA
            bcc -

          cmp $8F8002
          bne _SEC

          lda $8F8000
          cmp $888000
          bne _SEC

          cmp $878008
          bne _SEC

          lda $8F8002
          cmp $888002
          bne _SEC

          cmp $87800A
          bne _SEC

        _CLC
        plx
        plp
        plb
        clc
        rtl

        _SEC
        plx
        plp
        plb
        sec
        rtl

        .databank 0

      dialogueChapter02Opening1 .include "TEXT/DIALOGUE/Chapter02/Opening1.dialogue.txt" ; 8F806B
      dialogueChapter02Opening2 .include "TEXT/DIALOGUE/Chapter02/Opening2.dialogue.txt" ; 8F823F
      dialogueChapter02Opening3 .include "TEXT/DIALOGUE/Chapter02/Opening3.dialogue.txt" ; 8F8543
      dialogueChapter02Opening5 .include "TEXT/DIALOGUE/Chapter02/Opening5.dialogue.txt" ; 8F881B
      dialogueChapter02Opening4 .include "TEXT/DIALOGUE/Chapter02/Opening4.dialogue.txt" ; 8F8AC8
      dialogueChapter02InfiniBrigandsSpawn .include "TEXT/DIALOGUE/Chapter02/InfiniBrigandsSpawn.dialogue.txt" ; 8F8B5A
      dialogueChapter02MackilyWorried .include "TEXT/DIALOGUE/Chapter02/MackilyWorried.dialogue.txt" ; 8F8BFA
      dialogueChapter02ElliotCharge .include "TEXT/DIALOGUE/Chapter02/ElliotCharge.dialogue.txt" ; 8F8C6C
      dialogueChapter02PhilipDefend .include "TEXT/DIALOGUE/Chapter02/PhilipDefend.dialogue.txt" ; 8F8D0E
      dialogueChapter02ElliotBattleQuote .include "TEXT/DIALOGUE/Chapter02/ElliotBattleQuote.dialogue.txt" ; 8F8D5E
      dialogueChapter02PhilipBattleQuote .include "TEXT/DIALOGUE/Chapter02/PhilipBattleQuote.dialogue.txt" ; 8F8D95
      dialogueChapter02BordeauxBattleQuote .include "TEXT/DIALOGUE/Chapter02/BordeauxBattleQuote.dialogue.txt" ; 8F8DCA
      dialogueChapter02LewynSilviaSpawn .include "TEXT/DIALOGUE/Chapter02/LewynSilviaSpawn.dialogue.txt" ; 8F8E12
      dialogueChapter02InfiniSpawn1 .include "TEXT/DIALOGUE/Chapter02/InfiniSpawn1.dialogue.txt" ; 8F91EA
      dialogueChapter02AgustiSpawn2 .include "TEXT/DIALOGUE/Chapter02/AgustiSpawn2.dialogue.txt" ; 8F928A
      dialogueChapter02InfiniSpawn2 .include "TEXT/DIALOGUE/Chapter02/InfiniSpawn2.dialogue.txt" ; 8F92B6
      dialogueChapter02WaltzCharge .include "TEXT/DIALOGUE/Chapter02/WaltzCharge.dialogue.txt" ; 8F9439
      dialogueChapter02SigurdLachesisTalk .include "TEXT/DIALOGUE/Chapter02/SigurdLachesisTalk.dialogue.txt" ; 8F9478
      dialogueChapter02BeowulfTalkSuccess .include "TEXT/DIALOGUE/Chapter02/BeowulfTalkSuccess.dialogue.txt" ; 8F9678
      dialogueChapter02BeowulfTalkNoMoney .include "TEXT/DIALOGUE/Chapter02/BeowulfTalkNoMoney.dialogue.txt" ; 8F96D5
      dialogueChapter02WaltzBattleQuote .include "TEXT/DIALOGUE/Chapter02/WaltzBattleQuote.dialogue.txt" ; 8F9712
      dialogueChapter02BeowulfBattleQuote .include "TEXT/DIALOGUE/Chapter02/BeowulfBattleQuote.dialogue.txt" ; 8F9731
      dialogueChapter02InfiniSeized .include "TEXT/DIALOGUE/Chapter02/InfiniSeized.dialogue.txt" ; 8F975A
      dialogueChapter02MackilySpawn1 .include "TEXT/DIALOGUE/Chapter02/MackilySpawn1.dialogue.txt" ; 8F9DE1
      dialogueChapter02MacBethBattleQuote .include "TEXT/DIALOGUE/Chapter02/MacBethBattleQuote.dialogue.txt" ; 8F9E61
      dialogueChapter02MackilySpawn2 .include "TEXT/DIALOGUE/Chapter02/MackilySpawn2.dialogue.txt" ; 8F9EB2
      dialogueChapter02MackilySpawn3 .include "TEXT/DIALOGUE/Chapter02/MackilySpawn3.dialogue.txt" ; 8FA0BC
      dialogueChapter02HeirheinSeized .include "TEXT/DIALOGUE/Chapter02/HeirheinSeized.dialogue.txt" ; 8FA101
      dialogueChapter02ClementBattleQuote .include "TEXT/DIALOGUE/Chapter02/ClementBattleQuote.dialogue.txt" ; 8FA22A
      dialogueChapter02MackilySeized .include "TEXT/DIALOGUE/Chapter02/MackilySeized.dialogue.txt" ; 8FA261
      dialogueChapter02AgustiSpawn1 .include "TEXT/DIALOGUE/Chapter02/AgustiSpawn1.dialogue.txt" ; 8FA301
      dialogueChapter02ZaneBattleQuote .include "TEXT/DIALOGUE/Chapter02/ZaneBattleQuote.dialogue.txt" ; 8FA722
      dialogueChapter02ChulainnRecruitment .include "TEXT/DIALOGUE/Chapter02/ChulainnRecruitment.dialogue.txt" ; 8FA75D
      dialogueChapter02ChagallBattleQuote .include "TEXT/DIALOGUE/Chapter02/ChagallBattleQuote.dialogue.txt" ; 8FA851
      dialogueChapter02LewynErinysTalk .include "TEXT/DIALOGUE/Chapter02/LewynErinysTalk.dialogue.txt" ; 8FA878
      dialogueChapter02ErinysBattleQuote .include "TEXT/DIALOGUE/Chapter02/ErinysBattleQuote.dialogue.txt" ; 8FAE18
      dialogueChapter02LewynErinysBattleQuote .include "TEXT/DIALOGUE/Chapter02/LewynErinysBattleQuote.dialogue.txt" ; 8FAE41
      dialogueChapter02ErinysGroupArrive .include "TEXT/DIALOGUE/Chapter02/ErinysGroupArrive.dialogue.txt" ; 8FAE64
      dialogueChapter02Ending .include "TEXT/DIALOGUE/Chapter02/Ending.dialogue.txt" ; 8FAEB4
      dialogueChapter02Village8 .include "TEXT/DIALOGUE/Chapter02/Village8.dialogue.txt" ; 8FB2D7
      dialogueChapter02VillageBargainBand .include "TEXT/DIALOGUE/Chapter02/VillageBargainBand.dialogue.txt" ; 8FB31A
      dialogueChapter02VillageArmorslayer .include "TEXT/DIALOGUE/Chapter02/VillageArmorslayer.dialogue.txt" ; 8FB379
      dialogueChapter02Village5 .include "TEXT/DIALOGUE/Chapter02/Village5.dialogue.txt" ; 8FB40D
      dialogueChapter02Village2 .include "TEXT/DIALOGUE/Chapter02/Village2.dialogue.txt" ; 8FB461
      dialogueChapter02Village4 .include "TEXT/DIALOGUE/Chapter02/Village4.dialogue.txt" ; 8FB4FE
      dialogueChapter02Village6 .include "TEXT/DIALOGUE/Chapter02/Village6.dialogue.txt" ; 8FB59B
      dialogueChapter02Village7 .include "TEXT/DIALOGUE/Chapter02/Village7.dialogue.txt" ; 8FB623
      dialogueChapter02Village1 .include "TEXT/DIALOGUE/Chapter02/Village1.dialogue.txt" ; 8FB6AD
      dialogueChapter02Village3 .include "TEXT/DIALOGUE/Chapter02/Village3.dialogue.txt" ; 8FB728
      dialogueChapter02EndingKnightRing .include "TEXT/DIALOGUE/Chapter02/EndingKnightRing.dialogue.txt" ; 8FB77F

      .include "EVENTS/Chapter08/EventChapter08Opening.asm"
      .include "EVENTS/Chapter08/EventChapter08MuhammadCharge.asm"
      .include "EVENTS/Chapter08/EventChapter08OvoCharge.asm"
      .include "EVENTS/Chapter08/EventChapter08BanbaCharge.asm"
      .include "EVENTS/Chapter08/EventChapter08FebailSpawn.asm"
      .include "EVENTS/Chapter08/EventChapter08IshtarSpawn.asm"
      .include "EVENTS/Chapter08/EventChapter08IshtarLeave.asm"
      .include "EVENTS/Chapter08/EventChapter08ConnachtSeized.asm"
      .include "EVENTS/Chapter08/EventChapter08_12C.asm"
      .include "EVENTS/Chapter08/EventChapter08MeathSpawn.asm"
      .include "EVENTS/Chapter08/EventChapter08CoulterCharge.asm"
      .include "EVENTS/Chapter08/EventChapter08MunsterSavedMaykovReaction.asm"
      .include "EVENTS/Chapter08/EventChapter08Ending.asm"
      .include "EVENTS/Chapter08/EventChapter08PattyFebailTalk.asm"
      .include "EVENTS/Chapter08/EventChapter08SeliphCedTalk.asm"
      .include "EVENTS/Chapter08/EventChapter08Village1.asm"
      .include "EVENTS/Chapter08/EventChapter08VillagePowerRing.asm"
      .include "EVENTS/Chapter08/EventChapter08Village2.asm"
      .include "EVENTS/Chapter08/EventChapter08Village3.asm"
      .include "EVENTS/Chapter08/EventChapter08Village4.asm"
      .include "EVENTS/Chapter08/EventChapter08VillageThiefBand.asm"
      .include "EVENTS/Chapter08/EventChapter08IshtarDied.asm"
      .include "EVENTS/Chapter08/EventChapter08CivilianRescued1.asm"
      .include "EVENTS/Chapter08/EventChapter08CivilianRescued2.asm"
      .include "EVENTS/Chapter08/EventChapter08CivilianRescued3.asm"
      .include "EVENTS/Chapter08/EventChapter08CivilianRescued4.asm"
      .include "EVENTS/Chapter08/EventChapter08CivilianRescued5.asm"
      .include "EVENTS/Chapter08/EventChapter08CivilianRescued6.asm"
      .include "EVENTS/Chapter08/EventChapter08_140.asm"
      .include "EVENTS/Chapter08/EventChapter08Village3Asaello.asm"
      .include "EVENTS/Chapter08/EventChapter08LeifNearMountain.asm"
      .include "EVENTS/Chapter08/EventChapter08FeeOnMountain.asm"
      .include "EVENTS/Chapter08/EventChapter08MuirneSeliphAdjacent.asm"
      .include "EVENTS/Chapter08/EventChapter08LindaOnTree.asm"
      .include "EVENTS/Chapter08/EventChapter08AmidOnTree.asm"

      dialogueChapter08Opening1 .include "TEXT/DIALOGUE/Chapter08/Opening1.dialogue.txt" ; 8FC115
      dialogueChapter08Opening2 .include "TEXT/DIALOGUE/Chapter08/Opening2.dialogue.txt" ; 8FC2E9
      dialogueChapter08Opening3 .include "TEXT/DIALOGUE/Chapter08/Opening3.dialogue.txt" ; 8FC3B8
      dialogueChapter08Opening4 .include "TEXT/DIALOGUE/Chapter08/Opening4.dialogue.txt" ; 8FC660
      dialogueChapter08MuhammadCharge .include "TEXT/DIALOGUE/Chapter08/MuhammadCharge.dialogue.txt" ; 8FC741
      dialogueChapter08OvoCharge .include "TEXT/DIALOGUE/Chapter08/OvoCharge.dialogue.txt" ; 8FC79D
      dialogueChapter08BanbaCharge .include "TEXT/DIALOGUE/Chapter08/BanbaCharge.dialogue.txt" ; 8FC7E3
      dialogueChapter08FebailSpawn .include "TEXT/DIALOGUE/Chapter08/FebailSpawn.dialogue.txt" ; 8FC817
      dialogueChapter08IshtarSpawn .include "TEXT/DIALOGUE/Chapter08/IshtarSpawn.dialogue.txt" ; 8FCA0D
      dialogueChapter08IshtarLeave .include "TEXT/DIALOGUE/Chapter08/IshtarLeave.dialogue.txt" ; 8FCBB2
      dialogueChapter08ConnachtSeized .include "TEXT/DIALOGUE/Chapter08/ConnachtSeized.dialogue.txt" ; 8FCC47

      .word $02C5

      dialogueChapter08MeathSpawn1 .include "TEXT/DIALOGUE/Chapter08/MeathSpawn1.dialogue.txt" ; 8FCD86
      dialogueChapter08MeathSpawn2 .include "TEXT/DIALOGUE/Chapter08/MeathSpawn2.dialogue.txt" ; 8FCF81
      dialogueChapter08MeathSpawn3 .include "TEXT/DIALOGUE/Chapter08/MeathSpawn3.dialogue.txt" ; 8FD0A0
      dialogueChapter08CoulterCharge .include "TEXT/DIALOGUE/Chapter08/CoulterCharge.dialogue.txt" ; 8FD254
      dialogueChapter08MunsterSavedMaykovReaction .include "TEXT/DIALOGUE/Chapter08/MunsterSavedMaykovReaction.dialogue.txt" ; 8FD3CD
      dialogueChapter08Ending .include "TEXT/DIALOGUE/Chapter08/Ending.dialogue.txt" ; 8FD44D
      dialogueChapter08EndingAltena .include "TEXT/DIALOGUE/Chapter08/EndingAltena.dialogue.txt" ; 8FD69C
      dialogueChapter08PattyFebailTalk .include "TEXT/DIALOGUE/Chapter08/PattyFebailTalk.dialogue.txt" ; 8FD6D2
      dialogueChapter08SeliphCedTalk .include "TEXT/DIALOGUE/Chapter08/SeliphCedTalk.dialogue.txt" ; 8FD86E
      dialogueChapter08CivilianRescued1 .include "TEXT/DIALOGUE/Chapter08/CivilianRescued1.dialogue.txt" ; 8FD9FF
      dialogueChapter08CivilianRescued2 .include "TEXT/DIALOGUE/Chapter08/CivilianRescued2.dialogue.txt" ; 8FDA24
      dialogueChapter08CivilianRescued3 .include "TEXT/DIALOGUE/Chapter08/CivilianRescued3.dialogue.txt" ; 8FDA3C
      dialogueChapter08CivilianRescued4 .include "TEXT/DIALOGUE/Chapter08/CivilianRescued4.dialogue.txt" ; 8FDA53
      dialogueChapter08CivilianRescued5 .include "TEXT/DIALOGUE/Chapter08/CivilianRescued5.dialogue.txt" ; 8FDA76
      dialogueChapter08CivilianRescued6 .include "TEXT/DIALOGUE/Chapter08/CivilianRescued6.dialogue.txt" ; 8FDA98
      dialogueChapter08VillagePowerRing .include "TEXT/DIALOGUE/Chapter08/VillagePowerRing.dialogue.txt" ; 8FDAC4
      dialogueChapter08Village1 .include "TEXT/DIALOGUE/Chapter08/Village1.dialogue.txt" ; 8FDB4F
      dialogueChapter08Village2 .include "TEXT/DIALOGUE/Chapter08/Village2.dialogue.txt" ; 8FDBE2
      dialogueChapter08Village3 .include "TEXT/DIALOGUE/Chapter08/Village3.dialogue.txt" ; 8FDC92
      dialogueChapter08Village4 .include "TEXT/DIALOGUE/Chapter08/Village4.dialogue.txt" ; 8FDCF4
      dialogueChapter08VillageThiefBand .include "TEXT/DIALOGUE/Chapter08/VillageThiefBand.dialogue.txt" ; 8FDD74
      dialogueChapter08IshtarBattleQuote .include "TEXT/DIALOGUE/Chapter08/IshtarBattleQuote.dialogue.txt" ; 8FDE09
      dialogueChapter08FebailBattleQuote .include "TEXT/DIALOGUE/Chapter08/FebailBattleQuote.dialogue.txt" ; 8FDE2E
      dialogueChapter08PattyFebailBattleQuote .include "TEXT/DIALOGUE/Chapter08/PattyFebailBattleQuote.dialogue.txt" ; 8FDE4E
      dialogueChapter08MuhammadBattleQuote .include "TEXT/DIALOGUE/Chapter08/MuhammadBattleQuote.dialogue.txt" ; 8FDE71
      dialogueChapter08OvoBattleQuote .include "TEXT/DIALOGUE/Chapter08/OvoBattleQuote.dialogue.txt" ; 8FDE8B
      dialogueChapter08BanbaTriangleAttack .include "TEXT/DIALOGUE/Chapter08/BanbaTriangleAttack.dialogue.txt" ; 8FDEAE
      dialogueChapter08BanbaBattleQuote .include "TEXT/DIALOGUE/Chapter08/BanbaBattleQuote.dialogue.txt" ; 8FDEDB
      dialogueChapter08FotlaTriangleAttack .include "TEXT/DIALOGUE/Chapter08/FotlaTriangleAttack.dialogue.txt" ; 8FDEF4
      dialogueChapter08FotlaBattleQuote .include "TEXT/DIALOGUE/Chapter08/FotlaBattleQuote.dialogue.txt" ; 8FDF21
      dialogueChapter08EriuTriangleAttack .include "TEXT/DIALOGUE/Chapter08/EriuTriangleAttack.dialogue.txt" ; 8FDF39
      dialogueChapter08EriuBattleQuote .include "TEXT/DIALOGUE/Chapter08/EriuBattleQuote.dialogue.txt" ; 8FDF68
      dialogueChapter08BloomBattleQuote .include "TEXT/DIALOGUE/Chapter08/BloomBattleQuote.dialogue.txt" ; 8FDF83
      dialogueChapter08CoulterBattleQuote .include "TEXT/DIALOGUE/Chapter08/CoulterBattleQuote.dialogue.txt" ; 8FDFAF
      dialogueChapter08MaykovBattleQuote .include "TEXT/DIALOGUE/Chapter08/MaykovBattleQuote.dialogue.txt" ; 8FDFD0
      dialogueChapter08PlaceholderTitle .include "TEXT/DIALOGUE/Chapter08/PlaceholderTitle.dialogue.txt" ; 8FDFFA
      dialogueChapter08WorldMap1 .include "TEXT/DIALOGUE/Chapter08/WorldMap1.dialogue.txt" ; 8FDFFF
      dialogueChapter08WorldMap2 .include "TEXT/DIALOGUE/Chapter08/WorldMap2.dialogue.txt" ; 8FE046
      dialogueChapter08WorldMap3 .include "TEXT/DIALOGUE/Chapter08/WorldMap3.dialogue.txt" ; 8FE0DA

      dialogueChapter09WorldMap1 .include "TEXT/DIALOGUE/Chapter09/WorldMap1.dialogue.txt" ; 8FE3DF
      dialogueChapter09WorldMap2 .include "TEXT/DIALOGUE/Chapter09/WorldMap2.dialogue.txt" ; 8FE4C5

      dialogueChapterFinalWorldMap1 .include "TEXT/DIALOGUE/ChapterFinal/WorldMap1.dialogue.txt" ; 8FE65F
      dialogueChapterFinalWorldMap2 .include "TEXT/DIALOGUE/ChapterFinal/WorldMap2.dialogue.txt" ; 8FE6CC
      dialogueChapterFinalWorldMap3 .include "TEXT/DIALOGUE/ChapterFinal/WorldMap3.dialogue.txt" ; 8FE6F5
      dialogueChapterFinalWorldMap4 .include "TEXT/DIALOGUE/ChapterFinal/WorldMap4.dialogue.txt" ; 8FE728

      aEventPointers .include "TABLES/CHAPTER/EventPointers.csv.asm"

      .include "EVENTS/General/EventDebug8FEF78.asm"
      .include "EVENTS/General/EventSigurdDeathReaction.asm"
      .include "EVENTS/General/EventGen1HomeCastleSeized.asm"
      .include "EVENTS/General/EventSeliphDeathReaction.asm"
      .include "EVENTS/General/EventGen2HomeCastleSeized.asm"

      .include "EVENTS/Chapter06/EventChapter06OifeySeliphTalk.asm"
      .include "EVENTS/Chapter06/EventChapter06LesterLanaTalk.asm"
      .include "EVENTS/Chapter06/EventChapter06FeeSeliphTalk.asm"
      .include "EVENTS/Chapter06/EventChapter06LanaJuliaTalk.asm"
      .include "EVENTS/Chapter06/EventChapter06ScathachLarceiTalk.asm"
      .include "EVENTS/Chapter06/EventChapter06ArthurSeliphTalk.asm"
      .include "EVENTS/Chapter06/EventChapter06DeimneMuirneTalk.asm"
      .include "EVENTS/Chapter06/EventChapter06DalvinCreidneTalk.asm"
      .include "EVENTS/Chapter06/EventChapter06SeliphLanaTalk.asm"
      .include "EVENTS/Chapter06/EventChapter06JuliaSeliphTalk.asm"

      .include "EVENTS/Chapter07/EventChapter07ShannanPattyTalk.asm"
      .include "EVENTS/Chapter07/EventChapter07SeliphShannanTalk.asm"
      .include "EVENTS/Chapter07/EventChapter07OifeyDiarmuidTalk.asm"
      .include "EVENTS/Chapter07/EventChapter07LarceiShannanTalk.asm"
      .include "EVENTS/Chapter07/EventChapter07PattySeliphTalk.asm"
      .include "EVENTS/Chapter07/EventChapter07AresSeliphTalk.asm"
      .include "EVENTS/Chapter07/EventChapter07LeifSeliphTalk.asm"
      .include "EVENTS/Chapter07/EventChapter07DiarmuidNannaTalk.asm"
      .include "EVENTS/Chapter07/EventChapter07TristanJeanneTalk.asm"
      .include "EVENTS/Chapter07/EventChapter07TineSeliphTalk.asm"
      .include "EVENTS/Chapter07/EventChapter07LeneSeliphTalk.asm"
      .include "EVENTS/Chapter07/EventChapter07FinnNannaTalk.asm"
      .include "EVENTS/Chapter07/EventChapter07FinnLanaTalk.asm"
      .include "EVENTS/Chapter07/EventChapter07FinnLarceiTalk.asm"

      .include "EVENTS/Chapter08/EventChapter08FebailSeliphTalk.asm"
      .include "EVENTS/Chapter08/EventChapter08HerminaHawkTalk.asm"
      .include "EVENTS/Chapter08/EventChapter08FeeCedTalk.asm"
      .include "EVENTS/Chapter08/EventChapter08NannaAresTalk.asm"
      .include "EVENTS/Chapter08/EventChapter08CedSeliphTalk.asm"
      .include "EVENTS/Chapter08/EventChapter08SeliphTineTalk.asm"
      .include "EVENTS/Chapter08/EventChapter08JuliaSeliphTalk.asm"
      .include "EVENTS/Chapter08/EventChapter08ArthurFeeTalk.asm"
      .include "EVENTS/Chapter08/EventChapter08FinnLeifTalk.asm"

      .include "EVENTS/Chapter09/EventChapter09FebailPattyTalk.asm"
      .include "EVENTS/Chapter09/EventChapter09SeliphHannibalTalk.asm"
      .include "EVENTS/Chapter09/EventChapter09LeneCoirpreTalk.asm"
      .include "EVENTS/Chapter09/EventChapter09FinnAltenaTalk.asm"
      .include "EVENTS/Chapter09/EventChapter09HannibalAltenaTalk.asm"
      .include "EVENTS/Chapter09/EventChapter09PattyCoirpreTalk.asm"
      .include "EVENTS/Chapter09/EventChapter09JuliaSeliphTalk.asm"

      .include "EVENTS/Chapter10/EventChapter10LeifAltenaTalk.asm"
      .include "EVENTS/Chapter10/EventChapter10ShannanSeliphTalk.asm"
      .include "EVENTS/Chapter10/EventChapter10OifeySeliphTalk.asm"
      .include "EVENTS/Chapter10/EventChapter10CoirpreAltenaTalk.asm"
      .include "EVENTS/Chapter10/EventChapter10LesterPattyTalk.asm"
      .include "EVENTS/Chapter10/EventChapter10NannaLeifTalk.asm"
      .include "EVENTS/Chapter10/EventChapter10FebailLanaTalk.asm"
      .include "EVENTS/Chapter10/EventChapter10SeliphLeneTalk.asm"
      .include "EVENTS/Chapter10/EventChapter10SeliphFeeTalk.asm"
      .include "EVENTS/Chapter10/EventChapter10SeliphTineTalk.asm"

      .include "EVENTS/ChapterFinal/EventChapterFinalTineSeliphTalk.asm"
      .include "EVENTS/ChapterFinal/EventChapterFinalTineCedTalk.asm"
      .include "EVENTS/ChapterFinal/EventChapterFinalTineLeifTalk.asm"
      .include "EVENTS/ChapterFinal/EventChapterFinalDaisyDeimneTalk.asm"
      .include "EVENTS/ChapterFinal/EventChapterFinalJeanneLeifTalk.asm"
      .include "EVENTS/ChapterFinal/EventChapterFinalMuirneAsaelloTalk.asm"
      .include "EVENTS/ChapterFinal/EventChapterFinalLanaSeliphTalk.asm"
      .include "EVENTS/ChapterFinal/EventChapterFinalLanaFebailTalk.asm"
      .include "EVENTS/ChapterFinal/EventChapterFinalLanaScathachTalk.asm"
      .include "EVENTS/ChapterFinal/EventChapterFinalLarceiSeliphTalk.asm"
      .include "EVENTS/ChapterFinal/EventChapterFinalLarceiIucharTalk.asm"
      .include "EVENTS/ChapterFinal/EventChapterFinalLarceiIucharbaTalk.asm"
      .include "EVENTS/ChapterFinal/EventChapterFinalLarceiShannanTalk.asm"
      .include "EVENTS/ChapterFinal/EventChapterFinalPattySeliphTalk.asm"
      .include "EVENTS/ChapterFinal/EventChapterFinalPattyShannanTalk.asm"
      .include "EVENTS/ChapterFinal/EventChapterFinalPattyLesterTalk.asm"
      .include "EVENTS/ChapterFinal/EventChapterFinalNannaSeliphTalk.asm"
      .include "EVENTS/ChapterFinal/EventChapterFinalNannaAresTalk.asm"
      .include "EVENTS/ChapterFinal/EventChapterFinalNannaLeifTalk.asm"
      .include "EVENTS/ChapterFinal/EventChapterFinalFeeSeliphTalk.asm"
      .include "EVENTS/ChapterFinal/EventChapterFinalFeeArthurTalk.asm"
      .include "EVENTS/ChapterFinal/EventChapterFinalFeeOifeyTalk.asm"

      .include "EVENTS/Chapter09/EventChapter09AsaelloDaisyTalk.asm"

      .include "EVENTS/ChapterFinal/EventChapterFinalArthurTineTalk.asm"
      .include "EVENTS/ChapterFinal/EventChapterFinalAmidLindaTalk.asm"

      .include "EVENTS/Chapter09/EventChapter09LayleaCharlotTalk.asm"
      .include "EVENTS/Chapter06/EventChapter06HerminaSeliphTalk.asm"

      .fill $8F8000 + $8000 - *, 0

    .here

    * = $108000
    .logical $908000

      .dsection ChapterPrologueEventsSection
      .dsection ChapterPrologueEventDataSection

      .include "EVENTS/Chapter01/EventChapter01Opening.asm"
      .include "EVENTS/Chapter01/EventChapter01_021.asm"
      .include "EVENTS/Chapter01/EventChapter01EdainGroupSpawn.asm"
      .include "EVENTS/Chapter01/EventChapter01GenoaSeized.asm"
      .include "EVENTS/Chapter01/EventChapter01SigurdAyraTalk.asm"
      .include "EVENTS/Chapter01/EventChapter01EdainJamkeTalk.asm"
      .include "EVENTS/Chapter01/EventChapter01HeirheinSpawn.asm"
      .include "EVENTS/Chapter01/EventChapter01NordionSpawn.asm"
      .include "EVENTS/Chapter01/EventChapter01MarphaSeized.asm"
      .include "EVENTS/Chapter01/EventChapter01VerdaneSpawn.asm"
      .include "EVENTS/Chapter01/EventChapter01DeirdreSpawn.asm"
      .include "EVENTS/Chapter01/EventChapter01Ending.asm"
      .include "EVENTS/Chapter01/EventChapter01_02C.asm"
      .include "EVENTS/Chapter01/EventChapter01_02D.asm"
      .include "EVENTS/Chapter01/EventChapter01_02E.asm"
      .include "EVENTS/Chapter01/EventChapter01_02F.asm"
      .include "EVENTS/Chapter01/EventChapter01_030.asm"
      .include "EVENTS/Chapter01/EventChapter01_031.asm"
      .include "EVENTS/Chapter01/EventChapter01_032.asm"
      .include "EVENTS/Chapter01/EventChapter01_033.asm"
      .include "EVENTS/Chapter01/EventChapter01Village1.asm"
      .include "EVENTS/Chapter01/EventChapter01Village2.asm"
      .include "EVENTS/Chapter01/EventChapter01Village3.asm"
      .include "EVENTS/Chapter01/EventChapter01EldiganRetreat.asm"
      .include "EVENTS/Chapter01/EventChapter01MunnirRallyVanguard.asm"
      .include "EVENTS/Chapter01/EventChapter01AyraDestroysGenoa.asm"
      .include "EVENTS/Chapter01/EventChapter01AyraStartsMoving.asm"
      .include "EVENTS/Chapter01/EventChapter01GenoaSeizedAyraResponse.asm"
      .include "EVENTS/Chapter01/EventChapter01_03C.asm"
      .include "EVENTS/Chapter01/EventChapter01QuanDied.asm"
      .include "EVENTS/Chapter01/EventChapter01EthlynDied.asm"
      .include "EVENTS/Chapter01/EventChapter01FinnDied.asm"
      .include "EVENTS/Chapter01/EventChapter01ElliotRetreats.asm"
      .include "EVENTS/Chapter01/EventChapter01LexBraveAxe.asm"
      .include "EVENTS/Chapter01/EventChapter01CrossknightTalk.asm"
      .include "EVENTS/Chapter01/EventChapter01_043.asm"

      dialogueChapter01Opening2 .include "TEXT/DIALOGUE/Chapter01/Opening2.dialogue.txt" ; 908D0A
      dialogueChapter01Opening1 .include "TEXT/DIALOGUE/Chapter01/Opening1.dialogue.txt" ; 908E8D
      dialogueChapter01Opening3 .include "TEXT/DIALOGUE/Chapter01/Opening3.dialogue.txt" ; 908ECC
      dialogueChapter01Opening4 .include "TEXT/DIALOGUE/Chapter01/Opening4.dialogue.txt" ; 909106
      dialogueChapter01EdainGroupSpawn1 .include "TEXT/DIALOGUE/Chapter01/EdainGroupSpawn1.dialogue.txt" ; 909132
      dialogueChapter01EdainGroupSpawn2 .include "TEXT/DIALOGUE/Chapter01/EdainGroupSpawn2.dialogue.txt" ; 909361
      dialogueChapter01EdainGroupSpawn3 .include "TEXT/DIALOGUE/Chapter01/EdainGroupSpawn3.dialogue.txt" ; 90938A
      dialogueChapter01SigurdAyraTalk .include "TEXT/DIALOGUE/Chapter01/SigurdAyraTalk.dialogue.txt" ; 909403
      dialogueChapter01AyraBattleQuote .include "TEXT/DIALOGUE/Chapter01/AyraBattleQuote.dialogue.txt" ; 90967E
      dialogueChapter01CimbaethBattleQuote .include "TEXT/DIALOGUE/Chapter01/CimbaethBattleQuote.dialogue.txt" ; 9096AC
      dialogueChapter01GenoaSeizedAyraAlive .include "TEXT/DIALOGUE/Chapter01/GenoaSeizedAyraAlive.dialogue.txt" ; 9096e0
      dialogueChapter01GenoaSeizedAyraDead .include "TEXT/DIALOGUE/Chapter01/GenoaSeizedAyraDead.dialogue.txt" ; 9099E1
      dialogueChapter01HeirheinSpawn1 .include "TEXT/DIALOGUE/Chapter01/HeirheinSpawn1.dialogue.txt" ; 909CCC
      dialogueChapter01HeirheinSpawn2 .include "TEXT/DIALOGUE/Chapter01/HeirheinSpawn2.dialogue.txt" ; 909D2D
      dialogueChapter01NordionSpawn1 .include "TEXT/DIALOGUE/Chapter01/NordionSpawn1.dialogue.txt" ; 909D60
      dialogueChapter01NordionSpawn2 .include "TEXT/DIALOGUE/Chapter01/NordionSpawn2.dialogue.txt" ; 909E43
      dialogueChapter01ElliotBattleQuote .include "TEXT/DIALOGUE/Chapter01/ElliotBattleQuote.dialogue.txt" ; 90A07D
      dialogueChapter01MunnirRallyVanguard .include "TEXT/DIALOGUE/Chapter01/MunnirRallyVanguard.dialogue.txt" ; 90a0c1
      dialogueChapter01MunnirBattleQuote .include "TEXT/DIALOGUE/Chapter01/MunnirBattleQuote.dialogue.txt" ; 90A113
      dialogueChapter01MarphaSeized1 .include "TEXT/DIALOGUE/Chapter01/MarphaSeized1.dialogue.txt" ; 90a151
      dialogueChapter01MarphaSeized2 .include "TEXT/DIALOGUE/Chapter01/MarphaSeized2.dialogue.txt" ; 90A437
      dialogueChapter01VerdaneSpawn1 .include "TEXT/DIALOGUE/Chapter01/VerdaneSpawn1.dialogue.txt" ; 90A640
      dialogueChapter01VerdaneSpawn2 .include "TEXT/DIALOGUE/Chapter01/VerdaneSpawn2.dialogue.txt" ; 90A8A9
      dialogueChapter01DeirdreSpawnSandimaAlive .include "TEXT/DIALOGUE/Chapter01/DeirdreSpawnSandimaAlive.dialogue.txt" ; 90AD08
      dialogueChapter01DeirdreSpawnSandimaDead .include "TEXT/DIALOGUE/Chapter01/DeirdreSpawnSandimaDead.dialogue.txt" ; 90AFA6
      dialogueChapter01SandimaBattleQuote .include "TEXT/DIALOGUE/Chapter01/SandimaBattleQuote.dialogue.txt" ; 90B3CE
      dialogueChapter01Ending .include "TEXT/DIALOGUE/Chapter01/Ending.dialogue.txt" ; 90B3FA
      dialogueChapter01UnusedEnding .include "TEXT/DIALOGUE/Chapter01/UnusedEnding.dialogue.txt" ; 90B6A0 - This one is very slightly different. Just 'protect the people', leaving out 'of this country'.
      dialogueChapter01EdainJamkeTalk .include "TEXT/DIALOGUE/Chapter01/EdainJamkeTalk.dialogue.txt" ; 90B93D
      dialogueChapter01Village1 .include "TEXT/DIALOGUE/Chapter01/Village1.dialogue.txt" ; 90BB5A
      dialogueChapter01Village2 .include "TEXT/DIALOGUE/Chapter01/Village2.dialogue.txt" ; 90BBFA
      dialogueChapter01Village3 .include "TEXT/DIALOGUE/Chapter01/Village3.dialogue.txt" ; 90BCD6
      dialogueChapter01EldiganRetreat .include "TEXT/DIALOGUE/Chapter01/EldiganRetreat.dialogue.txt" ; 90BEC5
      dialogueChapter01JamkeBattleQuote .include "TEXT/DIALOGUE/Chapter01/JamkeBattleQuote.dialogue.txt" ; 90BEFF
      dialogueChapter01UnusedJamkeEdainBattleQuote .include "TEXT/DIALOGUE/Chapter01/UnusedJamkeEdainBattleQuote.dialogue.txt" ; 90BF2D
      dialogueChapter01AyraDestroysGenoa .include "TEXT/DIALOGUE/Chapter01/AyraDestroysGenoa.dialogue.txt" ; 90BF4E
      dialogueChapter01AyraStartsMoving .include "TEXT/DIALOGUE/Chapter01/AyraStartsMoving.dialogue.txt" ; 90BF91
      dialogueChapter01GenoaSeizedAyraResponse .include "TEXT/DIALOGUE/Chapter01/GenoaSeizedAyraResponse.dialogue.txt" ; 90BFB9
      dialogueChapter01LexBraveAxe .include "TEXT/DIALOGUE/Chapter01/LexBraveAxe.dialogue.txt" ; 90BFF2

      dialogueChapter06Opening1 .include "TEXT/DIALOGUE/Chapter06/Opening1.dialogue.txt" ; 90C0E8
      dialogueChapter06Opening2 .include "TEXT/DIALOGUE/Chapter06/Opening2.dialogue.txt" ; 90C3C0
      dialogueChapter06OifeyGroupSpawn .include "TEXT/DIALOGUE/Chapter06/OifeyGroupSpawn.dialogue.txt" ; 90C970
      dialogueChapter06GaneishireSeized1 .include "TEXT/DIALOGUE/Chapter06/GaneishireSeized1.dialogue.txt" ; 90CA9D
      dialogueChapter06GaneishireSeized2 .include "TEXT/DIALOGUE/Chapter06/GaneishireSeized2.dialogue.txt" ; 90CF79
      dialogueChapter06FeeArthurSpawn .include "TEXT/DIALOGUE/Chapter06/FeeArthurSpawn.dialogue.txt" ; 90D04D
      dialogueChapter06SchmidtSpawn1 .include "TEXT/DIALOGUE/Chapter06/SchmidtSpawn1.dialogue.txt" ; 90D4DB
      dialogueChapter06SchmidtSpawn2 .include "TEXT/DIALOGUE/Chapter06/SchmidtSpawn2.dialogue.txt" ; 90D53E
      dialogueChapter06SchmidtSpawn3 .include "TEXT/DIALOGUE/Chapter06/SchmidtSpawn3.dialogue.txt" ; 90D583
      dialogueChapter06LarceiIucharbaTalk .include "TEXT/DIALOGUE/Chapter06/LarceiIucharbaTalk.dialogue.txt" ; 90D5DF
      dialogueChapter06LarceiIucharbaTalkIucharResponse .include "TEXT/DIALOGUE/Chapter06/LarceiIucharbaTalkIucharResponse.dialogue.txt" ; 90D7F5
      dialogueChapter06LarceiIucharTalk .include "TEXT/DIALOGUE/Chapter06/LarceiIucharTalk.dialogue.txt" ; 90D843
      dialogueChapter06LarceiIucharTalkIucharbaResponse .include "TEXT/DIALOGUE/Chapter06/LarceiIucharTalkIucharbaResponse.dialogue.txt" ; 90D9B4
      dialogueChapter06IsaachSeizedDanannAlive .include "TEXT/DIALOGUE/Chapter06/IsaachSeizedDanannAlive.dialogue.txt" ; 90DA0E
      dialogueChapter06IsaachSeizedDanannDead .include "TEXT/DIALOGUE/Chapter06/IsaachSeizedDanannDead.dialogue.txt" ; 90DC01
      dialogueChapter06SofalaSeizedDanannAlive .include "TEXT/DIALOGUE/Chapter06/SofalaSeizedDanannAlive.dialogue.txt" ; 90DC35
      dialogueChapter06SofalaSeizedDanannDead .include "TEXT/DIALOGUE/Chapter06/SofalaSeizedDanannDead.dialogue.txt" ; 90DD57
      dialogueChapter06BrotherRecruitedDanannResponse .include "TEXT/DIALOGUE/Chapter06/BrotherRecruitedDanannResponse.dialogue.txt" ; 90DD8B
      dialogueChapter06Ending .include "TEXT/DIALOGUE/Chapter06/Ending.dialogue.txt" ; 90DE0C
      dialogueChapter06Village1 .include "TEXT/DIALOGUE/Chapter06/Village1.dialogue.txt" ; 90E4A8
      dialogueChapter06Village2 .include "TEXT/DIALOGUE/Chapter06/Village2.dialogue.txt" ; 90E585
      dialogueChapter06VillageSkillRing .include "TEXT/DIALOGUE/Chapter06/VillageSkillRing.dialogue.txt" ; 90E5E0
      dialogueChapter06Village4 .include "TEXT/DIALOGUE/Chapter06/Village4.dialogue.txt" ; 90E659
      dialogueChapter06Village3 .include "TEXT/DIALOGUE/Chapter06/Village3.dialogue.txt" ; 90E6CE
      dialogueChapter06Village5 .include "TEXT/DIALOGUE/Chapter06/Village5.dialogue.txt" ; 90E735
      dialogueChapter06HaroldBattleQuote .include "TEXT/DIALOGUE/Chapter06/HaroldBattleQoute.dialogue.txt" ; 90E7E2
      dialogueChapter06IucharbaBattleQuote .include "TEXT/DIALOGUE/Chapter06/IucharbaBattleQuote.dialogue.txt" ; 90E800
      dialogueChapter06IucharBattleQuote .include "TEXT/DIALOGUE/Chapter06/IucharBattleQuote.dialogue.txt" ; 90E82E
      dialogueChapter06SchmidtBattleQuote .include "TEXT/DIALOGUE/Chapter06/SchmidtBattleQuote.dialogue.txt" ; 90E871
      dialogueChapter06DanannBattleQuote .include "TEXT/DIALOGUE/Chapter06/DanannBattleQuote.dialogue.txt" ; 90E8A1

      ; 90e8ce

    .here

    * = $118000
    .logical $918000

      .dsection Dialogue1Section

      ; 91/A3AB

    .here

    * = $11A40E
    .logical $91A40E

      .dsection Code91A40ESection
      .dsection Code91A670Section

      ; 91a7bc

    .here

    * = $11A863
    .logical $91A863

      .dsection Dialogue2Section

      ; 91/A8E4

    .here

    * = $11A984
    .logical $91A984

      .dsection Dialogue3Section

      ; 91/A9BB

    .here

    * = $11AD0B
    .logical $91AD0B

      .dsection Code91AD0BSection

      ; 91b11c

    .here

    * = $11BA9C
    .logical $91BA9C

      .dsection EpilogueDialogueCodeSection

      ; 91bd42

    .here

    * = $11BDD2
    .logical $91BDD2

      .dsection Code91BDD2Section

      .include "EVENTS/Chapter06/EventChapter06Opening.asm"
      .include "EVENTS/Chapter06/EventChapter06OifeyGroupSpawn.asm"
      .include "EVENTS/Chapter06/EventChapter06GaneishireSeized.asm"
      .include "EVENTS/Chapter06/EventChapter06FeeArthurSpawn.asm"
      .include "EVENTS/Chapter06/EventChapter06SchmidtSpawn.asm"
      .include "EVENTS/Chapter06/EventChapter06LarceiIucharbaTalk.asm"
      .include "EVENTS/Chapter06/EventChapter06LarceiIucharTalk.asm"
      .include "EVENTS/Chapter06/EventChapter06IsaachSeized.asm"
      .include "EVENTS/Chapter06/EventChapter06SofalaSeized.asm"
      .include "EVENTS/Chapter06/EventChapter06BrotherRecruitedDanannResponse.asm"
      .include "EVENTS/Chapter06/EventChapter06Ending.asm"
      .include "EVENTS/Chapter06/EventChapter06Village1.asm"
      .include "EVENTS/Chapter06/EventChapter06Village2.asm"
      .include "EVENTS/Chapter06/EventChapter06Village3.asm"
      .include "EVENTS/Chapter06/EventChapter06Village4.asm"
      .include "EVENTS/Chapter06/EventChapter06VillageSkillRing.asm"
      .include "EVENTS/Chapter06/EventChapter06Village5.asm"
      .include "EVENTS/Chapter06/EventChapter06_0EA.asm"
      .include "EVENTS/Chapter06/EventChapter06CreidneIucharbaAdjacent.asm"
      .include "EVENTS/Chapter06/EventChapter06CreidneIucharAdjacent.asm"
      .include "EVENTS/Chapter06/EventChapter06Village2Seliph.asm"
      .include "EVENTS/Chapter06/EventChapter06SofalaArmyTalk.asm"
      .include "EVENTS/Chapter06/EventChapter06IsaachArmyTalk.asm"
      .include "EVENTS/Chapter06/EventChapter06DeimneIsaachVisit.asm"
      .include "EVENTS/Chapter06/EventChapter06_0F5.asm"

      ; 91d616

    .here

    * = $11D9C5
    .logical $91D9C5

      .dsection SaveCode1Section

      ; 91/D9FA

    .here

    * = $11E95F
    .logical $91E95F

      .dsection SaveCode2Section

      ; 91/F748

    .here

    * = $128000
    .logical $928000

      g2bppDialogueFont .text ROM[$128000:$130000] ; 92/8000

    .here

    * = $1D8000
    .logical $9D8000

      dialogueChapterPrologueWorldMap1 .include "TEXT/DIALOGUE/ChapterPrologue/WorldMap1.dialogue.txt" ; 9D8000
      dialogueChapterPrologueWorldMap2 .include "TEXT/DIALOGUE/ChapterPrologue/WorldMap2.dialogue.txt" ; 9D833B
      dialogueChapterPrologueWorldMap3 .include "TEXT/DIALOGUE/ChapterPrologue/WorldMap3.dialogue.txt" ; 9D839C
      dialogueChapterPrologueWorldMap4 .include "TEXT/DIALOGUE/ChapterPrologue/WorldMap4.dialogue.txt" ; 9D8490
      dialogueChapterPrologueWorldMap5 .include "TEXT/DIALOGUE/ChapterPrologue/WorldMap5.dialogue.txt" ; 9D84BA
      dialogueChapterPrologueWorldMap6 .include "TEXT/DIALOGUE/ChapterPrologue/WorldMap6.dialogue.txt" ; 9D8504
      dialogueChapterPrologueWorldMapUnknown .include "TEXT/DIALOGUE/ChapterPrologue/WorldMapUnknown.dialogue.txt" ; 9D8702

      .include "EVENTS/Chapter03/EventChapter03Opening.asm"
      .include "EVENTS/Chapter03/EventChapter03MadinoSeized.asm"
      .include "EVENTS/Chapter03/EventChapter03SylvaleSpawn.asm"
      .include "EVENTS/Chapter03/EventChapter03_075.asm"
      .include "EVENTS/Chapter03/EventChapter03EldiganApproachesSigurd.asm"
      .include "EVENTS/Chapter03/EventChapter03SigurdApproachesEldigan.asm"
      .include "EVENTS/Chapter03/EventChapter03LachesisEldiganTalk.asm"
      .include "EVENTS/Chapter03/EventChapter03_079.asm"
      .include "EVENTS/Chapter03/EventChapter03EldiganDeathSigurdResponse.asm"
      .include "EVENTS/Chapter03/EventChapter03ThraciaSpawn.asm"
      .include "EVENTS/Chapter03/EventChapter03_07C.asm"
      .include "EVENTS/Chapter03/EventChapter03TravantLeave.asm"
      .include "EVENTS/Chapter03/EventChapter03SylvaleSeized.asm"
      .include "EVENTS/Chapter03/EventChapter03ClaudTailtiuSpawn.asm"
      .include "EVENTS/Chapter03/EventChapter03OrgahilSpawn.asm"
      .include "EVENTS/Chapter03/EventChapter03_081.asm"
      .include "EVENTS/Chapter03/EventChapter03Ending.asm"
      .include "EVENTS/Chapter03/EventChapter03_083.asm"
      .include "EVENTS/Chapter03/EventChapter03_084.asm"
      .include "EVENTS/Chapter03/EventChapter03Village2.asm"
      .include "EVENTS/Chapter03/EventChapter03VillageWingclipper.asm"
      .include "EVENTS/Chapter03/EventChapter03VillageRestore.asm"
      .include "EVENTS/Chapter03/EventChapter03VillageDefense.asm"
      .include "EVENTS/Chapter03/EventChapter03Village4.asm"
      .include "EVENTS/Chapter03/EventChapter03Village3.asm"
      .include "EVENTS/Chapter03/EventChapter03VillageStrength.asm"
      .include "EVENTS/Chapter03/EventChapter03Village1.asm"
      .include "EVENTS/Chapter03/EventChapter03QuanDied.asm"
      .include "EVENTS/Chapter03/EventChapter03EthlynDied.asm"
      .include "EVENTS/Chapter03/EventChapter03FinnDied.asm"
      .include "EVENTS/Chapter03/EventChapter03_090.asm"
      .include "EVENTS/Chapter03/EventChapter03_091.asm"
      .include "EVENTS/Chapter03/EventChapter03_092.asm"
      .include "EVENTS/Chapter03/EventChapter03SylvaleCommanderTalk.asm"
      .include "EVENTS/Chapter03/EventChapter03DewBragiTower.asm"
      .include "EVENTS/Chapter03/EventChapter03_095.asm"

      dialogueChapter03Opening1 .include "TEXT/DIALOGUE/Chapter03/Opening1.dialogue.txt" ; 9D9381
      dialogueChapter03Opening2 .include "TEXT/DIALOGUE/Chapter03/Opening2.dialogue.txt" ; 9D9505
      dialogueChapter03Opening3 .include "TEXT/DIALOGUE/Chapter03/Opening3.dialogue.txt" ; 9D95AB
      dialogueChapter03Opening4 .include "TEXT/DIALOGUE/Chapter03/Opening4.dialogue.txt" ; 9D96B8
      dialogueChapter03MadinoSeized2 .include "TEXT/DIALOGUE/Chapter03/MadinoSeized2.dialogue.txt" ; 9D97B1
      dialogueChapter03Opening5 .include "TEXT/DIALOGUE/Chapter03/Opening5.dialogue.txt" ; 9D9D8D
      dialogueChapter03JacobiBattleQuote .include "TEXT/DIALOGUE/Chapter03/JacobiBattleQuote.dialogue.txt" ; 9D9FE0
      dialogueChapter03MadinoSeized1 .include "TEXT/DIALOGUE/Chapter03/MadinoSeized1.dialogue.txt" ; 9D9FFC
      dialogueChapter03SylvaleSpawn1 .include "TEXT/DIALOGUE/Chapter03/SylvaleSpawn1.dialogue.txt" ; 9DA0A2
      dialogueChapter03SylvaleSpawn2 .include "TEXT/DIALOGUE/Chapter03/SylvaleSpawn2.dialogue.txt" ; 9DA20F
      dialogueChapter03SylvaleSpawn3 .include "TEXT/DIALOGUE/Chapter03/SylvaleSpawn3.dialogue.txt" ; 9DA2B0
      dialogueChapter03SigurdEldiganCloseByTalk .include "TEXT/DIALOGUE/Chapter03/SigurdEldiganCloseByTalk.dialogue.txt" ; 9DA312
      dialogueChapter03LachesisEldiganTalk1 .include "TEXT/DIALOGUE/Chapter03/LachesisEldiganTalk1.dialogue.txt" ; 9DA412
      dialogueChapter03LachesisEldiganTalk2 .include "TEXT/DIALOGUE/Chapter03/LachesisEldiganTalk2.dialogue.txt" ; 9DA692
      dialogueChapter03EldiganDeathSigurdResponse .include "TEXT/DIALOGUE/Chapter03/EldiganDeathSigurdResponse.dialogue.txt" ; 9DA7D5
      dialogueChapter03ThraciaSpawn1 .include "TEXT/DIALOGUE/Chapter03/ThraciaSpawn1.dialogue.txt" ; 9DA894
      dialogueChapter03ThraciaSpawn2 .include "TEXT/DIALOGUE/Chapter03/ThraciaSpawn2.dialogue.txt" ; 9DA92D
      dialogueChapter03EldiganBattleQuote .include "TEXT/DIALOGUE/Chapter03/EldiganBattleQuote.dialogue.txt" ; 9DA98B
      dialogueChapter03LachesisEldiganBattleQuote .include "TEXT/DIALOGUE/Chapter03/LachesisEldiganBattleQuote.dialogue.txt" ; 9DA9CF
      dialogueChapter03PapilioBattleQuote .include "TEXT/DIALOGUE/Chapter03/PapilioBattleQuote.dialogue.txt" ; 9DA9F1
      dialogueChapter03ChagallBattleQuote .include "TEXT/DIALOGUE/Chapter03/ChagallBattleQuote.dialogue.txt" ; 9DAA21
      dialogueChapter03TravantLeave .include "TEXT/DIALOGUE/Chapter03/TravantLeave.dialogue.txt" ; 9DAA70
      dialogueChapter03SylvaleSeized .include "TEXT/DIALOGUE/Chapter03/SylvaleSeized.dialogue.txt" ; 9DAAC9
      dialogueChapter03ClaudTailtiuSpawn .include "TEXT/DIALOGUE/Chapter03/ClaudTailtiuSpawn.dialogue.txt" ; 9DACCF
      dialogueChapter03OrgahilSpawn1 .include "TEXT/DIALOGUE/Chapter03/OrgahilSpawn1.dialogue.txt" ; 9DAF38
      dialogueChapter03OrgahilSpawn2 .include "TEXT/DIALOGUE/Chapter03/OrgahilSpawn2.dialogue.txt" ; 9DB0CA
      dialogueChapter03OrgahilSpawn3 .include "TEXT/DIALOGUE/Chapter03/OrgahilSpawn3.dialogue.txt" ; 9DB142
      dialogueChapter03UnusedEdainBrigidTalk .include "TEXT/DIALOGUE/Chapter03/UnusedEdainBrigidTalk.dialogue.txt" ; 9DB16A - Has one more space and kana instead of one kanji.
      dialogueChapter03PizareBattleQuote .include "TEXT/DIALOGUE/Chapter03/PizareBattleQuote.dialogue.txt" ; 9DB454
      dialogueChapter03Ending1 .include "TEXT/DIALOGUE/Chapter03/Ending1.dialogue.txt" ; 9DB48D
      dialogueChapter03DuvallBattleQuote .include "TEXT/DIALOGUE/Chapter03/DuvallBattleQuote.dialogue.txt" ; 9DB4ED
      dialogueChapter03Ending2 .include "TEXT/DIALOGUE/Chapter03/Ending2.dialogue.txt" ; 9DB514
      dialogueChapter03Ending3 .include "TEXT/DIALOGUE/Chapter03/Ending3.dialogue.txt" ; 9DB5A3
      dialogueChapter03MadinoSeized3 .include "TEXT/DIALOGUE/Chapter03/MadinoSeized3.dialogue.txt" ; 9DB6B8
      dialogueChapter03MadinoSeized4 .include "TEXT/DIALOGUE/Chapter03/MadinoSeized4.dialogue.txt" ; 9DB7E0
      dialogueChapter03Ending4 .include "TEXT/DIALOGUE/Chapter03/Ending4.dialogue.txt" ; 9DB8CF
      dialogueChapter03Ending5 .include "TEXT/DIALOGUE/Chapter03/Ending5.dialogue.txt" ; 9DBA12
      dialogueChapter03VillageWingclipper .include "TEXT/DIALOGUE/Chapter03/VillageWingclipper.dialogue.txt" ; 9DBB4A
      dialogueChapter03VillageRestore .include "TEXT/DIALOGUE/Chapter03/VillageRestore.dialogue.txt" ; 9DBBB8
      dialogueChapter03Village2 .include "TEXT/DIALOGUE/Chapter03/Village2.dialogue.txt" ; 9DBC5C
      dialogueChapter03Village4SylvaleNotSeized .include "TEXT/DIALOGUE/Chapter03/Village4SylvaleNotSeized.dialogue.txt" ; 9DBCB2
      dialogueChapter03Village1 .include "TEXT/DIALOGUE/Chapter03/Village1.dialogue.txt" ; 9DBD1D
      dialogueChapter03Village3 .include "TEXT/DIALOGUE/Chapter03/Village3.dialogue.txt" ; 9DBD81
      dialogueChapter03VillageStrength .include "TEXT/DIALOGUE/Chapter03/VillageStrength.dialogue.txt" ; 9DBE06
      dialogueChapter03VillageDefense .include "TEXT/DIALOGUE/Chapter03/VillageDefense.dialogue.txt" ; 9DBE7E

      .include "EVENTS/Chapter05/EventChapter05Opening.asm"
      .include "EVENTS/Chapter05/EventChapter05SigurdByronTalk.asm"
      .include "EVENTS/Chapter05/EventChapter05AndreyCharge.asm"
      .include "EVENTS/Chapter05/EventChapter05BelhallaConversation.asm"
      .include "EVENTS/Chapter05/EventChapter05LubeckSeized.asm"
      .include "EVENTS/Chapter05/EventChapter05PhinoraSpawn.asm"
      .include "EVENTS/Chapter05/EventChapter05LeonsterSpawn.asm"
      .include "EVENTS/Chapter05/EventChapter05ThraciaSpawn.asm"
      .include "EVENTS/Chapter05/EventChapter05EthlynDied.asm"
      .include "EVENTS/Chapter05/EventChapter05QuanAndEthlynDead.asm"
      .include "EVENTS/Chapter05/EventChapter05PhinoraSeized.asm"
      .include "EVENTS/Chapter05/EventChapter05ReptorCharge.asm"
      .include "EVENTS/Chapter05/EventChapter05AidaBetrayal.asm"
      .include "EVENTS/Chapter05/EventChapter05ReptorBetrayalResponse.asm"
      .include "EVENTS/Chapter05/EventChapter05Ending.asm"
      .include "EVENTS/Chapter05/EventChapter05AnyoneAidaTalk.asm"
      .include "EVENTS/Chapter05/EventChapter05Village1.asm"
      .include "EVENTS/Chapter05/EventChapter05Village2.asm"
      .include "EVENTS/Chapter05/EventChapter05Village3.asm"
      .include "EVENTS/Chapter05/EventChapter05Village4.asm"
      .include "EVENTS/Chapter05/EventChapter05Village5.asm"
      .include "EVENTS/Chapter05/EventChapter05Village6.asm"
      .include "EVENTS/Chapter05/EventChapter05VelthomerSeized.asm"
      .include "EVENTS/Chapter05/EventChapter05Village7.asm"
      .include "EVENTS/Chapter05/EventChapter05ReptorDied.asm"
      .include "EVENTS/Chapter05/EventChapter05ArdenOnCliff.asm"
      .include "EVENTS/Chapter05/EventChapter05_0D7.asm"
      .include "EVENTS/Chapter05/EventChapter05_0D8.asm"

      dialogueEpilogue_Seliph_JuliaDead .include "TEXT/DIALOGUE/Epilogue/Seliph_JuliaDead.dialogue.txt" ; 9DCB04
      dialogueEpilogue_Seliph_JuliaDead_WithLover .include "TEXT/DIALOGUE/Epilogue/Seliph_JuliaDead_WithLover.dialogue.txt" ; 9DCB0F
      dialogueEpilogue_Seliph_JuliaAlive .include "TEXT/DIALOGUE/Epilogue/Seliph_JuliaAlive.dialogue.txt" ; 9DCB1F
      dialogueEpilogue_Seliph_JuliaAlive_WithLover .include "TEXT/DIALOGUE/Epilogue/Seliph_JuliaAlive_WithLover.dialogue.txt" ; 9DCB39
      dialogueEpilogue_Piece_Seliph_Start .include "TEXT/DIALOGUE/Epilogue/Piece_Seliph_Start.dialogue.txt" ; 9DCB49
      dialogueEpilogue_Piece_Seliph_JuliaDead .include "TEXT/DIALOGUE/Epilogue/Piece_Seliph_JuliaDead.dialogue.txt" ; 9DCCF4
      dialogueEpilogue_Piece_Seliph_JuliaDead_WithLover_Unused .include "TEXT/DIALOGUE/Epilogue/Piece_Seliph_JuliaDead_WithLover_Unused.dialogue.txt" ; 9DCE93
      dialogueEpilogue_Piece_Seliph_JuliaAlive .include "TEXT/DIALOGUE/Epilogue/Piece_Seliph_JuliaAlive.dialogue.txt" ; 9DCF22
      dialogueEpilogue_Piece_Seliph_JuliaAlive_WithLover_Unused .include "TEXT/DIALOGUE/Epilogue/Piece_Seliph_JuliaAlive_WithLover_Unused.dialogue.txt" ; 9DD054
      dialogueEpilogue_BelhallaEnd .include "TEXT/DIALOGUE/Epilogue/BelhallaEnd.dialogue.txt" ; 9DD0F8
      dialogueEpilogue_Shannan .include "TEXT/DIALOGUE/Epilogue/Shannan.dialogue.txt" ; 9DD14D
      dialogueEpilogue_Shannan_WithLover .include "TEXT/DIALOGUE/Epilogue/Shannan_WithLover.dialogue.txt" ; 9DD158
      dialogueEpilogue_Piece_Shannan_Start .include "TEXT/DIALOGUE/Epilogue/Piece_Shannan_Start.dialogue.txt" ; 9DD168
      dialogueEpilogue_Piece_Shannan_WithLover_Unused .include "TEXT/DIALOGUE/Epilogue/Piece_Shannan_WithLover_Unused.dialogue.txt" ; 9DD2F5
      dialogueEpilogue_Piece_Shannan_End .include "TEXT/DIALOGUE/Epilogue/Piece_Shannan_End.dialogue.txt" ; 9DD400
      dialogueEpilogue_Scathach_ShannanDead .include "TEXT/DIALOGUE/Epilogue/Scathach_ShannanDead.dialogue.txt" ; 9DD462
      dialogueEpilogue_Scathach_ShannanDead_WithLover .include "TEXT/DIALOGUE/Epilogue/Scathach_ShannanDead_WithLover.dialogue.txt" ; 9DD468
      dialogueEpilogue_Scathach_ShannanAlive .include "TEXT/DIALOGUE/Epilogue/Scathach_ShannanAlive.dialogue.txt" ; 9DD473
      dialogueEpilogue_Scathach_ShannanAlive_WithLover .include "TEXT/DIALOGUE/Epilogue/Scathach_ShannanAlive_WithLover.dialogue.txt" ; 9DD479
      dialogueEpilogue_Piece_Scathach_ShannanDead .include "TEXT/DIALOGUE/Epilogue/Piece_Scathach_ShannanDead.dialogue.txt" ; 9DD484
      dialogueEpilogue_Piece_Scathach_ShannanDead_WithLover_Unused .include "TEXT/DIALOGUE/Epilogue/Piece_Scathach_ShannanDead_WithLover_Unused.dialogue.txt" ; 9DD538
      dialogueEpilogue_Piece_Scathach_ShannanAlive .include "TEXT/DIALOGUE/Epilogue/Piece_Scathach_ShannanAlive.dialogue.txt" ; 9DD5FF
      dialogueEpilogue_Piece_Scathach_ShannanAlive_WithLover_Unused .include "TEXT/DIALOGUE/Epilogue/Piece_Scathach_ShannanAlive_WithLover_Unused.dialogue.txt" ; 9DD6BB
      dialogueEpilogue_Dalvin_ShannanDead .include "TEXT/DIALOGUE/Epilogue/Dalvin_ShannanDead.dialogue.txt" ; 9DD789
      dialogueEpilogue_Dalvin_ShannanDead_WithLover .include "TEXT/DIALOGUE/Epilogue/Dalvin_ShannanDead_WithLover.dialogue.txt" ; 9DD78F
      dialogueEpilogue_Dalvin_ShannanAlive .include "TEXT/DIALOGUE/Epilogue/Dalvin_ShannanAlive.dialogue.txt" ; 9DD79A
      dialogueEpilogue_Dalvin_ShannanAlive_WithLover .include "TEXT/DIALOGUE/Epilogue/Dalvin_ShannanAlive_WithLover.dialogue.txt" ; 9DD7A0
      dialogueEpilogue_Piece_Dalvin_ShannanDead .include "TEXT/DIALOGUE/Epilogue/Piece_Dalvin_ShannanDead.dialogue.txt" ; 9DD7AB
      dialogueEpilogue_Piece_Dalvin_ShannanAlive .include "TEXT/DIALOGUE/Epilogue/Piece_Dalvin_ShannanAlive.dialogue.txt" ; 9DD87E
      dialogueEpilogue_Larcei_ShannanDead .include "TEXT/DIALOGUE/Epilogue/Larcei_ShannanDead.dialogue.txt" ; 9DD92B
      dialogueEpilogue_CreidneLarcei_LoverDead .include "TEXT/DIALOGUE/Epilogue/CreidneLarcei_LoverDead.dialogue.txt" ; 9DD9FC
      dialogueEpilogue_Larcei_ShannanAlive_ScathachDead .include "TEXT/DIALOGUE/Epilogue/Larcei_ShannanAlive_ScathachDead.dialogue.txt" ; 9DDA8C
      dialogueEpilogue_CreidneLarcei_ShannanAlive_BrotherAlive .include "TEXT/DIALOGUE/Epilogue/CreidneLarcei_ShannanAlive_BrotherAlive.dialogue.txt" ; 9DDB14
      dialogueEpilogue_Piece_CreidneLarcei_End .include "TEXT/DIALOGUE/Epilogue/Piece_CreidneLarcei_End.dialogue.txt" ; 9DDB49
      dialogueEpilogue_Creidne_LoverDead .include "TEXT/DIALOGUE/Epilogue/Creidne_LoverDead.dialogue.txt" ; 9DDB77
      dialogueEpilogue_Creidne_ShannanAlive_DalvinDead .include "TEXT/DIALOGUE/Epilogue/Creidne_ShannanAlive_DalvinDead.dialogue.txt" ; 9DDB7D
      dialogueEpilogue_Creidne_ShannanAlive_DalvinAlive .include "TEXT/DIALOGUE/Epilogue/Creidne_ShannanAlive_DalvinAlive.dialogue.txt" ; 9DDC0D
      dialogueEpilogue_Deimne_MuirneDead .include "TEXT/DIALOGUE/Epilogue/Deimne_MuirneDead.dialogue.txt" ; 9DDC13
      dialogueEpilogue_Deimne_MuirneDead_WithLover .include "TEXT/DIALOGUE/Epilogue/Deimne_MuirneDead_WithLover.dialogue.txt" ; 9DDC19
      dialogueEpilogue_Deimne_MuirneAlive .include "TEXT/DIALOGUE/Epilogue/Deimne_MuirneAlive.dialogue.txt" ; 9DDC24
      dialogueEpilogue_Deimne_MuirneAlive_WithLover .include "TEXT/DIALOGUE/Epilogue/Deimne_MuirneAlive_WithLover.dialogue.txt" ; 9DDC2A
      dialogueEpilogue_Piece_Deimne_MuirneDead .include "TEXT/DIALOGUE/Epilogue/Piece_Deimne_MuirneDead.dialogue.txt" ; 9DDC35
      dialogueEpilogue_Piece_Deimne_MuirneDead_WithLover_Unused .include "TEXT/DIALOGUE/Epilogue/Piece_Deimne_MuirneDead_WithLover_Unused.dialogue.txt" ; 9DDCFF
      dialogueEpilogue_Piece_Deimne_MuirneAlive .include "TEXT/DIALOGUE/Epilogue/Piece_Deimne_MuirneAlive.dialogue.txt" ; 9DDDBA
      dialogueEpilogue_Piece_Deimne_MuirneAlive_WithLover_Unused .include "TEXT/DIALOGUE/Epilogue/Piece_Deimne_MuirneAlive_WithLover_Unused.dialogue.txt" ; 9DDE3F
      dialogueEpilogue_Muirne_LoverDead .include "TEXT/DIALOGUE/Epilogue/Muirne_LoverDead.dialogue.txt" ; 9DDEB7
      dialogueEpilogue_Muirne_DeimneDead .include "TEXT/DIALOGUE/Epilogue/Muirne_DeimneDead.dialogue.txt" ; 9DDF52
      dialogueEpilogue_Muirne_DeimneAlive .include "TEXT/DIALOGUE/Epilogue/Muirne_DeimneAlive.dialogue.txt" ; 9DDFD3

      dialogueEpilogue_IsaachEnd_Multiple .include "TEXT/DIALOGUE/Epilogue/IsaachEnd_Multiple.dialogue.txt" ; 9DE067
      dialogueEpilogue_IsaachEnd_Solo .include "TEXT/DIALOGUE/Epilogue/IsaachEnd_Solo.dialogue.txt" ; 9DE07E
      dialogueEpilogue_Piece_IsaachEnd_Start .include "TEXT/DIALOGUE/Epilogue/Piece_IsaachEnd_Start.dialogue.txt" ; 9DE089
      dialogueEpilogue_Piece_IsaachEnd_End .include "TEXT/DIALOGUE/Epilogue/Piece_IsaachEnd_End.dialogue.txt" ; 9DE0A4

      dialogueEpilogue_Piece_Region_Start .include "TEXT/DIALOGUE/Epilogue/Piece_Region_Start.dialogue.txt" ; 9DE0B3

      dialogueEpilogue_Leif_AltenaDead .include "TEXT/DIALOGUE/Epilogue/Leif_AltenaDead.dialogue.txt" ; 9DE0BB
      dialogueEpilogue_Leif_AltenaDead_WithLover .include "TEXT/DIALOGUE/Epilogue/Leif_AltenaDead_WithLover.dialogue.txt" ; 9DE0E4
      dialogueEpilogue_Leif_AltenaAlive .include "TEXT/DIALOGUE/Epilogue/Leif_AltenaAlive.dialogue.txt" ; 9DE112
      dialogueEpilogue_Leif_AltenaAlive_WithLover .include "TEXT/DIALOGUE/Epilogue/Leif_AltenaAlive_WithLover.dialogue.txt" ; 9DE138
      dialogueEpilogue_Piece_Leif_Start .include "TEXT/DIALOGUE/Epilogue/Piece_Leif_Start.dialogue.txt" ; 9DE163
      dialogueEpilogue_Piece_Leif_End .include "TEXT/DIALOGUE/Epilogue/Piece_Leif_End.dialogue.txt" ; 9DE1C5
      dialogueEpilogue_Piece_Leif_WithLover_Unused .include "TEXT/DIALOGUE/Epilogue/Piece_Leif_WithLover_Unused.dialogue.txt" ; 9DE2C5
      dialogueEpilogue_Altena_LeifDead_ArionDead .include "TEXT/DIALOGUE/Epilogue/Altena_LeifDead_ArionDead.dialogue.txt" ; 9DE34F
      dialogueEpilogue_Altena_LeifDead_ArionAlive .include "TEXT/DIALOGUE/Epilogue/Altena_LeifDead_ArionAlive.dialogue.txt" ; 9DE386
      dialogueEpilogue_Altena_LeifAlive_ArionDead .include "TEXT/DIALOGUE/Epilogue/Altena_LeifAlive_ArionDead.dialogue.txt" ; 9DE391
      dialogueEpilogue_Altena_LeifAlive_ArionAlive .include "TEXT/DIALOGUE/Epilogue/Altena_LeifAlive_ArionAlive.dialogue.txt" ; 9DE3EE
      dialogueEpilogue_Piece_Altena_LeifDead .include "TEXT/DIALOGUE/Epilogue/Piece_Altena_LeifDead.dialogue.txt" ; 9DE3F9
      dialogueEpilogue_Piece_Altena_ArionAlive .include "TEXT/DIALOGUE/Epilogue/Piece_Altena_ArionAlive.dialogue.txt" ; 9DE4FF
      dialogueEpilogue_Piece_Altena_LeifAlive .include "TEXT/DIALOGUE/Epilogue/Piece_Altena_LeifAlive.dialogue.txt" ; 9DE547
      dialogueEpilogue_Finn_LeifDead .include "TEXT/DIALOGUE/Epilogue/Finn_LeifDead.dialogue.txt" ; 9DE5D5
      dialogueEpilogue_Finn_LeifAlive .include "TEXT/DIALOGUE/Epilogue/Finn_LeifAlive.dialogue.txt" ; 9DE6D0
      dialogueEpilogue_Piece_Finn .include "TEXT/DIALOGUE/Epilogue/Piece_Finn.dialogue.txt" ; 9DE786
      dialogueEpilogue_Hannibal_CharlotDead .include "TEXT/DIALOGUE/Epilogue/Hannibal_CharlotDead.dialogue.txt" ; 9DE812
      dialogueEpilogue_Hannibal_CharlotAlive .include "TEXT/DIALOGUE/Epilogue/Hannibal_CharlotAlive.dialogue.txt" ; 9DE823
      dialogueEpilogue_Hannibal_CoirpreDead .include "TEXT/DIALOGUE/Epilogue/Hannibal_CoirpreDead.dialogue.txt" ; 9DE82E
      dialogueEpilogue_Hannibal_CoirpreAlive .include "TEXT/DIALOGUE/Epilogue/Hannibal_CoirpreAlive.dialogue.txt" ; 9DE83E
      dialogueEpilogue_Piece_Hannibal_Start .include "TEXT/DIALOGUE/Epilogue/Piece_Hannibal_Start.dialogue.txt" ; 9DE849
      dialogueEpilogue_Piece_Hannibal_CharlotCoirpreDead .include "TEXT/DIALOGUE/Epilogue/Piece_Hannibal_CharlotCoirpreDead.dialogue.txt" ; 9DE897
      dialogueEpilogue_Piece_Hannibal_CharlotCoirpreAlive .include "TEXT/DIALOGUE/Epilogue/Piece_Hannibal_CharlotCoirpreAlive.dialogue.txt" ; 9DE8F8
      dialogueEpilogue_CharlotCoirpre_HannibalDead .include "TEXT/DIALOGUE/Epilogue/CharlotCoirpre_HannibalDead.dialogue.txt" ; 9DE960
      dialogueEpilogue_CharlotCoirpre_HannibalDead_WithLover .include "TEXT/DIALOGUE/Epilogue/CharlotCoirpre_HannibalDead_WithLover.dialogue.txt" ; 9DE966
      dialogueEpilogue_CharlotCoirpre_HannibalAlive .include "TEXT/DIALOGUE/Epilogue/CharlotCoirpre_HannibalAlive.dialogue.txt" ; 9DE971
      dialogueEpilogue_CharlotCoirpre_HannibalAlive_WithLover .include "TEXT/DIALOGUE/Epilogue/CharlotCoirpre_HannibalAlive_WithLover.dialogue.txt" ; 9DE977
      dialogueEpilogue_Piece_CharlotCoirpre_HannibalDead .include "TEXT/DIALOGUE/Epilogue/Piece_CharlotCoirpre_HannibalDead.dialogue.txt" ; 9DE982
      dialogueEpilogue_Piece_CharlotCoirpre_HannibalAlive .include "TEXT/DIALOGUE/Epilogue/Piece_CharlotCoirpre_HannibalAlive.dialogue.txt" ; 9DEA83
      dialogueEpilogue_Asaello_DaisyDead .include "TEXT/DIALOGUE/Epilogue/Asaello_DaisyDead.dialogue.txt" ; 9DEB28
      dialogueEpilogue_Asaello_DaisyDead_WithLover .include "TEXT/DIALOGUE/Epilogue/Asaello_DaisyDead_WithLover.dialogue.txt" ; 9DEB2E
      dialogueEpilogue_Asaello_DaisyAlive .include "TEXT/DIALOGUE/Epilogue/Asaello_DaisyAlive.dialogue.txt" ; 9DEB39
      dialogueEpilogue_Asaello_DaisyAlive_WithLover .include "TEXT/DIALOGUE/Epilogue/Asaello_DaisyAlive_WithLover.dialogue.txt" ; 9DEB3F
      dialogueEpilogue_Piece_Asaello_Start .include "TEXT/DIALOGUE/Epilogue/Piece_Asaello_Start.dialogue.txt" ; 9DEB4A
      dialogueEpilogue_Piece_Asaello_DaisyDead .include "TEXT/DIALOGUE/Epilogue/Piece_Asaello_DaisyDead.dialogue.txt" ; 9DEBCE
      dialogueEpilogue_Piece_Asaello_DaisyDead_WithLover_Unused .include "TEXT/DIALOGUE/Epilogue/Piece_Asaello_DaisyDead_WithLover_Unused.dialogue.txt" ; 9DEC4F
      dialogueEpilogue_Piece_Asaello_DaisyAlive .include "TEXT/DIALOGUE/Epilogue/Piece_Asaello_DaisyAlive.dialogue.txt" ; 9DEC7D
      dialogueEpilogue_Daisy_LoverDead .include "TEXT/DIALOGUE/Epilogue/Daisy_LoverDead.dialogue.txt" ; 9DECDB
      dialogueEpilogue_Daisy_AsaelloDead .include "TEXT/DIALOGUE/Epilogue/Daisy_AsaelloDead.dialogue.txt" ; 9DECE1
      dialogueEpilogue_Daisy_AsaelloAlive .include "TEXT/DIALOGUE/Epilogue/Daisy_AsaelloAlive.dialogue.txt" ; 9DED32
      dialogueEpilogue_Piece_DaisyPatty_LoverDead .include "TEXT/DIALOGUE/Epilogue/Piece_DaisyPatty_LoverDead.dialogue.txt" ; 9DED84
      dialogueEpilogue_Piece_Daisy_End .include "TEXT/DIALOGUE/Epilogue/Piece_Daisy_End.dialogue.txt" ; 9DEEAB

      dialogueEpilogue_NewThraciaEnd_Multiple .include "TEXT/DIALOGUE/Epilogue/NewThraciaEnd_Multiple.dialogue.txt" ; 9DEF37
      dialogueEpilogue_NewThraciaEnd_Solo .include "TEXT/DIALOGUE/Epilogue/NewThraciaEnd_Solo.dialogue.txt" ; 9DEF6E
      dialogueEpilogue_Piece_NewThraciaEnd_End .include "TEXT/DIALOGUE/Epilogue/Piece_NewThraciaEnd_End.dialogue.txt" ; 9DEF8F

      dialogueEpilogueLover_Seliph_JuliaDead_Peppy .include "TEXT/DIALOGUE/Epilogue/Lover_Seliph_JuliaDead_Peppy.dialogue.txt" ; 9DEFB6
      dialogueEpilogueLover_Seliph_JuliaDead_Noble .include "TEXT/DIALOGUE/Epilogue/Lover_Seliph_JuliaDead_Noble.dialogue.txt" ; 9DF042
      dialogueEpilogueLover_Seliph_JuliaAlive_All .include "TEXT/DIALOGUE/Epilogue/Lover_Seliph_JuliaAlive_All.dialogue.txt" ; 9DF0D0
      dialogueEpilogueLover_Shannan_Peppy .include "TEXT/DIALOGUE/Epilogue/Lover_Shannan_Peppy.dialogue.txt" ; 9DF173
      dialogueEpilogueLover_Shannan_Noble .include "TEXT/DIALOGUE/Epilogue/Lover_Shannan_Noble.dialogue.txt" ; 9DF27E
      dialogueEpilogueLover_DalvinScathach_ShannanDead_Peppy .include "TEXT/DIALOGUE/Epilogue/Lover_DalvinScathach_ShannanDead_Peppy.dialogue.txt" ; 9DF38D
      dialogueEpilogueLover_DalvinScathach_ShannanDead_Noble .include "TEXT/DIALOGUE/Epilogue/Lover_DalvinScathach_ShannanDead_Noble.dialogue.txt" ; 9DF448
      dialogueEpilogueLover_DalvinScathach_ShannanDead_JeanneNanna .include "TEXT/DIALOGUE/Epilogue/Lover_DalvinScathach_ShannanDead_JeanneNanna.dialogue.txt" ; 9DF4FF
      dialogueEpilogueLover_DalvinScathach_ShannanAlive_All .include "TEXT/DIALOGUE/Epilogue/Lover_DalvinScathach_ShannanAlive_All.dialogue.txt" ; 9DF5B7
      dialogueEpilogueLover_DalvinScathach_ShannanAlive_MuirneLana .include "TEXT/DIALOGUE/Epilogue/Lover_DalvinScathach_ShannanAlive_MuirneLana.dialogue.txt" ; 9DF685
      dialogueEpilogueLover_Deimne_MuirneDead_Peppy .include "TEXT/DIALOGUE/Epilogue/Lover_Deimne_MuirneDead_Peppy.dialogue.txt" ; 9DF737
      dialogueEpilogueLover_Deimne_MuirneDead_Noble .include "TEXT/DIALOGUE/Epilogue/Lover_Deimne_MuirneDead_Noble.dialogue.txt" ; 9DF7EA
      dialogueEpilogueLover_Deimne_MuirneDead_CreidneLarcei .include "TEXT/DIALOGUE/Epilogue/Lover_Deimne_MuirneDead_CreidneLarcei.dialogue.txt" ; 9DF89F
      dialogueEpilogueLover_Deimne_MuirneAlive_All .include "TEXT/DIALOGUE/Epilogue/Lover_Deimne_MuirneAlive_All.dialogue.txt" ; 9DF966
      dialogueEpilogueLover_Deimne_MuirneAlive_LindaTine .include "TEXT/DIALOGUE/Epilogue/Lover_Deimne_MuirneAlive_LindaTine.dialogue.txt" ; 9DF9FC
      dialogueEpilogueLover_Deimne_MuirneAlive_CreidneLarcei .include "TEXT/DIALOGUE/Epilogue/Lover_Deimne_MuirneAlive_CreidneLarcei.dialogue.txt" ; 9DFA95
      dialogueEpilogueLover_Leif_Peppy .include "TEXT/DIALOGUE/Epilogue/Lover_Leif_Peppy.dialogue.txt" ; 9DFB4E
      dialogueEpilogueLover_Leif_AltenaDead_CreidneLarcei .include "TEXT/DIALOGUE/Epilogue/Lover_Leif_AltenaDead_CreidneLarcei.dialogue.txt" ; 9DFBE3
      dialogueEpilogueLover_Leif_AltenaAlive_CreidneLarcei .include "TEXT/DIALOGUE/Epilogue/Lover_Leif_AltenaAlive_CreidneLarcei.dialogue.txt" ; 9DFC84
      dialogueEpilogueLover_Leif_Noble .include "TEXT/DIALOGUE/Epilogue/Lover_Leif_Noble.dialogue.txt" ; 9DFD1A
      dialogueEpilogueLover_CharlotCoirpre_HannibalDead_Peppy .include "TEXT/DIALOGUE/Epilogue/Lover_CharlotCoirpre_HannibalDead_Peppy.dialogue.txt" ; 9DFDA4
      dialogueEpilogueLover_CharlotCoirpre_HannibalDead_CreidneLarcei .include "TEXT/DIALOGUE/Epilogue/Lover_CharlotCoirpre_HannibalDead_CreidneLarcei.dialogue.txt" ; 9DFE4A
      dialogueEpilogueLover_CharlotCoirpre_HannibalDead_Noble .include "TEXT/DIALOGUE/Epilogue/Lover_CharlotCoirpre_HannibalDead_Noble.dialogue.txt" ; 9DFED4

      .fill $9D8000 + $8000 - *, 0

    .here

    * = $2E8000
    .logical $AE8000

      dialogueChapterPrologueEthlynSigurdTalk .include "TEXT/DIALOGUE/ChapterPrologue/EthlynSigurdTalk.dialogue.txt" ; AE8272
      dialogueChapterPrologueAzelleSigurdTalk .include "TEXT/DIALOGUE/ChapterPrologue/AzelleSigurdTalk.dialogue.txt" ; AE8272
      dialogueChapterPrologueLexSigurdTalk .include "TEXT/DIALOGUE/ChapterPrologue/LexSigurdTalk.dialogue.txt" ; AE/84B7
      dialogueChapterPrologueUnusedAlecEthlynTalk .include "TEXT/DIALOGUE/ChapterPrologue/UnusedAlecEthlynTalk.dialogue.txt" ; AE/865F
      dialogueChapterPrologueQuanSigurdTalk .include "TEXT/DIALOGUE/ChapterPrologue/QuanSigurdTalk.dialogue.txt" ; AE/87E0
      dialogueChapterPrologueUnusedQuanSigurdTalkExpanded .include "TEXT/DIALOGUE/ChapterPrologue/UnusedQuanSigurdTalkExpanded.dialogue.txt" ; AE/8A14
      dialogueChapterPrologueUnusedMidirAzelleTalk .include "TEXT/DIALOGUE/ChapterPrologue/UnusedMidirAzelleTalk.dialogue.txt" ; AE/8AAB
      dialogueChapterPrologueUnusedNaoiseAlecTalk .include "TEXT/DIALOGUE/ChapterPrologue/UnusedNaoiseAlecTalk.dialogue.txt" ; AE/8BC8
      
      dialogueChapter01QuanFinnTalk .include "TEXT/DIALOGUE/Chapter01/QuanFinnTalk.dialogue.txt" ; AE8D28
      dialogueChapter01MidirEdainTalk .include "TEXT/DIALOGUE/Chapter01/MidirEdainTalk.dialogue.txt" ; AE8E25
      dialogueChapter01SigurdEdainTalk .include "TEXT/DIALOGUE/Chapter01/SigurdEdainTalk.dialogue.txt" ; AE8F3C
      dialogueChapter01AzelleEdainTalk .include "TEXT/DIALOGUE/Chapter01/AzelleEdainTalk.dialogue.txt" ; AE9169
      dialogueChapter01EdainEthlynTalk .include "TEXT/DIALOGUE/Chapter01/EdainEthlynTalk.dialogue.txt" ; AE92B8
      dialogueChapter01DewEdainTalk .include "TEXT/DIALOGUE/Chapter01/DewEdainTalk.dialogue.txt" ; AE938F
      dialogueChapter01AyraQuanTalk .include "TEXT/DIALOGUE/Chapter01/AyraQuanTalk.dialogue.txt" ; AE9488
      
      dialogueChapter02DewLachesisTalk .include "TEXT/DIALOGUE/Chapter02/DewLachesisTalk.dialogue.txt" ; AE98F4
      dialogueChapter02DeirdreEthlynTalk .include "TEXT/DIALOGUE/Chapter02/DeirdreEthlynTalk.dialogue.txt" ; AE9A14
      dialogueChapter02QuanFinnTalk .include "TEXT/DIALOGUE/Chapter02/QuanFinnTalk.dialogue.txt" ; AE9B71
      dialogueChapter02SigurdLewynTalk .include "TEXT/DIALOGUE/Chapter02/SigurdLewynTalk.dialogue.txt" ; AE9C8C
      dialogueChapter02BeowulfLachesisTalk .include "TEXT/DIALOGUE/Chapter02/BeowulfLachesisTalk.dialogue.txt" ; AE9F70
      dialogueChapter02AlecSilviaTalk .include "TEXT/DIALOGUE/Chapter02/AlecSilviaTalk.dialogue.txt" ; AEA173
      dialogueChapter02SilviaSigurdTalk .include "TEXT/DIALOGUE/Chapter02/SilviaSigurdTalk.dialogue.txt" ; AEA297
      dialogueChapter02ErinysSigurdTalk .include "TEXT/DIALOGUE/Chapter02/ErinysSigurdTalk.dialogue.txt" ; AEA3FA

      dialogueChapter03LexAyraTalk .include "TEXT/DIALOGUE/Chapter03/LexAyraTalk.dialogue.txt" ; AEA5C2
      dialogueChapter03ChulainnAyraTalk .include "TEXT/DIALOGUE/Chapter03/ChulainnAyraTalk.dialogue.txt" ; AEA74A
      dialogueChapter03SigurdBrigidTalk .include "TEXT/DIALOGUE/Chapter03/SigurdBrigidTalk.dialogue.txt" ; AEA838
      dialogueChapter03ClaudSigurdTalk .include "TEXT/DIALOGUE/Chapter03/ClaudSigurdTalk.dialogue.txt" ; AEA99E
      dialogueChapter03MidirBrigidTalk .include "TEXT/DIALOGUE/Chapter03/MidirBrigidTalk.dialogue.txt" ; AEACEC
      dialogueChapter03EthlynQuanTalk .include "TEXT/DIALOGUE/Chapter03/EthlynQuanTalk.dialogue.txt" ; AEAE09
      dialogueChapter03EdainBrigidTalk .include "TEXT/DIALOGUE/Chapter03/EdainBrigidTalk.dialogue.txt" ; AEB0D3

      dialogueChapter04SigurdClaudTalk .include "TEXT/DIALOGUE/Chapter04/SigurdClaudTalk.dialogue.txt" ; AEB3BD
      dialogueChapter04TailtiuAzelleTalk .include "TEXT/DIALOGUE/Chapter04/TailtiuAzelleTalk.dialogue.txt" ; AEB568
      dialogueChapter04EdainJamkeTalk .include "TEXT/DIALOGUE/Chapter04/EdainJamkeTalk.dialogue.txt" ; AEB7AD
      dialogueChapter04EdainMidirTalk .include "TEXT/DIALOGUE/Chapter04/EdainMidirTalk.dialogue.txt" ; AEB8A6
      dialogueChapter04EdainAzelleTalk .include "TEXT/DIALOGUE/Chapter04/EdainAzelleTalk.dialogue.txt" ; AEB9F0
      dialogueChapter04SilviaClaudTalk .include "TEXT/DIALOGUE/Chapter04/SilviaClaudTalk.dialogue.txt" ; AEBBFB
      dialogueChapter04LewynSigurdTalk .include "TEXT/DIALOGUE/Chapter04/LewynSigurdTalk.dialogue.txt" ; AEBF7F
      dialogueChapter04ErinysLewynTalk .include "TEXT/DIALOGUE/Chapter04/ErinysLewynTalk.dialogue.txt" ; AEC0F6
 
      dialogueChapter05EdainBrigidTalk .include "TEXT/DIALOGUE/Chapter05/EdainBrigidTalk.dialogue.txt" ; AEC1E7
      dialogueChapter05ClaudEdainTalk .include "TEXT/DIALOGUE/Chapter05/ClaudEdainTalk.dialogue.txt" ; AEC32E
      dialogueChapter05DewJamkeTalk .include "TEXT/DIALOGUE/Chapter05/DewJamkeTalk.dialogue.txt" ; AEC66C
      dialogueChapter05AlecNaoiseTalk .include "TEXT/DIALOGUE/Chapter05/AlecNaoiseTalk.dialogue.txt" ; AEC7D6
      dialogueChapter05LexAzelleTalk .include "TEXT/DIALOGUE/Chapter05/LexAzelleTalk.dialogue.txt" ; AEC858
      dialogueChapter05SigurdAyraTalk .include "TEXT/DIALOGUE/Chapter05/SigurdAyraTalk.dialogue.txt" ; AECA23
      dialogueChapter05TailtiuAzelleTalk .include "TEXT/DIALOGUE/Chapter05/TailtiuAzelleTalk.dialogue.txt" ; AECB70
      dialogueChapter05TailtiuClaudTalk .include "TEXT/DIALOGUE/Chapter05/TailtiuClaudTalk.dialogue.txt" ; AECC71
      dialogueChapter05TailtiuLexTalk .include "TEXT/DIALOGUE/Chapter05/TailtiuLexTalk.dialogue.txt" ; AECD78
      dialogueChapter05ErinysLewynTalk .include "TEXT/DIALOGUE/Chapter05/ErinysLewynTalk.dialogue.txt" ; AECEAD
      dialogueChapter05ErinysArdenTalk .include "TEXT/DIALOGUE/Chapter05/ErinysArdenTalk.dialogue.txt" ; AECFF4
      dialogueChapter05ErinysNaoiseTalk .include "TEXT/DIALOGUE/Chapter05/ErinysNaoiseTalk.dialogue.txt" ; AED100
      dialogueChapter05SilviaClaudTalk .include "TEXT/DIALOGUE/Chapter05/SilviaClaudTalk.dialogue.txt" ; AED1F8
      dialogueChapter05SilviaLewynTalk .include "TEXT/DIALOGUE/Chapter05/SilviaLewynTalk.dialogue.txt" ; AED2ED
      dialogueChapter05SilviaAlecTalk .include "TEXT/DIALOGUE/Chapter05/SilviaAlecTalk.dialogue.txt" ; AED3BA
      dialogueChapter05LachesisBeowulfTalk .include "TEXT/DIALOGUE/Chapter05/LachesisBeowulfTalk.dialogue.txt" ; AED4E4
      dialogueChapter05LachesisNaoiseTalk .include "TEXT/DIALOGUE/Chapter05/LachesisNaoiseTalk.dialogue.txt" ; AED611
      dialogueChapter05LachesisDewTalk .include "TEXT/DIALOGUE/Chapter05/LachesisDewTalk.dialogue.txt" ; AED799
      dialogueChapter05AyraLexTalk .include "TEXT/DIALOGUE/Chapter05/AyraLexTalk.dialogue.txt" ; AED8CA
      dialogueChapter05AyraChulainnTalk .include "TEXT/DIALOGUE/Chapter05/AyraChulainnTalk.dialogue.txt" ; AEDA62
      dialogueChapter05AyraArdenTalk .include "TEXT/DIALOGUE/Chapter05/AyraArdenTalk.dialogue.txt" ; AEDB64
      dialogueChapter05BrigidAlecTalk .include "TEXT/DIALOGUE/Chapter05/BrigidAlecTalk.dialogue.txt" ; AEDC86
      dialogueChapter05BrigidJamkeTalk .include "TEXT/DIALOGUE/Chapter05/BrigidJamkeTalk.dialogue.txt" ; AEDDC9
      dialogueChapter05BrigidMidirTalk .include "TEXT/DIALOGUE/Chapter05/BrigidMidirTalk.dialogue.txt" ; AEDF1E

      dialogueChapter06OifeySeliphTalk .include "TEXT/DIALOGUE/Chapter06/OifeySeliphTalk.dialogue.txt" ; AEE07D
      dialogueChapter06LesterLanaTalk .include "TEXT/DIALOGUE/Chapter06/LesterLanaTalk.dialogue.txt" ; AEE2C2
      dialogueChapter06FeeSeliphTalk .include "TEXT/DIALOGUE/Chapter06/FeeSeliphTalk.dialogue.txt" ; AEE472
      dialogueChapter06LanaJuliaTalk .include "TEXT/DIALOGUE/Chapter06/LanaJuliaTalk.dialogue.txt" ; AEE626
      dialogueChapter06ScathachLarceiTalk .include "TEXT/DIALOGUE/Chapter06/ScathachLarceiTalk.dialogue.txt" ; AEE76F
      dialogueChapter06ArthurSeliphTalk .include "TEXT/DIALOGUE/Chapter06/ArthurSeliphTalk.dialogue.txt" ; AEE93A
      dialogueChapter06DeimneMuirneTalk .include "TEXT/DIALOGUE/Chapter06/DeimneMuirneTalk.dialogue.txt" ; AEEA90
      dialogueChapter06DalvinCreidneTalk .include "TEXT/DIALOGUE/Chapter06/DalvinCreidneTalk.dialogue.txt" ; AEEC0D
      dialogueChapter06SeliphLanaTalk .include "TEXT/DIALOGUE/Chapter06/SeliphLanaTalk.dialogue.txt" ; AEED93
      dialogueChapter06JuliaSeliphTalkIsaachSeized .include "TEXT/DIALOGUE/Chapter06/JuliaSeliphTalkIsaachSeized.dialogue.txt" ; AEEE3D
      dialogueChapter06JuliaSeliphTalkSofalaSeized .include "TEXT/DIALOGUE/Chapter06/JuliaSeliphTalkSofalaSeized.dialogue.txt" ; AEEF0E

      dialogueChapter07ShannanPattyTalk .include "TEXT/DIALOGUE/Chapter07/ShannanPattyTalk.dialogue.txt" ; AEEFCC
      dialogueChapter07SeliphShannanTalk .include "TEXT/DIALOGUE/Chapter07/SeliphShannanTalk.dialogue.txt" ; AEF22F
      dialogueChapter07OifeyDiarmuidTalk .include "TEXT/DIALOGUE/Chapter07/OifeyDiarmuidTalk.dialogue.txt" ; AEF36C
      dialogueChapter07LarceiShannanTalk .include "TEXT/DIALOGUE/Chapter07/LarceiShannanTalk.dialogue.txt" ; AEF452
      dialogueChapter07PattySeliphTalk .include "TEXT/DIALOGUE/Chapter07/PattySeliphTalk.dialogue.txt" ; AEF550
      dialogueChapter07AresSeliphTalk .include "TEXT/DIALOGUE/Chapter07/AresSeliphTalk.dialogue.txt" ; AEF7E0

      .fill $AE8000 + $8000 - *, 0

    .here

    * = $2F8000
    .logical $AF8000

      dialogueChapter09SeliphHannibalTalk .include "TEXT/DIALOGUE/Chapter09/SeliphHannibalTalk.dialogue.txt" ; AF8000
      dialogueChapter09LeneCoirpreTalk .include "TEXT/DIALOGUE/Chapter09/LeneCoirpreTalk.dialogue.txt" ; AF818B
      dialogueChapter09FinnAltenaTalk .include "TEXT/DIALOGUE/Chapter09/FinnAltenaTalk.dialogue.txt" ; AF8379
      dialogueChapter09HannibalAltenaTalk .include "TEXT/DIALOGUE/Chapter09/HannibalAltenaTalk.dialogue.txt" ; AF853B
      dialogueChapter09PattyCoirpreTalk .include "TEXT/DIALOGUE/Chapter09/PattyCoirpreTalk.dialogue.txt" ; AF86DF
      dialogueChapter09JuliaSeliphTalk .include "TEXT/DIALOGUE/Chapter09/JuliaSeliphTalk.dialogue.txt" ; AF879F

      dialogueChapter10LeifAltenaTalk .include "TEXT/DIALOGUE/Chapter10/LeifAltenaTalk.dialogue.txt" ; AF8AF2
      dialogueChapter10ShannanSeliphTalk .include "TEXT/DIALOGUE/Chapter10/ShannanSeliphTalk.dialogue.txt" ; AF8DA4
      dialogueChapter10OifeySeliphTalk .include "TEXT/DIALOGUE/Chapter10/OifeySeliphTalk.dialogue.txt" ; AF8EE2
      dialogueChapter10CoirpreAltenaTalk .include "TEXT/DIALOGUE/Chapter10/CoirpreAltenaTalk.dialogue.txt" ; AF9321
      dialogueChapter10LesterPattyTalk .include "TEXT/DIALOGUE/Chapter10/LesterPattyTalk.dialogue.txt" ; AF955C
      dialogueChapter10NannaLeifTalk .include "TEXT/DIALOGUE/Chapter10/NannaLeifTalk.dialogue.txt" ; AF96BF
      dialogueChapter10FebailLanaTalk .include "TEXT/DIALOGUE/Chapter10/FebailLanaTalk.dialogue.txt" ; AF98F8
      dialogueChapter10SeliphLeneTalk .include "TEXT/DIALOGUE/Chapter10/SeliphLeneTalk.dialogue.txt" ; AF9ABD
      dialogueChapter10SeliphFeeTalk .include "TEXT/DIALOGUE/Chapter10/SeliphFeeTalk.dialogue.txt" ; AF9CF4
      dialogueChapter10SeliphTineTalk .include "TEXT/DIALOGUE/Chapter10/SeliphTineTalk.dialogue.txt" ; AF9F99

      dialogueChapterFinalTineSeliphTalk .include "TEXT/DIALOGUE/ChapterFinal/TineSeliphTalk.dialogue.txt" ; AFA258
      dialogueChapterFinalTineCedTalk .include "TEXT/DIALOGUE/ChapterFinal/TineCedTalk.dialogue.txt" ; AFA38E
      dialogueChapterFinalTineLeifTalk .include "TEXT/DIALOGUE/ChapterFinal/TineLeifTalk.dialogue.txt" ; AFA4AD
      dialogueChapterFinalDaisyDeimneTalk .include "TEXT/DIALOGUE/ChapterFinal/DaisyDeimneTalk.dialogue.txt" ; AFA5E7
      dialogueChapterFinalJeanneLeifTalk .include "TEXT/DIALOGUE/ChapterFinal/JeanneLeifTalk.dialogue.txt" ; AFA6DA
      dialogueChapterFinalMuirneAsaelloTalk .include "TEXT/DIALOGUE/ChapterFinal/MuirneAsaelloTalk.dialogue.txt" ; AFA7F9
      dialogueChapterFinalLanaSeliphTalk .include "TEXT/DIALOGUE/ChapterFinal/LanaSeliphTalk.dialogue.txt" ; AFA97A
      dialogueChapterFinalLanaFebailTalk .include "TEXT/DIALOGUE/ChapterFinal/LanaFebailTalk.dialogue.txt" ; AFAAEC
      dialogueChapterFinalLanaScathachTalk .include "TEXT/DIALOGUE/ChapterFinal/LanaScathachTalk.dialogue.txt" ; AFAB91
      dialogueChapterFinalLarceiSeliphTalk .include "TEXT/DIALOGUE/ChapterFinal/LarceiSeliphTalk.dialogue.txt" ; AFAC38
      dialogueChapterFinalLarceiIucharTalk .include "TEXT/DIALOGUE/ChapterFinal/LarceiIucharTalk.dialogue.txt" ; AFAD11
      dialogueChapterFinalLarceiIucharbaTalk .include "TEXT/DIALOGUE/ChapterFinal/LarceiIucharbaTalk.dialogue.txt" ; AFADF0
      dialogueChapterFinalLarceiShannanTalk .include "TEXT/DIALOGUE/ChapterFinal/LarceiShannanTalk.dialogue.txt" ; AFAF23
      dialogueChapterFinalPattySeliphTalk .include "TEXT/DIALOGUE/ChapterFinal/PattySeliphTalk.dialogue.txt" ; AFB03E
      dialogueChapterFinalPattyShannanTalk .include "TEXT/DIALOGUE/ChapterFinal/PattyShannanTalk.dialogue.txt" ; AFB119
      dialogueChapterFinalPattyLesterTalk .include "TEXT/DIALOGUE/ChapterFinal/PattyLesterTalk.dialogue.txt" ; AFB28A
      dialogueChapterFinalNannaSeliphTalk .include "TEXT/DIALOGUE/ChapterFinal/NannaSeliphTalk.dialogue.txt" ; AFB326
      dialogueChapterFinalNannaAresTalk .include "TEXT/DIALOGUE/ChapterFinal/NannaAresTalk.dialogue.txt" ; AFB437
      dialogueChapterFinalNannaLeifTalk .include "TEXT/DIALOGUE/ChapterFinal/NannaLeifTalk.dialogue.txt" ; AFB5F6
      dialogueChapterFinalFeeSeliphTalk .include "TEXT/DIALOGUE/ChapterFinal/FeeSeliphTalk.dialogue.txt" ; AFB719
      dialogueChapterFinalFeeArthurTalk .include "TEXT/DIALOGUE/ChapterFinal/FeeArthurTalk.dialogue.txt" ; AFB8A4
      dialogueChapterFinalFeeOifeyTalk .include "TEXT/DIALOGUE/ChapterFinal/FeeOifeyTalk.dialogue.txt" ; AFB9FC
      dialogueChapter09AsaelloDaisyTalk .include "TEXT/DIALOGUE/Chapter09/AsaelloDaisyTalk.dialogue.txt" ; AFBC4C
      dialogueChapterFinalArthurTineTalk .include "TEXT/DIALOGUE/ChapterFinal/ArthurTineTalk.dialogue.txt" ; AFBDB1
      dialogueChapterFinalAmidLindaTalk .include "TEXT/DIALOGUE/ChapterFinal/AmidLindaTalk.dialogue.txt" ; AFBF2E
      dialogueChapter09LayleaCharlotTalk .include "TEXT/DIALOGUE/Chapter09/LayleaCharlotTalk.dialogue.txt" ; AFC07C
      dialogueChapter06HerminaSeliphTalk .include "TEXT/DIALOGUE/Chapter06/HerminaSeliphTalk.dialogue.txt" ; AFC12D

      ; afc293

    .here

    * = $308000
    .logical $B08000

      .dsection Chapter10EventsSection
      .dsection Chapter10EventDataSection

      dialogueChapter05Opening1 .include "TEXT/DIALOGUE/Chapter05/Opening1.dialogue.txt" ; B084C7
      dialogueChapter05Opening2 .include "TEXT/DIALOGUE/Chapter05/Opening2.dialogue.txt" ; B0850C
      dialogueChapter05Opening3 .include "TEXT/DIALOGUE/Chapter05/Opening3.dialogue.txt" ; B086C4
      dialogueChapter05Opening4 .include "TEXT/DIALOGUE/Chapter05/Opening4.dialogue.txt" ; B087C1
      dialogueChapter05Opening5 .include "TEXT/DIALOGUE/Chapter05/Opening5.dialogue.txt" ; B0880F
      dialogueChapter05SigurdByronTalk .include "TEXT/DIALOGUE/Chapter05/SigurdByronTalk.dialogue.txt" ; B08903
      dialogueChapter05AndreyCharge .include "TEXT/DIALOGUE/Chapter05/AndreyCharge.dialogue.txt" ; B08B67
      dialogueChapter05BelhallaConversation .include "TEXT/DIALOGUE/Chapter05/BelhallaConversation.dialogue.txt" ; B08B98
      dialogueChapter05LubeckSeized1 .include "TEXT/DIALOGUE/Chapter05/LubeckSeized1.dialogue.txt" ; B09297
      dialogueChapter05LubeckSeized2 .include "TEXT/DIALOGUE/Chapter05/LubeckSeized2.dialogue.txt" ; B09817
      dialogueChapter05PhinoraSpawn1 .include "TEXT/DIALOGUE/Chapter05/PhinoraSpawn1.dialogue.txt" ; B09849
      dialogueChapter05PhinoraSpawn2 .include "TEXT/DIALOGUE/Chapter05/PhinoraSpawn2.dialogue.txt" ; B09DAE
      dialogueChapter05LeonsterSpawn .include "TEXT/DIALOGUE/Chapter05/LeonsterSpawn.dialogue.txt" ; B09E06
      dialogueChapter05ThraciaSpawn1 .include "TEXT/DIALOGUE/Chapter05/ThraciaSpawn1.dialogue.txt" ; B0A25F
      dialogueChapter05ThraciaSpawn2 .include "TEXT/DIALOGUE/Chapter05/ThraciaSpawn2.dialogue.txt" ; B0A2FF
      dialogueChapter05EthlynDiedQuanAlive1 .include "TEXT/DIALOGUE/Chapter05/EthlynDiedQuanAlive1.dialogue.txt" ; B0A487
      dialogueChapter05EthlynDiedQuanDead .include "TEXT/DIALOGUE/Chapter05/EthlynDiedQuanDead.dialogue.txt" ; B0A50E
      dialogueChapter05EthlynDiedQuanAlive2 .include "TEXT/DIALOGUE/Chapter05/EthlynDiedQuanAlive2.dialogue.txt" ; B0A624
      dialogueChapter05QuanAndEthlynDead .include "TEXT/DIALOGUE/Chapter05/QuanAndEthlynDead.dialogue.txt" ; B0A682
      dialogueChapter05PhinoraSeized1 .include "TEXT/DIALOGUE/Chapter05/PhinoraSeized1.dialogue.txt" ; B0A811
      dialogueChapter05PhinoraSeized2 .include "TEXT/DIALOGUE/Chapter05/PhinoraSeized2.dialogue.txt" ; B0A9E9
      dialogueChapter05PhinoraSeized3 .include "TEXT/DIALOGUE/Chapter05/PhinoraSeized3.dialogue.txt" ; B0AAD3
      dialogueChapter05PhinoraSeized4 .include "TEXT/DIALOGUE/Chapter05/PhinoraSeized4.dialogue.txt" ; B0AAFE
      dialogueChapter05ReptorCharge .include "TEXT/DIALOGUE/Chapter05/ReptorCharge.dialogue.txt" ; B0AB41
      dialogueChapter05AidaBetrayal .include "TEXT/DIALOGUE/Chapter05/AidaBetrayal.dialogue.txt" ; B0AB82
      dialogueChapter05ReptorBetrayalResponse .include "TEXT/DIALOGUE/Chapter05/ReptorBetrayalResponse.dialogue.txt" ; B0ABD0
      dialogueChapter05Ending1 .include "TEXT/DIALOGUE/Chapter05/Ending1.dialogue.txt" ; B0AC0B
      dialogueChapter05AnyoneAidaTalk .include "TEXT/DIALOGUE/Chapter05/AnyoneAidaTalk.dialogue.txt" ; B0AE59
      dialogueChapter05Ending2 .include "TEXT/DIALOGUE/Chapter05/Ending2.dialogue.txt" ; B0AE99
      dialogueChapter05Ending3 .include "TEXT/DIALOGUE/Chapter05/Ending3.dialogue.txt" ; B0B117
      dialogueChapter05Ending4SigurdAndParty .include "TEXT/DIALOGUE/Chapter05/Ending4SigurdAndParty.dialogue.txt" ; B0B2C7
      dialogueChapter05Ending4SigurdAlone .include "TEXT/DIALOGUE/Chapter05/Ending4SigurdAlone.dialogue.txt" ; B0B378
      dialogueChapter05Village1 .include "TEXT/DIALOGUE/Chapter05/Village1.dialogue.txt" ; B0B422
      dialogueChapter05Village2 .include "TEXT/DIALOGUE/Chapter05/Village2.dialogue.txt" ; B0B468
      dialogueChapter05Village3 .include "TEXT/DIALOGUE/Chapter05/Village3.dialogue.txt" ; B0B4B1
      dialogueChapter05Village4 .include "TEXT/DIALOGUE/Chapter05/Village4.dialogue.txt" ; B0B51F
      dialogueChapter05Village5 .include "TEXT/DIALOGUE/Chapter05/Village5.dialogue.txt" ; B0B588
      dialogueChapter05Village6 .include "TEXT/DIALOGUE/Chapter05/Village6.dialogue.txt" ; B0B5FC
      dialogueChapter05Village7 .include "TEXT/DIALOGUE/Chapter05/Village7.dialogue.txt" ; B0B66A
      dialogueChapter05LubeckSeizedByronDies .include "TEXT/DIALOGUE/Chapter05/LubeckSeizedByronDies.dialogue.txt" ; B0B726
      dialogueChapter05EdainAndreyBattleQuote .include "TEXT/DIALOGUE/Chapter05/EdainAndreyBattleQuote.dialogue.txt" ; B0B76E
      dialogueChapter05BrigidAndreyBattleQuote .include "TEXT/DIALOGUE/Chapter05/BrigidAndreyBattleQuote.dialogue.txt" ; B0B7E9
      dialogueChapter05SigurdLombardBattleQuote .include "TEXT/DIALOGUE/Chapter05/SigurdLombardBattleQuote.dialogue.txt" ; B0B8AE
      dialogueChapter05ByronSlayderBattleQuote .include "TEXT/DIALOGUE/Chapter05/ByronSlayderBattleQuote.dialogue.txt" ; B0B933
      dialogueChapter05ByronLubeckBattleQuote .include "TEXT/DIALOGUE/Chapter05/ByronLubeckBattleQuote.dialogue.txt" ; B0B968
      dialogueChapter05SlayderBattleQuote .include "TEXT/DIALOGUE/Chapter05/SlayderBattleQuote.dialogue.txt" ; B0B981
      dialogueChapter05AndreyBattleQuote .include "TEXT/DIALOGUE/Chapter05/AndreyBattleQuote.dialogue.txt" ; B0B9BA
      dialogueChapter05LombardBattleQuote .include "TEXT/DIALOGUE/Chapter05/LombardBattleQuote.dialogue.txt" ; B0B9DC
      dialogueChapter05VajaBattleQuote .include "TEXT/DIALOGUE/Chapter05/VajaBattleQuote.dialogue.txt" ; B0BA33
      dialogueChapter05EthlynThraciaBattleQuote .include "TEXT/DIALOGUE/Chapter05/EthlynThraciaBattleQuote.dialogue.txt" ; B0BA52
      dialogueChapter05QuanBattleQuoteEthlynAlive .include "TEXT/DIALOGUE/Chapter05/QuanBattleQuoteEthlynAlive.dialogue.txt" ; B0BA77
      dialogueChapter05QuanBattleQuoteEthlynDead .include "TEXT/DIALOGUE/Chapter05/QuanBattleQuoteEthlynDead.dialogue.txt" ; B0BAAC
      dialogueChapter05TravantBattleQuote .include "TEXT/DIALOGUE/Chapter05/TravantBattleQuote.dialogue.txt" ; B0BAC4
      dialogueChapter05MagornBattleQuote .include "TEXT/DIALOGUE/Chapter05/MagornBattleQuote.dialogue.txt" ; B0BB0C
      dialogueChapter05ReptorBattleQuotePostBetrayal .include "TEXT/DIALOGUE/Chapter05/ReptorBattleQuotePostBetrayal.dialogue.txt" ; B0BB36
      dialogueChapter05ReptorBattleQuotePreBetrayal .include "TEXT/DIALOGUE/Chapter05/ReptorBattleQuotePreBetrayal.dialogue.txt" ; B0BB5B

      dialogueEpilogue_Ares .include "TEXT/DIALOGUE/Epilogue/Ares.dialogue.txt" ; B0BB8B
      dialogueEpilogue_Ares_WithLover .include "TEXT/DIALOGUE/Epilogue/Ares_WithLover.dialogue.txt" ; B0BB91
      dialogueEpilogue_Piece_Ares .include "TEXT/DIALOGUE/Epilogue/Piece_Ares.dialogue.txt" ; B0BB9C
      dialogueEpilogue_LayleaLene_LoverDead .include "TEXT/DIALOGUE/Epilogue/LayleaLene_LoverDead.dialogue.txt" ; B0BD13
      dialogueEpilogue_LayleaLene_AresDead .include "TEXT/DIALOGUE/Epilogue/LayleaLene_AresDead.dialogue.txt" ; B0BDD5
      dialogueEpilogue_LayleaLene_AresAlive .include "TEXT/DIALOGUE/Epilogue/LayleaLene_AresAlive.dialogue.txt" ; B0BE2D
      dialogueEpilogue_Piece_LayleaLene_End .include "TEXT/DIALOGUE/Epilogue/Piece_LayleaLene_End.dialogue.txt" ; B0BE73
      dialogueEpilogue_Diarmuid_AresDead .include "TEXT/DIALOGUE/Epilogue/Diarmuid_AresDead.dialogue.txt" ; B0BF1B
      dialogueEpilogue_Diarmuid_AresDead_WithLover .include "TEXT/DIALOGUE/Epilogue/Diarmuid_AresDead_WithLover.dialogue.txt" ; B0BF21
      dialogueEpilogue_Diarmuid_AresAlive .include "TEXT/DIALOGUE/Epilogue/Diarmuid_AresAlive.dialogue.txt" ; B0BF2C
      dialogueEpilogue_Diarmuid_AresAlive_WithLover .include "TEXT/DIALOGUE/Epilogue/Diarmuid_AresAlive_WithLover.dialogue.txt" ; B0BF32
      dialogueEpilogue_Piece_Diarmuid_AresDead .include "TEXT/DIALOGUE/Epilogue/Piece_Diarmuid_AresDead.dialogue.txt" ; B0BF3D
      dialogueEpilogue_Piece_DiarmuidNanna_Mother .include "TEXT/DIALOGUE/Epilogue/Piece_DiarmuidNanna_Mother.dialogue.txt" ; B0BFA8
      dialogueEpilogue_Piece_DiarmuidNanna_End .include "TEXT/DIALOGUE/Epilogue/Piece_DiarmuidNanna_End.dialogue.txt" ; B0BFD9
      dialogueEpilogue_Piece_Diarmuid_WithLover_Unused .include "TEXT/DIALOGUE/Epilogue/Piece_Diarmuid_WithLover_Unused.dialogue.txt" ; B0C043
      dialogueEpilogue_Piece_Diarmuid_AresAlive .include "TEXT/DIALOGUE/Epilogue/Piece_Diarmuid_AresAlive.dialogue.txt" ; B0C0E8
      dialogueEpilogue_Tristan_AresDead .include "TEXT/DIALOGUE/Epilogue/Tristan_AresDead.dialogue.txt" ; B0C15F
      dialogueEpilogue_Tristan_AresDead_WithLover .include "TEXT/DIALOGUE/Epilogue/Tristan_AresDead_WithLover.dialogue.txt" ; B0C165
      dialogueEpilogue_Tristan_AresAlive .include "TEXT/DIALOGUE/Epilogue/Tristan_AresAlive.dialogue.txt" ; B0C170
      dialogueEpilogue_Tristan_AresAlive_WithLover .include "TEXT/DIALOGUE/Epilogue/Tristan_AresAlive_WithLover.dialogue.txt" ; B0C176
      dialogueEpilogue_Piece_Tristan_AresDead .include "TEXT/DIALOGUE/Epilogue/Piece_Tristan_AresDead.dialogue.txt" ; B0C181
      dialogueEpilogue_Piece_Tristan_WithLover_Unused .include "TEXT/DIALOGUE/Epilogue/Piece_Tristan_WithLover_Unused.dialogue.txt" ; B0C223
      dialogueEpilogue_Piece_Tristan_AresAlive .include "TEXT/DIALOGUE/Epilogue/Piece_Tristan_AresAlive.dialogue.txt" ; B0C2BB
      dialogueEpilogue_Nanna_AresDead .include "TEXT/DIALOGUE/Epilogue/Nanna_AresDead.dialogue.txt" ; B0C352
      dialogueEpilogue_Nanna_LoverDead .include "TEXT/DIALOGUE/Epilogue/Nanna_LoverDead.dialogue.txt" ; B0C3C5
      dialogueEpilogue_Piece_JeanneNanna_LoverDead .include "TEXT/DIALOGUE/Epilogue/Piece_JeanneNanna_LoverDead.dialogue.txt" ; B0C41A
      dialogueEpilogue_Nanna_AresAlive_DiarmuidDead .include "TEXT/DIALOGUE/Epilogue/Nanna_AresAlive_DiarmuidDead.dialogue.txt" ; B0C488
      dialogueEpilogue_Nanna_AresAlive_DiarmuidAlive .include "TEXT/DIALOGUE/Epilogue/Nanna_AresAlive_DiarmuidAlive.dialogue.txt" ; B0C50E
      dialogueEpilogue_Jeanne_LoverDead .include "TEXT/DIALOGUE/Epilogue/Jeanne_LoverDead.dialogue.txt" ; B0C5E2
      dialogueEpilogue_Jeanne_TristanDead .include "TEXT/DIALOGUE/Epilogue/Jeanne_TristanDead.dialogue.txt" ; B0C62B
      dialogueEpilogue_Jeanne_TristanAlive .include "TEXT/DIALOGUE/Epilogue/Jeanne_TristanAlive.dialogue.txt" ; B0C76B

      dialogueEpilogue_AgustriaEnd_Multiple .include "TEXT/DIALOGUE/Epilogue/AgustriaEnd_Multiple.dialogue.txt" ; B0C825
      dialogueEpilogue_AgustriaEnd_Solo .include "TEXT/DIALOGUE/Epilogue/AgustriaEnd_Solo.dialogue.txt" ; B0C862
      dialogueEpilogue_Piece_AgustriaEnd_Start .include "TEXT/DIALOGUE/Epilogue/Piece_AgustriaEnd_Start.dialogue.txt" ; B0C887
      dialogueEpilogue_Piece_AgustriaEnd_End .include "TEXT/DIALOGUE/Epilogue/Piece_AgustriaEnd_End.dialogue.txt" ; B0C8C1

      dialogueEpilogue_JamkesSon .include "TEXT/DIALOGUE/Epilogue/JamkesSon.dialogue.txt" ; B0C8D1
      dialogueEpilogue_JamkesSon_WithLover .include "TEXT/DIALOGUE/Epilogue/JamkesSon_WithLover.dialogue.txt" ; B0C8D7
      dialogueEpilogue_Piece_JamkesChild .include "TEXT/DIALOGUE/Epilogue/Piece_JamkesChild.dialogue.txt" ; B0C8E2
      dialogueEpilogue_JamkesDaughter_BrotherDead .include "TEXT/DIALOGUE/Epilogue/JamkesDaughter_BrotherDead.dialogue.txt" ; B0CA2D
      dialogueEpilogue_JamkesDaughter_BrotherAlive .include "TEXT/DIALOGUE/Epilogue/JamkesDaughter_BrotherAlive.dialogue.txt" ; B0CA33
      dialogueEpilogue_JamkesDaughter_BrotherAlive_LoverDead .include "TEXT/DIALOGUE/Epilogue/JamkesDaughter_BrotherAlive_LoverDead.dialogue.txt" ; B0CABE

      .include "EVENTS/Chapter03/EventChapter03LexAyraTalk.asm"
      .include "EVENTS/Chapter03/EventChapter03ChulainnAyraTalk.asm"
      .include "EVENTS/Chapter03/EventChapter03SigurdBrigidTalk.asm"
      .include "EVENTS/Chapter03/EventChapter03ClaudSigurdTalk.asm"
      .include "EVENTS/Chapter03/EventChapter03MidirBrigidTalk.asm"
      .include "EVENTS/Chapter03/EventChapter03EthlynQuanTalk.asm"
      .include "EVENTS/Chapter03/EventChapter03EdainBrigidTalk.asm"

      .include "EVENTS/Chapter04/EventChapter04SigurdClaudTalk.asm"
      .include "EVENTS/Chapter04/EventChapter04TailtiuAzelleTalk.asm"
      .include "EVENTS/Chapter04/EventChapter04EdainJamkeTalk.asm"
      .include "EVENTS/Chapter04/EventChapter04EdainMidirTalk.asm"
      .include "EVENTS/Chapter04/EventChapter04EdainAzelleTalk.asm"
      .include "EVENTS/Chapter04/EventChapter04SilviaClaudTalk.asm"
      .include "EVENTS/Chapter04/EventChapter04LewynSigurdTalk.asm"
      .include "EVENTS/Chapter04/EventChapter04ErinysLewynTalk.asm"

      .include "EVENTS/Chapter05/EventChapter05EdainBrigidTalk.asm"
      .include "EVENTS/Chapter05/EventChapter05ClaudEdainTalk.asm"
      .include "EVENTS/Chapter05/EventChapter05DewJamkeTalk.asm"
      .include "EVENTS/Chapter05/EventChapter05AlecNaoiseTalk.asm"
      .include "EVENTS/Chapter05/EventChapter05LexAzelleTalk.asm"
      .include "EVENTS/Chapter05/EventChapter05SigurdAyraTalk.asm"
      .include "EVENTS/Chapter05/EventChapter05_1CE.asm"
      .include "EVENTS/Chapter05/EventChapter05TailtiuAzelleTalk.asm"
      .include "EVENTS/Chapter05/EventChapter05TailtiuClaudTalk.asm"
      .include "EVENTS/Chapter05/EventChapter05TailtiuLexTalk.asm"
      .include "EVENTS/Chapter05/EventChapter05ErinysLewynTalk.asm"
      .include "EVENTS/Chapter05/EventChapter05ErinysArdenTalk.asm"
      .include "EVENTS/Chapter05/EventChapter05ErinysNaoiseTalk.asm"
      .include "EVENTS/Chapter05/EventChapter05SilviaClaudTalk.asm"
      .include "EVENTS/Chapter05/EventChapter05SilviaLewynTalk.asm"
      .include "EVENTS/Chapter05/EventChapter05SilviaAlecTalk.asm"
      .include "EVENTS/Chapter05/EventChapter05LachesisBeowulfTalk.asm"
      .include "EVENTS/Chapter05/EventChapter05LachesisNaoiseTalk.asm"
      .include "EVENTS/Chapter05/EventChapter05LachesisDewTalk.asm"
      .include "EVENTS/Chapter05/EventChapter05AyraLexTalk.asm"
      .include "EVENTS/Chapter05/EventChapter05AyraChulainnTalk.asm"
      .include "EVENTS/Chapter05/EventChapter05AyraArdenTalk.asm"
      .include "EVENTS/Chapter05/EventChapter05BrigidAlecTalk.asm"
      .include "EVENTS/Chapter05/EventChapter05BrigidJamkeTalk.asm"
      .include "EVENTS/Chapter05/EventChapter05BrigidMidirTalk.asm"

      dialogueChapterPrologueMidirGerrardBattleQuote .include "TEXT/DIALOGUE/ChapterPrologue/MidirGerrardBattleQuote.dialogue.txt" ; B0CFE7
      
      dialogueChapter01MidirMunnirBattleQuote .include "TEXT/DIALOGUE/Chapter01/MidirMunnirBattleQuote.dialogue.txt" ; B0D03A
      dialogueChapter01AzelleMunnirBattleQuote .include "TEXT/DIALOGUE/Chapter01/AzelleMunnirBattleQuote.dialogue.txt" ; B0D09B
      dialogueChapter01DeirdreSandimaBattleQuote .include "TEXT/DIALOGUE/Chapter01/DeirdreSandimaBattleQuote.dialogue.txt" ; B0D0EB
      dialogueChapter01JamkeSandimaBattleQuote .include "TEXT/DIALOGUE/Chapter01/JamkeSandimaBattleQuote.dialogue.txt" ; B0D128
      dialogueChapter01UnusedEdainJamkeBattleQuote .include "TEXT/DIALOGUE/Chapter01/UnusedEdainJamkeBattleQuote.dialogue.txt" ; B0D17A

      dialogueChapter02ErinysChagallBattleQuote .include "TEXT/DIALOGUE/Chapter02/ErinysChagallBattleQuote.dialogue.txt" ; B0D1B5
      dialogueChapter02LachesisChagallBattleQuote .include "TEXT/DIALOGUE/Chapter02/LachesisChagallBattleQuote.dialogue.txt" ; B0D218
      dialogueChapter02LachesisElliotBattleQuote .include "TEXT/DIALOGUE/Chapter02/LachesisElliotBattleQuote.dialogue.txt" ; B0D280
      dialogueChapter02BeowulfWaltzBattleQuote .include "TEXT/DIALOGUE/Chapter02/BeowulfWaltzBattleQuote.dialogue.txt" ; B0D2F9
      dialogueChapter02LewynMacBethBattleQuote .include "TEXT/DIALOGUE/Chapter02/LewynMacBethBattleQuote.dialogue.txt" ; B0D362
      dialogueChapter02UnusedLewynErinysBattleQuote .include "TEXT/DIALOGUE/Chapter02/UnusedLewynErinysBattleQuote.dialogue.txt" ; B0D3B0

      dialogueChapter03SigurdEldiganBattleQuote .include "TEXT/DIALOGUE/Chapter03/SigurdEldiganBattleQuote.dialogue.txt" ; B0D3D2
      dialogueChapter03BrigidDuvallBattleQuote .include "TEXT/DIALOGUE/Chapter03/BrigidDuvallBattleQuote.dialogue.txt" ; B0D440
      dialogueChapter03LachesisChagallBattleQuote .include "TEXT/DIALOGUE/Chapter03/LachesisChagallBattleQuote.dialogue.txt" ; B0D48A
      dialogueChapter03SigurdChagallBattleQuote .include "TEXT/DIALOGUE/Chapter03/SigurdChagallBattleQuote.dialogue.txt" ; B0D4DB
      dialogueChapter03UnusedLachesisEldiganBattleQuote .include "TEXT/DIALOGUE/Chapter03/UnusedLachesisEldiganBattleQuote.dialogue.txt" ; B0D572

      dialogueChapter04LewynMyosBattleQuote .include "TEXT/DIALOGUE/Chapter04/LewynMyosBattleQuote.dialogue.txt" ; B0D59A
      dialogueChapter04LewynDaccarBattleQuote .include "TEXT/DIALOGUE/Chapter04/LewynDaccarBattleQuote.dialogue.txt" ; B0D602
      dialogueChapter04ErinysDithorbaBattleQuote .include "TEXT/DIALOGUE/Chapter04/ErinysDithorbaBattleQuote.dialogue.txt" ; B0D66D
      dialogueChapter04ErinysPamelaBattleQuote .include "TEXT/DIALOGUE/Chapter04/ErinysPamelaBattleQuote.dialogue.txt" ; B0D722
      dialogueChapter04LewynPamelaBattleQuote .include "TEXT/DIALOGUE/Chapter04/LewynPamelaBattleQuote.dialogue.txt" ; B0D7B0

      dialogueChapter05LexLombardBattleQuote .include "TEXT/DIALOGUE/Chapter05/LexLombardBattleQuote.dialogue.txt" ; B0D83C
      dialogueChapter05TailtiuReptorBattleQuote .include "TEXT/DIALOGUE/Chapter05/TailtiuReptorBattleQuote.dialogue.txt" ; B0D8B6
      dialogueChapter05SigurdMagornBattleQuote .include "TEXT/DIALOGUE/Chapter05/SigurdMagornBattleQuote.dialogue.txt" ; B0D990
      dialogueChapter05SigurdReptorBattleQuote .include "TEXT/DIALOGUE/Chapter05/SigurdReptorBattleQuote.dialogue.txt" ; B0D9B9
      dialogueChapter05AidaReptorBattleQuote .include "TEXT/DIALOGUE/Chapter05/AidaReptorBattleQuote.dialogue.txt" ; B0DB71

      dialogueChapter06IucharDanannBattleQuote .include "TEXT/DIALOGUE/Chapter06/IucharDanannBattleQuote.dialogue.txt" ; B0DBD0
      dialogueChapter06IucharbaDanannBattleQuote .include "TEXT/DIALOGUE/Chapter06/IucharbaDanannBattleQuote.dialogue.txt" ; B0DC39
      dialogueChapter06IucharIucharbaBattleQuote .include "TEXT/DIALOGUE/Chapter06/IucharIucharbaBattleQuote.dialogue.txt" ; B0DCBE
      dialogueChapter06LarceiIucharBattleQuote .include "TEXT/DIALOGUE/Chapter06/LarceiIucharBattleQuote.dialogue.txt" ; B0DD49
      dialogueChapter06LarceiIucharbaBattleQuote .include "TEXT/DIALOGUE/Chapter06/LarceiIucharbaBattleQuote.dialogue.txt" ; B0DD77
      dialogueChapter06SeliphDanannBattleQuote .include "TEXT/DIALOGUE/Chapter06/SeliphDanannBattleQuote.dialogue.txt" ; B0DDA2

      dialogueChapter07ArthurTineBattleQuote .include "TEXT/DIALOGUE/Chapter07/ArthurTineBattleQuote.dialogue.txt" ; B0DE30
      dialogueChapter07AresBramselBattleQuote .include "TEXT/DIALOGUE/Chapter07/AresBramselBattleQuote.dialogue.txt" ; B0DE78
      dialogueChapter07AresJavarroBattleQuote .include "TEXT/DIALOGUE/Chapter07/AresJavarroBattleQuote.dialogue.txt" ; B0DEFA
      dialogueChapter07TineBloomBattleQuote .include "TEXT/DIALOGUE/Chapter07/TineBloomBattleQuote.dialogue.txt" ; B0DF4C
      dialogueChapter07ArthurBloomBattleQuote .include "TEXT/DIALOGUE/Chapter07/ArthurBloomBattleQuote.dialogue.txt" ; B0DF90
      dialogueChapter07LeifBloomBattleQuote .include "TEXT/DIALOGUE/Chapter07/LeifBloomBattleQuote.dialogue.txt" ; B0E01A

      dialogueChapter08FebailBloomBattleQuote .include "TEXT/DIALOGUE/Chapter08/FebailBloomBattleQuote.dialogue.txt" ; B0E09C
      dialogueChapter08TineIshtarBattleQuote .include "TEXT/DIALOGUE/Chapter08/TineIshtarBattleQuote.dialogue.txt" ; B0E115
      dialogueChapter08TineBloomBattleQuote .include "TEXT/DIALOGUE/Chapter08/TineBloomBattleQuote.dialogue.txt" ; B0E181
      dialogueChapter08SeliphBloomBattleQuote .include "TEXT/DIALOGUE/Chapter08/SeliphBloomBattleQuote.dialogue.txt" ; B0E1E8
      dialogueChapter08UnusedPattyFebailBattleQuote .include "TEXT/DIALOGUE/Chapter08/UnusedPattyFebailBattleQuote.dialogue.txt" ; B0E27D

      dialogueChapter09LeifAltenaBattleQuote .include "TEXT/DIALOGUE/Chapter09/LeifAltenaBattleQuote.dialogue.txt" ; B0E2A8
      dialogueChapter09FinnAltenaBattleQuote .include "TEXT/DIALOGUE/Chapter09/FinnAltenaBattleQuote.dialogue.txt" ; B0E317
      dialogueChapter09UnusedAltenaArionBattleQuote .include "TEXT/DIALOGUE/Chapter09/UnusedAltenaArionBattleQuote.dialogue.txt" ; B0E363
      dialogueChapter09LeifTravantBattleQuote .include "TEXT/DIALOGUE/Chapter09/LeifTravantBattleQuote.dialogue.txt" ; B0E3EC
      dialogueChapter09FinnTravantBattleQuote .include "TEXT/DIALOGUE/Chapter09/FinnTravantBattleQuote.dialogue.txt" ; B0E4F7
      dialogueChapter09SeliphArionBattleQuote .include "TEXT/DIALOGUE/Chapter09/SeliphArionBattleQuote.dialogue.txt" ; B0E58E
      dialogueChapter10TineHildaBattleQuote .include "TEXT/DIALOGUE/Chapter10/TineHildaBattleQuote.dialogue.txt" ; B0E61E
      dialogueChapter10SeliphHildaBattleQuote .include "TEXT/DIALOGUE/Chapter10/SeliphHildaBattleQuote.dialogue.txt" ; B0E72D

      dialogueChapterFinalIuchar_BrianBattleQuote .include "TEXT/DIALOGUE/ChapterFinal/Iuchar_BrianBattleQuote.dialogue.txt" ; B0E769
      dialogueChapterFinalIucharba_BrianBattleQuote .include "TEXT/DIALOGUE/ChapterFinal/Iucharba_BrianBattleQuote.dialogue.txt" ; B0E7F7
      dialogueChapterFinalTineLinda_HildaBattleQuote .include "TEXT/DIALOGUE/ChapterFinal/TineLinda_HildaBattleQuote.dialogue.txt" ; B0E889
      dialogueChapterFinalArthur_HildaBattleQuote .include "TEXT/DIALOGUE/ChapterFinal/Arthur_HildaBattleQuote.dialogue.txt" ; B0E906
      dialogueChapterFinalFebail_ScipioBattleQuote .include "TEXT/DIALOGUE/ChapterFinal/Febail_ScipioBattleQuote.dialogue.txt" ; B0E99D
      dialogueChapterFinalLester_ScipioBattleQuote .include "TEXT/DIALOGUE/ChapterFinal/Lester_ScipioBattleQuote.dialogue.txt" ; B0EA3C
      dialogueChapterFinalTineLinda_IshtarBattleQuote .include "TEXT/DIALOGUE/ChapterFinal/TineLinda_IshtarBattleQuote.dialogue.txt" ; B0EADE
      dialogueChapterFinalSeliph_ManfroyBattleQuote .include "TEXT/DIALOGUE/ChapterFinal/Seliph_ManfroyBattleQuote.dialogue.txt" ; B0EB80
      dialogueChapterFinalAltena_ArionBattleQuote .include "TEXT/DIALOGUE/ChapterFinal/Altena_ArionBattleQuote.dialogue.txt" ; B0ED61

      dialogueEpilogueLover_Diarmuid_Peppy .include "TEXT/DIALOGUE/Epilogue/Lover_Diarmuid_Peppy.dialogue.txt" ; B0EDB3
      dialogueEpilogueLover_Diarmuid_Noble .include "TEXT/DIALOGUE/Epilogue/Lover_Diarmuid_Noble.dialogue.txt" ; B0EE5A
      dialogueEpilogueLover_Tristan_Peppy .include "TEXT/DIALOGUE/Epilogue/Lover_Tristan_Peppy.dialogue.txt" ; B0EF04
      dialogueEpilogueLover_Tristan_Noble .include "TEXT/DIALOGUE/Epilogue/Lover_Tristan_Noble.dialogue.txt" ; B0EFB1
      dialogueEpilogueLover_JamkesSon_Peppy .include "TEXT/DIALOGUE/Epilogue/Lover_JamkesSon_Peppy.dialogue.txt" ; B0F049
      dialogueEpilogueLover_JamkesSon_CreidneLarcei .include "TEXT/DIALOGUE/Epilogue/Lover_JamkesSon_CreidneLarcei.dialogue.txt" ; B0F0F5
      dialogueEpilogueLover_JamkesSon_Noble .include "TEXT/DIALOGUE/Epilogue/Lover_JamkesSon_Noble.dialogue.txt" ; B0F1F1
      dialogueEpilogueLover_Febail_Peppy .include "TEXT/DIALOGUE/Epilogue/Lover_Febail_Peppy.dialogue.txt" ; B0F2E5
      dialogueEpilogueLover_Febail_CreidneLarcei .include "TEXT/DIALOGUE/Epilogue/Lover_Febail_CreidneLarcei.dialogue.txt" ; B0F36D
      dialogueEpilogueLover_Febail_MuirneLana .include "TEXT/DIALOGUE/Epilogue/Lover_Febail_MuirneLana.dialogue.txt" ; B0F3FA
      dialogueEpilogueLover_Febail_Noble .include "TEXT/DIALOGUE/Epilogue/Lover_Febail_Noble.dialogue.txt" ; B0F486
      dialogueEpilogueLover_Lester_BrigidsChildrenDead_Peppy .include "TEXT/DIALOGUE/Epilogue/Lover_Lester_BrigidsChildrenDead_Peppy.dialogue.txt" ; B0F513
      dialogueEpilogueLover_Lester_BrigidsChildrenDead_Noble .include "TEXT/DIALOGUE/Epilogue/Lover_Lester_BrigidsChildrenDead_Noble.dialogue.txt" ; B0F598
      dialogueEpilogueLover_Lester_BrigidsChildrenAlive_Peppy .include "TEXT/DIALOGUE/Epilogue/Lover_Lester_BrigidsChildrenAlive_Peppy.dialogue.txt" ; B0F60D
      dialogueEpilogueLover_Lester_BrigidsChildrenAlive_Noble .include "TEXT/DIALOGUE/Epilogue/Lover_Lester_BrigidsChildrenAlive_Noble.dialogue.txt" ; B0F64E
      dialogueEpilogueLover_AmidArthur_Peppy .include "TEXT/DIALOGUE/Epilogue/Lover_AmidArthur_Peppy.dialogue.txt" ; B0F694
      dialogueEpilogueLover_AmidArthur_NobleA .include "TEXT/DIALOGUE/Epilogue/Lover_AmidArthur_NobleA.dialogue.txt" ; B0F6FF
      dialogueEpilogueLover_AmidArthur_NobleB .include "TEXT/DIALOGUE/Epilogue/Lover_AmidArthur_NobleB.dialogue.txt" ; B0F779
      dialogueEpilogueLover_LexSon_Peppy .include "TEXT/DIALOGUE/Epilogue/Lover_LexSon_Peppy.dialogue.txt" ; B0F7F4
      dialogueEpilogueLover_LexSon_CreidneLarcei .include "TEXT/DIALOGUE/Epilogue/Lover_LexSon_CreidneLarcei.dialogue.txt" ; B0F86D
      dialogueEpilogueLover_LexSon_Noble .include "TEXT/DIALOGUE/Epilogue/Lover_LexSon_Noble.dialogue.txt" ; B0F8F1
      dialogueEpilogueLover_Iuchar_Peppy .include "TEXT/DIALOGUE/Epilogue/Lover_Iuchar_Peppy.dialogue.txt" ; B0F96A
      dialogueEpilogueLover_Iuchar_CreidneLarcei .include "TEXT/DIALOGUE/Epilogue/Lover_Iuchar_CreidneLarcei.dialogue.txt" ; B0F9E5
      dialogueEpilogueLover_Iuchar_Noble .include "TEXT/DIALOGUE/Epilogue/Lover_Iuchar_Noble.dialogue.txt" ; B0FA6C
      dialogueEpilogueLover_Iucharba_Peppy .include "TEXT/DIALOGUE/Epilogue/Lover_Iucharba_Peppy.dialogue.txt" ; B0FADF
      dialogueEpilogueLover_Iucharba_Noble .include "TEXT/DIALOGUE/Epilogue/Lover_Iucharba_Noble.dialogue.txt" ; B0FB80
      dialogueEpilogueLover_ClaudsSon_Peppy .include "TEXT/DIALOGUE/Epilogue/Lover_ClaudsSon_Peppy.dialogue.txt" ; B0FC20
      dialogueEpilogueLover_ClaudsSon_CreidneLarcei .include "TEXT/DIALOGUE/Epilogue/Lover_ClaudsSon_CreidneLarcei.dialogue.txt" ; B0FCA1
      dialogueEpilogueLover_ClaudsSon_MuirneLana .include "TEXT/DIALOGUE/Epilogue/Lover_ClaudsSon_MuirneLana.dialogue.txt" ; B0FD27
      dialogueEpilogueLover_ClaudsSon_LindaTine .include "TEXT/DIALOGUE/Epilogue/Lover_ClaudsSon_LindaTine.dialogue.txt" ; B0FDB0
      dialogueEpilogueLover_ClaudsSon_JeanneNanna .include "TEXT/DIALOGUE/Epilogue/Lover_ClaudsSon_JeanneNanna.dialogue.txt" ; B0FE32

      .fill $B08000 + $8000 - *, 0

    .here

    * = $318000
    .logical $B18000

      .include "EVENTS/ChapterPrologue/EventPrologueOpening.asm"
      .include "EVENTS/ChapterPrologue/EventPrologueEdainAbduction.asm"
      .include "EVENTS/ChapterPrologue/EventPrologueQuanGroupSpawn.asm"
      .include "EVENTS/ChapterPrologue/EventPrologueLexAzelleSpawn.asm"
      .include "EVENTS/ChapterPrologue/EventPrologueYngviSeized.asm"
      .include "EVENTS/ChapterPrologue/EventPrologueEvansSpawn.asm"
      .include "EVENTS/ChapterPrologue/EventPrologueArvisSpawn.asm"
      .include "EVENTS/ChapterPrologue/EventPrologueEnding.asm"
      .include "EVENTS/ChapterPrologue/EventPrologueSigurdHomeCastle.asm"
      .include "EVENTS/ChapterPrologue/EventPrologue00A.asm"
      .include "EVENTS/ChapterPrologue/EventPrologue00B.asm"
      .include "EVENTS/ChapterPrologue/EventPrologue00C.asm"
      .include "EVENTS/ChapterPrologue/EventPrologue00D.asm"
      .include "EVENTS/ChapterPrologue/EventPrologue00E.asm"
      .include "EVENTS/ChapterPrologue/EventPrologue00F.asm"
      .include "EVENTS/ChapterPrologue/EventPrologue010.asm"
      .include "EVENTS/ChapterPrologue/EventPrologue011.asm"
      .include "EVENTS/ChapterPrologue/EventPrologue012.asm"
      .include "EVENTS/ChapterPrologue/EventPrologueSigurdArvisTalk.asm"
      .include "EVENTS/ChapterPrologue/EventPrologueVillage1.asm"
      .include "EVENTS/ChapterPrologue/EventPrologueVillage2.asm"
      .include "EVENTS/ChapterPrologue/EventPrologueVillage4.asm"
      .include "EVENTS/ChapterPrologue/EventPrologueVillage3.asm"
      .include "EVENTS/ChapterPrologue/EventPrologueVillageSpeedRing.asm"
      .include "EVENTS/ChapterPrologue/EventPrologueQuanDied.asm"
      .include "EVENTS/ChapterPrologue/EventPrologueEthlynDied.asm"
      .include "EVENTS/ChapterPrologue/EventPrologueFinnDied.asm"
      .include "EVENTS/ChapterPrologue/EventPrologue01C.asm"
      .include "EVENTS/ChapterPrologue/EventPrologue01D.asm"
      .include "EVENTS/ChapterPrologue/EventPrologue01E.asm"
      .include "EVENTS/ChapterPrologue/EventPrologue01F.asm"

      dialogueChapterPrologueOpening1 .include "TEXT/DIALOGUE/ChapterPrologue/Opening1.dialogue.txt" ; B18771
      dialogueChapterPrologueOpening2 .include "TEXT/DIALOGUE/ChapterPrologue/Opening2.dialogue.txt" ; B18874
      dialogueChapterPrologueMunnirMidirBattleQuote .include "TEXT/DIALOGUE/ChapterPrologue/MunnirMidirBattleQuote.dialogue.txt" ; B18E93
      dialogueChapterPrologueMidirCutsceneDeath .include "TEXT/DIALOGUE/ChapterPrologue/MidirCutsceneDeath.dialogue.txt" ; B18ECD
      dialogueChapterPrologueMunnirEdainCaptured .include "TEXT/DIALOGUE/ChapterPrologue/MunnirEdainCaptured.dialogue.txt" ; B18EF7
      dialogueChapterPrologueMunnirLowerBridge .include "TEXT/DIALOGUE/ChapterPrologue/MunnirLowerBridge.dialogue.txt" ; B1901C
      dialogueChapterPrologueMunnirHurryUp .include "TEXT/DIALOGUE/ChapterPrologue/MunnirHurryUp.dialogue.txt" ; B19067
      dialogueChapterPrologueDiMaggioYngviTakeover .include "TEXT/DIALOGUE/ChapterPrologue/DiMaggioYngviTakeover.dialogue.txt" ; B190A5
      dialogueChapterPrologueQuanGroupSpawn .include "TEXT/DIALOGUE/ChapterPrologue/QuanGroupSpawn.dialogue.txt" ; B190DC
      dialogueChapterPrologueDiMaggioBattleQuote .include "TEXT/DIALOGUE/ChapterPrologue/DiMaggioBattleQuote.dialogue.txt" ; B19291
      dialogueChapterPrologueYngviSeized .include "TEXT/DIALOGUE/ChapterPrologue/YngviSeized.dialogue.txt" ; B192C5
      dialogueChapterPrologueEvansSpawn .include "TEXT/DIALOGUE/ChapterPrologue/EvansSpawn.dialogue.txt" ; B19403
      dialogueChapterPrologueEnding2 .include "TEXT/DIALOGUE/ChapterPrologue/Ending2.dialogue.txt" ; B1946F
      dialogueChapterPrologueMunnirAttackCastle .include "TEXT/DIALOGUE/ChapterPrologue/MunnirAttackCastle.dialogue.txt" ; B195BC
      dialogueChapterPrologueGerrardBattleQuote .include "TEXT/DIALOGUE/ChapterPrologue/GerrardBattleQuote.dialogue.txt" ; B195FA
      dialogueChapterPrologueMunnirGerrardConversation .include "TEXT/DIALOGUE/ChapterPrologue/MunnirGerrardConversation.dialogue.txt" ; B19616
      dialogueChapterPrologueLexAzelleSpawn .include "TEXT/DIALOGUE/ChapterPrologue/LexAzelleSpawn.dialogue.txt" ; B1978A
      dialogueChapterPrologueEnding1 .include "TEXT/DIALOGUE/ChapterPrologue/Ending1.dialogue.txt" ; B1998E
      dialogueChapterPrologueUnusedEnding1Copy .include "TEXT/DIALOGUE/ChapterPrologue/UnusedEnding1Copy.dialogue.txt" ; B19A5C

      dialogueChapterPrologueSigurdHomeCastle .include "TEXT/DIALOGUE/ChapterPrologue/SigurdHomeCastle.dialogue.txt" ; B19B2A
      dialogueChapterPrologueVillage1 .include "TEXT/DIALOGUE/ChapterPrologue/Village1.dialogue.txt" ; B19B9B
      dialogueChapterPrologueVillage2 .include "TEXT/DIALOGUE/ChapterPrologue/Village2.dialogue.txt" ; B19C32
      dialogueChapterPrologueVillage4 .include "TEXT/DIALOGUE/ChapterPrologue/Village4.dialogue.txt" ; B19CED
      dialogueChapterPrologueVillage3 .include "TEXT/DIALOGUE/ChapterPrologue/Village3.dialogue.txt" ; B19D8D
      dialogueChapterPrologueVillageSpeedRing .include "TEXT/DIALOGUE/ChapterPrologue/VillageSpeedRing.dialogue.txt" ; B19E87
      dialogueChapterPrologueArvisSpawn .include "TEXT/DIALOGUE/ChapterPrologue/ArvisSpawn.dialogue.txt" ; B19F26
      dialogueChapterPrologueArvisSigurdTalkAzelleAlive .include "TEXT/DIALOGUE/ChapterPrologue/ArvisSigurdTalkAzelleAlive.dialogue.txt" ; B19F88
      dialogueChapterPrologueArvisSigurdTalkAzelleDead .include "TEXT/DIALOGUE/ChapterPrologue/ArvisSigurdTalkAzelleDead.dialogue.txt" ; B1A1F1

      .dsection ChapterFinalEventsSection
      .dsection ChapterFinalEventDataSection

      dialogueChapter07Opening1 .include "TEXT/DIALOGUE/Chapter07/Opening1.dialogue.txt" ; B1AC01
      dialogueChapter07Opening2 .include "TEXT/DIALOGUE/Chapter07/Opening2.dialogue.txt" ; B1AE96
      dialogueChapter07Opening3 .include "TEXT/DIALOGUE/Chapter07/Opening3.dialogue.txt" ; B1AF75
      dialogueChapter07Opening4 .include "TEXT/DIALOGUE/Chapter07/Opening4.dialogue.txt" ; B1AFD0
      dialogueChapter07Opening5 .include "TEXT/DIALOGUE/Chapter07/Opening5.dialogue.txt" ; B1B061
      dialogueChapter07Opening6 .include "TEXT/DIALOGUE/Chapter07/Opening6.dialogue.txt" ; B1B18D
      dialogueChapter07BramselWaiting1 .include "TEXT/DIALOGUE/Chapter07/BramselWaiting1.dialogue.txt" ; B1B302
      dialogueChapter07BramselWaiting2 .include "TEXT/DIALOGUE/Chapter07/BramselWaiting2.dialogue.txt" ; B1B400
      dialogueChapter07AedSeized .include "TEXT/DIALOGUE/Chapter07/AedSeized.dialogue.txt" ; B1B609
      dialogueChapter07MelgenSpawn1 .include "TEXT/DIALOGUE/Chapter07/MelgenSpawn1.dialogue.txt" ; B1B7DE
      dialogueChapter07AresThreatensBramsel .include "TEXT/DIALOGUE/Chapter07/AresThreatensBramsel.dialogue.txt" ; B1B8C7
      dialogueChapter07MelgenSpawn2 .include "TEXT/DIALOGUE/Chapter07/MelgenSpawn2.dialogue.txt" ; B1BB67
      dialogueChapter07MelgenSeized .include "TEXT/DIALOGUE/Chapter07/MelgenSeized.dialogue.txt" ; B1BD20
      dialogueChapter07UlsterSpawn1 .include "TEXT/DIALOGUE/Chapter07/UlsterSpawn1.dialogue.txt" ; B1BEA3
      dialogueChapter07UlsterSpawn2 .include "TEXT/DIALOGUE/Chapter07/UlsterSpawn2.dialogue.txt" ; B1BF42
      dialogueChapter07UlsterSpawn3 .include "TEXT/DIALOGUE/Chapter07/UlsterSpawn3.dialogue.txt" ; B1C02F
      dialogueChapter07UlsterSpawn4 .include "TEXT/DIALOGUE/Chapter07/UlsterSpawn4.dialogue.txt" ; B1C058
      dialogueChapter07BloomCharge .include "TEXT/DIALOGUE/Chapter07/BloomCharge.dialogue.txt" ; B1C1FF
      dialogueChapter07AresRecruitment1 .include "TEXT/DIALOGUE/Chapter07/AresRecruitment1.dialogue.txt" ; B1C22C
      dialogueChapter07AresRecruitment2 .include "TEXT/DIALOGUE/Chapter07/AresRecruitment2.dialogue.txt" ; B1C321
      dialogueChapter07BanbaDialogue .include "TEXT/DIALOGUE/Chapter07/BanbaDialogue.dialogue.txt" ; B1C4F2
      dialogueChapter07TineDialogue .include "TEXT/DIALOGUE/Chapter07/TineDialogue.dialogue.txt" ; B1C557
      dialogueChapter07DahnaSeized1 .include "TEXT/DIALOGUE/Chapter07/DahnaSeized1.dialogue.txt" ; B1C5BF
      dialogueChapter07DahnaSeized2 .include "TEXT/DIALOGUE/Chapter07/DahnaSeized2.dialogue.txt" ; B1C776
      dialogueChapter07AresDahnaVisit .include "TEXT/DIALOGUE/Chapter07/AresDahnaVisit.dialogue.txt" ; B1C7A4
      dialogueChapter07ArthurTineTalk .include "TEXT/DIALOGUE/Chapter07/ArthurTineTalk.dialogue.txt" ; B1C8CB
      dialogueChapter07LeonsterSeized .include "TEXT/DIALOGUE/Chapter07/LeonsterSeized.dialogue.txt" ; B1CB51
      dialogueChapter07Ending .include "TEXT/DIALOGUE/Chapter07/Ending.dialogue.txt" ; B1CB9A
      dialogueChapter07KutuzovFenrirFound .include "TEXT/DIALOGUE/Chapter07/KutuzovFenrirFound.dialogue.txt" ; B1CCFF
      dialogueChapter07BanbaTriangleAttack .include "TEXT/DIALOGUE/Chapter07/BanbaTriangleAttack.dialogue.txt" ; B1CD7C

      .word $02C5

      dialogueChapter07FotlaTriangleAttack .include "TEXT/DIALOGUE/Chapter07/FotlaTriangleAttack.dialogue.txt" ; B1CDA8
      dialogueChapter07EriuTriangleAttack .include "TEXT/DIALOGUE/Chapter07/EriuTriangleAttack.dialogue.txt" ; B1CDD0
      dialogueChapter07VillageSpeedRing .include "TEXT/DIALOGUE/Chapter07/VillageSpeedRing.dialogue.txt" ; B1CDF9
      dialogueChapter07VillageBarrierBladeAnyone .include "TEXT/DIALOGUE/Chapter07/VillageBarrierBladeAnyone.dialogue.txt" ; B1CE7C
      dialogueChapter07Village1 .include "TEXT/DIALOGUE/Chapter07/Village1.dialogue.txt" ; B1CEBB
      dialogueChapter07Village2 .include "TEXT/DIALOGUE/Chapter07/Village2.dialogue.txt" ; B1CF4C
      dialogueChapter07Village3 .include "TEXT/DIALOGUE/Chapter07/Village3.dialogue.txt" ; B1CFFB
      dialogueChapter07VillageShieldRing .include "TEXT/DIALOGUE/Chapter07/VillageShieldRing.dialogue.txt" ; B1D08A
      dialogueChapter07KutuzovBattleQuote .include "TEXT/DIALOGUE/Chapter07/KutuzovBattleQuote.dialogue.txt" ; B1D216
      dialogueChapter07LizaBattleQuote .include "TEXT/DIALOGUE/Chapter07/LizaBattleQuote.dialogue.txt" ; B1D25B
      dialogueChapter07IshtoreBattleQuoteLizaDead .include "TEXT/DIALOGUE/Chapter07/IshtoreBattleQuoteLizaDead.dialogue.txt" ; B1D2AA
      dialogueChapter07IshtoreBattleQuoteLizaAlive .include "TEXT/DIALOGUE/Chapter07/IshtoreBattleQuoteLizaAlive.dialogue.txt" ; B1D2CC
      dialogueChapter07JavarroBattleQuote .include "TEXT/DIALOGUE/Chapter07/JavarroBattleQuote.dialogue.txt" ; B1D2EB
      dialogueChapter07BramselBattleQuote .include "TEXT/DIALOGUE/Chapter07/BramselBattleQuote.dialogue.txt" ; B1D307
      dialogueChapter07BanbaBattleQuote .include "TEXT/DIALOGUE/Chapter07/BanbaBattleQuote.dialogue.txt" ; B1D342
      dialogueChapter07FotlaBattleQuote .include "TEXT/DIALOGUE/Chapter07/FotlaBattleQuote.dialogue.txt" ; B1D35B
      dialogueChapter07EriuBattleQuote .include "TEXT/DIALOGUE/Chapter07/EriuBattleQuote.dialogue.txt" ; B1D372
      dialogueChapter07TineBattleQuote .include "TEXT/DIALOGUE/Chapter07/TineBattleQuote.dialogue.txt" ; B1D38C
      dialogueChapter07BloomBattleQuote .include "TEXT/DIALOGUE/Chapter07/BloomBattleQuote.dialogue.txt" ; B1D3A0

      .include "EVENTS/Chapter09/EventChapter09Opening.asm"
      .include "EVENTS/Chapter09/EventChapter09AltenaCharge.asm"
      .include "EVENTS/Chapter09/EventChapter09HannibalDefend.asm"
      .include "EVENTS/Chapter09/EventChapter09CoirpreHostage.asm"
      .include "EVENTS/Chapter09/EventChapter09LeifAltenaTalk.asm"
      .include "EVENTS/Chapter09/EventChapter09AltenaRespawn.asm"
      .include "EVENTS/Chapter09/EventChapter09TravantSpawnAltenaDead.asm"
      .include "EVENTS/Chapter09/EventChapter09HannibalCharge.asm"
      .include "EVENTS/Chapter09/EventChapter09SeliphAltenaTalk.asm"
      .include "EVENTS/Chapter09/EventChapter09HannibalNotRecruited.asm"
      .include "EVENTS/Chapter09/EventChapter09LutheciaSeized.asm"
      .include "EVENTS/Chapter09/EventChapter09CoirpreHannibalTalk.asm"
      .include "EVENTS/Chapter09/EventChapter09GrutiaSpawn.asm"
      .include "EVENTS/Chapter09/EventChapter09GrutiaSeized.asm"
      .include "EVENTS/Chapter09/EventChapter09ThraciaSpawn.asm"
      .include "EVENTS/Chapter09/EventChapter09ArionCharge.asm"
      .include "EVENTS/Chapter09/EventChapter09ArionDied.asm"
      .include "EVENTS/Chapter09/EventChapter09ThraciaSeized.asm"
      .include "EVENTS/Chapter09/EventChapter09Village1.asm"
      .include "EVENTS/Chapter09/EventChapter09Village2.asm"
      .include "EVENTS/Chapter09/EventChapter09Village3.asm"
      .include "EVENTS/Chapter09/EventChapter09Village4.asm"
      .include "EVENTS/Chapter09/EventChapter09VillageBarrierRing.asm"
      .include "EVENTS/Chapter09/EventChapter09Village5.asm"
      .include "EVENTS/Chapter09/EventChapter09_161.asm"
      .include "EVENTS/Chapter09/EventChapter09CharlotHannibalAdjacent.asm"
      .include "EVENTS/Chapter09/EventChapter09Village4Special.asm"
      .include "EVENTS/Chapter09/EventChapter09HawkLutheciaVisit.asm"
      .include "EVENTS/Chapter09/EventChapter09_168.asm"

      .include "EVENTS/ChapterFinal/EventChapterFinalOpening.asm"
      .include "EVENTS/ChapterFinal/EventChapterFinalEddaSeized.asm"
      .include "EVENTS/ChapterFinal/EventChapterFinalDozelSpawn.asm"
      .include "EVENTS/ChapterFinal/EventChapterFinalDozelSeized.asm"
      .include "EVENTS/ChapterFinal/EventChapterFinalFriegeSpawn.asm"
      .include "EVENTS/ChapterFinal/EventChapterFinalYngviSpawn.asm"
      .include "EVENTS/ChapterFinal/EventChapterFinalFriegeSeized.asm"
      .include "EVENTS/ChapterFinal/EventChapterFinalBelhallaSpawn.asm"
      .include "EVENTS/ChapterFinal/EventChapterFinalThraciaSpawn.asm"
      .include "EVENTS/ChapterFinal/EventChapterFinal_197.asm"
      .include "EVENTS/ChapterFinal/EventChapterFinalSeliphJuliaTalkManfroyDead.asm"
      .include "EVENTS/ChapterFinal/EventChapterFinalAltenaArionTalk.asm"
      .include "EVENTS/ChapterFinal/EventChapterFinalVelthomerSeized.asm"
      .include "EVENTS/ChapterFinal/EventChapterFinalJuliaVelthomerVisit.asm"
      .include "EVENTS/ChapterFinal/EventChapterFinalEnding.asm"
      .include "EVENTS/ChapterFinal/EventChapterFinalVillage1.asm"
      .include "EVENTS/ChapterFinal/EventChapterFinalVillage2.asm"
      .include "EVENTS/ChapterFinal/EventChapterFinalSeliphJuliaTalkManfroyAlive.asm"
      .include "EVENTS/ChapterFinal/EventChapterFinalJuliusDied.asm"
      .include "EVENTS/ChapterFinal/EventChapterFinal_1A1.asm"
      .include "EVENTS/ChapterFinal/EventChapterFinal_1A2.asm"

    rlASMCChapterFinalJuliaRecruitment ; B1/E8D9

      .al
      .autsiz
      .databank ?

      lda #Julia
      jsl rlGetUnitRAMDataPointerByID
      bcs +

        jsl rlGetSelectedUnitDeploymentOffset
        tax
        lda #FS_Player
        jsl rlChangeFactionSlotOfFieldedSelectedUnit

      +
      rtl

      .databank 0

      dialogueEpilogue_Febail .include "TEXT/DIALOGUE/Epilogue/Febail.dialogue.txt" ; B1E8EF
      dialogueEpilogue_Febail_WithLover .include "TEXT/DIALOGUE/Epilogue/Febail_WithLover.dialogue.txt" ; B1E8F5
      dialogueEpilogue_Piece_Febail .include "TEXT/DIALOGUE/Epilogue/Piece_Febail.dialogue.txt" ; B1E900
      dialogueEpilogue_Patty_FebailDead .include "TEXT/DIALOGUE/Epilogue/Patty_FebailDead.dialogue.txt" ; B1E9E6
      dialogueEpilogue_Patty_FebailAlive .include "TEXT/DIALOGUE/Epilogue/Patty_FebailAlive.dialogue.txt" ; B1EAC3
      dialogueEpilogue_Patty_LoverDead .include "TEXT/DIALOGUE/Epilogue/Patty_LoverDead.dialogue.txt" ; B1EBB3
      dialogueEpilogue_Lester_BrigidsChildrenDead .include "TEXT/DIALOGUE/Epilogue/Lester_BrigidsChildrenDead.dialogue.txt" ; B1EBB9
      dialogueEpilogue_Lester_BrigidsChildrenDead_WithLover .include "TEXT/DIALOGUE/Epilogue/Lester_BrigidsChildrenDead_WithLover.dialogue.txt" ; B1EBBF
      dialogueEpilogue_Lester_BrigidsChildrenAlive .include "TEXT/DIALOGUE/Epilogue/Lester_BrigidsChildrenAlive.dialogue.txt" ; B1EBCA
      dialogueEpilogue_Lester_BrigidsChildrenAlive_WithLover .include "TEXT/DIALOGUE/Epilogue/Lester_BrigidsChildrenAlive_WithLover.dialogue.txt" ; B1EBD0
      dialogueEpilogue_Piece_Lester_BrigidsChildrenDead .include "TEXT/DIALOGUE/Epilogue/Piece_Lester_BrigidsChildrenDead.dialogue.txt" ; B1EBDB
      dialogueEpilogue_Piece_Lester_BrigidsChildrenAlive .include "TEXT/DIALOGUE/Epilogue/Piece_Lester_BrigidsChildrenAlive.dialogue.txt" ; B1ECB7
      dialogueEpilogue_Lana_YngviChildrenDead .include "TEXT/DIALOGUE/Epilogue/Lana_YngviChildrenDead.dialogue.txt" ; B1ED4E
      dialogueEpilogue_Lana_YngviChildrenAlive_LoverDead .include "TEXT/DIALOGUE/Epilogue/Lana_YngviChildrenAlive_LoverDead.dialogue.txt" ; B1EE15
      dialogueEpilogue_Lana_YngviChildrenAlive_LesterDead .include "TEXT/DIALOGUE/Epilogue/Lana_YngviChildrenAlive_LesterDead.dialogue.txt" ; B1EEB6
      dialogueEpilogue_Lana_YngviChildrenAlive_LesterAlive .include "TEXT/DIALOGUE/Epilogue/Lana_YngviChildrenAlive_LesterAlive.dialogue.txt" ; B1EED0
      dialogueEpilogue_Piece_Lana_Start .include "TEXT/DIALOGUE/Epilogue/Piece_Lana_Start.dialogue.txt" ; B1EEF3
      dialogueEpilogue_Piece_Lana_End .include "TEXT/DIALOGUE/Epilogue/Piece_Lana_End.dialogue.txt" ; B1EF23
      dialogueEpilogue_AmidArthur .include "TEXT/DIALOGUE/Epilogue/AmidArthur.dialogue.txt" ; B1EF75
      dialogueEpilogue_AmidArthur_WithLover .include "TEXT/DIALOGUE/Epilogue/AmidArthur_WithLover.dialogue.txt" ; B1EF7B
      dialogueEpilogue_Piece_AmidArthur .include "TEXT/DIALOGUE/Epilogue/Piece_AmidArthur.dialogue.txt" ; B1EF86
      dialogueEpilogue_LindaTine_BrotherDead .include "TEXT/DIALOGUE/Epilogue/LindaTine_BrotherDead.dialogue.txt" ; B1F069
      dialogueEpilogue_LindaTine_BrotherAlive_LoverDead .include "TEXT/DIALOGUE/Epilogue/LindaTine_BrotherAlive_LoverDead.dialogue.txt" ; B1F0FC
      dialogueEpilogue_LindaTine_BrotherAlive .include "TEXT/DIALOGUE/Epilogue/LindaTine_BrotherAlive.dialogue.txt" ; B1F178
      dialogueEpilogue_LexSon .include "TEXT/DIALOGUE/Epilogue/LexSon.dialogue.txt" ; B1F1F0
      dialogueEpilogue_LexSon_WithLover .include "TEXT/DIALOGUE/Epilogue/LexSon_WithLover.dialogue.txt" ; B1F1F6
      dialogueEpilogue_Piece_LexChild .include "TEXT/DIALOGUE/Epilogue/Piece_LexChild.dialogue.txt" ; B1F201
      dialogueEpilogue_LexDaughter_BrotherDead .include "TEXT/DIALOGUE/Epilogue/LexDaughter_BrotherDead.dialogue.txt" ; B1F2FF
      dialogueEpilogue_LexDaughter_BrotherAlive .include "TEXT/DIALOGUE/Epilogue/LexDaughter_BrotherAlive.dialogue.txt" ; B1F305
      dialogueEpilogue_LexDaughter_BrotherAlive_LoverDead .include "TEXT/DIALOGUE/Epilogue/LexDaughter_BrotherAlive_LoverDead.dialogue.txt" ; B1F3A9
      dialogueEpilogue_Iuchar .include "TEXT/DIALOGUE/Epilogue/Iuchar.dialogue.txt" ; B1F45C
      dialogueEpilogue_Iuchar_WithLover .include "TEXT/DIALOGUE/Epilogue/Iuchar_WithLover.dialogue.txt" ; B1F462
      dialogueEpilogue_Piece_Iuchar .include "TEXT/DIALOGUE/Epilogue/Piece_Iuchar.dialogue.txt" ; B1F46D
      dialogueEpilogue_Iucharba .include "TEXT/DIALOGUE/Epilogue/Iucharba.dialogue.txt" ; B1F5CF
      dialogueEpilogue_Iucharba_WithLover .include "TEXT/DIALOGUE/Epilogue/Iucharba_WithLover.dialogue.txt" ; B1F5D5
      dialogueEpilogue_Piece_Iucharba .include "TEXT/DIALOGUE/Epilogue/Piece_Iucharba.dialogue.txt" ; B1F5E0
      dialogueEpilogue_ClaudsSon .include "TEXT/DIALOGUE/Epilogue/ClaudsSon.dialogue.txt" ; B1F6C8
      dialogueEpilogue_ClaudsSon_WithLover .include "TEXT/DIALOGUE/Epilogue/ClaudsSon_WithLover.dialogue.txt" ; B1F6CE
      dialogueEpilogue_Piece_ClaudsChild .include "TEXT/DIALOGUE/Epilogue/Piece_ClaudsChild.dialogue.txt" ; B1F6D9
      dialogueEpilogue_ClaudsDaughter_BrotherDead .include "TEXT/DIALOGUE/Epilogue/ClaudsDaughter_BrotherDead.dialogue.txt" ; B1F775
      dialogueEpilogue_ClaudsDaughter_BrotherAlive .include "TEXT/DIALOGUE/Epilogue/ClaudsDaughter_BrotherAlive.dialogue.txt" ; B1F77B
      dialogueEpilogue_ClaudsDaughter_BrotherAlive_LoverDead .include "TEXT/DIALOGUE/Epilogue/ClaudsDaughter_BrotherAlive_LoverDead.dialogue.txt" ; B1F786
      dialogueEpilogue_Piece_ClaudsDaughter_BrotherAlive .include "TEXT/DIALOGUE/Epilogue/Piece_ClaudsDaughter_BrotherAlive.dialogue.txt" ; B1F7A1
      dialogueEpilogue_Piece_ClaudsDaughter_End .include "TEXT/DIALOGUE/Epilogue/Piece_ClaudsDaughter_End.dialogue.txt" ; B1F7E8
      dialogueEpilogueLover_AzellesSon_Peppy .include "TEXT/DIALOGUE/Epilogue/Lover_AzellesSon_Peppy.dialogue.txt" ; B1F82E
      dialogueEpilogueLover_AzellesSon_CreidneLarcei .include "TEXT/DIALOGUE/Epilogue/Lover_AzellesSon_CreidneLarcei.dialogue.txt" ; B1F89B
      dialogueEpilogueLover_AzellesSon_MuirneLana .include "TEXT/DIALOGUE/Epilogue/Lover_AzellesSon_MuirneLana.dialogue.txt" ; B1F915
      dialogueEpilogueLover_AzellesSon_LindaTine .include "TEXT/DIALOGUE/Epilogue/Lover_AzellesSon_LindaTine.dialogue.txt" ; B1F985
      dialogueEpilogueLover_AzellesSon_JeanneNanna .include "TEXT/DIALOGUE/Epilogue/Lover_AzellesSon_JeanneNanna.dialogue.txt" ; B1F9F1
      dialogueEpilogueLover_Oifey_Peppy .include "TEXT/DIALOGUE/Epilogue/Lover_Oifey_Peppy.dialogue.txt" ; B1FA5E
      dialogueEpilogueLover_Oifey_Noble .include "TEXT/DIALOGUE/Epilogue/Lover_Oifey_Noble.dialogue.txt" ; B1FB1F
      dialogueEpilogueLover_Ced_Peppy .include "TEXT/DIALOGUE/Epilogue/Lover_Ced_Peppy.dialogue.txt" ; B1FBE0
      dialogueEpilogueLover_Ced_Noble .include "TEXT/DIALOGUE/Epilogue/Lover_Ced_Noble.dialogue.txt" ; B1FC4B
      dialogueEpilogueLover_LewynsSon_Peppy .include "TEXT/DIALOGUE/Epilogue/Lover_LewynsSon_Peppy.dialogue.txt" ; B1FCB9
      dialogueEpilogueLover_LewynsSon_Noble .include "TEXT/DIALOGUE/Epilogue/Lover_LewynsSon_Noble.dialogue.txt" ; B1FD2B

      .fill $B18000 + $8000 - *, 0

    .here

    * = $328000
    .logical $B28000

      .dsection Chapter06EventsSection
      .dsection Chapter06EventDataSection

      dialogueChapter01WorldMap1 .include "TEXT/DIALOGUE/Chapter01/WorldMap1.dialogue.txt" ; B284FB
      dialogueChapter01WorldMap2 .include "TEXT/DIALOGUE/Chapter01/WorldMap2.dialogue.txt" ; B28517
      dialogueChapter01WorldMap3 .include "TEXT/DIALOGUE/Chapter01/WorldMap3.dialogue.txt" ; B28543
      dialogueChapter01WorldMap4 .include "TEXT/DIALOGUE/Chapter01/WorldMap4.dialogue.txt" ; B28592
      dialogueChapter01WorldMap5 .include "TEXT/DIALOGUE/Chapter01/WorldMap5.dialogue.txt" ; B28639
      dialogueChapter01WorldMap6 .include "TEXT/DIALOGUE/Chapter01/WorldMap6.dialogue.txt" ; B286E8
      dialogueChapter01WorldMapUnused .include "TEXT/DIALOGUE/Chapter01/WorldMapUnused.dialogue.txt" ; B2876C

      .include "EVENTS/Chapter07/EventChapter07Opening.asm"
      .include "EVENTS/Chapter07/EventChapter07BramselWaiting.asm"
      .include "EVENTS/Chapter07/EventChapter07AedSeized.asm"
      .include "EVENTS/Chapter07/EventChapter07MelgenSpawn.asm"
      .include "EVENTS/Chapter07/EventChapter07AresThreatensBramsel.asm"
      .include "EVENTS/Chapter07/EventChapter07_0FB.asm"
      .include "EVENTS/Chapter07/EventChapter07MelgenSeized.asm"
      .include "EVENTS/Chapter07/EventChapter07UlsterSpawn.asm"
      .include "EVENTS/Chapter07/EventChapter07BloomCharge.asm"
      .include "EVENTS/Chapter07/EventChapter07AresRecruitment.asm"
      .include "EVENTS/Chapter07/EventChapter07BanbaDialogue.asm"
      .include "EVENTS/Chapter07/EventChapter07DahnaSeized.asm"
      .include "EVENTS/Chapter07/EventChapter07_102.asm"
      .include "EVENTS/Chapter07/EventChapter07Ending.asm"
      .include "EVENTS/Chapter07/EventChapter07ArthurTineTalk.asm"
      .include "EVENTS/Chapter07/EventChapter07AresDahnaVisit.asm"
      .include "EVENTS/Chapter07/EventChapter07TineDialogue.asm"
      .include "EVENTS/Chapter07/EventChapter07VillageSpeedRing.asm"
      .include "EVENTS/Chapter07/EventChapter07VillageBarrierBladeAnyone.asm"
      .include "EVENTS/Chapter07/EventChapter07Village1.asm"
      .include "EVENTS/Chapter07/EventChapter07Village2.asm"
      .include "EVENTS/Chapter07/EventChapter07Village3.asm"
      .include "EVENTS/Chapter07/EventChapter07VillageShieldRing.asm"
      .include "EVENTS/Chapter07/EventChapter07_10E.asm"
      .include "EVENTS/Chapter07/EventChapter07BanbaDied.asm"
      .include "EVENTS/Chapter07/EventChapter07FotlaDied.asm"
      .include "EVENTS/Chapter07/EventChapter07EriuDied.asm"
      .include "EVENTS/Chapter07/EventChapter07BloomDied.asm"
      .include "EVENTS/Chapter07/EventChapter07KutuzovFenrirFound.asm"
      .include "EVENTS/Chapter07/EventChapter07LeonsterSeized.asm"
      .include "EVENTS/Chapter07/EventChapter07_117.asm"
      .include "EVENTS/Chapter07/EventChapter07DahnaArmyTalk.asm"
      .include "EVENTS/Chapter07/EventChapter07VillageBarrierBladeLaylea.asm"
      .include "EVENTS/Chapter07/EventChapter07DaisyShannanAdjacent.asm"
      .include "EVENTS/Chapter07/EventChapter07DalvinTristanAdjacent.asm"

      .dsection EpilogueMovementSection

      dialogueChapterFinalOpening1 .include "TEXT/DIALOGUE/ChapterFinal/Opening1.dialogue.txt" ; B29916
      dialogueChapterFinalOpening2 .include "TEXT/DIALOGUE/ChapterFinal/Opening2.dialogue.txt" ; B29DC3
      dialogueChapterFinalOpening3 .include "TEXT/DIALOGUE/ChapterFinal/Opening3.dialogue.txt" ; B29E1D
      dialogueChapterFinalEddaSeized .include "TEXT/DIALOGUE/ChapterFinal/EddaSeized.dialogue.txt" ; B2A1B4
      dialogueChapterFinalEddaSeizedClaudsChildren .include "TEXT/DIALOGUE/ChapterFinal/EddaSeizedClaudsChildren.dialogue.txt" ; B2A22A
      dialogueChapterFinalEddaSeizedNoInheritor .include "TEXT/DIALOGUE/ChapterFinal/EddaSeizedNoInheritor.dialogue.txt" ; B2A275
      dialogueChapterFinalDozelSpawn .include "TEXT/DIALOGUE/ChapterFinal/DozelSpawn.dialogue.txt" ; B2A2BF
      dialogueChapterFinalDozelSeized .include "TEXT/DIALOGUE/ChapterFinal/DozelSeized.dialogue.txt" ; B2A344
      dialogueChapterFinalFriegeSpawn .include "TEXT/DIALOGUE/ChapterFinal/FriegeSpawn.dialogue.txt" ; B2A872
      dialogueChapterFinalYngviSpawn .include "TEXT/DIALOGUE/ChapterFinal/YngviSpawn.dialogue.txt" ; B2A963
      dialogueChapterFinalFriegeSeized .include "TEXT/DIALOGUE/ChapterFinal/FriegeSeized.dialogue.txt" ; B2A9C5
      dialogueChapterFinalBelhallaSpawn1 .include "TEXT/DIALOGUE/ChapterFinal/BelhallaSpawn1.dialogue.txt" ; B2ADBD
      dialogueChapterFinalThraciaSpawn .include "TEXT/DIALOGUE/ChapterFinal/ThraciaSpawn.dialogue.txt" ; B2B03B
      dialogueChapterFinalBelhallaSpawn2 .include "TEXT/DIALOGUE/ChapterFinal/BelhallaSpawn2.dialogue.txt" ; B2B0BD
      dialogueChapterFinalSeliphJuliaTalkManfroyDead .include "TEXT/DIALOGUE/ChapterFinal/SeliphJuliaTalkManfroyDead.dialogue.txt" ; B2B120
      dialogueChapterFinalAltenaArionTalk .include "TEXT/DIALOGUE/ChapterFinal/AltenaArionTalk.dialogue.txt" ; B2B2D1
      dialogueChapterFinalVelthomerSeized .include "TEXT/DIALOGUE/ChapterFinal/VelthomerSeized.dialogue.txt" ; B2B4AE
      dialogueChapterFinalJuliaVelthomerVisit .include "TEXT/DIALOGUE/ChapterFinal/JuliaVelthomerVisit.dialogue.txt" ; B2B5E6
      dialogueChapterFinalUnusedSeliphLewynTalk .include "TEXT/DIALOGUE/ChapterFinal/UnusedSeliphLewynTalk.dialogue.txt" ; B2B6B6
      dialogueChapterFinalSeliphJuliaTalkManfroyAlive .include "TEXT/DIALOGUE/ChapterFinal/SeliphJuliaTalkManfroyAlive.dialogue.txt" ; B2B6E8
      dialogueChapterFinalJuliusDiedManfroyDeath .include "TEXT/DIALOGUE/ChapterFinal/JuliusDiedManfroyDeath.dialogue.txt" ; B2B78B
      dialogueChapterFinalJuliusDiedJuliaRecruitment .include "TEXT/DIALOGUE/ChapterFinal/JuliusDiedJuliaRecruitment.dialogue.txt" ; B2B7E3
      dialogueChapterFinalRobertoBattleQuote .include "TEXT/DIALOGUE/ChapterFinal/RobertoBattleQuote.dialogue.txt" ; B2B84B
      dialogueChapterFinalBoyceBattleQuote .include "TEXT/DIALOGUE/ChapterFinal/BoyceBattleQuote.dialogue.txt" ; B2B878
      dialogueChapterFinalRodanBattleQuote .include "TEXT/DIALOGUE/ChapterFinal/RodanBattleQuote.dialogue.txt" ; B2B899
      dialogueChapterFinalJuphielBattleQuote .include "TEXT/DIALOGUE/ChapterFinal/JuphielBattleQuote.dialogue.txt" ; B2B8B6
      dialogueChapterFinalFisherBattleQuote .include "TEXT/DIALOGUE/ChapterFinal/FisherBattleQuote.dialogue.txt" ; B2B8E5
      dialogueChapterFinalBrianBattleQuote .include "TEXT/DIALOGUE/ChapterFinal/BrianBattleQuote.dialogue.txt" ; B2B908
      dialogueChapterFinalDagonBattleQuote .include "TEXT/DIALOGUE/ChapterFinal/DagonBattleQuote.dialogue.txt" ; B2B93E
      dialogueChapterFinalHildaBattleQuote .include "TEXT/DIALOGUE/ChapterFinal/HildaBattleQuote.dialogue.txt" ; B2B96D
      dialogueChapterFinalScipioBattleQuote .include "TEXT/DIALOGUE/ChapterFinal/ScipioBattleQuote.dialogue.txt" ; B2B98E
      dialogueChapterFinalBaranBattleQuote .include "TEXT/DIALOGUE/ChapterFinal/BaranBattleQuote.dialogue.txt" ; B2B9B9
      dialogueChapterFinalMengBattleQuote .include "TEXT/DIALOGUE/ChapterFinal/MengBattleQuote.dialogue.txt" ; B2B9E8
      dialogueChapterFinalMabelBattleQuote .include "TEXT/DIALOGUE/ChapterFinal/MabelBattleQuote.dialogue.txt" ; B2BA02
      dialogueChapterFinalBlegBattleQuote .include "TEXT/DIALOGUE/ChapterFinal/BlegBattleQuote.dialogue.txt" ; B2BA1C
      dialogueChapterFinalArionBattleQuote .include "TEXT/DIALOGUE/ChapterFinal/ArionBattleQuote.dialogue.txt" ; B2BA2F
      dialogueChapterFinalIshtarBattleQuote .include "TEXT/DIALOGUE/ChapterFinal/IshtarBattleQuote.dialogue.txt" ; B2BA41
      dialogueChapterFinalManfroyBattleQuote .include "TEXT/DIALOGUE/ChapterFinal/ManfroyBattleQuote.dialogue.txt" ; B2BA83
      dialogueChapterFinalJuliusBattleQuote .include "TEXT/DIALOGUE/ChapterFinal/JuliusBattleQuote.dialogue.txt" ; B2BABF
      dialogueChapterFinalJulia_JuliusBattleQuote .include "TEXT/DIALOGUE/ChapterFinal/Julia_JuliusBattleQuote.dialogue.txt" ; B2BAE9
      dialogueChapterFinalSeliph_JuliusBattleQuote .include "TEXT/DIALOGUE/ChapterFinal/Seliph_JuliusBattleQuote.dialogue.txt" ; B2BB14
      dialogueChapterFinalJuliaBattleQuote .include "TEXT/DIALOGUE/ChapterFinal/JuliaBattleQuote.dialogue.txt" ; B2BB68
      dialogueChapterFinalVillage1 .include "TEXT/DIALOGUE/ChapterFinal/Village1.dialogue.txt" ; B2BB7D
      dialogueChapterFinalVillage2 .include "TEXT/DIALOGUE/ChapterFinal/Village2.dialogue.txt" ; B2BD6F

      dialogueEpilogue_AzellesSon .include "TEXT/DIALOGUE/Epilogue/AzellesSon.dialogue.txt" ; B2BE13
      dialogueEpilogue_AzellesSon_WithLover .include "TEXT/DIALOGUE/Epilogue/AzellesSon_WithLover.dialogue.txt" ; B2BE19
      dialogueEpilogue_Piece_AzellesChild .include "TEXT/DIALOGUE/Epilogue/Piece_AzellesChild.dialogue.txt" ; B2BE24
      dialogueEpilogue_AzellesDaughter_BrotherDead .include "TEXT/DIALOGUE/Epilogue/AzellesDaughter_BrotherDead.dialogue.txt" ; B2BFA5
      dialogueEpilogue_AzellesDaughter_BrotherAlive .include "TEXT/DIALOGUE/Epilogue/AzellesDaughter_BrotherAlive.dialogue.txt" ; B2BFAB
      dialogueEpilogue_AzellesDaughter_BrotherAlive_LoverDead .include "TEXT/DIALOGUE/Epilogue/AzellesDaughter_BrotherAlive_LoverDead.dialogue.txt" ; B2BFFC
      dialogueEpilogue_Piece_AzellesDaughter_BrotherAlive .include "TEXT/DIALOGUE/Epilogue/Piece_AzellesDaughter_BrotherAlive.dialogue.txt" ; B2C07C
      dialogueEpilogue_Oifey .include "TEXT/DIALOGUE/Epilogue/Oifey.dialogue.txt" ; B2C0E0
      dialogueEpilogue_Oifey_WithLover .include "TEXT/DIALOGUE/Epilogue/Oifey_WithLover.dialogue.txt" ; B2C0E6
      dialogueEpilogue_Piece_Oifey .include "TEXT/DIALOGUE/Epilogue/Piece_Oifey.dialogue.txt" ; B2C0F1
      dialogueEpilogue_HawkCed .include "TEXT/DIALOGUE/Epilogue/HawkCed.dialogue.txt" ; B2C3E5
      dialogueEpilogue_HawkCed_WithLover .include "TEXT/DIALOGUE/Epilogue/HawkCed_WithLover.dialogue.txt" ; B2C3EB
      dialogueEpilogue_Piece_HawkCed .include "TEXT/DIALOGUE/Epilogue/Piece_HawkCed.dialogue.txt" ; B2C3F6
      dialogueEpilogue_HerminaFee_LoverDead .include "TEXT/DIALOGUE/Epilogue/HerminaFee_LoverDead.dialogue.txt" ; B2C4CD
      dialogueEpilogue_HerminaFee .include "TEXT/DIALOGUE/Epilogue/HerminaFee.dialogue.txt" ; B2C55F
      dialogueEpilogue_HerminaFee_LoverDead_Start .include "TEXT/DIALOGUE/Epilogue/HerminaFee_LoverDead_Start.dialogue.txt" ; B2C654
      dialogueEpilogue_LewynsSon_SisterDead .include "TEXT/DIALOGUE/Epilogue/LewynsSon_SisterDead.dialogue.txt" ; B2C6B7
      dialogueEpilogue_LewynsSon_SisterDead_WithLover .include "TEXT/DIALOGUE/Epilogue/LewynsSon_SisterDead_WithLover.dialogue.txt" ; B2C769
      dialogueEpilogue_LewynsSon_SisterAlive .include "TEXT/DIALOGUE/Epilogue/LewynsSon_SisterAlive.dialogue.txt" ; B2C90C
      dialogueEpilogue_LewynsSon_SisterAlive_WithLover .include "TEXT/DIALOGUE/Epilogue/LewynsSon_SisterAlive_WithLover.dialogue.txt" ; B2C9EE
      dialogueEpilogue_Piece_LewnysSon_Start2 .include "TEXT/DIALOGUE/Epilogue/Piece_LewnysSon_Start2.dialogue.txt" ; B2CA24
      dialogueEpilogue_Piece_LewnysSon_Start1 .include "TEXT/DIALOGUE/Epilogue/Piece_LewnysSon_Start1.dialogue.txt" ; B2CA64
      dialogueEpilogue_Piece_LewnysSon_NoLover .include "TEXT/DIALOGUE/Epilogue/Piece_LewnysSon_NoLover.dialogue.txt" ; B2CAD2
      dialogueEpilogue_LewynsDaughter_Priority .include "TEXT/DIALOGUE/Epilogue/LewynsDaughter_Priority.dialogue.txt" ; B2CBA1
      dialogueEpilogue_LewynsDaughter_NoPriority .include "TEXT/DIALOGUE/Epilogue/LewynsDaughter_NoPriority.dialogue.txt" ; B2CD8D
      dialogueEpilogue_Piece_LewynsDaughter_NoPriority_End .include "TEXT/DIALOGUE/Epilogue/Piece_LewynsDaughter_NoPriority_End.dialogue.txt" ; B2CE45
      dialogueEpilogue_Ending .include "TEXT/DIALOGUE/Epilogue/Ending.dialogue.txt" ; B2CE76

      aEpiloguePointers .include "TABLES/SYSTEM/EpiloguePointers.csv.asm"
      aEpilogueRegionEndDialoguePointers .include "TABLES/SYSTEM/EpilogueRegionEndDialoguePointers.csv.asm"
      .dsection EpilogueDialoguePointersSection

      dialogueChapter03Village4SylvaleSeized .include "TEXT/DIALOGUE/Chapter03/Village4SylvaleSeized.dialogue.txt" ; B2D2AA
      dialogueChapter04VillageSafeguardSilvia1 .include "TEXT/DIALOGUE/Chapter04/VillageSafeguardSilvia1.dialogue.txt" ; B2D2FB
      dialogueChapter04VillageSafeguardSilvia2 .include "TEXT/DIALOGUE/Chapter04/VillageSafeguardSilvia2.dialogue.txt" ; B2D3C4
      dialogueChapter04VillageSafeguardSilvia3 .include "TEXT/DIALOGUE/Chapter04/VillageSafeguardSilvia3.dialogue.txt" ; B2D3D6
      dialogueChapter04VillageSafeguardSilvia4 .include "TEXT/DIALOGUE/Chapter04/VillageSafeguardSilvia4.dialogue.txt" ; B2D3E8
      dialogueChapter04VillageSafeguardSilvia5 .include "TEXT/DIALOGUE/Chapter04/VillageSafeguardSilvia5.dialogue.txt" ; B2D3F9
      dialogueChapter06CreidneIucharAdjacent .include "TEXT/DIALOGUE/Chapter06/CreidneIucharAdjacent.dialogue.txt" ; B2D497
      dialogueChapter06CreidneIucharbaAdjacent .include "TEXT/DIALOGUE/Chapter06/CreidneIucharbaAdjacent.dialogue.txt" ; B2D4B5
      dialogueChapter06CreidneBrotherAdjacent1 .include "TEXT/DIALOGUE/Chapter06/CreidneBrotherAdjacent1.dialogue.txt" ; B2D4D3
      dialogueChapter06CreidneIucharAdjacent2 .include "TEXT/DIALOGUE/Chapter06/CreidneIucharAdjacent2.dialogue.txt" ; B2D4F7
      dialogueChapter06CreidneIucharbaAdjacent2 .include "TEXT/DIALOGUE/Chapter06/CreidneIucharbaAdjacent2.dialogue.txt" ; B2D547
      dialogueChapter06CreidneBrotherAdjacent3 .include "TEXT/DIALOGUE/Chapter06/CreidneBrotherAdjacent3.dialogue.txt" ; B2D56F
      dialogueChapter06Village2Seliph .include "TEXT/DIALOGUE/Chapter06/Village2Seliph.dialogue.txt" ; B2D578
      dialogueChapter03DewBragiTower1 .include "TEXT/DIALOGUE/Chapter03/DewBragiTower1.dialogue.txt" ; B2D726
      dialogueChapter03DewBragiTower2 .include "TEXT/DIALOGUE/Chapter03/DewBragiTower2.dialogue.txt" ; B2D766
      dialogueChapter03DewBragiTower3 .include "TEXT/DIALOGUE/Chapter03/DewBragiTower3.dialogue.txt" ; B2D81C
      dialogueChapter02MountainArmorTalk .include "TEXT/DIALOGUE/Chapter02/MountainArmorTalk.dialogue.txt" ; B2D862
      dialogueChapter01CrossknightTalk .include "TEXT/DIALOGUE/Chapter01/CrossknightTalk.dialogue.txt" ; B2D8D3
      dialogueChapter03SylvaleCommanderTalk .include "TEXT/DIALOGUE/Chapter03/SylvaleCommanderTalk.dialogue.txt" ; B2D8D3
      dialogueChapter06SofalaArmyTalk .include "TEXT/DIALOGUE/Chapter06/SofalaArmyTalk.dialogue.txt" ; B2D92F
      dialogueChapter06IsaachArmyTalk .include "TEXT/DIALOGUE/Chapter06/IsaachArmyTalk.dialogue.txt" ; B2D998
      dialogueChapter07DahnaArmyTalk .include "TEXT/DIALOGUE/Chapter07/DahnaArmyTalk.dialogue.txt" ; B2DA08
      dialogueChapter07VillageBarrierBladeLaylea .include "TEXT/DIALOGUE/Chapter07/VillageBarrierBladeLaylea.dialogue.txt" ; B2DA44
      dialogueChapter08LeifNearMountain .include "TEXT/DIALOGUE/Chapter08/LeifNearMountain.dialogue.txt" ; B2DB86
      dialogueChapter05ArdenOnCliff .include "TEXT/DIALOGUE/Chapter05/ArdenOnCliff.dialogue.txt" ; B2DBC9
      dialogueChapter07DaisyShannanAdjacent .include "TEXT/DIALOGUE/Chapter07/DaisyShannanAdjacent.dialogue.txt" ; B2DC78
      dialogueChapter10SeliphAtSea .include "TEXT/DIALOGUE/Chapter10/SeliphAtSea.dialogue.txt" ; B2DDDC
      dialogueChapter08FeeOnMountain .include "TEXT/DIALOGUE/Chapter08/FeeOnMountain.dialogue.txt" ; B2E093
      dialogueChapter04ErinysSilviaAdjacent .include "TEXT/DIALOGUE/Chapter04/ErinysSilviaAdjacent.dialogue.txt" ; B2E187
      dialogueChapter09CharlotHannibalAdjacent .include "TEXT/DIALOGUE/Chapter09/CharlotHannibalAdjacent.dialogue.txt" ; B2E359
      dialogueChapter08MuirneSeliphAdjacent .include "TEXT/DIALOGUE/Chapter08/MuirneSeliphAdjacent.dialogue.txt" ; B2E53C
      dialogueChapter09Village4Special .include "TEXT/DIALOGUE/Chapter09/Village4Special.dialogue.txt" ; B2E7DA
      dialogueChapter08LindaOnTree .include "TEXT/DIALOGUE/Chapter08/LindaOnTree.dialogue.txt" ; B2EA49
      dialogueChapter09HawkLutheciaVisit .include "TEXT/DIALOGUE/Chapter09/HawkLutheciaVisit.dialogue.txt" ; B2EC7F
      dialogueChapter08Village3Asaello .include "TEXT/DIALOGUE/Chapter08/Village3Asaello.dialogue.txt" ; B2ED67
      dialogueChapter06DeimneIsaachVisit .include "TEXT/DIALOGUE/Chapter06/DeimneIsaachVisit.dialogue.txt" ; B2EE5F
      dialogueChapter07DalvinTristanAdjacent1 .include "TEXT/DIALOGUE/Chapter07/DalvinTristanAdjacent1.dialogue.txt" ; B2F174
      dialogueChapter07DalvinTristanAdjacent2 .include "TEXT/DIALOGUE/Chapter07/DalvinTristanAdjacent2.dialogue.txt" ; B2F3FF
      dialogueChapter07DalvinTristanAdjacent3 .include "TEXT/DIALOGUE/Chapter07/DalvinTristanAdjacent3.dialogue.txt" ; B2F40E
      dialogueChapter08AmidOnTree .include "TEXT/DIALOGUE/Chapter08/AmidOnTree.dialogue.txt" ; B2F41E
      dialogueChapter02ArdenPursuitRing .include "TEXT/DIALOGUE/Chapter02/ArdenPursuitRing.dialogue.txt" ; B2F6C3
      dialogueChapter02UnusedTired .include "TEXT/DIALOGUE/Chapter02/UnusedTired.dialogue.txt" ; B2F7BE

      .include "EVENTS/ChapterPrologue/EventPrologueEthlynSigurdTalk.asm"
      .include "EVENTS/ChapterPrologue/EventPrologueAzelleSigurdTalk.asm"
      .include "EVENTS/ChapterPrologue/EventPrologueLexSigurdTalk.asm"
      .include "EVENTS/ChapterPrologue/EventPrologueUnusedAlecEthlynTalk.asm"
      .include "EVENTS/ChapterPrologue/EventPrologueQuanSigurdTalk.asm"
      .include "EVENTS/ChapterPrologue/EventPrologueUnusedMidirAzelleTalk.asm"
      .include "EVENTS/ChapterPrologue/EventPrologueUnusedNaoiseAlecTalk.asm"
      .include "EVENTS/Chapter01/EventChapter01QuanFinnTalk.asm"
      .include "EVENTS/Chapter01/EventChapter01MidirEdainTalk.asm"
      .include "EVENTS/Chapter01/EventChapter01SigurdEdainTalk.asm"
      .include "EVENTS/Chapter01/EventChapter01AzelleEdainTalk.asm"
      .include "EVENTS/Chapter01/EventChapter01EdainEthlynTalk.asm"
      .include "EVENTS/Chapter01/EventChapter01DewEdainTalk.asm"
      .include "EVENTS/Chapter01/EventChapter01AyraQuanTalk.asm"
      .include "EVENTS/Chapter02/EventChapter02DewLachesisTalk.asm"
      .include "EVENTS/Chapter02/EventChapter02DeirdreEthlynTalk.asm"
      .include "EVENTS/Chapter02/EventChapter02QuanFinnTalk.asm"
      .include "EVENTS/Chapter02/EventChapter02SigurdLewynTalk.asm"
      .include "EVENTS/Chapter02/EventChapter02BeowulfLachesisTalk.asm"
      .include "EVENTS/Chapter02/EventChapter02AlecSilviaTalk.asm"
      .include "EVENTS/Chapter02/EventChapter02SilviaSigurdTalk.asm"
      .include "EVENTS/Chapter02/EventChapter02ErinysSigurdTalk.asm"

      dialogueEpilogueLover_CharlotCoirpre_HannibalAlive_Peppy .include "TEXT/DIALOGUE/Epilogue/Lover_CharlotCoirpre_HannibalAlive_Peppy.dialogue.txt" ; B2FA8D
      dialogueEpilogueLover_CharlotCoirpre_HannibalAlive_CreidneLarcei .include "TEXT/DIALOGUE/Epilogue/Lover_CharlotCoirpre_HannibalAlive_CreidneLarcei.dialogue.txt" ; B2FB06
      dialogueEpilogueLover_CharlotCoirpre_HannibalAlive_MuirneLana .include "TEXT/DIALOGUE/Epilogue/Lover_CharlotCoirpre_HannibalAlive_MuirneLana.dialogue.txt" ; B2FB7A
      dialogueEpilogueLover_CharlotCoirpre_HannibalAlive_LindaTine .include "TEXT/DIALOGUE/Epilogue/Lover_CharlotCoirpre_HannibalAlive_LindaTine.dialogue.txt" ; B2FBF3
      dialogueEpilogueLover_CharlotCoirpre_HannibalAlive_JeanneNanna .include "TEXT/DIALOGUE/Epilogue/Lover_CharlotCoirpre_HannibalAlive_JeanneNanna.dialogue.txt" ; B2FC69
      dialogueEpilogueLover_Asaello_DaisyDead_Peppy .include "TEXT/DIALOGUE/Epilogue/Lover_Asaello_DaisyDead_Peppy.dialogue.txt" ; B2FCE0
      dialogueEpilogueLover_Asaello_DaisyDead_CreidneLarcei .include "TEXT/DIALOGUE/Epilogue/Lover_Asaello_DaisyDead_CreidneLarcei.dialogue.txt" ; B2FD85
      dialogueEpilogueLover_Asaello_DaisyDead_Noble .include "TEXT/DIALOGUE/Epilogue/Lover_Asaello_DaisyDead_Noble.dialogue.txt" ; B2FE52

      .fill $B28000 + $8000 - *, 0

    .here

    * = $338000
    .logical $B38000

      dialogueChapter09Opening1 .include "TEXT/DIALOGUE/Chapter09/Opening1.dialogue.txt" ; B38000
      dialogueChapter09Opening2 .include "TEXT/DIALOGUE/Chapter09/Opening2.dialogue.txt" ; B38294
      dialogueChapter09Opening3 .include "TEXT/DIALOGUE/Chapter09/Opening3.dialogue.txt" ; B38396
      dialogueChapter09Opening4 .include "TEXT/DIALOGUE/Chapter09/Opening4.dialogue.txt" ; B386C6
      dialogueChapter09Opening5 .include "TEXT/DIALOGUE/Chapter09/Opening5.dialogue.txt" ; B38804
      dialogueChapter09Opening6 .include "TEXT/DIALOGUE/Chapter09/Opening6.dialogue.txt" ; B388CA
      dialogueChapter09Opening6OifeyAlive .include "TEXT/DIALOGUE/Chapter09/Opening6OifeyAlive.dialogue.txt" ; B38A1E
      dialogueChapter09Opening7LeifFinn .include "TEXT/DIALOGUE/Chapter09/Opening7LeifFinn.dialogue.txt" ; B38B6E
      dialogueChapter09AltenaCharge .include "TEXT/DIALOGUE/Chapter09/AltenaCharge.dialogue.txt" ; B38ED5
      dialogueChapter09HannibalDefend .include "TEXT/DIALOGUE/Chapter09/HannibalDefend.dialogue.txt" ; B38F07
      dialogueChapter09CoirpreHostage .include "TEXT/DIALOGUE/Chapter09/CoirpreHostage.dialogue.txt" ; B38FF6
      dialogueChapter09LeifAltenaTalk1 .include "TEXT/DIALOGUE/Chapter09/LeifAltenaTalk1.dialogue.txt" ; B390CE
      dialogueChapter09LeifAltenaTalk2 .include "TEXT/DIALOGUE/Chapter09/LeifAltenaTalk2.dialogue.txt" ; B392F5
      dialogueChapter09AltenaRespawn .include "TEXT/DIALOGUE/Chapter09/AltenaRespawn.dialogue.txt" ; B39744
      dialogueChapter09TravantSpawnAltenaDead .include "TEXT/DIALOGUE/Chapter09/TravantSpawnAltenaDead.dialogue.txt" ; B3999D
      dialogueChapter09HannibalCharge .include "TEXT/DIALOGUE/Chapter09/HannibalCharge.dialogue.txt" ; B39B4B
      dialogueChapter09SeliphAltenaTalk .include "TEXT/DIALOGUE/Chapter09/SeliphAltenaTalk.dialogue.txt" ; B39BA6
      dialogueChapter09HannibalNotRecruited .include "TEXT/DIALOGUE/Chapter09/HannibalNotRecruited.dialogue.txt" ; B39EE2
      dialogueChapter09LutheciaSeized .include "TEXT/DIALOGUE/Chapter09/LutheciaSeized.dialogue.txt" ; B39F67
      dialogueChapter09LutheciaSeizedNoCoirpre .include "TEXT/DIALOGUE/Chapter09/LutheciaSeizedNoCoirpre.dialogue.txt" ; B3A11B
      dialogueChapter09CoirpreHannibalTalk .include "TEXT/DIALOGUE/Chapter09/CoirpreHannibalTalk.dialogue.txt" ; B3A1E1
      dialogueChapter09UnusedJedahKapathogiaSeizedResponse .include "TEXT/DIALOGUE/Chapter09/UnusedJedahKapathogiaSeizedResponse.dialogue.txt" ; B3A303
      dialogueChapter09UnusedMusarCharge .include "TEXT/DIALOGUE/Chapter09/UnusedMusarCharge.dialogue.txt" ; B3A37C
      dialogueChapter09GrutiaSeized .include "TEXT/DIALOGUE/Chapter09/GrutiaSeized.dialogue.txt" ; B3A406
      dialogueChapter09GrutiaSeizedAltenaRecruited .include "TEXT/DIALOGUE/Chapter09/GrutiaSeizedAltenaRecruited.dialogue.txt" ; B3A4E8
      dialogueChapter09ThraciaSpawn .include "TEXT/DIALOGUE/Chapter09/ThraciaSpawn.dialogue.txt" ; B3A512
      dialogueChapter09ArionCharge .include "TEXT/DIALOGUE/Chapter09/ArionCharge.dialogue.txt" ; B3A591
      dialogueChapter09ArionDied .include "TEXT/DIALOGUE/Chapter09/ArionDied.dialogue.txt" ; B3A5E9
      dialogueChapter09Ending .include "TEXT/DIALOGUE/Chapter09/Ending.dialogue.txt" ; B3A622
      dialogueChapter09AltenaArionBattleQuote .include "TEXT/DIALOGUE/Chapter09/AltenaArionBattleQuote.dialogue.txt" ; B3A779
      dialogueChapter09UnusedAltenaArionDeathQuote .include "TEXT/DIALOGUE/Chapter09/UnusedAltenaArionDeathQuote.dialogue.txt" ; B3A803
      dialogueChapter09Village1 .include "TEXT/DIALOGUE/Chapter09/Village1.dialogue.txt" ; B3A82C
      dialogueChapter09Village2 .include "TEXT/DIALOGUE/Chapter09/Village2.dialogue.txt" ; B3A893
      dialogueChapter09Village3 .include "TEXT/DIALOGUE/Chapter09/Village3.dialogue.txt" ; B3A907
      dialogueChapter09Village4 .include "TEXT/DIALOGUE/Chapter09/Village4.dialogue.txt" ; B3A9A1
      dialogueChapter09VillageBarrierRing .include "TEXT/DIALOGUE/Chapter09/VillageBarrierRing.dialogue.txt" ; B3A9F1
      dialogueChapter09Village5MusarAlive .include "TEXT/DIALOGUE/Chapter09/Village5MusarAlive.dialogue.txt" ; B3AAAE
      dialogueChapter09Village5MusarDead .include "TEXT/DIALOGUE/Chapter09/Village5MusarDead.dialogue.txt" ; B3AB26
      dialogueChapter09AltenaBattleQuote .include "TEXT/DIALOGUE/Chapter09/AltenaBattleQuote.dialogue.txt" ; B3AB56
      dialogueChapter09HannibalBattleQuote .include "TEXT/DIALOGUE/Chapter09/HannibalBattleQuote.dialogue.txt" ; B3AB7A
      dialogueChapter09KanatzBattleQuote .include "TEXT/DIALOGUE/Chapter09/KanatzBattleQuote.dialogue.txt" ; B3ABAE
      dialogueChapter09DistlerBattleQuote .include "TEXT/DIALOGUE/Chapter09/DistlerBattleQuote.dialogue.txt" ; B3ABEE
      dialogueChapter09MusarBattleQuote .include "TEXT/DIALOGUE/Chapter09/MusarBattleQuote.dialogue.txt" ; B3AC14
      dialogueChapter09JudahBattleQuote .include "TEXT/DIALOGUE/Chapter09/JudahBattleQuote.dialogue.txt" ; B3AC45
      dialogueChapter09ArionBattleQuote .include "TEXT/DIALOGUE/Chapter09/ArionBattleQuote.dialogue.txt" ; B3AC94
      dialogueChapter09TravantBattleQuote .include "TEXT/DIALOGUE/Chapter09/TravantBattleQuote.dialogue.txt" ; B3ACCC

      dialogueChapter10Opening1 .include "TEXT/DIALOGUE/Chapter10/Opening1.dialogue.txt" ; B3AD0A
      dialogueChapter10Opening2 .include "TEXT/DIALOGUE/Chapter10/Opening2.dialogue.txt" ; B3B1EB
      dialogueChapter10CivilianRescued1 .include "TEXT/DIALOGUE/Chapter10/CivilianRescued1.dialogue.txt" ; B3B297
      dialogueChapter10CivilianRescued2 .include "TEXT/DIALOGUE/Chapter10/CivilianRescued2.dialogue.txt" ; B3B2BB
      dialogueChapter10CivilianRescued3 .include "TEXT/DIALOGUE/Chapter10/CivilianRescued3.dialogue.txt" ; B3B2DB
      dialogueChapter10CivilianRescued4 .include "TEXT/DIALOGUE/Chapter10/CivilianRescued4.dialogue.txt" ; B3B2FF
      dialogueChapter10CivilianRescued5 .include "TEXT/DIALOGUE/Chapter10/CivilianRescued5.dialogue.txt" ; B3B325
      dialogueChapter10CivilianRescued6 .include "TEXT/DIALOGUE/Chapter10/CivilianRescued6.dialogue.txt" ; B3B348
      dialogueChapter10Opening3 .include "TEXT/DIALOGUE/Chapter10/Opening3.dialogue.txt" ; B3B35F
      dialogueChapter10RiddellLeisurelyCharge .include "TEXT/DIALOGUE/Chapter10/RiddellLeisurelyCharge.dialogue.txt" ; B3B4BB
      dialogueChapter10Opening4 .include "TEXT/DIALOGUE/Chapter10/Opening4.dialogue.txt" ; B3B4EA
      dialogueChapter10Opening5 .include "TEXT/DIALOGUE/Chapter10/Opening5.dialogue.txt" ; B3B5A0
      dialogueChapter10ChronosSeized .include "TEXT/DIALOGUE/Chapter10/ChronosSeized.dialogue.txt" ; B3B6C0
      dialogueChapter10ChronosSeizedBeforeRados .include "TEXT/DIALOGUE/Chapter10/ChronosSeizedBeforeRados.dialogue.txt" ; B3B728
      dialogueChapter10RadosSeized .include "TEXT/DIALOGUE/Chapter10/RadosSeized.dialogue.txt" ; B3B78A
      dialogueChapter10RadosSeizedAfterChronos .include "TEXT/DIALOGUE/Chapter10/RadosSeizedAfterChronos.dialogue.txt" ; B3B859
      dialogueChapter10MiletosSpawn .include "TEXT/DIALOGUE/Chapter10/MiletosSpawn.dialogue.txt" ; B3B8D6
      dialogueChapter10MiletosSeized .include "TEXT/DIALOGUE/Chapter10/MiletosSeized.dialogue.txt" ; B3BFB2
      dialogueChapter10ChalphySpawn1 .include "TEXT/DIALOGUE/Chapter10/ChalphySpawn1.dialogue.txt" ; B3C0AB
      dialogueChapter10ChalphySpawn2 .include "TEXT/DIALOGUE/Chapter10/ChalphySpawn2.dialogue.txt" ; B3C5D9
      dialogueChapter10SeliphPalmarchTalk .include "TEXT/DIALOGUE/Chapter10/SeliphPalmarchTalk.dialogue.txt" ; B3C673
      dialogueChapter10Ending .include "TEXT/DIALOGUE/Chapter10/Ending.dialogue.txt" ; B3C837
      dialogueChapter10SeliphArvisBattleQuote .include "TEXT/DIALOGUE/Chapter10/SeliphArvisBattleQuote.dialogue.txt" ; B3CA04
      dialogueChapter10RiddellBattleQuote .include "TEXT/DIALOGUE/Chapter10/RiddellBattleQuote.dialogue.txt" ; B3CA88
      dialogueChapter10HildaBattleQuote .include "TEXT/DIALOGUE/Chapter10/HildaBattleQuote.dialogue.txt" ; B3CAAE
      dialogueChapter10MorriganBattleQuote .include "TEXT/DIALOGUE/Chapter10/MorriganBattleQuote.dialogue.txt" ; B3CADE
      dialogueChapter10JuliusBattleQuote .include "TEXT/DIALOGUE/Chapter10/JuliusBattleQuote.dialogue.txt" ; B3CB05
      dialogueChapter10IshtarBattleQuote .include "TEXT/DIALOGUE/Chapter10/IshtarBattleQuote.dialogue.txt" ; B3CB28
      dialogueChapter10IshtarDied .include "TEXT/DIALOGUE/Chapter10/IshtarDied.dialogue.txt" ; B3CB49
      dialogueChapter10IshtarKilledUnit .include "TEXT/DIALOGUE/Chapter10/IshtarKilledUnit.dialogue.txt" ; B3CB70
      dialogueChapter10JuliusKilledUnit .include "TEXT/DIALOGUE/Chapter10/JuliusKilledUnit.dialogue.txt" ; B3CBB1
      dialogueChapter10MiletosSeizedJuliusLeave .include "TEXT/DIALOGUE/Chapter10/MiletosSeizedJuliusLeave.dialogue.txt" ; B3CBED
      dialogueChapter10ZagamBattleQuote .include "TEXT/DIALOGUE/Chapter10/ZagamBattleQuote.dialogue.txt" ; B3CC23
      dialogueChapter10ArvisBattleQuote .include "TEXT/DIALOGUE/Chapter10/ArvisBattleQuote.dialogue.txt" ; B3CC48
      dialogueChapter10Village1 .include "TEXT/DIALOGUE/Chapter10/Village1.dialogue.txt" ; B3CC76
      dialogueChapter10Village2 .include "TEXT/DIALOGUE/Chapter10/Village2.dialogue.txt" ; B3CCD1
      dialogueChapter10VillageMagicRing .include "TEXT/DIALOGUE/Chapter10/VillageMagicRing.dialogue.txt" ; B3CD54
      dialogueChapter10Village3 .include "TEXT/DIALOGUE/Chapter10/Village3.dialogue.txt" ; B3CDE6
      dialogueChapter10Village4 .include "TEXT/DIALOGUE/Chapter10/Village4.dialogue.txt" ; B3CEAF
      dialogueChapter10Village5 .include "TEXT/DIALOGUE/Chapter10/Village5.dialogue.txt" ; B3CF42

      dialogueEpilogue_Belhalla .include "TEXT/DIALOGUE/Epilogue/Belhalla.dialogue.txt" ; B3CF9D
      dialogueEpilogue_Isaach .include "TEXT/DIALOGUE/Epilogue/Isaach.dialogue.txt" ; B3CFA8
      dialogueEpilogue_NewThracia .include "TEXT/DIALOGUE/Epilogue/NewThracia.dialogue.txt" ; B3CFB3
      dialogueEpilogue_Agustria .include "TEXT/DIALOGUE/Epilogue/Agustria.dialogue.txt" ; B3CFBE
      dialogueEpilogue_Verdane .include "TEXT/DIALOGUE/Epilogue/Verdane.dialogue.txt" ; B3CFC9
      dialogueEpilogue_Yngvi .include "TEXT/DIALOGUE/Epilogue/Yngvi.dialogue.txt" ; B3CFD4
      dialogueEpilogue_Friege .include "TEXT/DIALOGUE/Epilogue/Friege.dialogue.txt" ; B3CFDF
      dialogueEpilogue_Dozel .include "TEXT/DIALOGUE/Epilogue/Dozel.dialogue.txt" ; B3CFEA
      dialogueEpilogue_Edda .include "TEXT/DIALOGUE/Epilogue/Edda.dialogue.txt" ; B3CFF5
      dialogueEpilogue_Velthomer .include "TEXT/DIALOGUE/Epilogue/Velthomer.dialogue.txt" ; B3D000
      dialogueEpilogue_Chalphy .include "TEXT/DIALOGUE/Epilogue/Chalphy.dialogue.txt" ; B3D00B
      dialogueEpilogue_Silesse .include "TEXT/DIALOGUE/Epilogue/Silesse.dialogue.txt" ; B3D016

      dialogueChapter07LeneSeliphTalk .include "TEXT/DIALOGUE/Chapter07/LeneSeliphTalk.dialogue.txt" ; B3D021
      dialogueChapter07FinnNannaTalk .include "TEXT/DIALOGUE/Chapter07/FinnNannaTalk.dialogue.txt" ; B3D0CB
      dialogueChapter07FinnLanaTalk .include "TEXT/DIALOGUE/Chapter07/FinnLanaTalk.dialogue.txt" ; B3D1F5
      dialogueChapter07FinnLarceiTalk .include "TEXT/DIALOGUE/Chapter07/FinnLarceiTalk.dialogue.txt" ; B3D385

      dialogueChapter08FebailSeliphTalk .include "TEXT/DIALOGUE/Chapter08/FebailSeliphTalk.dialogue.txt" ; B3D507
      dialogueChapter08HerminaHawkTalk .include "TEXT/DIALOGUE/Chapter08/HerminaHawkTalk.dialogue.txt" ; B3D5E1
      dialogueChapter08FeeCedTalk .include "TEXT/DIALOGUE/Chapter08/FeeCedTalk.dialogue.txt" ; B3D79A
      dialogueChapter08NannaAresTalk .include "TEXT/DIALOGUE/Chapter08/NannaAresTalk.dialogue.txt" ; B3D982
      dialogueChapter08CedSeliphTalk .include "TEXT/DIALOGUE/Chapter08/CedSeliphTalk.dialogue.txt" ; B3DCCE
      dialogueChapter08SeliphTineTalk .include "TEXT/DIALOGUE/Chapter08/SeliphTineTalk.dialogue.txt" ; B3DF3B
      dialogueChapter08JuliaSeliphTalk .include "TEXT/DIALOGUE/Chapter08/JuliaSeliphTalk.dialogue.txt" ; B3E0B4
      dialogueChapter08ArthurFeeTalk .include "TEXT/DIALOGUE/Chapter08/ArthurFeeTalk.dialogue.txt" ; B3E1B7
      dialogueChapter08FinnLeifTalk .include "TEXT/DIALOGUE/Chapter08/FinnLeifTalk.dialogue.txt" ; B3E2C1

      dialogueChapter09FebailPattyTalk .include "TEXT/DIALOGUE/Chapter09/FebailPattyTalk.dialogue.txt" ; B3E4F6
      
      dialogueEpilogueLover_Asaello_DaisyAlive_Peppy .include "TEXT/DIALOGUE/Epilogue/Lover_Asaello_DaisyAlive_Peppy.dialogue.txt" ; B3E7BA
      dialogueEpilogueLover_Asaello_DaisyAlive_CreidneLarcei .include "TEXT/DIALOGUE/Epilogue/Lover_Asaello_DaisyAlive_CreidneLarcei.dialogue.txt" ; B3E86B
      dialogueEpilogueLover_Asaello_DaisyAlive_MuirneLana .include "TEXT/DIALOGUE/Epilogue/Lover_Asaello_DaisyAlive_MuirneLana.dialogue.txt" ; B3EA1B
      dialogueEpilogueLover_Asaello_DaisyAlive_LindaTine .include "TEXT/DIALOGUE/Epilogue/Lover_Asaello_DaisyAlive_LindaTine.dialogue.txt" ; B3EAA4
      dialogueEpilogueLover_Asaello_DaisyAlive_JeanneNanna .include "TEXT/DIALOGUE/Epilogue/Lover_Asaello_DaisyAlive_JeanneNanna.dialogue.txt" ; B3EB37
      dialogueEpilogueLover_Ares_Peppy .include "TEXT/DIALOGUE/Epilogue/Lover_Ares_Peppy.dialogue.txt" ; B3EBD1
      dialogueEpilogueLover_Ares_CreidneLarcei .include "TEXT/DIALOGUE/Epilogue/Lover_Ares_CreidneLarcei.dialogue.txt" ; B3EC75
      dialogueEpilogueLover_Ares_Noble .include "TEXT/DIALOGUE/Epilogue/Lover_Ares_Noble.dialogue.txt" ; B3ED26

      aEpilogueLoverGroups .binclude "TABLES/SYSTEM/EpilogueLoverGroups.csv.asm"
      aEpilogueLoverPointersPeppy .binclude "TABLES/SYSTEM/EpilogueLoverPointersPeppy.csv.asm"
      aEpilogueLoverPointersCreidneLarcei .binclude "TABLES/SYSTEM/EpilogueLoverPointersCreidneLarcei.csv.asm"
      aEpilogueLoverPointersMuirneLana .binclude "TABLES/SYSTEM/EpilogueLoverPointersMuirneLana.csv.asm"
      aEpilogueLoverPointersLindaTine .binclude "TABLES/SYSTEM/EpilogueLoverPointersLindaTine.csv.asm"
      aEpilogueLoverPointersJeanneNanna .binclude "TABLES/SYSTEM/EpilogueLoverPointersJeanneNanna.csv.asm"

      .fill $B38000 + $8000 - *, 0

    .here

    * = $010000
    .logical $C10000

      g4bppcMageFemaleMapMovementSprite         .binary "GRAPHICS/MapMovementSprites/MageFemale.4bpp.comp"
      g4bppcMageMapMovementSprite               .binary "GRAPHICS/MapMovementSprites/Mage.4bpp.comp"
      g4bppcPriestFemaleMapMovementSprite       .binary "GRAPHICS/MapMovementSprites/PriestFemale.4bpp.comp"
      g4bppcJuniorLordMapMovementSprite         .binary "GRAPHICS/MapMovementSprites/JuniorLord.4bpp.comp"
      g4bppcMyrmidonMapMovementSprite           .binary "GRAPHICS/MapMovementSprites/Myrmidon.4bpp.comp"
      g4bppcLanceArmorMapMovementSprite         .binary "GRAPHICS/MapMovementSprites/LanceArmor.4bpp.comp"
      g4bppcBarbarianMapMovementSprite          .binary "GRAPHICS/MapMovementSprites/Barbarian.4bpp.comp"
      g4bppcArcherMapMovementSprite             .binary "GRAPHICS/MapMovementSprites/Archer.4bpp.comp"
      g4bppcSoldierMapMovementSprite            .binary "GRAPHICS/MapMovementSprites/Soldier.4bpp.comp"
      g4bppcArcherFemaleMapMovementSprite       .binary "GRAPHICS/MapMovementSprites/ArcherFemale.4bpp.comp"
      g4bppcAxeArmorMapMovementSprite           .binary "GRAPHICS/MapMovementSprites/AxeArmor.4bpp.comp"
      g4bppcBowSoldierMapMovementSprite         .binary "GRAPHICS/MapMovementSprites/BowSoldier.4bpp.comp"
      g4bppcDancerMapMovementSprite             .binary "GRAPHICS/MapMovementSprites/Dancer.4bpp.comp"
      g4bppcMyrmidonFemaleMapMovementSprite     .binary "GRAPHICS/MapMovementSprites/MyrmidonFemale.4bpp.comp"
      g4bppcPrincessMapMovementSprite           .binary "GRAPHICS/MapMovementSprites/Princess.4bpp.comp"
      g4bppcThiefMapMovementSprite              .binary "GRAPHICS/MapMovementSprites/Thief.4bpp.comp"
      g4bppcGeneralMapMovementSprite            .binary "GRAPHICS/MapMovementSprites/General.4bpp.comp"
      g4bppcPriestessMapMovementSprite          .binary "GRAPHICS/MapMovementSprites/Priestess.4bpp.comp"
      g4bppcFighterMapMovementSprite            .binary "GRAPHICS/MapMovementSprites/Fighter.4bpp.comp"
      g4bppcWindMageMapMovementSprite           .crossbank.start "GRAPHICS/MapMovementSprites/WindMage.4bpp.comp"

    .here

    * = $020000
    .logical $C20000

      .crossbank.end
      g4bppcWindMageFemaleMapMovementSprite     .binary "GRAPHICS/MapMovementSprites/WindMageFemale.4bpp.comp"
      g4bppcPriestMapMovementSprite             .binary "GRAPHICS/MapMovementSprites/Priest.4bpp.comp"
      g4bppcHunterMapMovementSprite             .binary "GRAPHICS/MapMovementSprites/Hunter.4bpp.comp"
      g4bppcSwordmasterMapMovementSprite        .binary "GRAPHICS/MapMovementSprites/Swordmaster.4bpp.comp"
      g4bppcHeroMapMovementSprite               .binary "GRAPHICS/MapMovementSprites/Hero.4bpp.comp"
      g4bppcWarriorMapMovementSprite            .binary "GRAPHICS/MapMovementSprites/Warrior.4bpp.comp"
      g4bppcBrigandMapMovementSprite            .binary "GRAPHICS/MapMovementSprites/Brigand.4bpp.comp"
      g4bppcPirateMapMovementSprite             .binary "GRAPHICS/MapMovementSprites/Pirate.4bpp.comp"
      g4bppcHeroFemaleMapMovementSprite         .binary "GRAPHICS/MapMovementSprites/HeroFemale.4bpp.comp"
      g4bppcBaronMapMovementSprite              .binary "GRAPHICS/MapMovementSprites/Baron.4bpp.comp"
      g4bppcHighPriestFemaleMapMovementSprite   .binary "GRAPHICS/MapMovementSprites/HighPriestFemale.4bpp.comp"
      g4bppcSwordmasterFemaleMapMovementSprite  .binary "GRAPHICS/MapMovementSprites/SwordmasterFemale.4bpp.comp"
      g4bppcSniperFemaleMapMovementSprite       .binary "GRAPHICS/MapMovementSprites/SniperFemale.4bpp.comp"
      g4bppcSniperMapMovementSprite             .binary "GRAPHICS/MapMovementSprites/Sniper.4bpp.comp"
      g4bppcEmperorMapMovementSprite            .binary "GRAPHICS/MapMovementSprites/Emperor.4bpp.comp"
      g4bppcSwordSoldierMapMovementSprite       .binary "GRAPHICS/MapMovementSprites/SwordSoldier.4bpp.comp"
      g4bppcAxeSoldierMapMovementSprite         .binary "GRAPHICS/MapMovementSprites/AxeSoldier.4bpp.comp"
      g4bppcSpearSoldierMapMovementSprite       .binary "GRAPHICS/MapMovementSprites/SpearSoldier.4bpp.comp"
      g4bppcSwordArmorMapMovementSprite         .crossbank.start "GRAPHICS/MapMovementSprites/SwordArmor.4bpp.comp"

    .here

    * = $030000
    .logical $C30000

      .crossbank.end
      g4bppcBowArmorMapMovementSprite           .binary "GRAPHICS/MapMovementSprites/BowArmor.4bpp.comp"
      g4bppcFireMageFemaleMapMovementSprite     .binary "GRAPHICS/MapMovementSprites/FireMageFemale.4bpp.comp"
      g4bppcFireMageMapMovementSprite           .binary "GRAPHICS/MapMovementSprites/FireMage.4bpp.comp"
      g4bppcThunderMageFemaleMapMovementSprite  .binary "GRAPHICS/MapMovementSprites/ThunderMageFemale.4bpp.comp"
      g4bppcThunderMageMapMovementSprite        .binary "GRAPHICS/MapMovementSprites/ThunderMage.4bpp.comp"
      g4bppcHighPriestMapMovementSprite         .binary "GRAPHICS/MapMovementSprites/HighPriest.4bpp.comp"
      g4bppcWarMageFemaleMapMovementSprite      .binary "GRAPHICS/MapMovementSprites/WarMageFemale.4bpp.comp"
      g4bppcDarkBishopMapMovementSprite         .binary "GRAPHICS/MapMovementSprites/DarkBishop.4bpp.comp"
      g4bppcDarkMageMapMovementSprite           .binary "GRAPHICS/MapMovementSprites/DarkMage.4bpp.comp"
      g4bppcPrinceMapMovementSprite             .binary "GRAPHICS/MapMovementSprites/Prince.4bpp.comp"
      g4bppcWarMageMapMovementSprite            .binary "GRAPHICS/MapMovementSprites/WarMage.4bpp.comp"
      g4bppcChildFemaleMapMovementSprite        .binary "GRAPHICS/MapMovementSprites/ChildFemale.4bpp.comp"
      g4bppcChildMapMovementSprite              .binary "GRAPHICS/MapMovementSprites/Child.4bpp.comp"
      g4bppcQueenMapMovementSprite              .binary "GRAPHICS/MapMovementSprites/Queen.4bpp.comp"
      g4bppcBishopMapMovementSprite             .binary "GRAPHICS/MapMovementSprites/Bishop.4bpp.comp"
      g4bppcCivilianMapMovementSprite           .binary "GRAPHICS/MapMovementSprites/Civilian.4bpp.comp"
      g4bppcCivilianFemaleMapMovementSprite     .binary "GRAPHICS/MapMovementSprites/CivilianFemale.4bpp.comp"
      g4bppcRogueFemaleMapMovementSprite        .binary "GRAPHICS/MapMovementSprites/RogueFemale.4bpp.comp"
      g4bppcBardMapMovementSprite               .binary "GRAPHICS/MapMovementSprites/Bard.4bpp.comp"
      g4bppcThiefFemaleMapMovementSprite        .binary "GRAPHICS/MapMovementSprites/ThiefFemale.4bpp.comp"
      g4bppcRogueMapMovementSprite              .crossbank.start "GRAPHICS/MapMovementSprites/Rogue.4bpp.comp"

    .here

    * = $040000
    .logical $C40000

      .crossbank.end
      g4bppcSageMapMovementSprite               .binary "GRAPHICS/MapMovementSprites/Sage.4bpp.comp"
      g4bppcSageFemaleMapMovementSprite         .binary "GRAPHICS/MapMovementSprites/SageFemale.4bpp.comp"
      g4bppcDarkPrinceMapMovementSprite         .binary "GRAPHICS/MapMovementSprites/DarkPrince.4bpp.comp"
      g4bppcSmallOifeyMapMovementSprite         .binary "GRAPHICS/MapMovementSprites/SmallOifey.4bpp.comp"
      g4bppcShortEmptyMapMovementSprite         .binary "GRAPHICS/MapMovementSprites/ShortEmpty.4bpp.comp"

      g4bppcDragonRiderMapMovementSprite        .binary "GRAPHICS/MapMovementSprites/DragonRider.4bpp.comp"
      g4bppcCavalierMapMovementSprite           .binary "GRAPHICS/MapMovementSprites/Cavalier.4bpp.comp"
      g4bppcDukeKnightMapMovementSprite         .binary "GRAPHICS/MapMovementSprites/DukeKnight.4bpp.comp"
      g4bppcPegasusRiderMapMovementSprite       .binary "GRAPHICS/MapMovementSprites/PegasusRider.4bpp.comp"
      g4bppcAxeKnightMapMovementSprite          .binary "GRAPHICS/MapMovementSprites/AxeKnight.4bpp.comp"
      g4bppcFreeKnightMapMovementSprite         .binary "GRAPHICS/MapMovementSprites/FreeKnight.4bpp.comp"
      g4bppcLanceKnightMapMovementSprite        .binary "GRAPHICS/MapMovementSprites/LanceKnight.4bpp.comp"
      g4bppcBowKnightMapMovementSprite          .crossbank.start "GRAPHICS/MapMovementSprites/BowKnight.4bpp.comp"

    .here

    * = $050000
    .logical $C50000

      .crossbank.end
      g4bppcKnightLordSeliphMapMovementSprite   .binary "GRAPHICS/MapMovementSprites/KnightLordSeliph.4bpp.comp"
      g4bppcTroubadourMapMovementSprite         .binary "GRAPHICS/MapMovementSprites/Troubadour.4bpp.comp"
      g4bppcKnightLordSigurdMapMovementSprite   .binary "GRAPHICS/MapMovementSprites/KnightLordSigurd.4bpp.comp"
      g4bppcPaladinMapMovementSprite            .binary "GRAPHICS/MapMovementSprites/Paladin.4bpp.comp"
      g4bppcDragonMasterMapMovementSprite       .binary "GRAPHICS/MapMovementSprites/DragonMaster.4bpp.comp"
      g4bppcArchKnightMapMovementSprite         .binary "GRAPHICS/MapMovementSprites/ArchKnight.4bpp.comp"
      g4bppcGreatKnightMapMovementSprite        .binary "GRAPHICS/MapMovementSprites/GreatKnight.4bpp.comp"
      g4bppcMageKnightMapMovementSprite         .binary "GRAPHICS/MapMovementSprites/MageKnight.4bpp.comp"
      g4bppcDragonKnightMapMovementSprite       .binary "GRAPHICS/MapMovementSprites/DragonKnight.4bpp.comp"
      g4bppcPegasusKnightMapMovementSprite      .crossbank.start "GRAPHICS/MapMovementSprites/PegasusKnight.4bpp.comp"

    .here

    * = $060000
    .logical $C60000

      .crossbank.end
      g4bppcFalconKnightMapMovementSprite       .binary "GRAPHICS/MapMovementSprites/FalconKnight.4bpp.comp"
      g4bppcMasterKnightMapMovementSprite       .binary "GRAPHICS/MapMovementSprites/MasterKnight.4bpp.comp"
      g4bppcRangerMapMovementSprite             .binary "GRAPHICS/MapMovementSprites/Ranger.4bpp.comp"
      g4bppcBallisticianMapMovementSprite       .binary "GRAPHICS/MapMovementSprites/Ballistician.4bpp.comp"
      g4bppcIronBallisticianMapMovementSprite   .binary "GRAPHICS/MapMovementSprites/IronBallistician.4bpp.comp"
      g4bppcKillerBallisticianMapMovementSprite .binary "GRAPHICS/MapMovementSprites/KillerBallistician.4bpp.comp"
      g4bppcGreatBallisticianMapMovementSprite  .binary "GRAPHICS/MapMovementSprites/GreatBallistician.4bpp.comp"
      g4bppcDragonRiderFemaleMapMovementSprite  .binary "GRAPHICS/MapMovementSprites/DragonRiderFemale.4bpp.comp"
      g4bppcDragonKnightFemaleMapMovementSprite .binary "GRAPHICS/MapMovementSprites/DragonKnightFemale.4bpp.comp"
      g4bppcDragonMasterFemaleMapMovementSprite .binary "GRAPHICS/MapMovementSprites/DragonMasterFemale.4bpp.comp"
      g4bppcPaladinFemaleMapMovementSprite      .binary "GRAPHICS/MapMovementSprites/PaladinFemale.4bpp.comp"
      g4bppcMageKnightFemaleMapMovementSprite   .crossbank.start "GRAPHICS/MapMovementSprites/MageKnightFemale.4bpp.comp"

    .here

    * = $070000
    .logical $C70000

      .crossbank.end
      g4bppcMasterKnightFemaleMapMovementSprite .binary "GRAPHICS/MapMovementSprites/MasterKnightFemale.4bpp.comp"
      g4bppcTallEmptyMapMovementSprite          .binary "GRAPHICS/MapMovementSprites/TallEmpty.4bpp.comp"

      ; C7/0C6C

    .here

    * = $112E50
    .logical $D12E50

      aVerdaneMapHighlightTilemap          .text ROM[$112E50:$113019] ; D12E50
      aAgustriaMapHighlightTilemap         .text ROM[$113019:$113193] ; D13019
      aSilesseMapHighlightTilemap          .text ROM[$113193:$113300] ; D13193
      aAedMapHighlightTilemap              .text ROM[$113300:$11345D] ; D13300
      aIsaachMapHighlightTilemap           .text ROM[$11345D:$11360F] ; D1345D
      aMunsterMapHighlightTilemap          .text ROM[$11360F:$1137AC] ; D1360F
      aThraciaMapHighlightTilemap          .text ROM[$1137AC:$113977] ; D137AC
      aMiletosMapHighlightTilemap          .text ROM[$113977:$113AAC] ; D13977
      aGrannvaleMapHighlightTilemap        .text ROM[$113AAC:$113C01] ; D13AAC

      ; D1/3C01

    .here

    ; aUnknownD13C85 .text ROM[$113C85:$113D09]

    * = $1468A3
    .logical $D468A3

      aUnitedGrannvaleMapHighlightTilemap  .text ROM[$1468A3:$14699E] ; D468A3
      aUnifiedThraciaMapHighlightTilemap   .text ROM[$14699E:$146B27] ; D4699E

      ; D4/6B27

    .here
