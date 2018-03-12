require_relative 'config/environment'

class App < Sinatra::Base
  # Write your code here!

  get '/reversename/:name' do
    @name = params[:name]
    @name.reverse
  end

  get '/square/:number' do
    @number = params[:number]
    (@number.to_i * @number.to_i).to_s
  end

  get '/say/:number/:phrase' do
    @number = params[:number]
    @phrase = params[:phrase]
    string = ""
    @number.to_i.times do
      string += @phrase
    end
    string
  end

  get '/say/:word1/:word2/:word3/:word4/:word5' do
    @word1 = params[:word1]
    @word2 = params[:word2]
    @word3 = params[:word3]
    @word4 = params[:word4]
    @word5 = params[:word5]
    words = [@word1, @word2, @word3, @word4, @word5]
    string = ""
    words.each do |i|
      string += "#{i} "
    end
    string.chomp(" ")+"."
  end

  get '/:operation/:number1/:number2' do
    @operation = params[:operation]
    @number1 = params[:number1]
    @number2 = params[:number2]
    # add = @number1.to_i + @number2.to_i
    # subtract = @number1.to_i - @number2.to_i
    # multiply = @number1.to_i * @number2.to_i
    # divide = @number1.to_i / @number2.to_i
    options = {"add" => @number1.to_i + @number2.to_i, "subtract" => @number1.to_i - @number2.to_i,
    "multiply" => @number1.to_i * @number2.to_i, "divide" => @number1.to_i / @number2.to_i}
      options.each do |operation, result|
        if @operation.include?(operation)
          result.to_s
        end
      end
    end

end
