class Student
  attr_accessor :phone, :telegram, :email, :github, :id, :surname, :first_name, :last_name

    
  def initialize(id, surname, first_name, last_name, phone: nil, telegram: nil, email: nil, github: nil)
    @id = id
    @surname = surname
    @first_name = first_name
    @last_name = middle_name
    @phone = phone
    @telegram = telegram
    @email = email
    @github = github
  end
end