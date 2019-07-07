# frozen_string_literal: true

class Portfolio < ApplicationRecord
  has_many :technologies, dependent: :destroy
  accepts_nested_attributes_for :technologies, 
                                 allow_destroy: true,
                                reject_if: lambda { |attrs| attrs['name'].blank?}
  validates_presence_of :title, :body

  has_rich_text :body

  mount_uploader :thumb_image, PortfolioUploader
  mount_uploader :main_image, PortfolioUploader

  def self.by_positiom
    order('position ASC')
  end
end
