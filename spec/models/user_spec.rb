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
end
