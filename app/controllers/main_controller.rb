class MainController < ApplicationController

  # POST
  def reshuffle
    in_document = params[:document]

    output = HTMLUnnest.new(in_document)

    render :text => output.to_html
  end


end
