###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Helpers
###

# Automatic image dimensions on image_tag helper
activate :automatic_image_sizes

# Activate 'blogging' to generate guides
activate :blog do |guide|
  guide.prefix = 'articles/guides'
  guide.default_extension = '.md'
  guide.layout = :'articles/guide'
  guide.sources = '{year}-{month}-{day}-{title}.html'
  guide.permalink = 'articles/guides/{tags}/{title}.html'
end

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

# Methods defined in the helpers block are available in templates
helpers do
  # Require all functions in the helpers directory
  require_all 'lib/helpers'
end

# All overrides for core extensions
require_all 'lib/core_ext'

# Activate sprokets + compass
activate :sprockets

# Import CSS/SCSS
set :css_dir, 'stylesheets'
activate :autoprefixer

# Import JavaScript
set :js_dir, 'javascripts'

# Set the image directory to be ./images
set :images_dir, 'images'

# Partials must be from partials directory
set :partials_dir, 'partials'

# Activate markdown using Redcarpet parsing engine and syntax highlighting
set :markdown_engine, :redcarpet
set :markdown, fenced_code_blocks: true, smartypants: true
activate :syntax

# Pretty index directory structure
activate :directory_indexes

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  activate :asset_hash
end

###
# Page options, layouts, aliases and proxies
###

# Specify the root layout to index
page '/index.html', layout: :index

# Specify layouts for subdirectories of articles _in order_ of application
page '/articles/installation/**/step*', layout: :'articles/installation'
page '/articles/guides/index.html', layout: :'articles/index'
page '/articles/guides/*', layout: :'articles/guide'
page '/articles/*', layout: :'articles/index'

# API proxy pages
data.api.each do |api_group, data|
  name = api_group.to_human_case
  #guides = find_guides_in_category("examples/#{name.downcase}")
  types = (data.typedefs + data.structs + data.enums).sort_by { |h| h[:name] }
  locals = {
    raw_api_data: data,
    name: name,
    types: types,
    functions: data.functions,
    guides: [],
    defines: data.defines,
    description: data.description,
    brief: data.brief
  }
  proxy_url = "#{path_for_group(api_group)}/index.html"
  proxy proxy_url,
        '/api/template.html',
        locals: locals,
        ignore: true,
        layout: :'api/index'
end
