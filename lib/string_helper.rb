

class StringHelper

  def self.chunk(input_string) # breaks input string into maleable chunks
    chunks =[]
    input_string.chars.each_slice(4) do |slice|
      chunks << slice
    end
    return chunks
  end

  def self.flatten(input_array) # this will be used once we've encrypted the chunks
    return input_array.flatten.join("")
  end

end