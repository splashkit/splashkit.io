#
# Find guide categories by searching for subdirectories of a path.
#
def find_guide_categories(path = nil)

  if path == nil
    return {}
  end

  # Prepend data/snippets to the path
  path = 'source/guides/' << path

  dirs = Dir.entries(path).select {|entry| File.directory? File.join(path, entry) and !(entry =='.' || entry == '..') }

  return dirs

end

#
# Finds guides within a category by searching for files in a subdirectory
#
def find_guides_in_category(path = nil)

  if path == nil
    return {}
  end

  # Prepend data/snippets to the path
  base_uri = 'guides/' << path << '/'
  path = 'source/guides/' << path << "/*.html.md"

  files = Dir.glob(path).map do |f|
    extname = File.extname(f)
    name = File.basename(f, extname)
    src = Nokogiri::HTML(open(f))
    doc_title = src.at('meta[name="guide-title"]')['content']
    api_linked_groups = src.at('meta[name="api-link-groups"]')['content'].split(",")
    api_linked_functions = src.at('meta[name="api-link-functions"]')['content'].split(",")
    {
      name: name,
      uri: base_uri <<  name.gsub('.html', ''),
      doc_title: doc_title,
      api_linked_groups: api_linked_groups,
      api_linked_functions: api_linked_functions
    }
  end

  return files

end
