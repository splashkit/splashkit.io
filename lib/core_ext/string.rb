require 'lib/helpers/slug'

HUMANIZED_STRINGS = YAML.load_file('data/humanize.yml').freeze

module CoreExtensions
  module String
    def to_human_case
      selff = split(/[_\s]/).map(&:capitalize).join('_')
      HUMANIZED_STRINGS.each do |old, new|
        regex = Regexp.new("(?<=[^a-z]|^)#{old}(?=[^a-z]|$)")
        selff = selff.gsub(regex, new)
      end
      selff.tr('_', ' ')
    end

    def to_title_case
      split(/[_\s]/).map(&:capitalize).join(' ')
    end

    def to_kebab_case
      to_human_case.downcase.tr(' ', '-')
    end

    def to_html
      renderer = Redcarpet::Render::HTML.new
      markdown = Redcarpet::Markdown.new(renderer, {})
      markdown.render(humanize_backticks)
    end

    def to_slug_link
      "`#{self}`".to_html
    end

    def humanize_backticks
      gsub(/`(.*?)`/) do |match|
        # trim off backticks
        inner_match = match[1..-2]
        # humanize inner match
        inner_match_humanized = inner_match.to_human_case
        if slug_exists? inner_match
          url = slug_url_for inner_match
          "[`#{inner_match_humanized}`](#{url})"
        else
          "`#{inner_match_humanized}`"
        end
      end
    end
  end
end
String.prepend CoreExtensions::String
