
class KeyGenerator

  def initialize
    @rotation = Hash.new { |h, k| h[k] = 0 }
    @random_key = self.generate_random_key
    self.add_random_rotation
    @date_key = self.generate_date_key
    self.add_date_rotation
  end

  def rotation
    return @rotation
  end

  def generate_random_key # gives us a random, 5 digit number
    numbers = []
    5.times do
      numbers << rand(10).to_s
    end
    return numbers.join
  end

  def add_random_rotation # transfers the 5 digits numbers to their respective channels
    @rotation["A"] += @random_key[0..1].to_i
    @rotation["B"] += @random_key[1..2].to_i
    @rotation["C"] += @random_key[2..3].to_i
    @rotation["D"] += @random_key[3..4].to_i
  end

  def generate_date_key # generates the time-based key
    time = Time.new
    squared_stamp = time.strftime("%m%d%y").to_i**2
    return squared_stamp.to_s[-4..-1]
  end

  def add_date_rotation # final rotation with key and date considered
    @rotation["A"] += @date_key[0].to_i
    @rotation["B"] += @date_key[1].to_i
    @rotation["C"] += @date_key[2].to_i
    @rotation["D"] += @date_key[3].to_i
  end

end

