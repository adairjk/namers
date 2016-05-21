require 'pry'
class String

  def splitter(length)
    return self if self.length < length
    lines = []
    line = ''
    words = self.split
    words.each do |word|
      if word.length > length
        until word.length < length
          lines << "#{word.slice!(word[0..(length - 1)])}-\\n"
        end
        line = word
      elsif word.length + line.length > length
        lines << "#{line}\\n"
        line = word
      else
        line = line.empty? ? word : "#{line} #{word}"
      end
    end
    lines << line
    lines.join
  end


end
