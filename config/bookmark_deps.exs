use Mix.Config

config :bookmark_deps,
    map: %("story.*.chapter.*.title" => {"story.*.toc", "story.*.chapter.*"}, "story.*.chapter.*.content" => {"story.*.chapter.*"}, "story.*.chapter.*.author" => {"story.*.chapter.*"})
