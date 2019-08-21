# From Ruby Facets
# https://github.com/rubyworks/facets/blob/master/lib/core/facets/string/snakecase.rb
# Convert CamelCase to snake_case


def c_name_to_ruby(name)
  name.to_s.
    gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
    gsub(/([a-z\d])([A-Z])/,'\1_\2').
    tr('-', '_').
    gsub(/\s/, '_').
    gsub(/__+/, '_').
    gsub(/^SU_/, "").
    gsub(/3_D/, "3d").
    gsub(/2_D/, "2d").
    downcase
end

