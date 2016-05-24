require 'spec_helper'

describe(Splitter) do

  let(:some_string) {'Four score and seven years ago'}
  let(:splitter) {Splitter.new(some_string)}

  it('should store the string that is passed') do
    expect(splitter.instance_variable_get(:'@string')).to eql some_string
  end

  it('should return the string if less than the split length') do
    expect(Splitter.new('x').split_lines(2)).to eql "x"
  end

  it('should return the string if equal to the split length') do
    expect(Splitter.new('x').split_lines(1)).to eql "x"
  end

  it('should handle empty strings') do
    expect(Splitter.new('').split_lines(1)).to eql ''
  end

  it('should split words if longer than split length') do
    splitter = Splitter.new('xxx')
    splitter.lines = []
    splitter.line = []
    expect(splitter.split_lines(1)).to eql 'x\nx\nx'
  end

  it('should insert a new line between words') do
    splitter = Splitter.new('xxx xxx')
    splitter.lines = []
    splitter.line = []
    expect(splitter.split_lines(3)).to eql 'xxx\nxxx'
  end

  it('should insert a new line between words') do
    splitter = Splitter.new('x xxx')
    splitter.lines = []
    splitter.line = []
    expect(splitter.split_lines(3)).to eql 'x\nxxx'
  end

  it('should split long words within the phrase') do
    splitter = Splitter.new('x xx')
    splitter.lines = []
    splitter.line = []
    expect(splitter.split_lines(1)).to eql 'x\nx\nx'
  end

  it('should handle a larger sample') do
    splitter = Splitter.new('these are some longer words and phrases')
    expect(splitter.split_lines(10)).to eql 'these are\nsome\nlonger\nwords and\nphrases'
  end

  describe('helper methods') do

    let(:splitter) { Splitter.new('xxxxxxx')}

    describe('split_word') do
      it('should split a word into lines up to the split length') do
        splitter.line_length = 3
        splitter.lines = []
        splitter.line = []
        splitter.send(:split_word, 'xxxxxxx')
        expect(splitter.instance_variable_get(:'@lines')).to eql ['xxx', 'xxx']
      end

      it('should return remaining letters') do
        splitter.line_length = 3
        splitter.lines = []
        splitter.line = []
        expect(splitter.send(:split_word, 'xxxxxxx')).to eql 'x'
      end
    end

    describe('word_fits_on_line?') do
      it('should return true if the word fits on the line') do
        splitter.line = []
        splitter.line_length = 10
        expect(splitter.send(:word_fits_on_line?, 'xxxxx')).to be true
      end

      it('should return false if the word is too long to fit on the line') do
        splitter.line = []
        splitter.line_length = 3
        expect(splitter.send(:word_fits_on_line?, 'xxxxx')).to be false
      end
    end

    describe('build_lines') do
      it('should build an array of lines') do
        splitter.lines = []
        splitter.line = []
        splitter.line_length = 10
        splitter.instance_variable_set(:'@words', (%w(these are some words)))
        splitter.send(:build_lines)
        expect(splitter.lines).to eql ['these are', 'some words']
      end
    end

  end

end