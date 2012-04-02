ReshufflerApp::Application.routes.draw do
  match "/reshuffle" => "main#reshuffle"
  match "/list_ids" => "main#list_ids"
end
