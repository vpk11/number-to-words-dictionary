require 'spec_helper'
require './search'

describe Search do

    describe "#get_word_combinations" do
        it "returns an array of word combination for the number" do
            dictionary = []
            File.foreach("dictionary.txt") do |word|
              dictionary.push(word.chop.to_s.downcase)
            end
            number = "6686787825"
            @search = Search.new(dictionary,number)
        end
    end

end