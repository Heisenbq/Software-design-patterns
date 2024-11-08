require './Student.rb'
require './Person.rb'
require './StudentValidator.rb'
class Student_short < Person
  attr_reader :contact, :surname_initials
  private_class_method :new

  def self.create_by_student(student)    
    contact = student.contact
    github = student.github
    id = student.id
    surname_initials=student.surname_initials
    new(id,surname_initials,contact,github)
  end

  def self.create_by_id_and_string(id,all_info) 
    github = all_info.match(/Git:\s*([^,]+)/)&.captures&.first&.strip
    contact = all_info.match(/phone\/telegram\/email:\s*(.+)/)&.captures&.first&.strip
    surname_initials = all_info.match(/ФИО:\s*([^,]+)/)&.captures&.first&.strip
    new(id,surname_initials,contact,github)
  end
  
  def to_s 
    " Id: #{@id}\n Contact: #{@contact}\n Github: #{@github}\n Surname and initials: #{@surname_initials}"
  end

  def initialize(id,surname_initials,contact,github)
    @contact =contact
    if !StudentValidator.valid_contact?(contact) && !contact == "info about contacts is empty"
      raise ArgumentError, "Invalid contact format"
    end
    self.github = github
    @id = id
    @surname_initials = surname_initials
  end
end