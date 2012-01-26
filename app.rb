require "sinatra"
require "sinatra/reloader" if development?
require "haml"
require "slim"
require "liquid"
require "markaby"

get "/:name.erb" do
	erb :index, :locals => params
end

get "/:name.haml" do
    haml :index, :locals => params
end

get "/:name.slim" do
    slim :index, :locals => params
end

get "/:name" do
    extensions = ["erb","haml","slim"]
    liquid :index, :locals => { "name" => params[:name], "extensions" => extensions }
end

get "/" do
    markaby {
        html do
            head do
                title "sinatr-what"
            end

            body do
                h1 "What's your name?"
                form :action => "/", :method => "POST" do
                    input :type => "text", :name => "name"
                    input :type => "submit", :value => "Start!" 
                end
            end
        end
    }
end

post "/" do
    redirect "/#{params[:name]}"
end

