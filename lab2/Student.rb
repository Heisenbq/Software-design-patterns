class Student
  attr_accessor :phone, :telegram, :email, :github, :id, :surname, :first_name, :last_name
  
    
  def initialize(args)
    @id = args[:id]
    if (!args[:surname] || !args[:first_name] || !args[:last_name]) then
      raise "Exception some of attributes not given"
    end 
    @surname = args[:surname]
    @first_name = args[:first_name]
    @last_name = args[:last_name]
    @phone = args[:phone]
    @telegram = args[:telegram]
    @email = args[:email]
    @github = args[:github]
  end

  def to_s
    " ID: #{@id}\n ФИО: #{@surname} #{@first_name} #{@last_name}\n Телефон: #{@phone}\n Телеграм: #{@telegram}\n Почта: #{@email}\n Git: #{@github}"
  end
end