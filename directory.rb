def interactive_menu
  students = []
  loop do
    #1. print the menu and ask what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    #2. read the input and save it in a variable
    selection = gets.chomp
    #3. do what the user has asked
    case selection
      when "1"
        students = input_students
      when "2"
        if students.count > 0
          print_header
          print(students)
          print_footer(students)
        else
          puts "There are no students to show"
        end
      when "9"
        exit
      else
        puts "I don't fully understand, try again."
    end
  end
end

def input_students
  puts "Please enter the name and cohort of the students;"
  puts "To finish, just hit return twice."
  students = []
  name = gets.chomp
  cohort = gets.chomp
  cohort = :unknown if cohort == ""

  while !name.empty? do
    students << {name: name, cohort: cohort}
    students.count == 1 ? student_noun = "student" : student_noun = "students"
    puts "Now we have #{students.count} #{student_noun}!"
    name = gets.chomp
    cohort = gets.chomp
    cohort = :unknown if cohort == ""
  end
  students
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts "-----------".center(50)
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)".center(50)
  end
end

def print_footer(students)
  students.count == 1 ? student_noun = "student" : student_noun = "students"
  puts "Overall, we have #{students.count} great #{student_noun}.".center(50)
end

interactive_menu
