class UserLoginController < ApiController

	def check
		secret = params[:secret]
		user = User.where(:secret => secret).first

		if user 
			data = Hash.new
			data["USER_NAME"] = user.name
			data["USER_PASSWORD"] = user.password
			data["USER_SECRET"] = user.secret
			return response_data(data, "user found", "200")
		else
			return response_data({},"no user","404")
		end

	end

	def checklogin
		
		name = params[:name]
		password = params[:password]

		user = User.where(:name => name , :password => password).first

		if user 
			data = Hash.new
			data["USER_NAME"] = user.name
			data["USER_PASSWORD"] = user.password
			data["USER_SECRET"] = user.secret
			return response_data(data, "user found", "200")
		else
			return response_data({},"no user","404")
		end

	end

	def create
		name = params[:name]
		password = params[:password]
		user = User.where(:name => name, :password=> password).first
		if user
			return response_data({},"user already there","403")
		else
			user = User.new
			user.name = name
			user.password = password
			user.secret = SecureRandom.hex
			user.save
			data = Hash.new
			data["USER_NAME"] = user.name
			data["USER_PASSWORD"] = user.password
			data["USER_SECRET"] = user.secret
			return response_data(data, "user created", "200")

		end
	end

end
