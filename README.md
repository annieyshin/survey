<% @surveys.each() do |survey| %>
  <li><%= survey.name %> <a href="/survey/<% survey.id %>/edit">Update this survey</a></li>
  <% end %>
