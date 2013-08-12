namespace :db do
  desc "denormalize user and karma points, add karma value to users"
  task :update_user_karma_points => :environment do
    User.all.each do |user|
      user.karma_total = user.total_karma
      user.save(validate: false)
    end
  end
end
