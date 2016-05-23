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
    splitter.instance_variable_set(:'@lines', [])
    splitter.instance_variable_set(:'@line', [])
    expect(splitter.split_lines(1)).to eql 'x\nx\nx'
  end

  it('should insert a new line between words') do
    splitter = Splitter.new('xxx xxx')
    splitter.instance_variable_set(:'@lines', [])
    splitter.instance_variable_set(:'@line', [])
    expect(splitter.split_lines(3)).to eql 'xxx\nxxx'
  end

  it('should insert a new line between words') do
    splitter = Splitter.new('x xxx')
    splitter.instance_variable_set(:'@lines', [])
    splitter.instance_variable_set(:'@line', [])
    expect(splitter.split_lines(3)).to eql 'x\nxxx'
  end

  it('should split long words within the phrase') do
    splitter = Splitter.new('x xx')
    splitter.instance_variable_set(:'@lines', [])
    splitter.instance_variable_set(:'@line', [])
    expect(splitter.split_lines(1)).to eql 'x\nx\nx'
  end

  describe('helper methods') do

    let(:splitter) { Splitter.new('xxxxxxx')}

    describe('split_word') do
      it('should split a word into lines up to the split length') do
        splitter.instance_variable_set(:'@line_length', 3)
        splitter.instance_variable_set(:'@lines', [])
        splitter.instance_variable_set(:'@line', [])
        splitter.send(:split_word, 'xxxxxxx')
        expect(splitter.instance_variable_get(:'@lines')).to eql ['xxx', 'xxx']
      end

      it('should return remaining letters') do
        splitter.instance_variable_set(:'@line_length', 3)
        splitter.instance_variable_set(:'@lines', [])
        splitter.instance_variable_set(:'@line', [])
        expect(splitter.send(:split_word, 'xxxxxxx')).to eql 'x'
      end
    end

  end

end