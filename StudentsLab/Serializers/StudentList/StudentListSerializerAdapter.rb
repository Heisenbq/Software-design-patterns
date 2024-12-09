require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Serializers/StudentList/StudentListSerializer.rb')
class StudentListSerializerAdapter < IStorageList
  def initialize(student_list_serializer)
    unless student_list_serializer.is_a?(StudentListSerializer)
      raise ArgumentError, "required StudentListDB"
    end
    @student_list_serializer = student_list_serializer
  end

  def get_student_by_id(id)
    @student_list_serializer.read_from_file()
    @student_list_serializer.get_student_by_id(id)
  end

  def get_student_short_list(amount_of_elems_on_page,page,filter = nil)
    @student_list_serializer.read_from_file()
    @student_list_serializer.get_student_short_list(amount_of_elems_on_page,page,filter)
  end
  
  def add_student_in_list(student)
    @student_list_serializer.read_from_file()
    @student_list_serializer.add_student_in_list(student)
    @student_list_serializer.write_to_file()
  end

  def change_by_id(id,student)
    @student_list_serializer.read_from_file()
    @student_list_serializer.change_by_id(id,student)
    @student_list_serializer.write_to_file()
  end
  def delete(id)
    @student_list_serializer.read_from_file()
    @student_list_serializer.delete(id)
    @student_list_serializer.write_to_file()
  end
  def get_student_count(filter=nil)
    @student_list_serializer.read_from_file()
    @student_list_serializer.get_student_count(filter)
  end
end