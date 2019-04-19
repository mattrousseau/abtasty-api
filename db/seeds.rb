
unvalid_email = User.new(email: "matthieu@gmail.com", password: "123456")
puts "unvalid_email is valid?"
p unvalid_email.valid?

valid_email = User.new(email: "matthieu@abtasty.com", password: "123456")
puts "valid_email is valid?"
p valid_email.valid?
