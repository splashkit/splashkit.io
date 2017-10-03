#
# Produces a nice output image of an image, using the filename as its
# alt name
#
def img(src)
  alt = File.basename(src, File.extname(src))
            .tr(/-/, '')
            .gsub(/\w+/)
            .map(&:capitalize)
  partial :img, locals: { src: src, alt: alt }
end
