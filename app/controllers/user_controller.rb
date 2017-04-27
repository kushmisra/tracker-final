class UserController < ApiController

	def battery
		secret = params[:secret]
		user = User.where(:secret => secret).first
		if user
			battery = user.locations.last.battery
			data = Hash.new
			data["battery"] = battery
			return response_data(data,"battery","200")
		else
			return response_data({},"user not found","404")
		end
	end

	def music
		secret = params[:secret]
		user = User.where(:secret => secret).first
		if user
			if user.music == "false"
				user.music = "true"
			else
				user.music = "false"
			end
			user.save!
			data = Hash.new
			data["music"] = user.music
			return response_data(data,"music toggled","200")
		else
			return response_data({},"user not found","404")
		end

	end


	def update
		secret = params[:secret]
		latitude = params[:latitude]
		longitude = params[:longitude]
		battery = params[:battery]
		user = User.where(:secret => secret).first
		if user
			user.locations.create(:latitude => latitude,
				:longitude => longitude ,:battery => battery)
			data = Hash.new
			data["music"] = user.music
			return response_data(data,"updated","200")
		else
			return response_data({},"user not found","404")
		end
	end


	def getlocation
		secret = params[:secret]
		user = User.where(:secret => secret).first
		if user
			locs = user.locations.order('created_at DESC').limit(100)
			data = Hash.new
			if locs.first
				i = 0
				locs.each do |loc|
					loca = Hash.new
					loca["latitude"] = loc.latitude
					loca["longitude"] = loc.longitude
					data[i] = loca
					i = i+1 
				end
			else
				return response_data({},"no location found","404")
			end

			
			return response_data(data,"locations given ","200")
		else
			return response_data({},"user not found","404")
		end
	end

	def getsecret
		name = params[:name]
		password = params[:password]
		user = User.where(:name => name , :password => password).first
		if user 
			data = Hash.new
			data["secret"] = user.secret
			return response_data(data, "user found", "200")
		else
			return response_data({},"no user","404")
		end
	end

end