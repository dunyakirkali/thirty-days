class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable
  
  def today
    self.progress[days_since - 1]
  end

  def success_percentage_so_far
    successfull_days.to_f / days_since * 100.0
  end
    
  def success_percentage
    successfull_days.to_f / ENV['NUMBER_OF_DAYS'].to_i * 100.0
  end
  
  def send_reminder
    UserMailer.reminder_email(self).deliver unless completed_plan?
  end
  
  def reset
    self.progress_will_change!
    self.began_at = nil
    self.progress = Array.new(30, 'f')
    self.plan = nil
    self.save
  end
  
  def has_plan?
    !plan.blank? 
  end
  
  def completed_plan?
    days_since > ENV['NUMBER_OF_DAYS'].to_i
  end
  
  def start(plan)
    self.began_at = DateTime.now
    self.plan = plan
    self.progress = Array.new(30, 'f')
    self.save
  end
  
  def successfull_days
    progress.count('t')
  end
  
  def mark_success
    self.progress_will_change!
    self.progress[days_since - 1] = 't'
    self.save
  end
  
  def mark_fail
    self.progress_will_change!
    self.progress[days_since - 1] = 'f'
    self.save
  end
  
  def days_since
    (DateTime.now - began_at.to_date).to_i + 1
  end
  
  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
     data = access_token.info
     user = User.where(:provider => access_token.provider, :uid => access_token.uid ).first
     if user
       return user
     else
       registered_user = User.where(:email => access_token.info.email).first
       if registered_user
         return registered_user
       else
         user = User.create(provider:access_token.provider,
           email: data["email"],
           uid: access_token.uid ,
           password: Devise.friendly_token[0,20],
         )
       end
    end
  end
end
