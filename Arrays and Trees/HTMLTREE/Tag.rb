class Tag 
  attr_accessor :name, :attributes, :children

  def initialize(name, attributes = {})
    self.name = name
    self.attributes = attributes
    self.children = []
  end

  def add_children(children) 
    self.children.append(children) if children.is_a?(Tag)
  end

  # return num
  def children_count
    self.children.length
  end

  # return bool
  def has_children?
    !self.children.empty?
  end

  # def show_tag
  #   "<#{name} #{attributes_to_s}>"
  # end

  #return string
  def to_s(lvl = 0)
    tab = "  " * lvl
    if children.empty?
      "#{tab}<#{name} #{attributes_to_s}></#{name}>"
    else
      "#{tab}<#{name} #{attributes_to_s}>\n#{children_content(lvl+1)}\n#{tab}</#{name}>"
    end
  end
  
  private 

  def attributes_to_s
    return '' if attributes.empty?
    self.attributes.map {|key,value| "#{key} = \"#{value}\" "}.join('')
  end

  def children_content(lvl = 0)
    self.children.map {|el| el.to_s(lvl+1)}.join("\n")
  end
end

# t = Tag.new('div',{'size:': '1'})
# m = Tag.new('p',{'size:': '2'})
# f = Tag.new('li',{'size:': '3'})
# s = Tag.new('ul',{'size:': '4'})
# t.add_children(m)
# t.add_children(f)
# m.add_children(s)
# puts t.to_s

