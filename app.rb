require_relative 'config/environment'

class App < Sinatra::Base
  get '/reversename/:name' do
    @name = params[:name]
    "#{@name.reverse}"
  end
  get '/square/:number' do
    @squared = params[:number].to_i**2
    "#{@squared}"
  end
  get '/say/:number/:phrase' do
    @resp = params[:phrase] * params[:number].to_i
    "#{@resp}"
  end
  get '/say/:word1/:word2/:word3/:word4/:word5' do
    @resp = [params[:word1], params[:word2], params[:word3], params[:word4], params[:word5]]
    "#{@resp.join(" ")}."
  end
  get '/:operation/:number1/:number2' do
    @operation = params[:operation]
    if @operation == "add"
      @resp = params[:number1].to_i + params[:number2].to_i
    elsif @operation == "subtract"
      @resp = params[:number1].to_i - params[:number2].to_i
    elsif @operation == "multiply"
      @resp = params[:number1].to_i * params[:number2].to_i
    else
      @resp = params[:number1].to_i / params[:number2].to_i
    end
    "#{@resp}"
  end
end
