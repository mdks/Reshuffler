require 'nokogiri'

class HTMLIDClassList

  def initialize(in_document)

  @dom = Nokogiri::HTML(in_document)

  @document = @dom.document

  @global_out = ''

  list(@document)

  @global_out

  end

  def list(node)

  # recurse
  if node.children.count > 0
    node.children.each do |n|
      list(n)
    end
  end

  unnested = node.clone
  if unnested && unnested.children.count > 0
  # kill children
  unnested.children.remove
  end

  # nokogiri bug
  unless unnested.nil? || ['head', 'xml', 'meta', 'link', 'body', 'html', 'document'].include?(unnested.name) # nothing outside body
  # remove indent
  @global_out += "id: #{unnested.attributes["id"]}\nclass: #{unnested.attributes["class"]}"
  end

  end




end