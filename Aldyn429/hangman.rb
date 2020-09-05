# frozen_string_literal: true

require 'yaml'
require_relative 'image.rb'

# one class hangman
class Hangman
  @guesses_left_result = false
  @load_game = false
  def initialize
    communicate_to_player
    choose_mode_result
  end

  def choose_mode_result
    print "\nPlayer input: "
    choose_mode = gets.chomp.strip
    loop do
      if choose_mode == '1'
        load
        break
      elsif choose_mode == '2'
        new_game
        start_game
        break
      else
        choose_mode_result
        break
      end
    end
  end

  def new_game
    @round_number = 1
    @player_result = []
    @guesses_left = 7
    @answer = create_word
    @answer.length.times do
      @player_result.push('_')
    end
    @guessed_letters = []
  end

  def communicate_to_player
    puts 'Welcome to Hangman! In this game, you have 7 tries to figure out what the word is before you lose'
    puts "Every try you can either inpt a letter, which if it exists in the word, then you\'re one step closer to finding the solution, else you have one less try"
    puts "Type \"Save\" to save your current game"
    puts "\nPick your mode"
    puts "(1): Saved game \n(2): New game"
  end

  def create_word
    true_list = []
    list = File.read('5desk.txt').split
    list.select do |word|
      if word.length >= 5 && word.length <= 13
        true_list.push(word)
      end
    end
    true_list.sample.downcase
  end

  def start_game 
    while @guesses_left != -1
      puts "\n\nRound #{@round_number}"
      puts "<-------------------------->"
      if @load_game 
        puts @player_result.join(' ')
        puts "Used letters: #{@guessed_letters.join(' ')}"
        show_image(@guesses_left)
        @load_game = false
      end
      print "\nInput a letter: "
      player_letter = gets.chomp.downcase
      loop do
        if player_letter == 'save'
          save 
          puts "\nExitting game"
          play_again?
        elsif @guessed_letters.join('').include? player_letter
          puts "\nYou've already used this number already"
          print "Input another letter: "
          player_letter = gets.chomp
        elsif player_letter.match(/[^a-zA-Z]/)
          puts "\nYou have to input a letter"
          print "Input another letter: "
          player_letter = gets.chomp 
        elsif player_letter.length != 1
          print "Please input ONE letter: "
          player_letter = gets.chomp 
        else 
          break
        end
      end
      @guessed_letters.push(player_letter)
      check_answer(player_letter)
      puts @player_result.join(' ')
      puts "Used letters: #{@guessed_letters.join(' ')}"
      @guesses_left -= 1
      if @guesses_left_result == true
        @guesses_left += 1 
        @guesses_left_result = false
      end
      show_image(@guesses_left)
      if victory?
        puts "Congratulations! You beated the game"
        play_again?
      end
      if @guesses_left == 0
        puts "You lost!"
        play_again?
      end
      puts "You have #{@guesses_left} guesses left"
      puts "\n<-------------------------->"
      @round_number += 1
    end
  end

  def play_again?
    puts "\nPlay Again? [y/n]"
    print "Player input: "
    player_answer = gets.chomp.downcase
    loop do     
      if player_answer == 'y' || player_answer == 'yes'
        puts "\n\n\n\n\n"
        Hangman.new 
        exit 
      elsif player_answer == 'n' || player_answer == 'no'
        exit
      else
        puts "Your input is neither \"y\" or \"n\""
        print "Player input: "
        player_answer = gets.chomp.downcase
      end
    end
  end

  def check_answer(player_letter)
    for i in 0...@answer.length do
      if player_letter == @answer[i]
        @player_result[i] = @answer[i]
        @guesses_left_result = true 
      end
    end
  end

  def victory? 
    for i in 0...@answer.length do
      if @player_result[i] == '_'
        false
        break 
      end
      if i == @answer.length - 1
        true 
      end
    end
  end

  def save 
    data = { player_result: @player_result, guesses_left: @guesses_left, guessed_letters: @guessed_letters, answer: @answer, round_number: @round_number }
    file = File.open('saved_game.yml', 'w')
    file.puts YAML.dump(data)
    file.close
  end

  def load
    if File.exist?('saved_game.yml')
      info = File.open('saved_game.yml', 'r')
      data = YAML.load(info)
      @player_result = data[:player_result]
      @guesses_left = data[:guesses_left]
      @guessed_letters = data[:guessed_letters]
      @answer = data[:answer]
      @round_number = data[:round_number]
      @load_game = true
      start_game
    else
      puts "\n--> No saved games exist \nStarting new game..."
      new_game
      start_game
      exit
    end
  end
end

Hangman.new