require 'spec_helper'

describe Rsack::Server do

  #let(:server) { Rack::MockRequest.new(Rsack::Server.new) }
  def server
    Rack::MockRequest.new(Rsack::Server.new) 
  end

  context '/' do
		it "should return a 200 code" do
			response = server.get('/')
			response.status.should == 200
		end
  end
  
  context "/?choice='rock'" do

		it "Debería devolver el código 200" do
				response = server.get("/?choice='rock'")
				response.status.should == 200
		end
		it "pierde piedra" do
			computer_throw = 'paper'
			response = server.get("/?choice='rock'")
			response.body.include?("perder")
		end
		it "gana piedra" do
			computer_throw = 'sccisors'
			response = server.get("/?choice='rock'")
			response.body.include?("ganar")
		end 
		it "empatar" do
			computer_throw = 'rock'
			response = server.get("/?choice='rock'")
			response.body.include?("empatar")
		end
			
		
	end
	
	context "/?choice='paper'" do

		it "Debería devolver el código 200" do
				response = server.get("/?choice='paper'")
				response.status.should == 200
		end
		
		it "pierde papel" do
			computer_throw = 'scissors'
			response = server.get("/?choice='paper'")
			response.body.include?("perder")
		end
		it "gana piedra" do
			computer_throw = 'rock'
			response = server.get("/?choice='paper'")
			response.body.include?("ganar")
		end 
		it "empatar" do
			computer_throw = 'paper'
			response = server.get("/?choice='paper'")
			response.body.include?("empatar")
		end
	end
  
  context "/?choice='scissors'" do

		it "Debería devolver el código 200" do
				response = server.get("/?choice='scissors'")
				response.status.should == 200
		end
		
		it "pierde tijeras" do
			computer_throw = 'rock'
			response = server.get("/?choice='scissors'")
			response.body.include?("perder")
		end
		it "gana piedra" do
			computer_throw = 'paper'
			response = server.get("/?choice='scissors'")
			response.body.include?("ganar")
		end 
		it "empatar" do
			computer_throw = 'scissors'
			response = server.get("/?choice='scissors'")
			response.body.include?("empatar")
		end
	
	end
end
