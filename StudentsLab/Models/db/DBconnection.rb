require 'pg'

conn = PG.connect({
  host: 'localhost',
  port: 5432,
  dbname: 'your_database_name',
  user: 'your_username',
  password: 'your_password'
})

# Теперь вы можете выполнять запросы
result = conn.exec("SELECT * FROM your_table")

# Обработка результатов
result.each do |row|
  puts row['column_name']
end

conn.close