class HexConverter
    def initialize(hex_value)
      @hex = hex_value.gsub("0x","")
      @code_string = "123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz"
      @decimal_value = @hex.to_i(16)
      @number_of_zeros = num_of_beginning_zeros
    end
  
    def num_of_beginning_zeros
        x = 0
        while @hex[x] == "0"
          x += 1
        end
        x / 2
    end

    def decimal_to_base58
      output_string = ""
      x = @decimal_value
      while x > 0
        remainder = x % 58
        x = x / 58
        x = x.floor
        output_string = output_string + @code_string[remainder]
      end
      while @number_of_zeros > 0
        output_string += "1"
        @number_of_zeros -= 1
      end
      output_string.reverse()
    end

    def hex_getter
        "0x#{@hex}"
    end
end

#Test
hex_value = "8024606dc6ece601de7e54be7cc706eb2e26a5b87fa3389858ce0b078d461b34057ef522c5" #Hex Input
num = HexConverter.new(hex_value)
output = num.decimal_to_base58
puts "Hex: #{num.hex_getter}"
puts "Base58: #{output}"