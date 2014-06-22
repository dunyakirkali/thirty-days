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
    describe 'when user has a plan' do
      before :each do
        @user = FactoryGirl.create(:user, :with_plan)
      
        visit new_user_session_path
        fill_in 'user_email', with: @user.email
        fill_in 'user_password', with: @user.password
        click_on 'Sign in'
      end
      
      it 'should show number of Days' do
        visit pages_profile_path
        
        expect(page).to have_content('0 days since')
      end

      it 'should show a saved plan text' do
        visit pages_profile_path
      
        expect(page).to have_css('#savedPlanText')
      end
    
      it 'should show a yes/no buttons' do
        visit pages_profile_path
      
        expect(page).to have_css('.yesnoButtons', count:2)
      end
    end
    
    describe 'when user has no plan' do
      before :each do
        user = FactoryGirl.create(:user, :without_plan)
      
        visit new_user_session_path
        fill_in 'user_email', with: user.email
        fill_in 'user_password', with: user.password
        click_on 'Sign in'
      end
      
      it 'should show what text' do
        visit pages_profile_path
        
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