require './Person.rb'
require'./Validator.rb'
class Student < Person
  attr_reader :phone, :telegram, :email, :surname, :first_name, :last_name
  attr_writer  :id
    
  def initialize(args)
    @id = args[:id]
    if (!args[:surname] || !args[:first_name] || !args[:last_name])
      raise "Exception: some of the required attributes are not given"
    end

    self.surname = args[:surname]
    self.first_name = args[:first_name]
    self.last_name = args[:last_name]
    set_contacts(github: args[:github],email: args[:email],telegram: args[:telegram],phone: args[:phone])
  end

  def surname=(surname)
    if !Validator.valid_name?(surname)
      raise ArgumentError, "Invalid surname format"
    end
    @surname = surname
  end

  def first_name=(first_name)
    if !Validator.valid_name?(first_name)
      raise ArgumentError, "Invalid first name format"
    end
    @first_name = first_name
  end

  def last_name=(last_name)
    if !Validator.valid_name?(last_name)
      raise ArgumentError, "Invalid last name format"
    end
    @last_name = last_name
  end

  def set_contacts(contacts)

    if !Validator.valid_telegram?(contacts[:telegram]) && contacts[:telegram]
      raise ArgumentError, "Invalid Telegram username"
    end
    @telegram = contacts[:telegram]

    if !Validator.valid_github?(contacts[:github]) && contacts[:github]
      raise ArgumentError, "Invalid GitHub profile URL"
    end
    @github = contacts[:github]

    if !Validator.valid_email?(contacts[:email]) && contacts[:email]
      raise ArgumentError, "Invalid email format"
    end
    @email = contacts[:email] 

    if !Validator.valid_phone?(contacts[:phone]) && contacts[:phone]
      raise  ArgumentError, "Not valid phone number"
    end 
    @phone = contacts[:phone]
  end

  def to_s
    " ID: #{@id}\n ФИО: #{@surname} #{@first_name} #{@last_name}\n Телефон: #{@phone}\n Телеграм: #{@telegram}\n Почта: #{@email}\n Git: #{@github}"
  end

  def get_info
    " ФИО: #{get_fullname_info},\n Git: #{@github},\n #{get_any_contact}"
  end

  def get_fullname_info
    "#{@surname} #{@first_name[0]}.#{@last_name[0]}."
  end

  def get_any_contact
    if telegram 
      "telegram: #{@telegram}"
    elsif email
      "email: #{@email}"
    elsif phone
      "phone: #{@phone}"
    else 
      "info about contacts is empty"
    end
  end

end