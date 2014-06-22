require 'rails_helper'

describe "New Plan" do
  
  before :each do
    user = FactoryGirl.create(:user)
    
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_on 'Sign in'
    expect(page).to have_content("Signed in as #{user.email}")
  end
  
  it 'should start when saved' do
    
    fill_in 'plan', with: 'My plan is that ...'
    click_on 'OK'
    
    expect(page).to have_content('Plan Saved')
  end
  
end