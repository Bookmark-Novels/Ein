# Ein
Bookmark's dependency usage graph notifier.

Ein keeps track of who's using what and notifies others when there may be any dependency conflicts (e.g. somebody changes a chapter title while you're editing the table of contents). Ein is also responsible for invalidating cached objects in redis as well as newly invalidated pages in Varnish.
