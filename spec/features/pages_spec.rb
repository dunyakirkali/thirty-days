require 'rails_helper'

describe 'Pages' do
  
  describe 'welcome page' do
    
    it 'should show a image with id logoImage' do
      visit root_path
      
      expect(page).to have_css('img#logoImage')
    end
    
    it 'should show a p with class introText' do
      visit root_path
      
      expect(page).to have_css('p.introText')
    end 
    
    it 'should show a sign up button' do
      visit root_path
      
      expect(page).to have_css('a.sign-up-button')
    end
    
  end
  
  
  describe 'profile page' do
    
    describe 'user without ongoing plan' do
      
      it 'should show a plan text input' do
        visit pages_profile_path
      
        expect(page).to have_css('.planTextField')
      end
            
      it 'should show a ok button' do
        visit pages_profile_path
      
        expect(page).to have_css('#okButton') 
      end
      
      it 'should show what text' do
        visit pages_profile_path
      
        expect(page).to have_css('.whatText')
      end

    end
    
    describe 'user with ongoing plan' do
      it 'should show a saved plan text' do
        visit pages_profile_path
      
        expect(page).to have_css('#savedPlanText')
      end
      
      it 'should show a yes/no buttons' do
        visit pages_profile_path
      
        expect(page).to have_css('.yesnoButtons', count:2)
      end      
      
      it 'should show number of days passed' do
        pending
      end
    end                
  end
end