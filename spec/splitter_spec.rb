require_relative '../splitter'

describe('Splitter') do

  let(:some_string) {'Four score and seven years ago'}

  it('line length should be no longer than requested length') do
    expect(some_string.splitter(14)).to eql 'Four score and\nseven years ago'
  end

  it('it should not break a string') do
    expect(some_string.splitter(17)).to eql 'Four score and\nseven years ago'
  end

  it('should break multiple lines') do
    expect(some_string.splitter(10)).to eql 'Four score\nand seven\nyears ago'
  end

end