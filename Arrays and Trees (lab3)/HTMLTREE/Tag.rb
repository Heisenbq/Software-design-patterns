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

  def show_tag
    "<#{name} #{attributes_to_s}>"
  end

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

# <body>
#   <form action="/submit" method="post">
#   <input type="text" name="username" required placeholder="Введите имя пользователя">
#   <input type="password" name="password" required>
#   <button type="submit">Отправить</button>
#   </form>
# </body> 




# tag = Tag.new("div",{type: "text", name: "username"})
# tagSlave1 = Tag.new("li",{type: "text", name: "username"})
# tagSlave2 = Tag.new("ul",{type: "text", name: "username"})
# tag.add_children(tagSlave1)
# tagSlave1.add_children(tagSlave2)
# puts tag
# Create the root HTML tag

# html = Tag.new("html")

# # Create the head tag and add a title child
# head = Tag.new("head")
# title = Tag.new("title")
# title.content = "Example"
# head.add_children(title)

# # Create the body tag and add its children
# body = Tag.new("body")

# # Create a div with a class attribute and add a paragraph and anchor tag as its children
# div = Tag.new("div", { "class" => "container" })

# # Create a paragraph tag with an id and set its content
# p = Tag.new("p", { "id" => "paragraph" })
# p.content = "Hello, World!"
# div.add_children(p)

# # Create an empty anchor tag and add it to the div
# a = Tag.new("a")
# div.add_children(a)

# # Add the div to the body
# body.add_children(div)

# # Create an empty span tag and add it to the body
# span = Tag.new("span")
# body.add_children(span)

# # Add head and body to the html root
# html.add_children(head)
# html.add_children(body)

# puts html.children.size

# puts html.to_s и1