require 'smurf/javascript'
require 'smurf/stylesheet'

if Rails.version =~ /^2\.2\./
  # Support for Rails >= 2.2.x
  module Smurf

    module JavaScriptSources
    private
      def joined_contents; Smurf::Javascript.new(super).minified; end
    end # JavaScriptSources

    module StylesheetSources
    private
      def joined_contents; Smurf::Stylesheet.new(super).minified; end
    end # StylesheetSources

  end # ActionView::Helpers::AssetTagHelper::AssetTag
  ActionView::Helpers::AssetTagHelper::JavaScriptSources.send(
    :include, Smurf::JavaScriptSources)
  ActionView::Helpers::AssetTagHelper::StylesheetSources.send(
    :include, Smurf::StylesheetSources)
else
  # Support for Rails <= 2.1.x
  module ActionView::Helpers::AssetTagHelper
  private
    def join_asset_file_contents_with_minification(files)
      content = join_asset_file_contents_without_minification(files)
      if !files.grep(%r[/javascripts]).empty?
        content = Smurf::Javascript.new(content).minified
      elsif !files.grep(%r[/stylesheets]).empty?
        content = Smurf::Stylesheet.new(content).minified
      end
      content
    end
    alias_method_chain :join_asset_file_contents, :minification
  end # ActionView::Helpers::AssetTagHelper
end
