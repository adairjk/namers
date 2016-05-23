require_relative '../string'

describe('Splitter') do

  let(:some_string) {'Four score and seven years ago'}

  it('line length should be no longer than requested length') do
    expect(some_string.splitter(14)).to eql 'Four score and\nseven years\nago'
  end

  it('it should not break a string') do
    expect(some_string.splitter(17)).to eql 'Four score and\nseven years ago'
  end

  it('should break multiple lines') do
    expect(some_string.splitter(10)).to eql 'Four score\nand seven\nyears ago'
  end

  it('should hyphenate long words') do
    expect('thisisareallylongword'.splitter(6)).to eql 'thisis-\nareall-\nylongw-\nord'
  end

  it('should handle long words within lines and hyphenate them') do
    expect('this is a really long and intricateing sample'.splitter(10)).to eql 'this is a\nreally\nlong and\nintricatei-\nng sample'
  end

  it { expect(''.splitter(1)).to eql('') }
  it { expect(nil.splitter(1)).to eql('') }
  it { expect('x'.splitter(1)).to eql('x') }
  it { expect('xx'.splitter(1)).to eql("x\nx") }
  it { expect('xxx'.splitter(1)).to eql("x\nx\nx") }
  it { expect('x xx'.splitter(3)).to eql("x\nxx") }

end