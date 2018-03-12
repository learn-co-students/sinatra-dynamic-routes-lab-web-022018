require_relative 'config/environment'

class App < Sinatra::Base
  # Write your code here!

  get '/reversename/:name' do
    @name = params[:name]
    @name.reverse
  end

  get '/square/:number' do
    (params[:number].to_i ** 2).to_s
  end

  get '/say/:number/:phrase' do
    phrase = ''
    params[:number].to_i.times do
      phrase += params[:phrase]
    end
    phrase
  end

  get '/say/:word1/:word2/:word3/:word4/:word5' do
    "#{params[:word1]} #{params[:word2]} #{params[:word3]} #{params[:word4]} #{params[:word5]}."

  end

  get '/:operation/:number1/:number2' do
    @n1 = params[:number1].to_i
    @n2 = params[:number2].to_i
    result = 0
    if params[:operation] == "add"
      result = @n1 + @n2
    elsif params[:operation] == "multiply"
       result = @n1 * @n2
    elsif params[:operation] == "divide"
      result = @n1 / @n2
    elsif params[:operation] == "subtract"
      result = @n1 - @n2
    else
      "Not found"
    end
    result.to_s
  end

end
