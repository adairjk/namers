require_relative '../namers'

  describe 'true test' do
    it 'returns true' do
      expect(true).to eql true
    end
  end

  RSpec.describe Namers do
    it 'should return a name in the correct order' do
      expect(parse_name('John Doe')).to eql 'Doe, John'
    end

    it 'should respect middle names' do
      expect(parse_name('John James Doe')).to eql 'Doe, John James'
    end

    it 'should respect middle initials' do
      expect(parse_name('John J Doe')).to eql 'Doe, John J'
    end

    it 'should respect punctuated middle names' do
      expect(parse_name('John J. Doe')).to eql 'Doe, John J.'
    end

    it 'should respect and drop basic honorifics' do
      expect(parse_name('Dr. John J. Doe')).to eql 'Doe, John J.'
    end

    it 'should respect limited honorifics' do
      expect(Namers.honorifics).to eql %w(Mr Mr. Ms Ms. Mrs Mrs. Dr Dr.)
    end
  end