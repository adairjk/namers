require 'spec_helper'

describe(Splitter) do

  let(:some_string) {'Four score and seven years ago'}
  let(:splitter) {Splitter.new(some_string)}

  it('should store the string that is passed') do
    expect(Splitter.new('foo').string).to eql "foo"
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
    expect(Splitter.new('xxx').split_lines(1)).to eql 'x\nx\nx'
  end

  it('should insert a new line between words') do
    expect(Splitter.new('xxx xxx').split_lines(3)).to eql 'xxx\nxxx'
  end

  it('should insert a new line between words') do
    expect(Splitter.new('x xxx').split_lines(3)).to eql 'x\nxxx'
  end

  describe('helper methods') do

    let(:splitter) { Splitter.new('xxxxxxx')}

    describe('split_word') do
      it('should split a word into lines up to the split length') do
        splitter.line_length = 3
        splitter.split_word('xxxxxxx')
        expect(splitter.lines).to eql ['xxx', 'xxx']
      end

      it('should put remaining letters in the current line') do
        splitter.line_length = 3
        splitter.split_word('xxxxxxx')
        expect(splitter.line).to eql ['x']
      end
    end

  end

  describe('oscars tests') do

    it { expect(Splitter.new(nil).split_lines(1)).to eql('') }
    it { expect(Splitter.new('').split_lines(1)).to eql('') }
    it { expect(Splitter.new('x').split_lines(1)).to eql('x') }
    it { expect(Splitter.new('xx').split_lines(1)).to eql('x\nx') }
    it { expect(Splitter.new('xxx').split_lines(1)).to eql('x\nx\nx') }
    it { expect(Splitter.new('x xx').split_lines(1)).to eql('x\nx\nx') }

  end


  # it('line length should be no longer than requested length') do
  #   expect(some_string.splitter(14)).to eql "Four score and\nseven years\nago"
  # end
  #
  # it('it should not break a string') do
  #   expect(some_string.splitter(17)).to eql "Four score and\nseven years ago"
  # end
  #
  # it('should break multiple lines') do
  #   expect(some_string.splitter(10)).to eql "Four score\nand seven\nyears ago"
  # end
  #


end