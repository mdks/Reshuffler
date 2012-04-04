ReshufflerApp::Application.routes.draw do
  match "/reshuffle" => "main#reshuffle"
  match "/list_ids" => "main#list_ids"
  match "/merge" => "main#merge"
  match "/push" => "main#push"
end
