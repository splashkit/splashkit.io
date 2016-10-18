# A registry of slugs generated
class SlugRegistry < Hash
  include Singleton
  @registered = false

  def register_complete
    @registered = true
  end

  def all_registered?
    @registered
  end
end

#
# Registers all slugs... should be called once
#
def register_all_slugs
  if SlugRegistry.instance.all_registered?
    # puts 'Cannot call register_all_slugs twice'
    return
  end
  data.api.each do |api_group, data|
    (data.functions + data.typedefs + data.structs + data.enums + data.defines).each do |data|
      register_slug(data, api_group)
    end
  end
  SlugRegistry.instance.register_complete
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
  url = "#{path_for_group group}/\##{slug}"
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

def slug_url_for(data)
  SlugRegistry.instance[slug_for data]
end

def slug_exists?(data)
  SlugRegistry.instance.keys.include? slug_for data
end
