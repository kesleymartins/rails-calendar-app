class Event < ApplicationRecord
    validates :title, presence: true
    validates :description, presence: true
    validates :start_time, presence: true
    validates :end_time, presence: true
    validates :start_time, comparison: { less_than: :end_time }
end
