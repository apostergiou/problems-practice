def is_letter_constructible_from_magazine(letter_text, magazine_text)
  char_frequency_for_letter = {}
  letter.text.to_chars.each do |c|
    if char_frequency_for_letter[c] == 0
      char_frequency_for_letter[c] = 1
    else
      char_frequency_for_letter[c] += 1
    end

    magazine_text.to_chars.each do |c|
      if char_frequency_for_letter[c]
        char_frequency_for_letter[c] -= 1
        if char_frequency_for_letter[c] == 0
          char_frequency_for_letter.delete(c)
        end
        return true if char_frequency_for_letter.length == 0
      end
    end

    return char_frequency_for_letter == 0
  end
end
