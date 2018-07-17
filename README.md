<% @surveys.each() do |survey| %>
  <li><%= survey.name %> <a href="/survey/<% survey.id %>/edit">Update this survey</a></li>
  <% end %>


  get("/question/new") do
    erb(:question)
  end

  post('/question/new') do
    binding.pry
    question = params["question_text"]
    Question.create({:question_text => question_text})
    redirect '/'
  end
