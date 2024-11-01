require "./Tag.rb"

class HTMLTree 
  include Enumerable

  attr_accessor :root

  def initialize(html_string)
    @root = parse_html(html_string)
  end

  def parse_html(html_string)
    tags = []
    root_tag = nil
    current_tag = nil
  
    # Регулярное выражение для тегов, атрибутов и самозакрывающихся тегов
    tag_regex = /<(?<closing>\/)?(?<tag>\w+)(?<attributes>[^\/>]*)(?<self_closing>\/)?>/
  
    html_string.scan(tag_regex) do |closing, tag_name, attributes_str, self_closing|
      if closing
        # Закрывающий тег - проверяем соответствие со стеком
        if tags.empty? || tags.last.name != tag_name
          raise "Несоответствие тегов: закрывающий тег </#{tag_name}> не совпадает"
        end
        # Возвращаемся к родителю
        current_tag = tags.pop
      else
        # Открывающий или самозакрывающийся тег
        attributes = parse_attributes(attributes_str)
        new_tag = Tag.new(tag_name, attributes)
  
        # Если текущий тег уже есть, добавляем новый как дочерний
        if current_tag
          current_tag.add_children(new_tag)
        else
          root_tag = new_tag
        end
  
        # Если тег не самозакрывающийся, добавляем его в стек для последующей обработки
        unless self_closing
          tags.push(new_tag)
          current_tag = new_tag
        end
      end
    end
  
    root_tag
  end

  def parse_attributes(attributes_str)
    attributes = {}
    attributes_str.scan(/(\w+)="([^"]*)"/) do |key, value|
      attributes[key] = value
    end
    attributes
  end


  def dfs(node = @root, &block)
    yield node
    node.children.each do |child|
      dfs(child, &block)
    end
  end


  def bfs(&block)
    queue = [@root]
    until queue.empty?
      node = queue.shift
      yield node
      queue.concat(node.children)
    end
  end

  def each(&block)
    dfs(&block)
  end
end

# html_string = <<-HTML
# <html>
#   <body>
#     <div class="container">
#       <p id="paragraph">Hello, World!</p>
#     </div>
#     <p></p>
#   </body>

#   <div type="text"></div>
# </html>
# HTML


html_string = <<-HTML
<html>
  <body>
    <div class="container">
      <p id="paragraph">Hello, World!</p>
      <a></a>
    </div>
    <span></span>
  </body>
</html>
HTML

# Создаем дерево из HTML-строки
tree = HTMLTree.new(html_string)
# tree.dfs {|el| puts el}
# Вывод дерева с табуляцией
puts tree.root.to_s
puts "\n\n"

# tree.dfs {|el| puts el.name}
# puts "\n\n"

# tree.bfs {|el| puts el.name}

puts tree.root.children[0].children[0].children[1].name


