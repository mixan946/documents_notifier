
Given(/^I changed wiki content$/) do
  steps %{
    Given I'm logged in
    Given I have at least 1 project
    Given Project has wiki page
    Given I visit wiki edit page
    Given I edit content of wiki page
  }
end


Given(/^I'm logged in$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^"(.*?)" unchecked$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

When(/^I press save button$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^Nobody receives email except watchers$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I check "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I get list of project's users$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^I check some random users$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^random users and watchers will get email$/) do
  pending # express the regexp above with the code you wish you had
end

