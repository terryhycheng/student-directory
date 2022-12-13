def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit enter twice"

    # create an empty array
    students = []
    # get the first name
    name = gets.chomp
    # while the name is empty, repeat this code
    while !name.empty? do
        # add the student hash to the array
        students << { name: name, cohort: :November, country_of_birth: input_country_of_birth(name) , hobbies: input_hobbies(name) }
        puts "Now we have #{students.count} students"
        # get another name from the user
        name = gets.chomp
    end
    # return the array of students
    students
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
    index = 0
    # check if there is any special letter filter
    if !special_letter.empty?
        # select only student whose name begins with special letter
        students = students.select do |student|
            student[:name][0].downcase == special_letter.downcase
        end
    end
    # loop through the students array
    while index < students.length
        student = students[index]
        if student[:name].length < 12
            # then print them out
            puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort, hobbies: #{student[:hobbies]}, born in: #{student[:country_of_birth]})".center(100)
        end
        index += 1
    end
end

def print_footer(students)
    puts "Overall, we have #{students.count} great students"
end

special_letter = input_special_letter
students = input_students
print_header(special_letter)
print_students(students, special_letter)
print_footer(students)