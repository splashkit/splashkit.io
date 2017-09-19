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
    doc_title = src.xpath("//meta[@name='guide_title']/@content")
    {
      name: name,
      uri: base_uri <<  name.gsub('.html', ''),
      doc_title: doc_title
    }
  end

  return files

end
