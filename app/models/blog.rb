# frozen_string_literal: true

# Blog Model
class Blog < ApplicationRecord
  enum status: { draft: 0, published: 1 }
  extend FriendlyId
  friendly_id :title, use: :slugged
  validates :title, presence: true
  validates :body, presence: true
  validates_presence_of :topic_id

  has_many :comments, dependent: :destroy

  has_rich_text :body

  belongs_to :topic

  def self.order_blogs
    order('created_at DESC')
  end
end
