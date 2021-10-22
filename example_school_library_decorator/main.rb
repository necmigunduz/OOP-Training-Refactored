require_relative './student.rb'
require_relative './teacher.rb'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_books
    @books.each do |book|
      puts "Title: \"#{book.title}\", Author: #{book.author}"
    end
  end

  def list_people
    @people.each do |person|
      puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def create_person
    print "Do you want to create a student (1) or a teacher (2)? [Input the number]: "
    person_type = gets.chomp

    print "Age: "
    age = gets.chomp

    print "Name: "
    name = gets.chomp

    person =

    @people << person
    puts "Person created successfully"
  end

  def create_book
    print "Title: "
    title = gets.chomp

    print "Author: "
    author = gets.chomp

    @books << Book.new(title, author)
    puts "Book created successfully"
  end

    
  def create_rental
    puts "Select a book from the following list by number"
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
    puts "Rental created successfully"
  end

  def list_rentals_for_person_id
    print "ID of person: "
    id = gets.chomp.to_i

    rentals = @rentals.filter {|rental| rental.person.id == id}
    puts "Rentals:"
    rentals.each do |rental|
      puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
    end
  end
end

def main
  app = App.new()

  response = nil

  puts "Welcome to School Library App!\n\n"
  while response != "7"
    puts "Please choose an option by enterin a number:"
    puts "1 - List all books"
    puts "2 - List all people"
    puts "3 - Create a person"
    puts "4 - Create a book"
    puts "5 - Create a rental"
    puts "6 - List all rentals for a given person id"
    puts "7 - Exit"
    response = gets.chomp

    case response
    when "1"
      app.list_books()
    when "2"
      app.list_people()
    when "3"
      app.create_person()
    when "4"
      app.create_book()
    when "5"
      app.create_rental()
    when "6"
      app.list_rentals_for_person_id()
    when "7"
      puts "Thank you for using this app!"
    end

    puts "\n"
  end
end

main()
