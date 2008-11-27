# Smurf

Smurf is a Rails plugin that does Javascript and CSS minification the way you would expect. See, with Rails `2.x` we got this cool new `:cache` option on `javascript_include_tag` and `stylesheet_link_tag`, but no option for minifying the cached file(s).

Smurf ends that. Smurf - if installed and when caching is enabled for the environment - will nab the concatenated file content from Rails just before it saves it and minifies the content using either JSmin or a custom CSS compressor.

Some cool things about Smurf, which also allude to the reasons I wrote it:

* Smurf will only run when Rails needs to cache new files
* It will never run on its own
* It requires absolutely no configuration
* Other than installing it, you don't need to do anything
* It just gets out of your way

Smurf will work with any version of Rails `2.x`; including Rails `2.2.2`.

### JSmin

It's really an adaptation of Uladzislau Latynski's [jsmin.rb](http://javascript.crockford.com/jsmin.rb) port of Douglas Crockford's [jsmin.c](http://javascript.crockford.com/jsmin.c) library.

### Smurf CSS Compressor

The following are the rules I applied, gathered from various perusals around the Internet*s*

1. Replace consecutive whitespace characters with a single space
2. Remove whitespace around opening brackets
3. Remove whitespace in front of closing brackets
4. Remove the semi-colon just before the closing bracket
5. Remove comments between `/* ... */` - this could be a problem (esp. for CSS hacks)
6. Remove spaces around `;`, `:`, and `,` characters
7. Ensure whitespace between closing brackets and periods

## Installation

    ./script/plugin install git://github.com/thumblemonks/smurf.git

Then, wherever you define `javascript_include_tag` or `stylesheet_link_tag`, make sure to add the standard `:cache => true` or `:cache => 'some_bundle'` options.

Also make sure to at least have this setting in your production.rb:

    config.action_controller.perform_caching = true

## Testing and Other Stuff

If you want to test Smurf and you don't want to test with the latest version of Rails as of this writing (2.2.2), then do something like the following:

    rake RAILS_GEM_VERSION=2.1.2

This is the mechanism I used for testing that Smurf works for all versions:

    rake && rake RAILS_GEM_VERSION=2.1.2

## Contact

Justin Knowlden <gus@gusg.us>

## License

See MIT-LICENSE
