require_relative './classroom'
require_relative './person'
require_relative './rental'
require_relative './teacher'
require_relative './book'
require 'date'

class Student < Person
  attr_accessor :classroom

  # rubocop:disable Style/OptionalBooleanParameter
  def initialize(age, name = 'Unknown', parent_permission = true)
    # rubocop:enable Style/OptionalBooleanParameter
    super(age, name, parent_permission)
  end
end
