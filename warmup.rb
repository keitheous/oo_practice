class Name
  attr_reader :first, :family, :middle

  def initialize(first, family, middle = '')
    @first = first
    @family = family
    @middle = middle
  end

  def full_name
    p [first, middle ,family].delete_if{|x| x == ''}.join(' ')
  end

  def update_name(first, family, middle)
    @first = first
    @family = family
    @middle = middle unless middle.empty?
  end
end

# me = Name.new('Keith', 'Chong')
  # => #<Name:0x007f8dc2ab5660 @first="Keith", @family="Chong", @middle="">
# me.full_name
  # => "Keith Chong"
# me.update_name('Kim', 'Kardashian', 'Biggarse')
  # => "Kim Biggarse Kardashian"
