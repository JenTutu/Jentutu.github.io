#matching sql t oruby

class User
	def initilize(args)
		@id = args['id']
		@username = args['username']
	end
	def self.find_by_id(id) #tell the class (which reps the table here, to find a tweet, so use self.find)
		sql  = "SELECT * FROM tweets WHERE id = #{id}"
		user_data = $db.get_first_row(sql) #getfirst is part of sqlite; $db.results_as_hash=true means can refer to things by their column name
		User.new(user_data)
	end
	def starred_tweets
		tweets.select(&:starred?)

class Tweet
	def initialize(args)
		@id = args['id']
		@user_id = args['user_id']
		@body = args['body']
	end 

	def self.find_by_id(id) #tell the class (which reps the table here, to find a tweet, so use self.find), do this on class beacause class = tables
		sql  = "SELECT * FROM tweets WHERE id = #{id}"
		user_data = $db.get_first_row(sql) #getfirst is part of sqlite; $db.results_as_hash=true means can refer to things by their column name
		User.new(user_data)
	end#getfirst is part of sqlite; $db.results_as_hash=true means can refer to things by their column name
	
	#columns in swl are properties in ruby
	# #a foreign key in tweets is a pointer
	# def user 
	# 	User.find_by_id(user_id)
	# end

	def user 
		User.find_by_id(@user_id)
	end
	
	def starz 
		Star.find_by_tweet_id(@id)
		end
	def self.find_by_user_id(user_id)
		sql  = "SELECT * FROM tweets WHERE id = #{id}"
		$db.execute(sql).map { |tweet| Tweet.new(tweet) } 
	end
end

#test: Tweet.find_by_id(3).user

class Stars
	def initialize(args)
		@user_id = args['id']
		@tweet_id = args['username']
	end 
	def self.find_by_user_tweet_id(tweet_id)
		sql  = "SELECT * FROM tweets WHERE id = #{id}"
		$db.execute(sql).map { |tweet| Tweet.new(tweet) } 
	end
end