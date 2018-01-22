# Returns all blog guides that are relevant for this function.
# Essentially a lookup to which guides apply to the API group that
# owns the function.
def guides_for_function(guides, function)
  guides.select do |guide|
    guide.metadata[:page][:related_funcs].include?(function.name)
  end
end

def guides_for_api_group(api_name)
  blog.tags.map do |tag_name, tag_data|
    tag_data if tag_name == api_name
  end.flatten.compact
end
