def caesar_cipher(string,shift)
  alpha_lower = ('a'..'z').to_a
  alpha_upper = ('A'..'Z').to_a
  full_alpha = alpha_lower + alpha_upper

  highest_index = []

  string.downcase.split("").each { |char|
    highest_index << (alpha_lower.index(char))
  }
  highest_index = highest_index.compact.max
  
  while (highest_index + shift) >= alpha_lower.length
    alpha_lower += alpha_lower
    alpha_upper += alpha_upper
  end

  result = []
  
  string.split("").each { |char|
    if full_alpha.include? char
      if char == char.downcase
        result << alpha_lower[alpha_lower.index(char) + shift]
      else
        result << alpha_upper[alpha_upper.index(char) + shift]
      end
    else
      result << char
    end
  }
  result.join
end
p caesar_cipher("What a string!", 5)
# "Bmfy f xywnsl!"