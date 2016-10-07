#
# Generates a unique slug (i.e., id name) for something that has a signature
#
def slug_for(data)
  signature = data.signature if data.signature
  signature.gsub(/[^a-z]/, '-').gsub(/-*$/, '')
end
