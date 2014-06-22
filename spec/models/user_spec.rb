require 'rails_helper'

describe 'User' do
  
  it 'should not have a plan if project plan is nil' do
    user = FactoryGirl.create(:user, plan: nil)
    
    expect(user.has_plan?).to eq(false)
  end
  
  it 'should not have a plan if project plan is nil' do
    user = FactoryGirl.create(:user, plan: Faker::Lorem.paragraph)
    
    expect(user.has_plan?).to eq(true)
  end
  
  describe 'progress' do
    it 'should be a nil if no plan' do
      user = FactoryGirl.create(:user, plan: nil)
      
      expect(user.progress).to eq(nil)
    end
    
    it 'should be a null array if plan' do
      user = FactoryGirl.create(:user, plan: Faker::Lorem.paragraph)
      
      expect(user.progress.inject{|sum,x| sum + x }).to eq(0)
    end
  end
end
