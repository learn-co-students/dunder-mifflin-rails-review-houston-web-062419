class Employee < ApplicationRecord
    belongs_to :dog
    validates :first_name, :last_name, :title, :alias, :office, :dog_id, :img_url, presence: true
    validates :alias, :title, uniqueness: true


end
