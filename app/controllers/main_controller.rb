class MainController < ApplicationController

  # POST
  def reshuffle
    in_document = request.body

    output = HTMLUnnest.new(in_document)

    render :text => output.to_html
  end


end
