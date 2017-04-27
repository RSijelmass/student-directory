def interactive_menu
  @students ||= []
  initial_load_students
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit
    else
      puts "I don't fully understand, try again."
  end
end

def add_student
  @students << {name: @name, cohort: @cohort}
end

def get_student_info
  @name = STDIN.gets.chomp
  @cohort = STDIN.gets.chomp
  @cohort = :unknown if @cohort == ""
end

def input_students
  puts "Please enter the name and cohort of the students;"
  puts "To finish, just hit return twice."
  get_student_info
  while !@name.empty? do
    add_student
    @students.count == 1 ? student_noun = "student" : student_noun = "students"
    puts "Now we have #{@students.count} #{student_noun}!"
    get_student_info
  end
end

def save_students
  file = File.open("students.csv","w")
  @students.each do |student|
    student_data = [student[:name],student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def initial_load_students
  filename = ARGV.first
  filename = "students.csv" if filename.nil?
  load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
end

def load_students(filename = "students.csv")
  file = File.open(filename,"r")
  file.readlines.each do |line|
    @name, @cohort = line.chomp.split(",")
    add_student
  end
  file.close
end

def show_students
  if @students != []
    print_header
    print_students_list
    print_footer
  else
    puts "There are no students to show"
  end
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts "-----------".center(50)
end

def print_students_list
   @students.each do |student|
     puts "#{student[:name]} (#{student[:cohort]} cohort)".center(50)
   end
end

def print_footer
  @students.count == 1 ? student_noun = "student" : student_noun = "students"
  puts "Overall, we have #{@students.count} great #{student_noun}.".center(50)
end

interactive_menu
