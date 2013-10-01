module ApplicationHelper
  def urls_to_images(s)
    s.gsub! /(?:\s|\A)(http:\/\/.*?(\.(png|jpeg|jpg|gif)))(?:\s|\Z)/, '<p><img src="\1"></p>'
    s.html_safe
  end
  
  def urls_to_links(s)  
    s.gsub! /(\s|\A)(http:\/\/.*?)(\s|\Z)/, '\1<a href="\2" target="_blank">\2</a>\3'
    s.html_safe
  end
end