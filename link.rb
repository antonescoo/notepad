
class Link < Post

  def initialize
    super

    @url = ''
  end

  def read_from_console
    puts "Адрес ссылки:"
    @url = STDIN.gets.chomp

    puts "Что за ссылка?"
    @text = STDIN.gets.chomp
  end

  def save
    # Метод save во многом повторяет метод родителя, но отличия существенны

    file = File.new(file_path, "w:UTF-8")
    time_string = @created_at.strftime("%Y.%m.%d, %H:%M")
    file.puts(time_string + "\n\r")

    # Помимо текста мы ещё сохраняем в файл адрес ссылки
    file.puts(@url)
    file.puts(@text)

    file.close

    # Напишем пользователю, что запись добавлена
    puts "Ваша ссылка сохранена"
  end

  def to_stings
    time_string = "Создано: #{@created_at.strftime("%Y.%m.%d, %H:%M:%s")} \n\r \n\r"

    return [@url, @text, time_string]
  end
end