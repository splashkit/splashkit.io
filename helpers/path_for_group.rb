#
# Generates a path for the API group
#
def path_for_group(group)
  "/api/#{group.to_kebab_case}"
end
