A Rails app for taking notes.

It allows embedding html content.

Usage:

- "Notes" are objects with "title" and "content" attributes
- "content" can include ERB
- `<%= Embed.get(url).parse(css: ".css.selector", title: "Embedded Content") %>` will create a toggling section with parsed content from the url.
- run `rake update_cache` to re-compile "content" templates

- to access the Notes CRUD interace, `bundle`, `rails server`, then go to http://localhost:3000

Notes:  
- The "title" value of parse()'s options hash can't include quote marks. It needs to be a valid CSS selector when the spaces are replaced with dashes. 
- I'm not deploying this app because the html embedding makes it insecure. 
