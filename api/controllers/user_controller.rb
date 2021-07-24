require_relative '../models/user'

class UserController
    def login(params)
        user = User.new(params)
        
        if (user.login == 200)
            return "Success"
        else
            return "Failed"
        end
    end

    def register(params)
        user = User.new(params)

        if (user.register == 201)
            return "Success"
        else
            return "Failed"
        end
    end
end