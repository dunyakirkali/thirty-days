require 'rails_helper'

describe 'Pages' do
  
  describe 'welcome page' do
    
    it 'should show a header text' do
      visit root_path
      
      expect(page).to have_css('.introText')
    end 
    
    it 'should show a intro text' do
      visit root_path
      
      expect(page).to have_css('.introText')
    end 
    
    it 'should show a sign up button' do
      visit root_path
      
      expect(page).to have_css('.sign-up-button')
    end
    
  end
  
  
  describe 'profile page' do
    
    before :each do
      user = FactoryGirl.create(:user)
      
      visit new_user_session_path
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      click_on 'Sign in'
      expect(page).to have_content("Signed in as #{user.email}")
    end
    
    describe 'when user has a plan' do
      it 'should show number of Days' do
        pending
      end
    
   
      it 'should show a saved plan text' do
        visit pages_
        profile_path
      
        expect(page).to have_css('#savedPlanText')
      end
    
      it 'should show a yes/no buttons' do
        visit pages_profile_path
      
        expect(page).to have_css('.yesnoButtons', count:2)
      end
    end
    
    describe 'when uhser has no plan' do
      
      it 'should show what text' do
        visit pages_profile_path
        save_and_open_page
        expect(page).to have_css('.whatText')
      end
      
      it 'should show a plan text input' do
        visit pages_profile_path
      
        expect(page).to have_css('.planTextField')
      end
      
      it 'should show a submit button' do
        visit pages_profile_path
      
        expect(page).to have_css('#submitButton')
      end
    end
  end

end