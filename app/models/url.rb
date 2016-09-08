class Url < ActiveRecord::Base
	has_many :url_visits

	belongs_to :user

	validates :original_url, presence: true
	validates :original_url, format: { with: URI.regexp }

	def self.get_shorty
		begin
      shorty = Array.new(6){[*'0'..'9', *'a'..'z', *'A'..'Z'].sample}.join
    end while (Url.exists?(:shorty => shorty) )
    shorty
	end

	def as_json(options={})
    options[:except] ||= :updated_at
  	super
  end
end
