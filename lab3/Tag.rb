class Tag 
  attr_accessor :name, :attributes, :children, :content

  def initialize(name, attributes = {},children = [])
    self.name = name
    self.attributes = attributes
    self.children = []
  end

  def add_children(children) 
    self.children.append(children)
  end

  # return num
  def children_count
    self.children.length
  end

  # return bool
  def has_children?
    self.children.empty?
  end

  # return string
  def to_s(lvl = 0)
    tab = "  " * lvl
    "#{tab}<#{name} #{attributes_to_s}>\n#{children_content(lvl+1)}\n#{tab}</#{name}> "
  end

  private 

  def attributes_to_s
    self.attributes.map {|key,value| "#{key} = \"#{value}\" "}.join(" ")
  end

  def children_content(lvl = 0)
    # self.children.map(&:to_s).join
    self.children.map {|el| el.to_s(lvl+1)}.join
  end
# <body>
#   <form action="/submit" method="post">
#   <input type="text" name="username" required placeholder="Введите имя пользователя">
#   <input type="password" name="password" required>
#   <button type="submit">Отправить</button>
#   </form>
# </body> 
end

tag = Tag.new("div",{type: "text", name: "username"})
tagSlave1 = Tag.new("li",{type: "text", name: "username"})
tagSlave2 = Tag.new("ul",{type: "text", name: "username"})
tag.add_children(tagSlave1)
tagSlave1.add_children(tagSlave2)
puts tag