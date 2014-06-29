require 'rails_helper'

describe "Plan" do
  
  before :each do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_on 'Sign in'
  end
  
  it 'should be submittable' do
    fill_in 'plan', with: 'My plan is that ...'
    click_on 'OK'
  
    expect(page).to have_content('0 days since')
  end
end