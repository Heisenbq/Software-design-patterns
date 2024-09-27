class Student
  attr_accessor :phone, :telegram, :email, :github, :id, :surname, :first_name, :last_name
  
    
  def initialize(surname,first_name,last_name, args)
    @id = args[:id]
    @surname = surname
    @first_name = first_name
    @last_name = last_name
    @phone = args[:phone]
    @telegram = args[:telegram]
    @email = args[:email]
    @github = args[:github]
  end

  def to_s
    " ID: #{@id}\n ФИО: #{@surname} #{@first_name} #{@last_name}\n Телефон: #{@phone}\n Телеграм: #{@telegram}\n Почта: #{@email}\n Git: #{@github}"
  end
end