require 'pry'
class Splitter

    attr_accessor :lines, :line, :string

    def initialize(string)
      @string = string
    end

    def split_lines(line_length)
      @string if @string.length <= line_length
    end


end








# def split_lines(length)
#   return self if self.length < length
#   @lines = []
#   @line = ''
#   words = self.split
#   words.each do |word|
#     if word.length > length
#       @lines << "#{@line}\\n" unless @lines.empty?
#       until word.length < length
#         @lines << "#{word.slice!(word[0..(length - 1)])}\\n"
#       end
#       @line = word
#     elsif word.length + @line.length + 1 > length
#       @lines << "#{@line}\\n"
#       @line = word
#     else
#       @line = @line.empty? ? word : "#{@line} #{word}"
#     end
#   end
#   @lines << @line
#   @lines.join
# end