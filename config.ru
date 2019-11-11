require './config/environment'

use Rack::MethodOverride

use TodosController
use UsersController
use SessionsController
run ApplicationController

