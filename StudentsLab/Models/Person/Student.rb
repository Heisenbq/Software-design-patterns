require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Models/Person/Person.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Validators/StudentValidator.rb')
require 'date'

class Student < Person
  include Comparable

  attr_reader :phone, :telegram, :email, :surname, :first_name, :last_name, :dob
  attr_writer  :id
    
  def initialize(args = {first_name:,surname:,last_name:,id:nil,github:nil,phone:nil,telegram:nil,email:nil,dob:nil})
    args = symbolize_keys(args)
    @id = args[:id]
    self.surname = args[:surname]
    self.first_name = args[:first_name]
    self.last_name = args[:last_name]
    self.github = args[:github]
    set_contacts(email: args[:email],telegram: args[:telegram],phone: args[:phone])
  end

  def dob=(date)
    begin
      @dob = Date.parse(date.to_s)
    rescue ArgumentError => e
      puts "Ошибка при парсинге даты: #{e.message}"
    end
  end

  def surname=(surname)
    if !StudentValidator.valid_name?(surname)
      raise ArgumentError, "Invalid surname format"
    end
    @surname = surname
  end

  def first_name=(first_name)
    if !StudentValidator.valid_name?(first_name)
      raise ArgumentError, "Invalid first name format"
    end
    @first_name = first_name
  end

  def last_name=(last_name)
    if !StudentValidator.valid_name?(last_name)
      raise ArgumentError, "Invalid last name format"
    end
    @last_name = last_name
  end

  def set_contacts(contacts)

    if !StudentValidator.valid_telegram?(contacts[:telegram]) && contacts[:telegram]
      raise ArgumentError, "Invalid Telegram username"
    end
    @telegram = contacts[:telegram]

    if !StudentValidator.valid_email?(contacts[:email]) && contacts[:email]
      raise ArgumentError, "Invalid email format"
    end
    @email = contacts[:email] 

    if !StudentValidator.valid_phone?(contacts[:phone]) && contacts[:phone]
      raise  ArgumentError, "Not valid phone number"
    end 
    @phone = contacts[:phone]
  end

  def to_s
    " ID: #{@id}\n ФИО: #{@surname} #{@first_name} #{@last_name}\n Телефон: #{@phone}\n Телеграм: #{@telegram}\n Почта: #{@email}\n Git: #{@github}"
  end

  def get_info
    " ФИО: #{surname_initials},\n Git: #{@github},\n Contact #{contact}"
  end

  def surname_initials
    "#{@surname} #{@first_name[0]}.#{@last_name[0]}."
  end

  def contact
    if telegram 
      @telegram
    elsif email
      @email
    elsif phone
      @phone
    else 
      nil
    end
  end
  
  def to_hash
    {
      'phone' => @phone,
      'telegram' => @telegram,
      'email' => @email,
      'surname' => @surname,
      'first_name' => @first_name,
      'last_name' => @last_name,
      'dob' => @dob,
      'id' => @id,
      'github' => @github
    }
  end


  def <=>(other)
    return nil unless other.is_a?(Student)  
    @dob <=> other.dob  
  end

  def ==(other)
    other.is_a?(Student) && @dob == other.dob  
  end

  private

  # Преобразование строковых ключей в символы
  def symbolize_keys(hash)
    hash.each_with_object({}) do |(key, value), symbolized_hash|
      symbolized_hash[key.to_sym] = value
    end
  end

end

# student_data = {
#   "id" => "1",
#   "first_name" => "John",
#   "surname" => "Dosee",
#   "last_name" => "Smith",
#   "email" => "john.doe@example.com",
#   "telegram" => "john_doe_telegram",
#   "phone" => "8-800-535-30-30",
#   "git" => "https://github.com/johndoe",
#   "dob" => "1994-08-22"
# }
# student = Student.new(student_data)
# puts student