require 'rails_helper'

describe 'Pages' do
  
  describe 'welcome page' do
    
    it 'should show a div' do
      visit root_path
      
      expect(page).to have_css('#logoImage')
    end
    
    it 'should show a div' do
      visit root_path
      
      expect(page).to have_css('.introText')
    end 
    
    it 'should show a sign up button' do
      visit root_path
      
      expect(page).to have_css('.sign-up-button')
    end
    
  end
  
  
  describe 'profile page' do
    
    it 'should show a input' do
      visit pages_profile_path
      
      expect(page).to have_css('.textField')
    end
    
    it 'should show a submit button' do
      visit pages_profile_path
      
      expect(page).to have_css('.submitButton')
    end
    
    it 'should show number of Days' do
      visit pages_profile_path
      
      expect(page).to have_css('.whatText')
    end
    
    it 'should show a plan text input' do
      visit pages_profile_path
      
      expect(page).to have_css('.planTextField')
    end
    
    it 'should show a yes/no buttons' do
      visit pages_profile_path
      
      expect(page).to have_css('#okButton') 
    end
    
    
    
  end

end