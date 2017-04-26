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
  puts "The students of Villains Academy"
  puts "-----------"
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_index(students)
    i = 0
    while i < students.length
      puts "#{i+1}. #{students[i][:name]} (#{students[i][:cohort]} cohort)"
      i += 1
  end
end

def print_letter(students, letter)
  students.each_with_index do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)" if student[:name][0] == letter
  end
end

def print_short(students)
  students.each_with_index do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)" if student[:name].length < 11
  end
end

def print_footer(students)
  students.count == 1 ? student_noun = "student" : student_noun = "students"
  puts "Overall, we have #{students.count} great #{student_noun}."
end

students = input_students
print_header
print_index(students)
#print_letter(students, "H")
#print_short(students)
print_footer(students)
