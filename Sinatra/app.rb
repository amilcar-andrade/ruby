require 'rubygems'
require 'sinatra'
require 'rest_client'
require 'json'
require 'mysql2'

client = Mysql2::Client.new(:socket=>"/Applications/MAMP/tmp/mysql/mysql.sock",:username=>"root",:database=>"Prueba",:password=>"root")
rows = client.query("select * from product_class")
rows.each do |row|
puts "Categoria=>#{row['product_category']}. Department=>#{row['product_department']}"
end

# server : listens for client requests on a specific port (la cantina)
# client : sends http requests to server, a "client" can be anything that can create a http request (e.g. browser, curl, other SERVERS! or programs, etc)
# user: human being who initiated an action that directed the client to generate a http request and send it to the server



get '/' do # cuando haya un http GET request al directorio raiz "/", haz
  @titulo = "Home"
  @header = 'Titulo Home'
  @subheader ='Subtitulo Home'
  erb :index
end

get '/contact' do # cuando haya un http GET request al path "/contact" haz:
  @titulo = 'My Title'
  @header = 'Titulo Contacto'
  @subheader = 'Subtitulo Contacto'

  erb :contacto
end

get '/about' do
  @titulo = 'about'
  @header = 'Titulo About'
  @subheader = 'Subtitulo About'

  erb :about

end

get '/fb' do #cuando te llegue un http get request, al path /fb haz lo siguiente.
  baseurl = "https://graph.facebook.com/"
  username = params[:userName]
  picbig ="?type=large"

  variable_jala_informacion = RestClient.get(baseurl+username)
  objetoruby = JSON.parse(variable_jala_informacion)



  @name = objetoruby["name"]
  @id = objetoruby["id"]
  @photo = baseurl+username+"/picture"+picbig
  erb :fb #lo ultimo que manda, en este caso lo que este en fb.erb incluyendo el layout. 
  #si pongo "hola", me regresaria hola y eso seria lo unico que se desplegaria en el browser

end
