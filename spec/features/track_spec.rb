require 'rails_helper'

describe 'Tracking' do
  it 'should be possible to mark today positive' do
    user = FactoryGirl.create(:user, :with_plan)
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_on 'Sign in'
    click_on 'Yes'
    
    expect(page).to have_content("admire your 100.00% so far or 3.33% total success")
  end
  
  it 'should be possible to mark today negative' do
    user = FactoryGirl.create(:user, :with_plan)
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_on 'Sign in'
    click_on 'Yes'
    click_on 'No'
    
    expect(page).to have_content("admire your 0.00% so far or 0.00% total success")
  end
  
  it 'should be able to mark consecutive days' do
    user = FactoryGirl.create(:user, :with_plan)
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_on 'Sign in'
    
    [*0..29].each do |i|
      Timecop.freeze(DateTime.now + i.days) do
        visit pages_profile_path
        click_on 'Yes'
        value =  ActiveSupport::NumberHelper.number_to_percentage(((i+1) / ENV['NUMBER_OF_DAYS'].to_f * 100.0).round(2), precision: 2)
        expect(page).to have_content("admire your 100.00% so far or #{value} total success")
      end
    end
  end
end