# class String
#   def scan_with_index regex
#     Enumerator.new do |y|
#       scan(regex) do
#         y << Regexp.last_match
#         y << y[-1].offset[0][0]
#       end
#     end
#   end
# end