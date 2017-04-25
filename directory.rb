def input_students
  puts "Please enter the names of the students;"
  puts "to finish, just hit return twice."
  students = []
  name = gets.chomp

  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students!"
    name = gets.chomp
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
  puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
print_index(students)
#print_letter(students, "H")
#print_short(students)
print_footer(students)
