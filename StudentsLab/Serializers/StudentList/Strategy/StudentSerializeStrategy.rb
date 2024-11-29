class StudentSerializeStrategy
  # из какого формата json or yaml в класс Student
  def parse_to_student(data)
    raise NotImplementedError, 'Not implemented parse data'
  end
  # наоборот
  def parse_to_format(students)
    raise NotImplementedError, 'Not implemented parse data'
  end
end