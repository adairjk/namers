require 'pry'

class Splitter

    attr_accessor :lines, :line, :string, :words, :line_length

    def initialize(string)
      @string = string
    end

    def split_lines(line_length)
      @line_length = line_length
      return '' if @string.nil?
      return @string if @string.length <= line_length
      words.each do |word|
        if join_line.length + word.length > line_length
          self.lines << join_line unless line.empty?
          split_word(word) if word.length > line_length
          self.line = [word] unless word.empty?
        else
          self.line << word unless word.empty?
        end
      end
      @lines << @line unless @line.empty?
      join_lines
    end

    def words
      @words = @string.split
    end

    def split_word(word)
      until word.length < @line_length do
        self.lines << word.slice!(/.{#{@line_length}}/)
      end
      self.line = word.empty? ? [] : [word]
    end

    def join_lines
      self.lines.empty? ? '' : self.lines.join('\n')
    end

    def lines
      @lines ||= []
    end

    def join_line
      self.line.empty? ? '' : self.line.join(' ')
    end

    def line
      @line ||= []
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