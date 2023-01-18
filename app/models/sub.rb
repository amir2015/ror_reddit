class Sub < ApplicationRecord
has_many  :topics, dependent: :destroy,
 validates :title, uniqueness: true
end
