# From Ruby Facets
# https://github.com/rubyworks/facets/blob/master/lib/core/facets/string/snakecase.rb
# Convert CamelCase to snake_case
def snakecase(str)
  str.to_s.gsub(/^SU/, "").
    gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2').
    gsub(/([a-z\d])([A-Z])/, '\1_\2').
    tr("-", "_").
    gsub(/\s/, "_").
    gsub(/__+/, "_").
    gsub(/3_D/, "3d").
    gsub(/2_D/, "2d").
    downcase
end
