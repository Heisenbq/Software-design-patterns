require './Student.rb'
require './Person.rb'
require './Validator.rb'
class Student_short < Person
  attr_reader :contact, :surname_initials

  def self.create_by_student(student)    
    contact = student.get_any_contact.split(': ',2).last.lstrip
    github = student.github
    id = student.id
    surname_initials=student.get_fullname_info
    new(id,surname_initials,contact,github)
  end

  def self.create_by_id_and_string(id,all_info) 

    surname_initials = all_info.match(/ФИО:\s*([^,]+)/)&.captures&.first&.strip,
    github = all_info.match(/Git:\s*([^,]+)/)&.captures&.first&.strip,
    contact = all_info.match(/phone\/telegram\/email:\s*(.+)/)&.captures&.first&.strip
    new(id,surname_initials,contact,github)
  end
  
  def to_s 
    " Id: #{@id}\n Contact: #{@contact}\n Github: #{@github}\n Surname and initials: #{@surname_initials}"
  end

  private 
  def initialize(id,surname_initials,contact,github)
    @contact =contact
    if !Validator.valid_contact?(contact) && !contact == "info about contacts is empty"
      raise ArgumentError, "Invalid contact format"
    end
    if !Validator.valid_github?(github) && github
      raise ArgumentError, "Invalid GitHub profile URL"
    end
    @github = github
    @id = id
    @surname_initials = surname_initials
  end
end