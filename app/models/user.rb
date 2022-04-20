# email: string
# password_digest:string
# 
# password:string -> virtual attribute
# password confirmation -> virtual attribute

class User < ApplicationRecord # we can use this file to query the database
    has_secure_password 
    # add password confirmation for the password_digest field, password confirmation is a virtual attribute that wont get saved into the database
    # it will ensure password and password_confirmation matched, and run the "bcrypt" to hash the password to create the digest

    validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email address" }
    # check and make sure the email attribute is there before saving it to the database
    # we can also add regex in the format attribute to ensure the email match a certain template or format
end
