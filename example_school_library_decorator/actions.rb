require_relative 'book'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'

module Actions
  def list_books
    @books.each do |book|
      puts "Title: \"#{book.title}\", Author: #{book.author}"
    end
    start_app
  end

  def list_people
    @people.each do |person|
      puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    start_app
  end

  def list_rentals_for_person_id
    print 'ID of person: '
    id = gets.chomp.to_i

    rentals = @rentals.filter { |rental| rental.person.id == id }
    puts 'Rentals:'
    rentals.each do |rental|
      puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
    end
    start_app
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    # rubocop:disable Lint/UselessAssignment
    person_type = 0
    person_type = gets.chomp
    # rubocop:enable Lint/UselessAssignment

    if person_type != '1' && person_type != '2'
      puts 'Invalid option'
      return
    end

    case person_type
    when '1'
      create_student
    when '2'
      create_teacher
    end

    puts 'Person created successfully'
    start_app
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp

    @people.push(Teacher.new(age, specialization, name))
  end

  def create_student
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp
    parent_permission = parent_permission.downcase == 'y'

    @people.push(Student.new(age, name, parent_permission))
  end

  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    @books << Book.new(title, author)
    puts 'Book created successfully'
    start_app
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index do |book, index|
      puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
    end
    book_index = gets.chomp.to_i

    puts "\nSelect a person from the following list by number (not id)"
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_index = gets.chomp.to_i

    print "\nDate: "
    date = gets.chomp

    @rentals << Rental.new(date, @books[book_index], @people[person_index])
    puts 'Rental created successfully'
    start_app
  end
end
