def input_students
    puts "Please enter the names of the students"
    puts "To finish, enter 'stop'"

    # create an empty array
    students = []
    # get the first name
    name = gets.chomp
    # repeat this code
    loop do
        # until user enter "stop"
        break if name == "stop"
        # check if it is empty
        if name.empty?
            name = "Unknown"
        end

        # add the student hash to the array
        students << { name: name, cohort: input_cohort, country_of_birth: input_country_of_birth(name) , hobbies: input_hobbies(name) }
        puts "Now we have #{students.count} students"
        # get another name from the user
        puts "Add another student's name or enter 'stop' to finish"
        name = gets.chomp
    end
    # return the array of students
    students
end

def input_cohort
    month_table = [
        "January", "February", "March",
        "April", "May", "June", "July", 
        "August", "September", "October",
        "November", "December"
    ]
    
    # get the cohort
    puts "Which cohort are you in? (Please type in full month name)"
    cohort = gets.chomp

    # check if it is empty
    if cohort.empty?
        cohort = "Unknown"
    else
        # check if input is valid
        if !month_table.include?(cohort)
            puts "Invalid month input. Please enter again."
            cohort = gets.chomp
        end
    end

    # if valid input, turn it into symbol
    cohort == "No input" ? cohort : cohort.to_sym
end

def input_country_of_birth(name)
    # get country of birth
    puts "Please enter where #{name} was born"
    country_of_birth = gets.chomp
    # if user enters nothing, repeat the code
    while country_of_birth.empty?
        country_of_birth = gets.chomp
    end
    # return country of birth
    country_of_birth
end

def input_hobbies(name)
    # create an empty array
    hobbies = []
    # get hobby
    puts "Please enter #{name}'s hobbies"
    puts "Hit enter twice to go to next step"
    hobby = gets.chomp

    # while the hobby is empty, repeat this code
    while !hobby.empty?
        hobbies << hobby
        puts "Now #{name} has #{hobbies.count} hobbies"
        # ask another hobby
        hobby = gets.chomp
    end

    # return a list of hobbies
    hobbies
end

def input_special_letter
    # get a special letter for filter
    puts "Please indicate a special letter for filtering. (Optional)"
    special_letter = gets.chomp
end

def print_header(special_letter)
    puts "The students of Villains Academy".center(100)
    if !special_letter.empty?
        puts "With '#{special_letter.upcase}' letter filter".center(100)
    end
    puts "-------------".center(100)
end

def print_students(students, special_letter)
    #Variables
    index = 0
    
    # collect existing cohort
    existing_cohort = []
    students.each do |student|
        cohort = student[:cohort]
        !existing_cohort.include?(cohort) && existing_cohort << cohort
    end

    # check if there is any special letter filter
    if !special_letter.empty?
        # select only student whose name begins with special letter
        students = students.select do |student|
            student[:name][0].downcase == special_letter.downcase
        end
    end

    # loop through the students array by group with cohort
    existing_cohort.each do |cohort|
        puts "#{cohort.to_s} cohort".center(100)
        puts "----".center(100)
        # filter out students with selected cohort
        selected_students = students.select do |student|
            student[:cohort] == cohort
        end

        # then print them out
        selected_students.each do |student|
            if student[:name].length < 12
                puts "#{index + 1}. #{student[:name]} (hobbies: #{student[:hobbies]}, born in: #{student[:country_of_birth]})".center(100)
            end
        end
    end
end

def print_footer(students)
    puts "-------------".center(100)
    puts "Overall, we have #{students.count} great #{students.count > 1 ? 'students' : 'student'}.".center(100)
end

special_letter = input_special_letter
students = input_students
if students.count > 0
    print_header(special_letter)
    print_students(students, special_letter)
    print_footer(students)
end