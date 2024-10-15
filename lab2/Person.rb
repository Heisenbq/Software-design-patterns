class Person
  attr_reader :github, :id
  
  protected
  def get_any_contact
    if telegram 
      "telegram: #{@telegram}"
    elsif email
      "email: #{@email}"
    elsif phone
      "phone: #{@phone}"
    else 
      "info about contacts is empty"
    end
  end

end