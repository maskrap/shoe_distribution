require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe 'the store tracker path', type: :feature do
  it 'goes to the store list page' do
    visit '/'
    click_link("View Stores")
    expect(page).to have_content 'Stores'
  end

  it 'goes to the brand list page' do
    visit '/'
    click_link("View Brands")
    expect(page).to have_content 'Brands'
  end

  it 'adds new store to store form' do
    visit '/'
    click_button 'Add Store'
    expect(page).to have_content 'Store'
  end

  it 'adds new brands to brand form' do
    visit '/brands'
    click_button 'Add Brand'
    expect(page).to have_content 'Brand'
  end

  it 'goes back to index from stores page' do
    visit '/stores'
    click_link 'Home'
    expect(page).to have_content 'Shoe Tracker'
  end

  it 'goes back to index from brands page' do
    visit '/brands'
    click_link 'Home'
    expect(page).to have_content 'Shoe Tracker'
  end

  it 'updates store name from stores page' do
    test_store = Store.new({:name => "name"})
    test_store.save
    visit '/stores'
    fill_in('name', {:with => "Nike"})
    click_button 'Add Store'
    expect(page).to have_content(test_store.name())
  end

  it 'updates brand name from brands page' do
    test_brand = Brand.new({:name => "name"})
    test_brand.save
    visit '/brands'
    fill_in('name', {:with => "Nike"})
    click_button 'Add Brand'
    expect(page).to have_content(test_brand.name())
  end
end
