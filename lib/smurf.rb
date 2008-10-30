require 'smurf/javascript'

module ActionView::Helpers::AssetTagHelper
private
  def join_asset_file_contents_with_minification(*args)
    content = join_asset_file_contents_without_minification(*args)
    Smurf::Javascript.minify(content)
  end
  alias_method_chain :join_asset_file_contents, :minification
end # ActionView::Helpers::AssetTagHelper
