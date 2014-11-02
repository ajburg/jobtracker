class UsersController < SecuredController

def index
    @users = User.all
end

end
