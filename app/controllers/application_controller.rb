class ApplicationController < ActionController::API
	rescue_from ::Exception, with: :error_occurred

	def authenticate
		@current_user = User.find_by_api_token(request.headers["X-Access-Token"]) if request.headers["X-Access-Token"]
		render json: {error: 'Authentication failed'}, status: 401 unless @current_user
	end

  def error_occurred(exception)
    render json: {error: exception.message}.to_json, status: 500
  end
end
