require "rails_helper"

describe "The home page" do
  it "has an h1 element with the text \"Delivery Tracker\"", points: 1 do
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
    
    expect(page).to have_tag("h1", :text => /Delivery Tracker/i)
  end
end

describe "The home page" do
  it "has an h2 element with the text \"Expecting a package?\"", points: 1 do
    
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
    
    expect(page).to have_tag("h2", :text => /Expecting a package/)
  end
end

describe "The home page" do
  it "has the text \"Know if something gets lost in the mail.\"", points: 1 do
    
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
    
    expect(page).to have_text(/Know if something gets lost in the mail/i)
  end
end

describe "The home page" do
  it "has a div element with the class \"waiting_on\"", points: 1 do
    
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

    expect(page).to have_css("div.waiting_on"),
      "Expected to find a <div> element with the a class attribute containing 'waiting_on', but didn't find one."
  end
end

describe "The home page" do
  it "has an h2 element within the \"waiting_on\" div with the text \"Waiting on\"", points: 1 do
    
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
    
    within(:css, "div.waiting_on") do
      expect(page).to have_tag("h2", :text => /Waiting on/i)
    end
  end
end

describe "The home page" do
  it "has a div element with the class \"received\"", points: 1 do
    
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

    expect(page).to have_css("div.received"),
      "Expected to find a <div> of class 'received', but didn't find one."
  end
end

describe "The home page" do
  it "has an h2 element within the \"received\" div with the text \"Received\"", points: 1 do
    
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

    within(:css, "div.waiting_on") do
      expect(page).to have_tag("h2", :text => /Received/i)
    end
  end
end

describe "The home page" do
  it "has a label the text \"Description\" with a matching text input", points: 1,  hint: h("label_for_input copy_must_match") do
    
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

    description_label = find("label", :text => "Description")
    for_attribute = description_label[:for]

    if for_attribute.empty?
      expect(for_attribute).to_not be_empty,
        "Expected label's for attribute to be set to a non empty value, was '#{for_attribute}' instead."
    else
      all_inputs = all("input")
      all_input_ids = all_inputs.map { |input| input[:id] }
  
      expect(all_input_ids.count(for_attribute)).to eq(1),
        "Expected label's for attribute(#{for_attribute}) to match only 1 of the ids of an <input> tag (#{all_input_ids}), but found 0 or more than 1."
    end
  end
end

describe "The home page" do
  it "has a label with the text \"Supposed to arrive on\" with a matching input", points: 1,  hint: h("label_for_input copy_must_match") do
    
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

    arrive_on_label = find("label", :text => "Supposed to arrive on")
    for_attribute = arrive_on_label[:for]

    if for_attribute.empty?
      expect(for_attribute).to_not be_empty,
        "Expected label's for attribute to be set to a non empty value, was '#{for_attribute}' instead."
    else
      all_inputs = all("input")
      all_input_ids = all_inputs.map { |input| input[:id] }
  
      expect(all_input_ids.count(for_attribute)).to eq(1),
        "Expected label's for attribute(#{for_attribute}) to match only 1 of the ids of an <input> tag (#{all_input_ids}), but found 0 or more than 1."
    end
  end
end

describe "The home page" do
  it "has a label the text \"Details\" with a matching textarea", points: 1,  hint: h("label_for_input copy_must_match") do
    
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

    details_label = find("label", :text => "Details")
    for_attribute = details_label[:for]

    if for_attribute.empty?
      expect(for_attribute).to_not be_empty,
        "Expected label's for attribute to be set to a non empty value, was '#{for_attribute}' instead."
    else
      all_textareas = all("textarea")
      all_textarea_ids = all_textareas.map { |textarea| textarea[:id] }
  
      expect(all_textarea_ids.count(for_attribute)).to eq(1),
        "Expected label's for attribute(#{for_attribute}) to match only 1 of the ids of an <textarea> tag (#{all_textarea_ids}), but found 0 or more than 1."
    end
  end
end


describe "The home page" do
  it "has a button element with the text \"Log delivery\"", points: 1, hint: h("copy_must_match") do
    
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
    
    expect(page).to have_tag("button", :text => /Log delivery/)
  end
end

describe "The home page" do
  it "has a button that logs a package delivery", points: 2 do
    
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

    within(:css, "form") do
      fill_in "Description", with: "New phone"
      fill_in "Supposed to arrive on", with: 2.days.from_now
      fill_in "Details", with: "This package is important!"
      click_on "Log delivery"
    end
    
    expect(page).to have_text(/New phone/)
  end
end
