ENV['RACK_ENV'] = 'test'
require('sinatra')
require('sinatra/reloader')
require('sinatra/activerecord')
also_reload('lib/**/*.rb')
require('./lib/question')
require('./lib/survey')
require("pg")
require("pry")

get("/") do
  @questions = Question.all
  erb(:index)
end

get("/question") do
  @questions = Question.all
  erb(:question)
end

post("/question") do
  title = params["title"]
  Question.create({:question_text => question_text})
  @questions = Question.all()
  erb(:question)
end

get("/question/new") do
  @questions = Question.all
  erb(:question_form)
end

post('/question/new') do
  question = params["question_text"]
  Question.create({:question_text => question})
  redirect '/'
end


get("/survey") do
  @surveys = Survey.all()
  erb(:survey)
end

post("/survey") do
  title = params["title"]
  Survey.create({:title => title})
  @surveys = Survey.all()
  erb(:survey)
end

get("/question_assign") do
  @surveys = Survey.all()
  @questions = Question.all()
  erb(:question_assign)
end

post("/question_assign") do
  survey_id = params["surveys_drop"].to_i
  question_id = params["questions_drop"].to_i
  question_lookup = Question.find_by(id: question_id)
  question_lookup.update({survey_id: survey_id})
  @surveys = Survey.all()
  @questions = Question.all()
  erb(:question_assign)
end
