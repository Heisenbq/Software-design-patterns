class StudentSerializeStrategy
  def parse_to_student
    raise NotImplementedError, 'Not implemented parse data'
  end
  def parse_to_format
    raise NotImplementedError, 'Not implemented parse data'
  end
end