require 'rails_helper'

RSpec.feature "UserLogins", type: :feature do
  # SETUP
  before :each do
    @user = User.create!(
      name: 'Micheal Douglas',
      email: 'michael@example.org',
      password: 'password',
      password_confirmation: 'password',
    )
  end

  scenario "a user logs in", js:true do
    visit login_path
    fill_in "email", with: "michael@example.org"
    fill_in "password", with: "password"
    page.find("input[type='submit']").click
    expect(page).to have_text 'Logout', count: 1
  end
end
