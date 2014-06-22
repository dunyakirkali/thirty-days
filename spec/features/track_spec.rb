require 'rails_helper'

describe 'Tracking' do
  it 'should be possible to mark today positive' do
    user = FactoryGirl.create(:user, :with_plan)
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_on 'Sign in'
    click_on 'Yes'
    
    expect(page).to have_content("1 successfull days")
  end
  
  it 'should be possible to mark today negative' do
    user = FactoryGirl.create(:user, :with_plan)
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_on 'Sign in'
    click_on 'Yes'
    click_on 'No'
    
    expect(page).to have_content("0 successfull days")
  end
  
  it 'should be able to mark consecutive days' do
    user = FactoryGirl.create(:user, :with_plan)
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_on 'Sign in'
    
    [*0..9].each do |i|
      Timecop.freeze(DateTime.now + i.days) do
        visit pages_profile_path
        click_on 'Yes'
        
        expect(page).to have_content("#{i+1} successfull days")
      end
    end
  end
end