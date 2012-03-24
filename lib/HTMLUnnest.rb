require 'nokogiri'

class HTMLUnnest

  def initialize(in_document)

  @dom = Nokogiri::HTML(in_document)

  @document = @dom.document

  @global_out = ''

  unnest(@document)

  @document.search('body').first.inner_html = @global_out

  @document.to_s

  end

  def to_html
    @document.to_html
  end

  # walk tree

  def unnest(node)

  # recurse
  if node.children.count > 0
    node.children.each do |n|
      unnest(n)
    end
  end

  unnested = node.clone
  if unnested && unnested.children.count > 0
  # kill children
  unnested.children.remove
  end

  # nokogiri bug
  unless unnested.nil? || ['head', 'xml', 'meta', 'link', 'body', 'html'].include?(unnested.name) # nothing outside body
  # remove indent
  @global_out += unnested.to_s.gsub(/^\s+/, "").gsub(/\s+$/, "")
  end

  end




end