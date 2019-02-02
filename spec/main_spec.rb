require 'spec_helper'
require './main'

describe Main do

    describe ".start" do
        it "prints all word combination for the input number" do
            allow(STDIN).to receive(:gets) { '6686787825' }
            expect(STDOUT).to eq(STDOUT)
        end
    end

    describe ".read_dictionary" do
        it "reads words from the dictionary.txt file" do

        end
    end
end