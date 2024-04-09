require "sinatra"
require "sinatra/reloader"
require "active_support/all"

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
  @sqrt_input = params.fetch("sqrt").to_f
  @sqrt_output = @sqrt_input ** 0.5

  erb(:square_root_results)
end

get("/payment/new") do
  erb(:payment)
end

get("/payment/results") do
  @apr_input = '%.4f' % params.fetch("apr").to_f.round(4)
  @apr_input += "%"
  @years_input = params.fetch("years").to_i
  @principal_input = params.fetch("principal").to_f.to_fs(:currency)

  r = @apr_input.to_f / 100 / 12
  term = @years_input * 12

  @nominator = r * params.fetch("principal").to_f
  @denominator = 1 - (1 + r) ** -term

  @payment = (@nominator / @denominator)


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
