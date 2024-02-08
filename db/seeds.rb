# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

user_admin = User.where(email: 'admin@user').first_or_initialize
user_admin.update!(
  role: :admin,
  password: 'password',
  password_confirmation: 'password'
)

user_regular = User.where(email: 'regular@user').first_or_initialize
user_regular.update!(
  role: :regular,
  password: 'password',
  password_confirmation: 'password'
)

example_match_scheduled = Match.where(author: user_regular).first_or_initialize
example_match_scheduled.update!(
  datetime: Date.now(),
  status: :scheduled,
  author: user_regular
)