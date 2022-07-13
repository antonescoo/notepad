require 'date'
class Task < Post
  def initialize
    super

    @due_date = Time.now
  end

  def read_from_console
    puts "Что надо сделать?"
    @text = STDIN.gets.chomp

    puts "К какому числу? Укажите дату в формате ДД.ММ.ГГГГ, например 12.05.2022"
    input = STDIN.gets.chomp

    @due_date = Date.parse(input)
  end

  def save
    file = File.new(file_path, "w:UTF-8")
    time_string = @created_at.strftime("%Y.%m.%d, %H:%M")
    file.puts(time_string + "\n\r")

    # Так как поле @due_date указывает на объект класса Date, мы можем вызвать у него метод strftime
    # Подробнее о классе Date читайте по ссылкам в материалах
    file.puts("Сделать до #{@due_date.strftime("%Y.%m.%d")}")
    file.puts(@text)

    file.close

    # Напишем пользователю, что задача добавлена
    puts "Ваша задача сохранена"
  end

  def to_stings
    time_string = "Создано: #{@created_at.strftime("%Y.%m.%d, %H:%M:%s")} \n\r \n\r"

    deadline = "Крайний срок: #{@due_date}"

    return [deadline, @text, time_string]
  end
end