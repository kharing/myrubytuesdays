# Datum: 03.11.2015
# "pairs"- Sinatra Web-App
## Enter attendees' names create key-value-pairs 

require 'sinatra'
require 'sinatra/reloader' # server auto-reload
require 'pry' # binding.pry

get "/" do
	erb :index, layout: :main_layout
end

post "/" do
		# params-hash: fname-key, values: "string of names".variable stored in fname
		fname = params["fname"].to_s # Input stored in params-hash
		@btnapp = params["btnapp"] # 

		
		# string fname übergabe an array 
		@arr = fname.split(" ").map {|s| s.to_s.capitalize} # save in array
		@unarr = @arr.uniq # remove duplicates 

		# Helper Variable to count  elements of the array 
		@carr = @unarr.count.to_i # use count, size, or length of array
		
		if @carr%2  != 0 # Modulo is not nil, add placeholder "N.N" value
				@unarr << "N.N."
		end	

		@sufarr = @unarr.shuffle # Shuffle Array-Elements
		@hsh_pairs = Hash[*@sufarr.flatten] # Array to Hash, flatten: 1 Element = 1 Array

# link to append seite 
		if @btnapp then
				@sufarr = @unarr.shuffle # Shuffle Array-Elements
		@hsh_pairs = Hash[*@sufarr.flatten] # Array to Hash, flatten: 1 Element = 1 Array

			#redirect("/append") # only get works
		end

erb :pairs, layout: :main_layout
end
################# APPEND to ARRAY #######################

get "/append" do
	erb :appendlink, layout: :main_layout
end
################ POST Method ############################
post "/append" do
	apname = params["fname"].to_s
	# string apname übergabe an array with .split
	@aparr = apname.split(" ").map {|s| s.to_s.capitalize}


erb :append, layout: :main_layout
end