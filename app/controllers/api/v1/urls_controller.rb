class Api::V1::UrlsController < ApplicationController
	before_action :authenticate
	before_action :set_url, only: [:show,:update,:destroy,:visits] 
	
	def index
    set_urls(@current_user.urls,@current_user.urls.first(10))
		render json: {urls: @urls}
	end
	def create
		@url = frame_url
		if @url.save
			render json: {message: "Shortened URL for #{@url.original_url} is localhost:3000/#{@url.shorty}",url: @url}
		else
			render json: {error: @url.errors.full_messages}
		end
	end
	def show
		if @url
			render json:  @url
		else
			render json: {message: "URL with id #{params[:id]} not found"}
		end
	end
	def destroy
		@url.destroy
		render json: { message: "URL Deleted Successfully!"}
	end
	def update
		if @url.update(url_params)
			render json: { message: "URL Updated Successfully!"}
		else
			render json: { error: @url.errors.full_messages}
		end
	end
	def visits
		render json: {visits: @url.url_visits}
	end


	private

	def frame_url
		@current_user.urls.new({
			:original_url => url_params[:original_url],
			:shorty => Url.get_shorty
			})
	end

	def set_url
		@url = @current_user.urls.find(params[:id])
	end

	def url_params
		params.require(:url).permit(:original_url)
	end

	def set_urls(obj,model)
    if params[:limit].present? && params[:offset].present?
      @urls = obj.limit(params[:limit]).offset(params[:offset])
    else
      @urls = model
    end
  end
	
end
