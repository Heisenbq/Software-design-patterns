class Student
  attr_reader :phone, :telegram, :email, :github, :id, :surname, :first_name, :last_name
  attr_writer :telegram, :email, :github, :id, :surname, :first_name, :last_name
    
  def initialize(args)
    @id = args[:id]
    if (!args[:surname] || !args[:first_name] || !args[:last_name]) then
      raise "Exception some of attributes not given"
    end 
    if !valid_phone?(args[:phone]) then 
      raise "Not valid phone number"
    end 
    @surname = args[:surname]
    @first_name = args[:first_name]
    @last_name = args[:last_name]
    @phone = args[:phone]
    @telegram = args[:telegram]
    @email = args[:email]
    @github = args[:github]
  end

  def phone=(phone)
    if !valid_phone?(phone) then 
      raise "Not valid phone number"
    end 
    @phone = phone
  end


  def to_s
    " ID: #{@id}\n ФИО: #{@surname} #{@first_name} #{@last_name}\n Телефон: #{@phone}\n Телеграм: #{@telegram}\n Почта: #{@email}\n Git: #{@github}"
  end

  def valid_phone?(phone)
    !!(phone =~ /^(?:\+7|8)[\s-]?(?:\(?\d{3}\)?[\s-]?)\d{3}[\s-]?\d{2}[\s-]?\d{2}$/)
  end
end