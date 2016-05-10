require 'rails_helper'

feature 'Visitor adds a new friend' do
  scenario 'Add friend with image' do
    visit root_path
    click_link 'New Friend'
    fill_in 'Name', with: 'Jonny'
    attach_file 'Avatar', fixture_image_path
    click_button 'Make a friend'

    expect(page).to have_css('h2', text: 'Jonny')
    expect(page).to have_xpath("//img[contains(@src, 'jonny.jpg')]")
  end


  def fixture_image_path
    Rails.root.join('spec', 'support', 'jonny.jpg')
  end
end
