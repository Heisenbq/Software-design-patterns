# Выводим результат

require "./Tag.rb"
class HtmlParser
  # парсит html по сути в конце вернет самый главный тег 
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
tags = HtmlParser.parse(html)
puts tags[0]
# Выводим результат
# puts tags[0].children[0].children.size
# tags.each do |tag|
#   puts tag.to_s
# end