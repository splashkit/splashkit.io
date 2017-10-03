#
# Returns 'active' if rules set is true
#
def active_on(url)
  'active' if current_page.url.start_with? "/#{url}"
end
