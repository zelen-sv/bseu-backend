class ApplicationController < ActionController::Base
  layout :layout_by_resource
  before_action :set_fixed_locale

  private

  def layout_by_resource
    if devise_controller?
      "login"
    else
      "application"
    end
  end

  def set_fixed_locale
    I18n.locale = I18n.default_locale
  end
end
