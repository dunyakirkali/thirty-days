require 'rails_helper'

describe 'User' do
  
  it 'should not have a plan if project plan is nil' do
    user = FactoryGirl.create(:user, :without_plan)
    
    expect(user.has_plan?).to eq(false)
  end
  
  it 'should not have a plan if project plan is nil' do
    user = FactoryGirl.create(:user, :with_plan)
    
    expect(user.has_plan?).to eq(true)
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
      
      expect(user.days_since).to eq(2)
    end
  end
end
