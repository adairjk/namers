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
  # it { expect(splitter.split_lines(1)).to eql('') }
  # it { expect(nil.splitter(1)).to eql('') }
  # it { expect('x'.splitter(1)).to eql('x') }
  # it { expect('xx'.splitter(1)).to eql("x\nx") }
  # it { expect('xxx'.splitter(1)).to eql("x\nx\nx") }
  # it { expect('x xx'.splitter(3)).to eql("x\nxx") }

end