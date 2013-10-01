class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :check_admin 
  
  private
  
    def render_403
      render file: "public/403.html", status: 403, layout: "application" 
    end
    
    def render_404
      render file: "public/404.html", status: 404, layout: "application"
    end
    
    def check_admin
       # if params[:admin]
          @current_user_admin = true
       # end
    end
      
    def access_admin
      render_403 unless @current_user_admin
    end
end
