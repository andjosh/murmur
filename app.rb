require "sinatra"
require "haml"
require "postmark"
require "postmark-mitt"
require 'sinatra/activerecord'
require './environments'
require './models/reader'
require './models/verse'
require './models/step'

set :haml, :format => :html5
 
get "/" do
    haml :index
end

get "/begin" do
    redirect "/"
end

post "/begin" do
    email = params['email']
    @reader = Reader.new(email: email, verse_id: 1)
    if @reader.save
        haml :begin
    else
        redirect "/?error=saving"
    end
end

post "/step" do
    begin
        email = Postmark::Mitt.new(request.body)
        reader = Reader.find_by_email(email.from_email)
        if reader
            reader.choose_verse(email.text_body)
        else
            puts "No reader found for " + email.from_email
        end
    rescue
        puts "bad body posted"
        puts request.body
    end
end

get "/verse/:id" do
    @verse = Verse.includes(:children, :parent).find(params['id'])
    @verse.to_json
end
