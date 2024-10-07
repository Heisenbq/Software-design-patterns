class Student
  attr_reader :phone, :telegram, :email, :github, :id, :surname, :first_name, :last_name
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
    if !valid_name?(surname)
      raise ArgumentError, "Invalid surname format"
    end
    @surname = surname
  end

  def first_name=(first_name)
    if !valid_name?(first_name)
      raise ArgumentError, "Invalid first name format"
    end
    @first_name = first_name
  end

  def last_name=(last_name)
    if !valid_name?(last_name)
      raise ArgumentError, "Invalid last name format"
    end
    @last_name = last_name
  end
  
  def set_contacts(contacts)

    if !valid_telegram?(contacts[:telegram]) && contacts[:telegram]
      raise ArgumentError, "Invalid Telegram username"
    end
    @telegram = contacts[:telegram]

    if !valid_github?(contacts[:github]) && contacts[:github]
      raise ArgumentError, "Invalid GitHub profile URL"
    end
    @github = contacts[:github]

    if !valid_email?(contacts[:email]) && contacts[:email]
      raise ArgumentError, "Invalid email format"
    end
    @email = contacts[:email] 

    if !valid_phone?(contacts[:phone]) && contacts[:phone]
      raise  ArgumentError, "Not valid phone number"
    end 
    @phone = contacts[:phone]
  end

  def to_s
    " ID: #{@id}\n ФИО: #{@surname} #{@first_name} #{@last_name}\n Телефон: #{@phone}\n Телеграм: #{@telegram}\n Почта: #{@email}\n Git: #{@github}"
  end

  def get_info
    " ФИО: #{@surname} #{@first_name[0]}.#{@last_name[0]}.\n Git: #{@github}\n #{get_any_contact}"
  end

  def get_any_contact
    if telegram 
      "telegram: #{@telegram}"
    elsif email
      "telegram: #{@email}"
    elsif phone
      "phone: #{@phone}"
    else 
      "info about contacts is empty"
    end
  end

  def valid_phone?(phone)
    !!(phone =~ /^(?:\+7|8)[\s-]?(?:\(?\d{3}\)?[\s-]?)\d{3}[\s-]?\d{2}[\s-]?\d{2}$/)
  end
  def valid_name?(name)
    !!(name =~ /^[a-zA-Zа-яА-ЯёЁ]+$/)
  end
  def valid_email?(email)
    !!(email=~/^[\w+\-.]+@[a-z\d\-.]+\.[a-z]+$/i)
  end
  def valid_telegram?(telegram)
    !!(telegram=~/^@?[a-zA-Z0-9_]{5,32}$/)
  end
  def valid_github?(github)
    !!(github=~/^https:\/\/github\.com\/[a-zA-Z0-9\-]{1,39}$/)
  end

end