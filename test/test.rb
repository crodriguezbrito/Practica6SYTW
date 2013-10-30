require "test/unit"
require "rack/test"
require './lib/RockPaperScissors'

class AppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  
  #def app
   #Rack::Builder.new do
	#run RockPaperScissors::RPS.new        
   #end
  #end
	def app
       Rack::Session::Cookie.new(RockPaperScissors::RPS.new,
              :secret => 'cookie')
    end
  
	def test_index
		get "/"
		#puts last_response.inspect
		assert last_response.ok?
	end
	
	def test_header
		get"/"
        assert_match "<title>RPS</title>", last_response.body
    end
	
	
	 def test_body_rock
        get "/"
        assert last_response.body.include?("Rock")
    end
    def test_body_paper
        get "/"
        assert last_response.body.include?("chuchu")
    end
    def test_body_scissors
        get "/"
        assert last_response.body.include?("Scissors")
    end
 
end
