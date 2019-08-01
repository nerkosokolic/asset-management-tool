# table to class mapping
class User < ActiveRecord::Base
    has_secure_password
end


# u = User.new
# u.email = 'esdf@gmail.com'
# u.password = 'pudding'

# pushes password as a secure password


# Authenticate('pudding') will return object if password