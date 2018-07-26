require "spec_helper"

feature "User views articles", %(
  As a slacker
  I want to be able to visit a page that shows me all the submitted articles
  So that I can distract myself from the actual work I have to do

  [x] When I visit /articles I should be able to see all the articles that have been submitted.
  [x] Each article should show the description, title, and URL.
  [x] If I click on the URL it should take me to the relevant page inside of a new tab.

) do

  scenario "user sees a list of articles when visiting /articles, user sees title, decription, and url" do
    visit '/'

    expect(page).to have_selector('li')
    expect(page).to have_content('Microsoft')
    expect(page).to have_content('We know a lot Microsoft’s plans for next-gen consoles')
    expect(page).to have_link('Read Article 1')
  end

  scenario "user navigates to an individual article" do
    visit '/articles'
    click_on('Read Article 1')
    expect(page).to have_current_path('https://www.polygon.com/2018/6/19/17478718/microsoft-next-generation-xbox-e3')
  end
end
