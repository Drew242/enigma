require_relative "io_helper"
require_relative "string_helper"
require_relative "encryptor"

class Encrypt
  attr_reader :encryptor

  def initialize(input_path, output_path)
    @io = IoHelper.new(input_path, output_path)
    @message = @io.read
    @message_chunks = StringHelper.chunk(@message)
    @encryptor = Encryptor.new
    @encrypted_message = @encryptor.encrypt(@message)
    @io.write(@encrypted_message)
  end


  if __FILE__ == $0
    input_path = ARGV[0]
    output_path = ARGV[1]
    encrypt = Encrypt.new(input_path, output_path)
    puts "Created #{output_path} with the key #{encrypt.encryptor.key_generator.rotation}."
  end

end






# at LEAST 4 classes, with 4 tests encryptor, decryptor, key_and_offset_generator, runner, crack

# take a randomly generated 5 digit code
# This produced the 4 rotations, A-D
# i.e. 41521 produces A=>41 B=>15 C=>52 D=>21
# Then add the last four digits of the squared value of date
# i.e. 06-02-15 would be 60215 * 60215 or 362584(6225)
# Add those values to get the official rotation (A + 6, B + 2, etc.)

# As 'chunks' of 4, letters are rotated A,B,C,D

# character map includes alpha, #'s, (_space), " . ", " , "
# can either rotate full number or % 39 and rotate remainder

# if key is not known, use date and assume message ends "..end.."
# rotate until "..end.." to determine key


# need to be able to use the tool from command line
# ruby ./lib/encrypt.rb message.txt encrypted.txt


# time = Time.new time.strftime("%m%d%y")

