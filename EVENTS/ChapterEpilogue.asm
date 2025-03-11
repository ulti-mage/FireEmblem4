
    .section ChapterEpilogueEventsSection

      aChapterEpilogueEventHeader ; 86/FA9A

        .word ChapterEpilogue
        .long aChapterEpilogueOpeningEvent
        .long aChapterEpilogueMapEvents

      aChapterEpilogueOpeningEvent ; 86/FAA2

        END_CHAPTER_EVENTS

      aChapterEpilogueMapEvents ; 86/FAA4

        END_CHAPTER_EVENTS

    .endsection ChapterEpilogueEventsSection

