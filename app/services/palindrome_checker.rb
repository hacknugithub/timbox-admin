class PalindromeChecker
  def self.call(words_string)
    words = words_string.split(',').map(&:strip).reject(&:blank?)

    return [] if words.empty?
    
    words.select do |word|
      sanitized_word = word.downcase.gsub(/[^a-z0-9]/, '')
      sanitized_word == sanitized_word.reverse && sanitized_word.present?
    end
  end
end