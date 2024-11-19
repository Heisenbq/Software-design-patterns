require 'DataList.rb'
class DataListStudentShort < DataList
  def get_names
    ['№', 'contact', 'github', 'surname_initials']
  end

  def get_data
    index = 1
    data = []
    student_short = select(index)
    row = [index, student_short.contact, student_short.surname_initials,student_short.github]
    
  end
end
