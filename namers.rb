class Namers

  def self.parse_name(name)
    names = name.split(' ')
    names.delete_at(0) if self.honorifics.include? names[0]
    names[-1] = "#{names[-1]},"
    names.rotate!(names.length - 1).join(' ')
  end

  def self.honorifics
    %w(Mr Mr. Ms Ms. Mrs Mrs. Dr Dr.)
  end

end
