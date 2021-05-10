require 'json'
require 'open-uri'

class GamesController < ApplicationController

  def new
   @letters = [*('A'..'Z')].sample(10)
  end

def score
    word = params[:word].chars #["A", "B", "B"]
    grid = params[:grid].chars #["A", "B", "C"]
    results = word.all? {|letter| word.count(letter) <= grid.count(letter)}
    if results
      url = "https://wagon-dictionary.herokuapp.com/#{params[:word]}"
      user_serialized = URI.open(url).read
      user = JSON.parse(user_serialized)
      if user["found"]
        @answer = "Well done"
      else
        @answer = "Not english word"
      end
    else
      @answer = "This word is not matching"
    end
  end

end
