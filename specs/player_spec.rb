require_relative 'spec_helper'

describe "Player" do
  before do
    @player = Scrabble::Player.new("Bob")
  end
  describe "Initialize" do
    it "responds to name reader method" do
      @player.must_respond_to :name
    end

    it "has an instance variable plays that returns an array" do
      @player.must_respond_to :plays
      @player.plays.must_be_instance_of Array
    end
  end

  describe "play(word)" do
    # play(word): Adds the input word to the plays Array
    # Returns false if player has already won
    # Returns the score of the word
    it "has a play method that takes in a word and adds it to array" do
      word = "hello"
      @player.play(word)
      @player.plays.include?(word).must_equal true
    end

    it "returns the score of the word" do
      @player.play("hello").must_equal 8
    end

    it "returns false if the player has already won" do
      @player.play("quest")
      @player.play("favored")
      @player.play("pizzaz")
      @player.play("hello").must_equal false
    end
  end

  describe "total_score" do
    it "has a total_score method that returns an integer" do
      @player.must_respond_to :total_score
      @player.total_score.must_be_instance_of Integer
    end

    it "Returns the sums of scores of played words" do
      @player.play("quest")
      @player.play("favored")
      @player.total_score.must_equal 28
    end
  end

  describe "highest_scoring_word" do
    it "has a highest_scoring_word method that returns a string from the plays" do
      @player.must_respond_to :highest_scoring_word
      @player.highest_scoring_word.must_be_instance_of String
      @player.plays.include?(@player.highest_scoring_word).must_equal true
    end

    it "Returns the highest scoring word among the Player's plays" do
        @player.play("bench") #Should be 12
        @player.play("worry") #Should be 12
        @player.play("clocks") #Should be 14
        @player.highest_scoring_word.must_equal "clocks"
    end
  end

  describe "highest_word_score" do
    it "has a highest_word_score method that returns an integer from the plays" do
      @player.must_respond_to :highest_word_score
      @player.highest_scoring_word.must_be_instance_of Integer
    end

    it "returns the score of the highest scoring word among the player's plays" do
        @player.play("bench") #Should be 12
        @player.play("worry") #Should be 12
        @player.play("clocks") #Should be 14
        @player.highest_scoring_word.must_equal 14
    end
  end



end
