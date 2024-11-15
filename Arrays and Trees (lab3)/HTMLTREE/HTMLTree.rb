# Выводим результат

require "./Tag.rb"
class HtmlTree

  include Enumerable

  attr_reader :root

  def initialize(html_string)
    tags = HtmlTree.parse(html_string)
    @root = tags[0]
  end


  def to_s
    self.root.to_s
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


  private 
  def self.parse(html)
    tags = []
    
    # Регулярное выражение для поиска тегов и их содержимого (включая вложенные теги)
    html.scan(/<([a-zA-Z]+)([^>]*)>(.*?)<\/\1>/m) do |tag_name, attrs_string, inner_html|
      # Создаем объект Tag для текущего тега
      tag = Tag.new(tag_name, parse_attrs(attrs_string))
      
      # Парсим вложенные теги рекурсивно
      tag.children = parse(inner_html)
      
      # Добавляем текущий тег в список тегов
      tags << tag
    end
    
    # Если не было вложенных тегов, ищем самозакрывающиеся теги
    html.scan(/<([a-zA-Z]+)([^>]*)\/>/) do |tag_name, attrs_string|
      tags << Tag.new(tag_name, parse_attrs(attrs_string))
    end
    tags
  end

  # Метод для парсинга атрибутов
  def self.parse_attrs(attrs_string)
    attrs = {}
    
    # Регулярное выражение для парсинга атрибутов вида 'key="value"'
    attrs_string.scan(/([a-zA-Z\-]+)="([^"]*)"/) do |key, value|
      attrs[key] = value
    end
    
    attrs
  end
end

html = <<~HTML
<html>
  <body>
    <div class="container">
      <p id="paragraph"></p>
      <a href="https://example.com"></a>
    </div>
    <span class="highlight"></span>
  </body>
</html>
HTML

# Парсим HTML
tree = HtmlTree.new(html)
puts tree.to_s

tree.bfs do |tag|
  puts tag.name
end