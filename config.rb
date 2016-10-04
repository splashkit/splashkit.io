###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Root Layout
page '/*', layout: :root
# Article layout
page '/articles/*', layout: :articles
# API layout
page '/api/*', layout: :api

# Proxy pages (https://middlemanapp.com/advanced/dynamic_pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
activate :automatic_image_sizes

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

# Methods defined in the helpers block are available in templates
helpers do
  # Require all functions in the helpers directory
  require_all 'helpers'
end

# Activate sprokets + compass
activate :sprockets

# Import CSS/SCSS
set :css_dir, 'stylesheets'
activate :autoprefixer

# Import JavaScript
set :js_dir, 'javascripts'

# Set the image directory to be ./images
set :images_dir, 'images'

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
