require('spec_helper')
require 'capybara/rspec'
require './app'
Capybara.app = Sinatra::Application
set(:show_exceptions, false)


describe 'adding a new question', {:type => :feature} do
  it('allows a survey manager to add questions and survey information') do
    visit '/'
    click_link('Add a new question')
    fill_in('question_text', :with => 'How many times do you brush your teeth in a day?')
    click_button('Add')
    expect(page).to have_content('How many times do you brush your teeth in a day?')
  end
end

describe('viewing all of the surveys', {:type => :feature}) do
  it('allows a manager to see all of the surveys that have been created') do
    survey = Survey.create ({:title => 'Hygiene'})
    visit('/')
    click_link('View all surveys')
    expect(page).to have_content(survey.title)
  end
end

describe('seeing details for a single survey', {:type => :feature}) do
  it('allows a survey manager to click a survey to see the questions and detaisl for it') do
    test_survey = Survey.create ({:title => 'Hygiene'})
    test_question = Question.create ({:question_text => 'How many times do you brush your teeth in a day?', :survey_id => test_survey.id()})
    visit('/survey')
    click_link(test_survey.id())
    expect(page).to have_content(test_question.question_text())
  end
end
