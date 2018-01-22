#
# Generates a title based on the current directory tree
#
# E.g., "foo-bar/qux/index.html" will translate to "Foo Bar - Qux"
#
def sitemap_page_title
  # Grab the destination path from the current_page data
  dest_path = current_page.destination_path
  # Replace all dashes with spaces
  # (i.e. getting-started -> getting started)
  dest_path = dest_path.tr('-', ' ')
  # Replace all '/' with dashes and slice the last-most file
  # (i.e. getting started/foo/index.html -> getting started - foo)
  dest_path = dest_path.split('/')[0...-1].join(' - ')
  # Capitalize every word
  page_title = dest_path.split.map(&:to_human_case).join(' ')
  # Return nil if no page title, or the page_title
  !page_title.strip.empty? ? page_title : nil
end
