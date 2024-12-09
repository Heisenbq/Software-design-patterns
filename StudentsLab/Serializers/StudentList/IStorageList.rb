class IStorageList
  private
  def get_student_by_id(id)
    raise NotImplementedError, 'Not implemented'
  end

  def get_student_short_list(amount_of_elems_on_page,page)
    raise NotImplementedError, 'Not implemented'
  end

  def add_student_in_list(student)
    raise NotImplementedError, 'Not implemented'
  end

  def change_by_id(id,student)
    raise NotImplementedError, 'Not implemented'
  end
  def delete(id)
    raise NotImplementedError, 'Not implemented'
  end
  def get_student_count(filter=nil)
    raise NotImplementedError, 'Not implemented'
  end
end