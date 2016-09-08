class Api::V1::VisitsController < ApplicationController
	before_action :set_url, only: [:redirect]
	def redirect
		log_visits
		redirect_to @url.original_url
	end

	private
	def log_visits
		ip_details = JSON.parse get_location_details(request.remote_ip)
		@url.url_visits.create({
			:visitor_ip => ip_details['ip'],
			:visitor_city => ip_details['city'],
			:visitor_state => ip_details['region_name'],
			:visitor_country_iso2 => ip_details['country_code']
			})
	end
	def set_url
		@url = Url.find_by_shorty(params[:short_code])
		render json: {error: 'Invalid URL'} unless @url
	end
	def get_location_details(ip)
		Net::HTTP.get(URI("http://freegeoip.net/json/"+'103.210.140.14'))
	end
end
