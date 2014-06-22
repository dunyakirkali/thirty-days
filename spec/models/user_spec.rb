require 'rails_helper'

RSpec.describe User, :type => :model do
  
  let!(:user) { FactoryGirl.create(:user) }
  
  it 'should have a plan if project plan is not nil' do
    pending
  end
  
  it 'should not have a plan if project plan is not nil' do
    pending
  end
  
  it 'should have progress' do
    pending
  end
end
