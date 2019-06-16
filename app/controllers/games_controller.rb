class GamesController < ApplicationController
  require 'json'
  require 'open-uri'

  def new
  @letters = ('a'..'z').to_a.sample(8).join.upcase
    # @input = word[:value]
  end

  def score
    @letters = nil
    @score = 0
    @reason = nil
    @letters = params[:letters].split('')
    @word = params[:word].upcase.split('')
    if @word.all?{|i| @letters.include? i } && @score == "true"
      @answer = @score + @word.length * 5
    else
      @answer = @score
    end
    # @letters.any?{|x| @word.include?(x)}

    # (@letters & @word.upcase).empty?
  url = "https://wagon-dictionary.herokuapp.com/#{@word.join}"
  user_serialized = open(url).read
  user = JSON.parse(user_serialized)
  @score = user['found']
  end
end
