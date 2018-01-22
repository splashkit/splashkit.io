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
    javascript: '.js',
    python:     '.py',
    swift:      '.swift',
    csharp:     '.cs'
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
      if src.respond_to? :join
        src = src.join "\n"
      end
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
  partial 'partials/snippet', locals: { files: files }
end
