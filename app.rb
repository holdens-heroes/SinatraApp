require "sinatra"
require "sinatra/reloader" if development?
require "slim"

get "/:name.erb" do
	name = {"name" => params[:name]}
	erb :index, :layout=> true, :locals => name
end

get "/:name.haml" do
    name = {"name" => params[:name]}
    haml :index, :format => :html5, :locals => name
end

get "/:name.slim" do
    name = {"name" => params[:name]}
    slim :index, :pretty => true, :locals => name
end

