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

  def merge
    old_css_link = params[:old_css_link]
    
    new_css_link = params[:new_css_link]

    output = CSSMerge.new(old_css_link, new_css_link)

    render :text => output.out
  end

end
