class Student
  attr_reader :phone, :telegram, :email, :github, :id, :surname, :first_name, :last_name
  attr_writer :phone, :telegram, :email, :github, :id, :surname, :first_name, :last_name

    
  def initialize(surname, first_name, last_name, id = nil, phone = nil, telegram = nil, email = nil, github = nil)
    @id = id
    @surname = surname
    @first_name = first_name
    @last_name = last_name
    @phone = phone
    @telegram = telegram
    @email = email
    @github = github
  end

  def to_s
    " ID: #{@id}\n ФИО: #{@surname} #{@first_name} #{@last_name}\n Телефон: #{@phone}\n Телеграм: #{@telegram}\n Почта: #{@email}\n Git: #{@github}"
  end
end