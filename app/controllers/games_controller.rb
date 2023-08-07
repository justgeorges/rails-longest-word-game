require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    arr = ('A'..'Z').to_a
    @random = arr.sample(10)
  end

  def score
    # set entry variable
    @entry = params[:entry].upcase
    @checker = params[:letter_checker].split(' ')
    url = "https://wagon-dictionary.herokuapp.com/#{@entry}"
    user_serialized = URI.open(url).read
    user = JSON.parse(user_serialized)
    @entry.chars.each do |letter|
      @all_included = @checker.include?(letter)
    end
    if @all_included
      @score = user['found'] ? "#{@entry} is a valid English word!" : "Sorry, but #{@entry} is not an English word"
    else
      @score = "Sorry, but #{@entry} cannot be built out of #{@checker}"
    end
  end
end
