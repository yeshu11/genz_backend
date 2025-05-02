# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


puts "🌱 Seeding database..."

Admin.find_or_create_by!(email: "admin@example.com") do |admin|
  admin.name = "Admin User"
  admin.phone = "1234567890"
  admin.password = "password123"
  admin.password_confirmation = "password123"
end

AdminSuper.find_or_create_by!(email: "superadmin@example.com") do |super_admin|
  super_admin.password = "superpassword123"
  super_admin.password_confirmation = "superpassword123"
end

puts "✅ Admin and Super Admin created successfully."