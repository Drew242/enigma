# require_relative "io_helper"
# require_relative "sting_helper"
# require_relative "decryptor"
#
# class Decrypt
#
#   def initialize(input_path, output_path)
#     @io = IoHelper.new(input_path, output_path)
#     @message = @io.read
#     @message_chunks = StringHelper.chunk(@message)
#     @decryptor = Decryptor.new(key)
#     @decrypted_message = @decryptor.decrypt(@message)
#     @io.write(@decrypted_message)
#   end
#
# end
#
# input_path = "/Users/drew_conly/RubymineProjects/turing_projects/1/enigma/encrypted_messages/test_encryption.txt"
# output_path = "/Users/drew_conly/RubymineProjects/turing_projects/1/enigma/decrypted_messages/test_decryption.txt"
#
# test = Decrypt.new(input_path, output_path)