namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'ffaker'

    Post.delete_all

    Post.populate 100 do |post|
      post.title = Populator.words(3..7).titleize
      post.content = Faker::Lorem.paragraph(20)
      post.created_at = 2.years.ago..Time.now
    end
  end
end
