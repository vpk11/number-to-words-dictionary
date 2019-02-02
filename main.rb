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

end