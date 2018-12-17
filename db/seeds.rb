# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

AdminUser.create!(email: 'hatahelena@gmail.com', password: 'irko1965', password_confirmation: 'irko1965') if AdminUser.where(email: "hatahelena@gmail.com").first.nil?