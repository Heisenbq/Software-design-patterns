require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Serializers/StudentList/IStorageList.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Models/Person/Student.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Serializers/StudentList/Strategy/StudentSerializeStrategy.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Serializers/StudentList/Strategy/StudentSerializeJsonStrategy.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Serializers/StudentList/Strategy/StudentSerializeYamlStrategy.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Serializers/StudentList/StudentListSerializer.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Serializers/StudentList/StudentListSerializerAdapter.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Serializers/StudentList/StudentListDB.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Serializers/StudentList/Filter/AdditionalFilter.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Serializers/StudentList/Filter/FieldFilter.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Serializers/StudentList/Filter/Filter.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Serializers/StudentList/Filter/FilterDecorator.rb')
require 'yaml'
require 'json'
class StudentList 
  def initialize(student_list_adapter)
    unless student_list_adapter.is_a?(IStorageList)
      raise ArgumentError, "required IStorageList"
    end
    @student_list_adapter = student_list_adapter
  end

  def get_student_by_id(id)
    @student_list_adapter.get_student_by_id(id)
  end

  def get_student_short_list(amount_of_elems_on_page,page,filter = nil)
    @student_list_adapter.get_student_short_list(amount_of_elems_on_page, page, filter)
  end

  def add_student_in_list(student)
    @student_list_adapter.add_student_in_list(student)
  end

  def change_by_id(id,student)
    @student_list_adapter.update_student_in_list(id, student)
  end
  def delete(id)
    @student_list_adapter.delete_student_in_list(id)
  end
  def get_student_count(filter = nil)
    @student_list_adapter.get_student_count(filter)
  end
end

# s = Student.new(surname: "GadjievA",first_name: "AkhmedA",last_name: "RuslanovichA",id: 2)
# s1 = Student.new(surname: "GadjievA",first_name: "AkhmedA",last_name: "RuslanovichA",id: 2, email: "asd@mail.ru")
# a = StudentListSerializer.new('D:/3курс/RubyProjects/StudentsLab/files_for_tests/StudentList.yaml', StudentSerializeYamlStrategy.new())
# b = StudentListSerializerAdapter.new(a)

# # db_config = {
# #   host: 'localhost',  
# #   dbname: 'student',  
# #   user: 'postgres',   
# #   password: '2012'  
# # }
# # b = StudentListDB.new(db_config)
# d = StudentList.new(b)
# # # st = d.get_student_short_list(10,1).get_data
# # puts d.get_student_short_list(10,1).get_data W
# # filter = FieldFilter.new()
# # filter.do_filter(st) {|el| el.get_element}
# # mas = [s]
# # filter = AdditionalFilter.new(AdditionalFilter.new(FieldFilter.new("first_name","John"),"surname","Doe"),"last_name","Smit1h")
# # d.add_student_in_list(s)
# puts d.get_student_short_list(10,1).get_data 
# # puts filter.do_filter(mas) {|el| el.surname == "GadjievA"}
# # filter1 = AdditionalFilter.new(filter)
# # puts d.get_student_short_list(5,1,filter).get_data
