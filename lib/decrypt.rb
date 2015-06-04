require_relative "io_helper"
require_relative "string_helper"
require_relative "decryptor"

class Decrypt

  def initialize(input_path, output_path, key)
    @io = IoHelper.new(input_path, output_path, key)
    @message = @io.read
    @message_chunks = StringHelper.chunk(@message)
    @decryptor = Decryptor.new(@key)
    @decrypted_message = @decryptor.decrypt(@message)
    @io.write(@decrypted_message)
  end

end

if __FILE__ == $0
  input_path = ARGV[0]
  output_path = ARGV[1]
  key = ARGV[2]
  decrypt = Decrypt.new(input_path, output_path, key)
  puts "Created #{output_path} with the key #{key}."
end

