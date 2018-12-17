class ApplicationController < ActionController::Base
  def set_admin_locale
    I18n.locale = :ru
  end
end
