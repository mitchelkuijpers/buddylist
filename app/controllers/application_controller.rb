class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :console_line

  private

  def console_line
    puts "\n\n\n\n!!! ======================================================== !!!\n\n\n\n" # TODO Remove - Used for visibility in console due to asset errors
  end

end
