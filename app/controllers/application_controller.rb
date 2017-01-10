class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def crc
    render html: "<h1></strong>crc</strong></h1>".html_safe
  end

end
