def get_ord_values(x)
    letters = x.split('')
    numbers = letters.map{|letter| letter.ord}
    return numbers
end

def lower_or_upper_case(numbers_array, shift_amount)
    
    shift_amount = shift_amount % 26

    numbers_array.map do |number|

        number = number.to_i

        if number.between?(97,122)
            number = number + shift_amount
            if number > 122
                remainder = number % 122
                number = 96 + remainder
                number = number
            elsif number < 97
                remainder = 97 % number
                number = 123 - number
                number = number
            else
                number = number
            end
        elsif number.between?(65, 90)
            number = number + shift_amount
            if number > 90
                remainder = number % 90
                number = 64 + remainder
                number = number
            elsif number < 65
                remainder = 65 % number
                number = 91 - number
                number = number
            else
                number = number
            end
        else
            number = number
        end
    end
end

def shifted_nums_back_to_letters(arr)
    crypted = arr.map {|el| el.chr}
    crypted.join("")
end

def caesar_cipher(string = "hello there General Kenobi", amount_to_shift = 5)
    ord_values = get_ord_values(string)
    case_is = lower_or_upper_case(ord_values, amount_to_shift)
    back_to_string = shifted_nums_back_to_letters(case_is)
    puts back_to_string
end

caesar_cipher("change the test / string here to modify what gets scrambled!", 4)
# caesar_cipher()