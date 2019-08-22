def caesar_cipher(string,shift)
  alpha_lowercase = ('a'..'z').to_a
  alpha_uppercase = ('A'..'Z').to_a
  full_alphabet = alpha_lowercase + alpha_uppercase

  highest_index = []

  string.downcase.split("").each { |char|
    highest_index << (alpha_lowercase.index(char))
  }
  highest_index = highest_index.compact.max
  
  while (highest_index + shift) >= alpha_lowercase.length
    alpha_lowercase += alpha_lowercase
    alpha_uppercase += alpha_uppercase
  end

  result = []
  
  string.split("").each { |char|
    if full_alphabet.include? char
      if char == char.downcase
        result << alpha_lowercase[alpha_lowercase.index(char) + shift]
      else
        result << alpha_uppercase[alpha_uppercase.index(char) + shift]
      end
    else
      result << char
    end
  }
  result.join
end
p caesar_cipher("What a string!", 5)
# "Bmfy f xywnsl!"