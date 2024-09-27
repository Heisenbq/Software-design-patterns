class Student
  attr_accessor :phone, :telegram, :email, :github, :id, :surname, :first_name, :last_name

    
  def initialize(surname, first_name, last_name, id = nil, phone = nil, telegram = nil, email = nil, github = nil)
    @id = id
    @surname = surname
    @first_name = first_name
    @last_name = middle_name
    @phone = phone
    @telegram = telegram
    @email = email
    @github = github
  end

  # Геттер для фамилии
  def surname
    @surname
  end

  # Сеттер для фамилии
  def surname=(surname)
    @surname = surname
  end

  # Геттер для имени
  def first_name
    @first_name
  end

  # Сеттер для имени
  def first_name=(first_name)
    @first_name = first_name
  end

  # Геттер для отчества
  def last_name
    @last_name
  end

  # Сеттер для отчества
  def last_name=(last_name)
    @last_name = last_name
  end

  # Геттер для ID
  def id
    @id
  end

  # Сеттер для ID
  def id=(id)
    @id = id
  end

  # Геттер для телефона
  def phone
    @phone
  end

  # Сеттер для телефона
  def phone=(phone)
    @phone = phone
  end

  # Геттер для Telegram
  def telegram
    @telegram
  end

  # Сеттер для Telegram
  def telegram=(telegram)
    @telegram = telegram
  end

  # Геттер для почты
  def email
    @email
  end

  # Сеттер для почты
  def email=(email)
    @email = email
  end

  # Геттер для GitHub
  def github
    @github
  end

  # Сеттер для GitHub
  def github=(github)
    @github = github
  end
end