class Person
  def initialize(full_name)
    @full_name = full_name
  end
end

class Student < Person
  def initialize(full_name, about)
    super(full_name)
    @about = about
  end

  def to_s
    "#{@full_name} - #{@about}"
  end
end

class Coach < Person
  def initialize(full_name, bio)
    super(full_name)
    @bio = bio
    @skills = []
  end

  def add_skill(skill)
    @skills << skill
  end

  def to_s
    ["#{@full_name} - #{@skills.join(',')}",
    "#{@bio}"].join('\\n')
  end
end

class Workshop
  def initialize(date, venue_name)
    @date = date
    @venue_name = venue_name
    @coaches = []
    @students = []
  end

  def add_participant(member)
    if member.is_a?(Coach)
      @coaches << member
    elsif member.is_a?(Student)
      @students << member
    else
      "Please register participant first"
    end
  end

  def print_details
    p '#'
    p "Workshop - #{@date} - Venue: #{@venue_name}"
    p '#'
    p "Students"
    students_list(@students) unless @students.empty?
    p '#'
    p "Coaches"
    coaches_list(@coaches) unless @coaches.empty?
    p '#'

    nil
  end

  def students_list(students)
    students.each_with_index do |student, index|
      p "#{index+1}. #{student.to_s}"
    end
  end

  def coaches_list(coaches)
    coaches.each_with_index do |coach, index|
      p "#{index+1}. #{coach.to_s}"
    end
  end
end






# instructions
workshop = Workshop.new("12/03/2014", "Shutl")

jane = Student.new("Jane Doe", "I am trying to learn programming and need some help")
lena = Student.new("Lena Smith", "I am really excited about learning to program!")
vicky = Coach.new("Vicky Ruby", "I want to help people learn coding.")
vicky.add_skill("HTML")
vicky.add_skill("JavaScript")
nicole = Coach.new("Nicole McMillan", "I have been programming for 5 years in Ruby and want to spread the love")
nicole.add_skill("Ruby")

workshop.add_participant(jane)
workshop.add_participant(lena)
workshop.add_participant(vicky)
workshop.add_participant(nicole)
workshop.print_details

=begin
obtained results

"#"
"Workshop - 12/03/2014 - Venue: Shutl"
"#"
"Students"
"Jane Doe - I am trying to learn programming and need some help"
"Lena Smith - I am really excited about learning to program!"
"#"
"Coaches"
"Vicky Ruby - HTML,JavaScript"
"\tI want to help people learn coding."
"Nicole McMillan - Ruby"
"\tI have been programming for 5 years in Ruby and want to spread the love"
"#"
=end
