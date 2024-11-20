require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Validators/StudentValidator.rb')
class Person
  attr_accessor :github, :id
  
  
  def github=(github)
    if !StudentValidator.valid_github?(github) && github
      raise ArgumentError, "Invalid GitHub profile URL"
    end
    @github = github
  end

  protected
  def contact
  end    
  
end