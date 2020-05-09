require 'rails_helper'

RSpec.feature "Spots", type: :feature do
  scenario "index" do
    visit spots_path
    expect(page).to have_content ('Spots')
  end
end
