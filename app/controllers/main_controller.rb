class MainController < ApplicationController

  # POST
  def reshuffle
    in_document = request.body.read

    output = HTMLUnnest.new(in_document)

    render :text => output.to_html
  end


  # POST
  def list_ids
    in_document = request.body.read

    output = HTMLIDClassList.new(in_document)

    render :text => output.out
  end


end
