# Methods added to this helper will be available to all templates in the application.
include CommonHelper
module ApplicationHelper
  
 def prompt_to_remote(name, text, param, url, html_options = {})
    
    html_options[:onclick] = "promptToRemote('#{text}', '#{param}', '#{url_for(url)}'); return false;"

    link_to name, {},html_options
    
 end
  
end
