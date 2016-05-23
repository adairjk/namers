require 'pry'

class Splitter

  def initialize(string)
    @string = string
    @lines = []
    @line = []
    @words = string.split
  end

  def split_lines(line_length)
    @line_length = line_length
    return '' if @string.nil?
    return @string if @string.length <= line_length
    @words.each do |word|
      if @line.join.length + word.length > line_length
        @lines << @line.join
        @line = [split_word(word)].reject { |w| w.empty? }
      else
        @line << word
      end
    end
    @lines.reject! { |w| w.empty? }
    @lines.join('\n')
  end

  private

  def split_word(word)
    until word.length < @line_length do
      @lines << word.slice!(/.{#{@line_length}}/)
    end
    word
  end

end