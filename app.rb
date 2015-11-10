require "sinatra"
require "sinatra/reloader"

get "/" do
  erb :index, layout: :main_layout
end
