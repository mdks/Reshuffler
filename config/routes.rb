ReshufflerApp::Application.routes.draw do
  match "/reshuffle" => "main#reshuffle"
end
