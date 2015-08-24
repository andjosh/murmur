require "sinatra"
require "haml"
require "postmark"
require 'sinatra/activerecord'
require './environments'
require './models/reader'

set :haml, :format => :html5
 
get "/" do
    haml :index
end

post "/begin" do
    email = params['email']
    @reader = Reader.new(email: email)
    if @reader.save
        haml :index
    else
        redirect "/?error=saving"
    end
end
