require_relative '../db/db_connector'

class User
    attr_reader :email, :password

    def initialize(params)
        @id = params[:id]
        @email = params[:email]
        @password = params[:password]
        @name = params[:name]
        @photo = params[:photo]
    end

    def ==(other)
        self.email == other.email &&
        self.password == other.password
    end

    def login
        client = create_db_client
        response = client.query("SELECT email, password FROM users WHERE email = '#{@email}'")

        data = response.first()

        email = data["email"]
        password = data["password"]

        if (@email == email && @password == password)
            return 200
        else
            return 417
        end
    end

    def register
        client = create_db_client
        client.query("INSERT INTO users(email, password, name, photo) VALUES ('#{@email}', '#{@password}', '#{@name}', '#{@photo}')")
        response = client.query("SELECT email, password, name, photo FROM users WHERE id=#{client.last_id}")

        data = response.first
        user = User.new({email: data["email"], password: data["password"], name: data["name"], photo: data["photo"]})
        
        return 201 unless self != user

        return 400
    end
end