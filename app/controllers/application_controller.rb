class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def crc
    render html: "</strong>crc</strong>"
  end

end
