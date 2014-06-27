namespace :users do
  desc "Sends remider emails to users"
  task :remind => :environment do
    User.all.each do |user|
      user.send_reminder
    end
  end
end