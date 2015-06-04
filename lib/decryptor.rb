# require_relative "string_helper"
#
# class Decryptor
#
#   def initialize(key)
#     @key = key
#     @rotation = Hash.new { |h, k| h[k] = 0 }
#     @char_array = self.create_character_array
#     @char_map = self.create_character_map(@char_array)
#   end
#
#   def create_character_array # first step in mapping out characters
#     alpha = ("a".."z").to_a
#     numbs = (0..9).to_a.map { |x| x.to_s }
#     specials = [" ", ".", ","]
#     return alpha + numbs + specials
#   end
#
#   def create_character_map(char_array) # this will allow us to reference the character map via hash
#     map = Hash.new
#     char_array.map.with_index do |c, i|
#       map[c] = i
#     end
#     return map
#   end
#
#   def decrypt_chunk(chunk) # algorithm for decrypting chunks
#     decrypted_chunk = []
#     decrypted_chunk << @char_array[(@char_map[chunk[0]] - @key.rotation['A']) % @char_array.length]
#     decrypted_chunk << @char_array[(@char_map[chunk[1]] - @key.rotation['B']) % @char_array.length]
#     decrypted_chunk << @char_array[(@char_map[chunk[2]] - @key.rotation['C']) % @char_array.length]
#     decrypted_chunk << @char_array[(@char_map[chunk[3]] - @key.rotation['D']) % @char_array.length]
#     return decrypted_chunk
#   end
#
#   def decrypt(input_content) # passes chunks through to a new array, while decrypting using previous method
#     chunks = StringHelper.chunk(input_content)
#     decrypted_chunks = []
#     chunks.each do |chunk|
#       decrypted_chunks << self.encrypt_chunk(chunk)
#     end
#     return StringHelper.flatten(decrypted_chunks)
#   end
#
# end