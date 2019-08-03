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

  describe 'a soapmaker can add a raw material' do
    before do
      visit '/raw_materials'
      click_on 'Add Raw Material'
    end

    context 'when entering valid information' do
      it 'saves the raw material' do
        fill_in 'raw_material[name]', with: 'bbq sauce'
        select 'Liquids', from: 'raw_material[category]'
        click_on 'Submit'

        within "[data-category='Liquids']" do
          expect(page).to have_content 'bbq sauce'
        end
      end
    end

    context 'when missing required fields' do
      it 'preserves entered information and renders validation errors' do
        select 'Liquids', from: 'raw_material[category]'
        click_on 'Submit'

        expect(page).to have_select('raw_material[category]', selected: 'Liquids')
        expect(page).to have_content "Name can't be blank"
      end
    end
  end
end
