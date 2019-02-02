class Search

    attr_accessor :dictionary, :number

    def initialize(dictionary, number)
      @dictionary = dictionary
      @number = number
    end

    def get_word_combinations
      #return if not a valid number
      return [] if @number.nil? || @number.length != 10 || @number.split('').select{|a|(a.to_i == 0 || a.to_i == 1)}.length > 0
      
      #Map the numbers to letters
      letters = {"2" => ["a", "b", "c"],"3" => ["d", "e", "f"],"4" => ["g", "h", "i"],"5" => ["j", "k", "l"],"6" => ["m", "n", "o"],"7" => ["p", "q", "r", "s"],"8" => ["t", "u", "v"],"9" => ["w", "x", "y", "z"]}
  
      # Map all letters for each digit to variable keys
      keys = @number.chars.map{|num|letters[num]}
  
      results = {}
      total_number = keys.length - 1
      
      #Loop through all letters and get matching records with dictionary
      for i in (2..total_number)
        first_keys_array = keys[0..i]
        second_keys_array = keys[i + 1..total_number]
        next if first_keys_array.length < 3 || second_keys_array.length < 3
        first_combination = first_keys_array.shift.product(*first_keys_array).map(&:join)
        next if first_combination.nil?
        second_combination = second_keys_array.shift.product(*second_keys_array).map(&:join)
        next if second_combination.nil?
        results[i] = [(first_combination & @dictionary), (second_combination & @dictionary)]
      end
      #arrange words like we need as a output
      word_combinations = []
      results.each do |key, combinataions|
        next if combinataions.first.nil? || combinataions.last.nil?
        combinataions.first.product(combinataions.last).each do |combo_words|
          word_combinations << combo_words
        end
      end
      #Matches with all character
      word_combinations << (keys.shift.product(*keys).map(&:join) & @dictionary).join(", ")
      word_combinations
    end
  
  end