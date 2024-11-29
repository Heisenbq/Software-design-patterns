require 'pg'
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Models/db/student/InsertScript.sql')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Models/db/student/StudentDDL.sql')

# Параметры подключения к PostgreSQL
db_config = {
  host: 'localhost',   # Адрес хоста (можно изменить, если PostgreSQL на другом сервере)
  dbname: 'students',   # Название вашей базы данных
  user: 'postgres',   # Имя пользователя
  password: '2012'  # Пароль
}

# Создание подключения к PostgreSQL
conn = PG.connect(db_config)

# Функция для выполнения SQL-скрипта из файла
def execute_sql_from_file(conn, file_path)
  if File.exist?(file_path)
    sql = File.read(file_path)
    conn.exec(sql)
    puts "Успешно выполнен SQL скрипт: #{file_path}"
  else
    puts "Файл не найден: #{file_path}"
  end
end

# Заполнение таблицы данными
execute_sql_from_file(conn, 'db_fills/insert_student_data.sql')

# Закрытие соединения
conn.close