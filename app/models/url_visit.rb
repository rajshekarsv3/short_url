class UrlVisit < ActiveRecord::Base
	belongs_to :url
	after_save :sync_visits_count
	def sync_visits_count
		url = self.url
		url.visits_count = url.url_visits.count
		url.save
	end
end
