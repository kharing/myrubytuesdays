# Datum: 03.11.2015
# "pairs"- Sinatra Web-App
## Enter attendees' names create key-value-pairs 

require 'sinatra'
require 'sinatra/reloader' # server auto-reload
require 'pry' # binding.pry, ruby -r pry FILE

get "/" do
	erb :index, layout: :main_layout
end

post "/" do
		# params-hash: fname-key, values: "string of names".variable stored in fname
		@btnshuff = params["btnshuff"]
		@names = params["names"].split(" ").map {|s| s.to_s.capitalize} # Input stored in params-hash
		
		@namesshuff = @names.shuffle
		@pairs = @namesshuff.each_slice(2).to_a # 2 elements in array field
		
		if @pairs.last.size == 1 # 1 element in array field
			@solo_name = @pairs.delete_at(-1) # deletes last element
			@pairs[-1] << @solo_name # append to last array field
		end
		
erb :pairs, layout: :main_layout
end
