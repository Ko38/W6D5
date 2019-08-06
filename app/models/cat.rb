require 'action_view'
require 'action_view/helpers'

class Cat < ApplicationRecord
  include ActionView::Helpers::DateHelper

  validates :birth_date, :color, :sex, :name, :description, presence: true
  #validates :color, inclusion: ["red"]
  validates :color, inclusion: { in: ["red", "orange", "blue", "brown", "black", "white", "yellow", "green"] }
  validates :sex, inclusion: { in: ["M", "F"]}
  def age 
    distance_of_time_in_words(self.birth_date, Date.today)
  end

  def possible_colors
    Cat.validators_on(:color)[1].options[:in]
  end


  has_many :rentals,
    foreign_key: :cat_id,
    class_name: :Catrentalrequest,
    dependent: :destroy
end
