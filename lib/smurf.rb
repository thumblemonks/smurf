require 'smurf/javascript'
require 'smurf/stylesheet'

module ActionView::Helpers::AssetTagHelper
private
  # After rebasing finishes, apply these of changes
  # def join_asset_file_contents_with_minification(files)
  #   content = join_asset_file_contents_without_minification(files)
  #   if !files.grep(/javascripts.+\.js/).empty?
  #     content = Smurf::Javascript.new(content).minified
  #   elsif !files.grep(/stylesheets.+\.css/).empty?
  #     content = Smurf::Stylesheet.new(content).minified
  #   end
  #   content
  # end

  def minifiers; @@minifiers ||= [Smurf::Javascript, Smurf::Stylesheet]; end

  def join_asset_file_contents_with_minification(paths)
    content = join_asset_file_contents_without_minification(paths)
    minifiers.detect { |minifier| minifier.minifies?(paths) }.new(content).minified
  end
  alias_method_chain :join_asset_file_contents, :minification
end # ActionView::Helpers::AssetTagHelper
