require'./StudentValidator.rb'
class Person
  attr_reader :github, :id
  
  protected
  def github=(github)
    if !StudentValidator.valid_github?(github) && github
      raise ArgumentError, "Invalid GitHub profile URL"
    end
    @github = github
  end

  def contact(){
    
  }
end