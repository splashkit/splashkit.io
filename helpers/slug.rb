# A registry of slugs generated
class SlugRegistry < Hash
  include Singleton
end


#
# Generates a unique slug (i.e., id name) for something
#
def register_slug(data, group)
  slug = slug_for data
  # Account for overloaded names, e.g.: "hello-world"
  if slug_exists?(slug)
    overload_num = slug[(slug =~ /-\d+$/).to_i + 1..-1].to_i + 1
    slug += "-#{overload_num}" # "hello-world" -> "hello-world-1"
  end
  url = "/api/#{group}/\##{slug}"
  merge_data = {}
  # Where does the slug lead to? The url...
  merge_data[slug] = url
  SlugRegistry.instance.merge!(merge_data)
  slug
end

def slug_for(data)
  name = data.is_a?(String) ? data : data.name
  name.to_kebab_case
end

def url_for(data)
  slug = data.to_kebab_case
  SlugRegistry.instance[slug]
end

def slug_exists?(data)
  SlugRegistry.instance.keys.include? slug_for data
end
