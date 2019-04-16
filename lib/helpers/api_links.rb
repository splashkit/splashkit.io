
# Search for the function with the indicated name
def function_for_name(function_name)
    data.api.each do |api_group, data|
        data.functions.group_by { |fn| fn.name }.each do |group, functions|
            functions.each do | fn |
                if fn.unique_global_name == function_name
                    return { api_group: api_group, function: fn, in_group: functions.length > 1 }
                end
            end
        end
    end
    return nil
end

def link_for_function(function_name)
    fn = function_for_name(function_name)

    if fn.present?
        return link_to( fn[:function].name.to_human_case, "#{ path_for_group(fn[:api_group]) }/##{fn[:in_group]? "group-" : ""}#{fn[:function].name.to_kebab_case}" )
    else
        return function_name.to_human_case
    end
end

def type_for_name(type_name)
    data.api.each do |api_group, data|
        types = (data.typedefs + data.structs + data.enums).sort_by { |h| h[:name] }
        types.each do |type|
            if type.name == type_name
                return type
            end
        end
    end
    return nil
end

def link_for_type(type_name)
    type = type_for_name(type_name)

    if type.present?
        return link_to(type.name.to_human_case, slug_url_for(type))
    else
        return type_name.to_human_case
    end
end