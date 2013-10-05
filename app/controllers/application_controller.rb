class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :set_locale
  before_filter :check_admin 
  
  private
    def set_locale
      I18n.locale = params[:locale] || I18n.default_locale
    end
    
    def default_url_options(options={})
      { locale: I18n.locale }
    end
  
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
