# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  #require 'AuthenticatedSystem'
  include AuthenticatedSystem
  include ExceptionNotifiable
  include SimpleCaptcha::ControllerHelpers
  local_addresses.clear
  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '6ede1e59438d0578999be4db49e582ac'
  
    
  protected
      exception_data :additional_data

      def additional_data
        { :document => @document,
          :person => @person }
      end
 

end
