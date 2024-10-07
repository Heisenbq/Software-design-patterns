require './Student.rb'
class Student_short
  attr_reader :contact, :github, :id, :surname_initials

  def self.create_by_student(student)
    contact = student.get_any_contact
    github = student.github
    id = student.id
    surname_initials=student.get_fullname_info
    new(id,surname_initials,contact,github)
  end

  def self.create_by_id_and_string(id,all_info) 

    # Проверка строки на то подходит она или нет и для дальнейщего ее парсинга с помозью метода  match
    regex = /ФИО:\s*(\w+)\s(\w)\.(\w)\.\s*Git:\s*(https?:\/\/\S+)\s*(phone:\s*\+?\d{1,3}\s?\d{1,4}\s?\d{1,4}\s?\d{1,4}|telegram:\s*@\w+|email:\s*[\w+\-.]+@[a-z\d\-.]+\.[a-z]+)/i
    @id = id
    if match = all_info.match(regex)
      surname_initials = match[1] + " " + match[2] + "." + match[3] + "."
      github = match[4]
      contact = match[5]
      new(id,surname_initials,contact,github)
    else 
      raise ArgumentError, "not valid string required format : 'ФИО: Ivanov I.I. Git: https://github.com/Heisenbq phone/telegram/email: something'"
    end

  end

  def initialize(id,surname_initials,contact,github)
    @contact =contact
    @github = github
    @id = id
    @surname_initials = surname_initials
  end

  def to_s 
    " Id: #{@id}\n Contact: #{@contact}\n Github: #{@github}\n Surname and initials: #{@surname_initials}"
  end
end