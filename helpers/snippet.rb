#
# Generates a code snippet from a provided filename using the path provided
# relative to data/snippets. By default, if path is not provided, it will use
# the current page directory.
#
# E.g., if current page is "getting-started/graphics/index.html"
# then the path will default to "data/snippets/getting-started/graphics"
#
def snippet(filename_or_hash, path = nil)
  # Maps file extensions to their tab titles
  ext_to_title = {
    '.cpp'        => 'C++',
    '.cs'         => 'C#',
    '.java'       => 'Java',
    '.js'         => 'JavaScript',
    '.pas'        => 'Pascal',
    '.psuedocode' => 'Psuedocode',
    '.py'         => 'Python',
    '.swift'      => 'Swift'
  }
  hash_key_to_ext = {
    cpp:        '.cpp',
    pascal:     '.pas',
    java:       '.java',
    javascript: '.pas',
    python:     '.py',
    swift:      '.swift'
  }

  # Check for path, otherwise use current page
  path = path.nil? ? current_page.destination_path[/.*\//] : path
  # Prepend data/snippets to the path
  path = 'data/snippets/' << path
  # Create the HTML formatter pased on HTMLPygments + HTMLTable
  formatter = Rouge::Formatters::HTMLPygments.new(Rouge::Formatters::HTML.new)
  formatter_table = Rouge::Formatters::HTMLPygments.new(Rouge::Formatters::HTMLTable.new(Rouge::Formatters::HTML.new))
  # Get all the files that match the path with the filename
  if filename_or_hash.is_a? Hash
    hash = filename_or_hash
    files = hash.map do |lang, data|
      extname = hash_key_to_ext[lang.to_sym]
      title = ext_to_title[extname]
      lexer = Rouge::Lexer.guess(filename: "file.#{extname}")
      src = data
      formatter = src.lines.count < 5 ? formatter : formatter_table
      html = formatter.format(lexer.lex(src))
      id = "#{extname[/[a-z]+/]}-snippet-#{rand(0..9999)}"
      {
        id: id,
        title: title,
        html:  html
      }
    end
  else
    filename = filename_or_hash
    files = Dir.glob(path << filename << ".*").map do |f|
      extname = File.extname(f)
      basename = File.basename(f, extname)
      title = ext_to_title[extname]
      lexer = Rouge::Lexer.guess(filename: f)
      src = File.read(f)
      html = formatter.format(lexer.lex(src))
      formatter = src.lines.count < 5 ? formatter : formatter_table
      id = "#{extname[/[a-z]+/]}-#{basename}" # remove "." from extension
      {
        id: id,
        title: title,
        html:  html
      }
    end
  end

  # Sort alphabetically
  files.sort_by! { |f| f[:id] }

  # Auto Generation of HTML
  list_items = ""
  tab_panes = ""
  files.each_with_index do |file, index|
    tab_id = file[:id]

    # Determine if this is the default tab
    is_active = index == 0

    # Generate the <li> items HTML
    list_items << "<li class='nav-item'>"
    list_items << "<a href='##{tab_id}' aria-controls='#{tab_id}' role='tab' data-toggle='tab' class='nav-link"
    list_items <<  (is_active ? " active'>" : "'>")
    list_items << "#{file[:title]}</a></li>"

    # Generate the tab panes HTML
    tab_panes << "<div role='tabpanel' id='#{tab_id}' class='tab-pane fade"
    tab_panes << (is_active ? " in active'>" : "'>")
    tab_panes << file[:html]
    tab_panes << '</div>'
  end

# This is where we generate our HTML
<<-EOS
<div class='sk-snippet'>
  <ul class='nav nav-tabs' role='tablist'>
    #{list_items}
  </ul>
  <div class='tab-content' data-clipboard>
    #{tab_panes}
  </div>
</div>
EOS
end
