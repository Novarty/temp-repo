User.create!(email: 'admin@example.com', password: '123456', password_confirmation: '123456', role: :admin) if Rails.env.development?
User.create!(email: 'user@example.com', password: '123456', password_confirmation: '123456') if Rails.env.development?
