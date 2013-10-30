require 'rack/request'
require 'rack/response'
require 'haml'
require 'thin'
require 'rack'
require 'heroku'
module RockPaperScissors
	class RPS

		def initialize(app = nil)
			@app = app
			@content_type = :html
			@defeat = {'rock' => 'scissors', 'paper' => 'rock', 'scissors' => 'paper'}
			@throws = @defeat.keys
		end
		
		def set_env(env)
			@env = env
			@session = env['rack.session']
		end

		def play 
			return @session['play'].to_i if @session['play']
			@session['play'] = 0
		end

		def play=(value)
			@session['play'] = value
		end
		
		def win 
			return @session['win'].to_i if @session['win']
			@session['win'] = 0
		end

		def win=(value)
			@session['win'] = value
		end
		
		def lost 
			return @session['lost'].to_i if @session['lost']
			@session['lost'] = 0
		end

		def lost=(value)
			@session['lost'] = value
		end
		
		def tie 
			return @session['tie'].to_i if @session['tie']
			@session['tie'] = 0
		end

		def tie=(value)
			@session['tie'] = value
		end
		
		
		def call env
			
			set_env(env)
			req = Rack::Request.new(env)
			req.env.keys.sort.each { |x| puts "#{x} => #{req.env[x]}" }
			computer_throw = @throws.sample
			player_throw = req.GET["choice"]
			
			anwser = if !@throws.include?(player_throw)
				inicio = "Elige Rock Paper o Scissors para empezar a jugar:"
		    elsif player_throw == computer_throw
			 "Empate"
		    elsif computer_throw == @defeat[player_throw]
			 "Ganar"
			  
		    else
			 "Perder"
		    end
		     
		    if anwser == "Ganar"
				self.win= self.win + 1
				self.play = self.play + 1
			elsif anwser == "Perder"
				self.lost= self.lost + 1
				self.play = self.play + 1
			elsif anwser == "Empate"
				self.tie= self.tie + 1
				self.play = self.play + 1		
		    end
		    
			engine = Haml::Engine.new File.open("views/index.html.haml").read
			res = Rack::Response.new
			res.write engine.render({},
				:anwser => anwser,
				:choose => @choose,
				:throws => @throws,
				:computer_throw => computer_throw,
				:player_throw => player_throw,
				:inicio => inicio,
				:win => self.win,
				:play => self.play,
				:lost => self.lost,
				:tie => self.tie
				)
			res.finish
		end #call
	end #Clase
end #Modulo
