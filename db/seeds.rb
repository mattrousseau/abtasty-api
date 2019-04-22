# Testing email validation for abtasty.com domain
# User.destroy_all

# unvalid_email = User.new(email: "matthieu@gmail.com", password: "123456")
# puts "unvalid_email is valid?"
# p unvalid_email.valid?

# valid_email = User.new(email: "matthieu@abtasty.com", password: "123456")
# puts "valid_email is valid?"
# p valid_email.valid?


puts "Deleting all users"

User.destroy_all

puts "Creating users"

matt = User.create!(email: "matthieu@abtasty.com", password: "123456")
john = User.create!(email: "john@abtasty.com", password: "123456")

puts "Created #{User.all.length} users"



puts "Deleting all clients"

Client.destroy_all

puts "Creating clients"

matt = Client.create!(name: "Total")
john = Client.create!(name: "Shell")

puts "Created #{Client.all.length} clients"
