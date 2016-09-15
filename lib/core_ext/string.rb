module CoreExtensions
  module String
    #
    # Converts from snake_case to Humanised Case
    #
    def to_human_case
      split('_').map(&:capitalize).join(' ')
    end

    def to_html
      renderer = Redcarpet::Render::HTML.new()
      markdown = Redcarpet::Markdown.new(renderer, extensions = {})
      markdown.render(self)
    end
  end
end
String.prepend CoreExtensions::String