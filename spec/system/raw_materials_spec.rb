require 'rails_helper'

RSpec.describe 'Raw Material Management', type: :system do

  it 'a soapmaker can view raw materials for each category' do
    RawMaterial.create!(name: 'test material', category: 'Essential Oils')

    visit '/raw_materials'

    [
      'Base Oils',
      'Lye',
      'Liquids',
      'Colorants',
      'Additives',
    ].each do |category|
      expect(page).to have_content category
    end

    within "[data-category='Essential Oils']" do
      expect(page).to have_content 'Essential Oils'
      expect(page).to have_content 'test material'
    end
  end
end
