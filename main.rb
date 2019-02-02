require('./search')
class Main

    #Reads all words from the dictionary file
    def self.read_dictionary
      dictionary = []
      File.foreach("dictionary.txt") do |word|
        dictionary.push(word.chop.to_s.downcase)
      end
      dictionary
    end

    def self.start
        dictionary = read_dictionary
        print "Enter the 10 digit number : "
        number = gets.chomp
        search = Search.new(dictionary,number)
        word_combinations = search.get_word_combinations
        print word_combinations
    end

    start

end