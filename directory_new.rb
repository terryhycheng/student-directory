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
        students << { name: name, cohort: :november }
        puts "Now we have #{students.count} students"
        # get another name from the user
        name = gets.chomp
    end
    # return the array of students
    students
end

def input_special_letter
    puts "Please indicate a special letter for filtering. (Optional)"
    special_letter = gets.chomp
end

def print_header(special_letter)
    puts "The students of Villains Academy"
    if !special_letter.empty?
        puts "With '#{special_letter.upcase}' letter filter"
    end
    puts "-------------"
end

def print_students(students, special_letter)
    index = 0
    
    if !special_letter.empty?
        students = students.select do |student|
            student[:name][0].downcase == special_letter.downcase
        end
    end
    
    while index < students.length
        if students[index][:name].length < 12
            puts "#{index + 1}. #{students[index][:name]} (#{students[index][:cohort]} cohort)"
        end
        index += 1
    end

    # students.each_with_index do |student, index|
    #     if student[:name].length < 12
    #         puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
    #     end
    # end
end

def print_footer(students)
    puts "Overall, we have #{students.count} great students"
end

special_letter = input_special_letter
students = input_students
print_header(special_letter)
print_students(students, special_letter)
print_footer(students)