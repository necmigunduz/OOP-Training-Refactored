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
end
