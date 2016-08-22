require 'rails_helper'

RSpec.feature "Users", type: :feature, js: true do
  before(:each) do
    @user = User.create( email: 'tim@tim.com', password_digest: 'timtim')
  end

  it "Logs in the user" do
    visit home_index_path
    click_on('Login')
    fill_in 'email', with: @user.email
    fill_in 'password', with: @user.password_digest
    expect(page).to have_content(@user.email)
  end

  it "creates a new user" do
    visit home_index_path
    click_on('Sign Up')
    fill_in 'email', with: "tom@tom.com"
    fill_in 'password', with: "tomtom"
    @email = "tom@tom.com"
    expect(page).to have_content(@email)
  end

  it "has ability to log out" do
    visit home_index_path
    click_on('Login')
    fill_in 'email', with: @user.email
    fill_in 'password', with: @user.password_digest
    click_on('Log Out')
    expect(page).to_not have_content(@user.email)
  end

end
