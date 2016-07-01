#
# Generates a code snippet from a provided filename using the path provided
# relative to data/snippets. By default, if path is not provided, it will use
# the current page directory.
#
# E.g., if current page is "getting-started/graphics/index.html"
# then the path will default to "data/snippets/getting-started/graphics"
#
def snippet(filename, path = nil)
  # Maps file extensions to their tab titles
  ext_to_title = {
    '.c'          => 'C/C++',
    '.cpp'        => 'C/C++',
    '.cs'         => 'C#',
    '.java'       => 'Java',
    '.js'         => 'JavaScript',
    '.pas'        => 'Pascal',
    '.psuedocode' => 'Psuedocode',
    '.py'         => 'Python',
    '.swift'      => 'Swift'
  }

  # Check for path, otherwise use current page
  path = path.nil? ? current_page.destination_path[/.*\//] : path
  # Prepend data/snippets to the path
  path = 'data/snippets/' << path
  # Create the HTML formatter pased on HTMLPygments + HTMLTable
  formatter = Rouge::Formatters::HTMLPygments.new(Rouge::Formatters::HTMLTable.new(Rouge::Formatters::HTML.new))
  # Get all the files that match the path with the filename
  files = Dir.glob(path << filename << ".*").map do |f|
    extname = File.extname(f)
    basename = File.basename(f, extname)
    title = ext_to_title[extname]
    lexer = Rouge::Lexer.guess({filename: f})
    src = File.read(f)
    html = formatter.format(lexer.lex(src))
    id = "#{extname[/[a-z]+/]}-#{basename}" # remove "." from extension
    {
      id: id,
      title: title,
      html:  html
    }
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
    list_items << "<li role='presentation'"
    list_items <<  (is_active ? "class='active'" : "")
    list_items << "><a href='##{tab_id}' aria-controls='#{tab_id}' role='tab' data-toggle='tab'>#{file[:title]}</a></li>"

    # Generate the tab panes HTML
    tab_panes << "<div role='tabpanel' id='#{tab_id}' class='tab-pane"
    tab_panes << (is_active ? " active'>" : "'>")
    tab_panes << file[:html]
    tab_panes << "</div>"
  end

# This is where we generate our HTML
<<-EOS
<!-- Code snippet for #{filename} -->
<div class="snippet">
  <ul class='nav nav-tabs' role='tablist'>
    #{list_items}
  </ul>
  <div class='tab-content' onclick="selectSnippet(this)">
    #{tab_panes}
  </div>
</div>
<!-- End code snippet -->
EOS
end
