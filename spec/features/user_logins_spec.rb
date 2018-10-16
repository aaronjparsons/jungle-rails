require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
  # SETUP
  before :each do
    @user = User.create!(
      name: "test",
      email: "test@test.com",
      password: "tester",
      password_confirmation: "tester"
    )
  end

  scenario "User can succesfully login" do
    # ACT
    visit root_path
    click_on 'Login'

    within 'form' do
      fill_in id: 'email', with: 'test@test.com'
      fill_in id: 'password', with: 'tester'
   
      click_button 'Submit'
    end
   
    page.has_content?('Logout')

    # DEBUG / VERIFY
    save_screenshot
  end
end
