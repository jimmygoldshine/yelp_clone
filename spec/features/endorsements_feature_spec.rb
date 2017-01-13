require 'rails_helper'


feature 'endorsing reviews' do
  before do
    sign_up
    add_restaurant
    add_review
  end

  scenario 'a user can endorse a review, which updates the review endorsement count' do
    visit '/restaurants'
    click_link 'Endorse Review'
    expect(page).to have_content('1 endorsement')
  end

end
