require 'rails_helper'

describe 'root' do
  it 'should route signed in user to profile page' do
    pending
    visit root_path
    
    expect(page).to have_content('Welcome')
  end
  
  it 'should route new user to welcome page' do
    visit root_path
    
    expect(page).not_to have_content('Welcome')
  end
end