
class IoHelper

  def initialize(input_path, output_path, key = nil)
    @input_path = input_path
    @output_path = output_path
    @key = key
  end

  def read # used to read the input, stores and closes
    file_reader = File.open(@input_path, "r")
    message = file_reader.read
    file_reader.close
    return message
  end

  def write(content) # used to write to created file, then closes
    file_writer = File.open(@output_path, "w")
    file_writer.write(content)
    file_writer.close
  end

  def self.create_key(key)
    p key
  end

end