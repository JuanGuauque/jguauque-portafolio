module DefaultPageContent
	extend ActiveSupport::Concern

	included do
		before_action :set_page_defaults
	end

	def set_page_defaults
		@page_title = "JGuauque Portafolio | My Portfolio Website"
		@seo_keywords = "Sebastian Guauque portfolio"
	end
end



