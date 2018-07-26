require "spec_helper"

feature "users can submit articles", %(
  As a slacker
  I want to be able to submit an incredibly interesting article
  So that other slackers may benefit from my distraction

  [x]the form accepts article, title, URL, and description.
  [x]when I successfully post an article, it should be saved into a CSV file
  [x]If I try to submit an empty form, I stay on my form page, and nothing is saved to my CSV file.
) do

   scenario "User enters article details and hits submit, details are saved to csv" do
   visit '/articles/new'
   fill_in 'article_title', with: "Mechanic 'posed as general with helicopter to impress date'"
   fill_in 'article_description', with: "A car mechanic has been indicted on charges of posing as a three-star US army general in order to land a helicopter, officials say."
   fill_in 'article_url', with: "https://www.bbc.com/news/world-us-canada-44538395"
   click_button 'Submit'

   expect(page).to have_content("A car mechanic has been indicted on charges of posing as a three-star US army general in order to land a helicopter, officials say.")
   end

  scenario "User submits empty form, stays on same page, nothing is saved to csv" do
    visit '/articles/new'
    click_button 'Submit'
    expect(page).to have_current_path('/articles/new')
  end
end
