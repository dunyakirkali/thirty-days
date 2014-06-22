require 'rails_helper'

describe 'Pages' do
  
  describe 'welcome page' do
    
    it 'should show a sign up button' do
      visit root_path
      
      expect(page).to have_css('.sign-up-button')
    end
    
  end
  
  
    #
  #
  # it 'should ...' do
  #
  # end
  #
end