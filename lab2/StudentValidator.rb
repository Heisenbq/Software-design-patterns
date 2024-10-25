class StudentValidator
  def self.valid_github?(github)
    !!(github=~/^https:\/\/github\.com\/[a-zA-Z0-9\-]{1,39}$/)
  end

  def self.valid_email?(email)
    !!(email=~/^[\w+\-.]+@[a-z\d\-.]+\.[a-z]+$/i)
  end
  def self.valid_telegram?(telegram)
    !!(telegram=~/^@?[a-zA-Z0-9_]{5,32}$/)
  end
  def self.valid_phone?(phone)
    !!(phone =~ /^(?:\+7|8)[\s-]?(?:\(?\d{3}\)?[\s-]?)\d{3}[\s-]?\d{2}[\s-]?\d{2}$/)
  end

  def self.valid_contact?(contact)
    valid_email?(contact) || valid_phone?(contact) || valid_telegram?(contact)
  end

  def self.valid_name?(name)
    !!(name =~ /^[a-zA-Zа-яА-ЯёЁ]+$/)
  end
end