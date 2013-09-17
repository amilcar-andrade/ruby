require 'sinatra'
require 'rubygems'

get '/reversa/:cadena' do
  params[:cadena].reverse
  end 
  
get '/mayuscula/:cadena' do
  params[:cadena].upcase
end