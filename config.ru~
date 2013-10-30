
require './lib/RockPaperScissors.rb'

use Rack::Static, :urls => ['/public']
use Rack::ShowExceptions
use Rack::Lint
use Rack::Session::Cookie,{
    :key => 'gana',
    :secret =>'cookie',
    :expire_after => 120}

run RockPaperScissors::RPS.new
