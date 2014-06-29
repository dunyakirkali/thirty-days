require 'rails_helper'

describe "Plan" do
  before :each do
    user = FactoryGirl.create(:user, :with_plan)
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_on 'Sign in'
  end

  it 'should be resettable' do
    click_on 'reset'

    expect(page).to have_css('.whatText')
  end
end
