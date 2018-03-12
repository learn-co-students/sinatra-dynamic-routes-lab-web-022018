require_relative 'config/environment'

class App < Sinatra::Base
  get '/reversename/:name' do
    @name = params[:name]
    @name.reverse
  end

  get '/square/:number' do
    @num = params[:number].to_i
    "#{@num*@num}"
  end

  get '/say/:number/:phrase' do
    @num = params[:number].to_i
    @phrase = params[:phrase]
    "#{@phrase} "*@num
  end

  get '/say/:word1/:word2/:word3/:word4/:word5' do
    out = ""
    params.each do |key, val|
      out += params[key] + " "
    end
    out[0..-2] + "."
  end

  get '/:operation/:number1/:number2' do
    ops = {"add"=>"+", "subtract"=>"-", "multiply"=>"*", "divide"=>"/"}
    @operation = ops[params[:operation]]
    @num1 = params[:number1].to_i
    @num2 = params[:number2].to_i
    "#{@num1.send(@operation, @num2)}"
  end

end
