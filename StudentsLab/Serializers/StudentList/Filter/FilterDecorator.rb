require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Serializers/StudentList/Filter/FilterDecorator.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Serializers/StudentList/Filter/FilterDecorator.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Serializers/StudentList/Filter/Filter.rb')
class FilterDecorator < Filter
  def initialize(filter)
    # raise ArgumentError, "Expect the instance of Filter" if !@filter.is_a?(Filter)
    @filter = filter
  end
  def do_filter(students)
    @filter.do_filter(students)
  end
end