class Book < ActiveRecord::Base
	has_many :summaries, dependent: :destroy
end
