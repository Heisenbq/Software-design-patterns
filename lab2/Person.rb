class Person
  attr_reader :github, :id
  
  protected

  def valid_github?(github)
    !!(github=~/^https:\/\/github\.com\/[a-zA-Z0-9\-]{1,39}$/)
  end

end