def interactive_menu
    @students = []
    loop do
        print_menu
        process(gets.chomp)
    end
end

def process(selection)
    case selection
        when "1"
            input_students
        when "2"
            show_students
        when "9"
            exit # this will cause the program to terminate
        else
            puts "I don't know what you meant, try again"
        end
end

def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
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
    name = gets.chomp
    # while the name is empty, repeat this code
    while !name.empty? do
        # add the student hash to the array
        @students << { name: name, cohort: :november }
        puts "Now we have #{@students.count} students"
        # get another name from the user
        name = gets.chomp
    end

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

interactive_menu