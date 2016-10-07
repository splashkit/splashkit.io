# Exceptions to human case
HUMAN_CASE_EXCEPTIONS = {
  'int' => 'Integer',
  'vector_2d' => 'Vector 2D',
  'bool' => 'Boolean'
}.freeze

module CoreExtensions
  module String
    def to_human_case
      HUMAN_CASE_EXCEPTIONS[self] || split('_').map(&:capitalize).join(' ')
    end

    def to_kebab_case
      to_human_case.downcase.tr(' ', '-')
    end

    def to_html
      renderer = Redcarpet::Render::HTML.new
      markdown = Redcarpet::Markdown.new(renderer, {})
      markdown.render(humanize_backticks)
    end

    def humanize_backticks
      gsub(/`(.*?)`/) do |match|
        match.gsub(/(?<=`).*(?=`)/) do |inner_match|
          "`#{inner_match.to_human_case}`"
        end
      end
    end
  end
end
String.prepend CoreExtensions::String
