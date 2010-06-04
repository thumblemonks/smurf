require 'smurf/javascript'
require 'smurf/stylesheet'
require 'smurf/noop'

module ActionView::Helpers::AssetTagHelper
private
  def minifiers
    @@minifiers ||= [Smurf::Javascript, Smurf::Stylesheet, Smurf::Noop]
  end

  def join_asset_file_contents_with_minification(paths)
    content = join_asset_file_contents_without_minification(paths)
    minifiers.detect { |minifier| minifier.minifies?(paths) }.new(content).minified
  end
  alias_method_chain :join_asset_file_contents, :minification
end # ActionView::Helpers::AssetTagHelper
