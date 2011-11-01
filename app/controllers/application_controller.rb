class ApplicationController < ActionController::Base
  rescue_from Mongoid::Errors::DocumentNotFound, with: :document_not_found

  protect_from_forgery
  before_filter :console_line


  protected


  def console_line
    # TODO Remove - Used for visibility in console due to asset errors
    puts "\n\n\n\n!!! ======================================================== !!!\n\n\n\n"
  end


  def document_not_found
    render "common/document_not_found"
  end


  def redirect_to_back default = root_url
    if !request.env["HTTP_REFERER"].blank? and request.env["HTTP_REFERER"] != request.env["REQUEST_URI"]
      redirect_to :back
    else
      redirect_to default
    end
  end


end
