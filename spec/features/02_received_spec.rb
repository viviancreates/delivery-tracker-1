require "rails_helper"

describe "The Received section" do
  it "displays each package delivery description", points: 1 do
    
    user_jacob = User.new
    user_jacob.email = "jacob_#{rand(100)}@example.com"
    user_jacob.password = "password"
    user_jacob.save

    visit "/users/sign_in"

    within(:css, "form") do
      fill_in "Email", with: user_jacob.email
      fill_in "Password", with: user_jacob.password
      click_on "Log in"
    end

    visit("/")

    date = 3.days.from_now.to_date

    within(:css, "form") do
      fill_in "Description", with: "New phone"
      fill_in "Supposed to arrive on", with: date
      fill_in "Details", with: "This package is important!"
      click_on "Log delivery"
    end

    within(:css, "div.waiting_on") do
      click_on "Mark as received"
    end

    within(:css, "div.received") do
      expect(page).to have_text(/New phone/)
    end
  end
end

describe "The Received section" do
  it "has a link to delete deliveries with the text \"Delete\"", points: 2, hint: h("copy_must_match") do
    
    user_jacob = User.new
    user_jacob.email = "jacob_#{rand(100)}@example.com"
    user_jacob.password = "password"
    user_jacob.save

    visit "/users/sign_in"

    within(:css, "form") do
      fill_in "Email", with: user_jacob.email
      fill_in "Password", with: user_jacob.password
      click_on "Log in"
    end

    visit("/")
    date = 3.days.from_now.to_date

    within(:css, "form") do
      fill_in "Description", with: "New phone"
      fill_in "Supposed to arrive on", with: date
      fill_in "Details", with: "This package is important!"
      click_on "Log delivery"
    end

    within(:css, "div.waiting_on") do
      click_on "Mark as received"
    end

    within(:css, "div.received li") do
      click_on "Delete"
    end

    expect(page).to_not have_content(/New phone/)
  end
end

describe "The home page" do
  it "displays the message, \"Added to list\", after logging a delivery", points: 1, hint: h("flash_messages") do
    
    user_jacob = User.new
    user_jacob.email = "jacob_#{rand(100)}@example.com"
    user_jacob.password = "password"
    user_jacob.save

    visit "/users/sign_in"

    within(:css, "form") do
      fill_in "Email", with: user_jacob.email
      fill_in "Password", with: user_jacob.password
      click_on "Log in"
    end

    visit("/")

    formatted_date = 2.days.from_now
    within(:css, "form") do
      fill_in "Description", with: "New phone"
      fill_in "Supposed to arrive on", with: formatted_date
      fill_in "Details", with: "This package is important!"
      click_on "Log delivery"
    end
    
    expect(page).to have_text(/Added to list/)
  end
end
