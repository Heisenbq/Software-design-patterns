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
    self.phone = args[:phone]
    self.telegram = args[:telegram]
    self.email = args[:email]
    self.github = args[:github]
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

  def phone=(phone)
    if !valid_phone?(phone)
      raise  ArgumentError, "Not valid phone number"
    end 
    @phone = phone
  end

  def email=(email)
    if !valid_email?(email)
      raise ArgumentError, "Invalid email format"
    end
    @email = email
  end

  def telegram=(telegram)
    if !valid_telegram?(telegram)
      raise ArgumentError, "Invalid Telegram username"
    end
    @telegram = telegram
  end

  def github=(github)
    if !valid_github?(github)
      raise ArgumentError, "Invalid GitHub profile URL"
    end
    @github = github
  end
  
  def to_s
    " ID: #{@id}\n ФИО: #{@surname} #{@first_name} #{@last_name}\n Телефон: #{@phone}\n Телеграм: #{@telegram}\n Почта: #{@email}\n Git: #{@github}"
  end

  private 

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