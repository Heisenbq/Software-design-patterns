require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Serializers/StudentList/StudentList.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Serializers/StudentList/StudentListDB.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Models/DataList/DataList.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Models/DataList/DataListStudentShort.rb')
class StudentListController
  def initialize(view)
    db_config = {
      host: 'localhost',  
      dbname: 'student',  
      user: 'postgres',   
      password: '2012'  
    }
    @data_list_student_short = nil
    @student_list = StudentList.new(StudentListDB.new(db_config))
    # @student_list = StudentList.new(StudentListSerializerAdapter.new(StudentListSerializer.new('D:/3курс/RubyProjects/StudentsLab/files_for_tests/StudentList.yaml', StudentSerializeYamlStrategy.new())))
    @view = view
  end
  
  def refresh_data(elems_on_page,page)
    if @data_list_student_short == nil
      @data_list_student_short = @student_list.get_student_short_list(elems_on_page,page)
      @data_list_student_short.add_observer(@view)
    end
    @data_list_student_short.data = @student_list.get_student_short_list(elems_on_page,page).data
    @data_list_student_short.notify
  end

  def get_student_count(filter = nil)
    @student_list.get_student_count
  end
end
