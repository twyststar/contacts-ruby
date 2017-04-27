require('capybara/rspec')
require('./app')
require('launchy')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)


describe("address", {:type => :feature}) do
  it("accept a new address") do
    visit('/')
    click_on('See Contact List/ Add New Contacts')
    fill_in('first-name', :with => "Bob")
    fill_in('last-name', :with => "Ross")
    fill_in('job', :with => "Painter")
    fill_in('company', :with => "PBS")
    click_button('Click')
    click_on('Back to contacts list')
    click_on('Ross, Bob')
    fill_in('street', :with => "1800 Easel St.")
    fill_in('state', :with => "Public TV town")
    fill_in('city', :with => "WA")
    fill_in('zip', :with => "98116")
    fill_in('type', :with => "Home")
    click_button('Add')
    click_on('Back to contacts list')
    click_on('Ross, Bob')
    expect(page).to have_content("Home")
  end
end
