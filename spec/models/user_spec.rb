require 'rails_helper'

describe 'User' do
  
  describe 'has_plan?' do
    it 'should be false if project plan is nil' do
      user = FactoryGirl.create(:user, :without_plan)
    
      expect(user.has_plan?).to eq(false)
    end
  
    it 'should be true if project plan is not nil' do
      user = FactoryGirl.create(:user, :with_plan)
    
      expect(user.has_plan?).to eq(true)
    end
  end
  
  describe 'completed_plan?' do
    it 'should be false if it hasn not been 30 days yet' do
      user = FactoryGirl.create(:user, :with_plan)
    
      expect(user.completed_plan?).to eq(false)
    end
  
    it 'should be true if it has been 30 days' do
      user = FactoryGirl.create(:user, :with_a_completed_plan)
    
      expect(user.completed_plan?).to eq(true)
    end
  end
  
  describe 'progress' do
    it 'should be a nil if no plan' do
      user = FactoryGirl.create(:user, :without_plan)
      
      expect(user.progress).to eq(nil)
    end
    
    it 'should be a null array if plan' do
      user = FactoryGirl.create(:user, :with_plan)
      
      expect(user.progress.count(true)).to eq(0)
    end
    
    it 'should calculate days since' do
      user = FactoryGirl.create(:user, :with_plan, began_at: 2.days.ago)
      
      expect(user.days_since).to eq(3)
    end
  end
  
  describe 'send_reminder' do
    it 'should send reminder email if user has not completed plan' do
      user = FactoryGirl.create(:user, :with_plan)
    
      expect { user.send_reminder }.to change { ActionMailer::Base.deliveries.count }.by(1)
    end
    
    it 'should not send reminder email if user has completed plan' do
      user = FactoryGirl.create(:user, :with_a_completed_plan)
    
      expect { user.send_reminder }.to change { ActionMailer::Base.deliveries.count }.by(0)
    end
  end
end
