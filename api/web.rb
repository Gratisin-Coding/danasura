require 'sinatra'
require_relative 'db/db_connector'
require_relative 'controllers/user_controller'

post '/login' do
    email = params["email"]
    password = params["password"]

    controller = UserController.new()
    controller.login({email: email, password: password})
end

post '/register' do
    email = params["email"]
    password = params["password"]
    name = params["name"]
    photo = params["photo"]

    controller = UserController.new()
    controller.register({email: email, password: password, name: name, photo: photo})
end