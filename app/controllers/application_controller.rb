
# Application Controller
#
# Base controller for the application that all other controllers extend.
#
class ApplicationController < ActionController::Base

  # Catch DocumentNotFound exceptions
  rescue_from Mongoid::Errors::DocumentNotFound, with: :document_not_found
  rescue_from CanCan::AccessDenied, with: :access_denied

  # Add CSRF tokens to forms
  protect_from_forgery


  protected


  # Show a '404 Document not found' error page.
  #
  def document_not_found
    render "common/document_not_found"
  end


  # Show an 'Access Denied' error page.
  #
  def access_denied
    render "common/access_denied"
  end


  # Redirect to back. If not possible, redirect to provided fallback.
  #
  # @param fallback [String] Fallback route if back is not available.
  #
  def redirect_to_back fallback = root_url
    if !request.env["HTTP_REFERER"].blank? and request.env["HTTP_REFERER"] != request.env["REQUEST_URI"]
      redirect_to :back
    else
      redirect_to fallback
    end
  end


end
