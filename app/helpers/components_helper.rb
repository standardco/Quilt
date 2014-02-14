module ComponentsHelper
  def css_links(styleguide)
    if styleguide.css_paths
      styleguide.css_paths.split(",").each do |css_path|
        # TODO: Build the link tags.
      end
    end
    css_links
  end
end
