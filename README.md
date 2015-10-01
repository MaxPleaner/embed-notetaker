## blogger-rails

A Rails app; begin it by running `bundle`, `rake db:create db:migrate` (uses postgres), and `rails server`. Go to `localhost:3000`.

There are a couple components to the app
- Note taking (including embedding content from the web)
- Event listings

### Note Taking

Usage:

- "Notes" are objects with "title" and "content" attributes
- "content" can include ERB
- `<%= Embed.get(url).parse(css: ".css.selector", title: "Embedded Content") %>` will create a toggling section with parsed content from the url.
- run `rake update_cache` to re-compile "content" templates  
- The "title" value of parse()'s options hash can't include quote marks. It needs to be a valid CSS selector when the spaces are replaced with dashes. 

### Events

- Click on the links to event sources and see  
  upcoming events, separated by day. 

