class HtmlParser
  # Метод для парсинга HTML строки
  def self.parse(html)
    tags = []
    
    # Регулярное выражение для поиска тегов и их атрибутов
    html.scan(/<([a-zA-Z]+)([^>]*)>/) do |tag_name, attrs_string|
      tag = { name: tag_name, attrs: parse_attrs(attrs_string) }
      tags << tag
    end
    
    tags
  end

  # Метод для парсинга атрибутов тега (выводится в виде массив хешей где ключ -> имя тега, значение-> атрибуты (хэш ключ значение))
  def self.parse_attrs(attrs_string)
    attrs = {}
    
    # Регулярное выражение для парсинга атрибутов вида 'key="value"'
    attrs_string.scan(/([a-zA-Z\-]+)="([^"]*)"/) do |key, value|
      attrs[key] = value
    end
    
    attrs
  end
end

# Пример использования:
html = <<~HTML
<html>
  <body>
    <div class="container">
      <p id="paragraph"></p>
      <a></a>
    </div>
    <span></span>
  </body>
</html>
HTML

parsed_tags = HtmlParser.parse(html)

# Выводим результат
puts parsed_tags.inspect