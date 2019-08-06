class Catrentalrequest < ApplicationRecord

  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: {in: ['PENDING', 'APPROVED', 'DENIED']}
  #validate :start_must_come_before_end
  validate :does_not_overlap_approved_request

  belongs_to( :cat,
    foreign_key: :cat_id,
    class_name: :Cat)
    
  def overlapping_requests()
    requests = Catrentalrequest.where(cat_id: self.cat_id)
    requests.where.not(id: self.id)
      .where.not('start_date > :end_date OR end_date < :start_date',
      start_date: start_date, end_date: end_date)
  end

  def overlapping_approved_requests
    overlapping_requests.where("status = 'APPROVED'")
  end

  def does_not_overlap_approved_request
    if overlapping_approved_requests.any?
      errors[:base] << ("Existing approved request")
    end
  end
  #   requests.select {|request| (new_request.start_date < request.end_date) || (new_request.end_date < request.start_date)}
  # end


end

