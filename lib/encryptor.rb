require_relative "key_generator"
require_relative "string_helper"

class Encryptor
  attr_reader :key_generator

  def initialize
    @key_generator = KeyGenerator.new
    @char_array = self.create_character_array
    @char_map = self.create_character_map(@char_array)
  end

  def create_character_array # first step in mapping out characters
    alpha = ("a".."z").to_a
    numbs = (0..9).to_a.map { |x| x.to_s }
    specials = [" ", ".", ","]
    return alpha + numbs + specials
  end

  def create_character_map(char_array) # this will allow us to reference the character map via hash
    map = Hash.new
    char_array.map.with_index do |c, i|
        map[c] = i
    end
    return map
  end

  def encrypt_chunk(chunk) # algorithm for encrypting chunks
    encrypted_chunk = []
    encrypted_chunk << @char_array[(@char_map[chunk[0]] + @key_generator.rotation['A']) % @char_array.length]
    encrypted_chunk << @char_array[(@char_map[chunk[1]] + @key_generator.rotation['B']) % @char_array.length]
    encrypted_chunk << @char_array[(@char_map[chunk[2]] + @key_generator.rotation['C']) % @char_array.length]
    encrypted_chunk << @char_array[(@char_map[chunk[3]] + @key_generator.rotation['D']) % @char_array.length]
    return encrypted_chunk
  end

  def encrypt(input_content) # passes chunks through to a new array, while encrypting using previous method
    chunks = StringHelper.chunk(input_content)
    encrypted_chunks = []
    chunks.each do |chunk|
      encrypted_chunks << self.encrypt_chunk(chunk)
    end
    return StringHelper.flatten(encrypted_chunks)
  end

end