require 'pry'

class Splitter

  attr_accessor :line, :lines, :line_length, :string

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
    build_lines
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

  def build_lines
    @words.each do |word|
      if word_fits_on_line?(word)
        @line << word
      else
        @lines << @line.join(' ')
        @line = [split_word(word)].reject { |w| w.empty? }
      end
    end
    @lines << @line.join(' ')
  end

  def word_fits_on_line?(word)
    @line.join.length + word.length < @line_length
  end

end