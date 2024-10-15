class Validator
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
end