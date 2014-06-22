namespace :check do
  desc "Sends remider emails to users"
  task :users => :environment do
    User.all.each do |user|
      user.send_reminder
    end
  end
end