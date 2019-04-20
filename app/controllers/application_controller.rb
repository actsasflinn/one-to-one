Rails.application.config.active_record.sqlite3.represent_boolean_as_integer = true
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
end
