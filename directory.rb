require 'csv'

@students = []
puts "You are running #{__FILE__}"

def interactive_menu
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
            save_students(choose_file)
        when "4"
            load_students(choose_file)
        when "9"
            exit # this will cause the program to terminate
        else
            puts "I don't know what you meant, try again"
        end
end

def show_students
    print_header
    print_students
    print_footer
end

def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit enter twice"

    # get the first name
    name = STDIN.gets.chomp
    # while the name is empty, repeat this code
    while !name.empty? do
        # add the student hash to the array
        add_student(name, :november)
        puts "Now we have #{@students.count} students"
        # get another name from the user
        name = STDIN.gets.chomp
    end
end

def add_student(name, cohort)
    @students << { name: name, cohort: cohort }
end


def print_header
    puts "The students of Villains Academy"
    puts "-------------"
end

def print_students
    @students.each do |student|
        puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
end

def print_footer
    puts "Overall, we have #{@students.count} great students"
end

def save_students(filename = "students.csv")
    CSV.open(filename, "w") do |csv|
        @students.each do |student|
            student_data = [student[:name], student[:cohort]]
            csv << student_data
        end
    end
    puts "Saved #{@students.count} student(s) to #{filename}"
end

def load_students(filename = "students.csv")
    CSV.foreach(filename) do |line|
        name, cohort = line
        add_student(name, cohort.to_sym)
    end
    puts "Loaded #{@students.count} student(s) from #{filename}"
end

def try_load_students
    filename = ARGV.first
    return if filename.nil? 
    if File.exists?(filename)
        load_students(filename)
        puts "Loaded #{@students.count} from #{filename}"
    else
        puts "Sorry, #{filename} doesn't exist."
        exit # quit the program
    end
end

def choose_file
    puts "Which file do you want to edit?"
    filename = gets.chomp
    # repeat this code if user enter nothing
    if filename.empty?
        filename = ARGV.first.nil? ? "students.csv" : ARGV.first
    end
    # return file
    filename
end

try_load_students
interactive_menu