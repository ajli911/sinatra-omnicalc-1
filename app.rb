require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:square)
end

get("/square/new") do
  erb(:square)
end

get("/square/results") do
  @input = params.fetch("sq").to_f
  @output = @input ** 2

  erb(:square_results)
end

get("/square_root/new") do
  erb(:square_root)
end

get("/square_root/results") do
  @input = params.fetch("sqrt").to_f
  @output = @input ** 0.5

  erb(:square_root_results)
end

get("/payment/new") do
  erb(:payment)
end

get("/payment/results") do
  @apr_input = params.fetch("apr").to_f
  @years_input = params.fetch("years").to_i
  @principal_input = params.fetch("principal").to_f

  r = @apr_input / 100 / 12
  term = @years_input * 12

  @nominator = r * @principal_input
  @denominator = 1 - ((1 + r) ** (-term))

  @payment = (@nominator / @denominator).round(2)


  erb(:payment_results)
end

get("/random/new") do
  erb(:random)
end

get("/random/results") do
  @minimum = params.fetch("minimum").to_f
  @maximum = params.fetch("maximum").to_f

  @random = rand(@minimum..@maximum).to_f
  erb(:random_results)
end
