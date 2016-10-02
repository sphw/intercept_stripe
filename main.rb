require 'sinatra'
require 'stripe'
Stripe.api_key = ENV["stripe"]
get '/' do
  'Open The pod bay doors, HAL.
I\'m sorry Dave. I am afraid I can\'t do that.'
end
post '/pay' do
  body = JSON.parse request.body.read
  return JSON.generate Stripe::Charge.create(
     :amount => body["amount"] * 100,
     :card => body["token"],
     :currency => 'usd',
     :description => 'donation',
   )
end
