namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(email: "testo3@testo.com",
                         password: "testotesto",
                         password_confirmation: "testotesto")
    admin.toggle!(:admin)
  end
end
