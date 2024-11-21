class StudentSerializeStrategy
  def parse_to_student(data)
    raise NotImplementedError, 'Not implemented parse data'
  end
  def parse_to_format(students)
    raise NotImplementedError, 'Not implemented parse data'
  end
end