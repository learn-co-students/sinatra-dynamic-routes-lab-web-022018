require_relative 'config/environment'

class App < Sinatra::Base

	get '/reversename/:name' do
		params[:name].reverse
	end

	get '/square/:number' do
		square = params[:number].to_i ** 2
		square.to_s
	end

	get '/say/:number/:phrase' do
		string = ''
		params[:number].to_i.times do
			string += params[:phrase] + ' '
		end
		string
	end

	get '/say/*' do

		params[:splat][0].gsub('/',' ') + '.'
	end

	get '/:operation/:number1/:number2' do
		num1 = params[:number1].to_i
		num2 = params[:number2].to_i
		op = params[:operation]
		solution = nil
		if op == 'add'
			solution = num1 + num2
		elsif op == 'subtract'
			solution = num1 - num2
		elsif op == 'multiply'
			solution = num1 * num2
		elsif op == 'divide'
			solution = num1 / num2
		else
			solution = 'ERROR'
		end
		solution.to_s
	end
				
				

end