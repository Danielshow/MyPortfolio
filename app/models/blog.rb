# frozen_string_literal: true

# Blog Model
class Blog < ApplicationRecord
  enum status: { draft: 0, published: 1 }
  extend FriendlyId
  friendly_id :title, use: :slugged
  validates :title, presence: true
  validates :body, presence: true
  validates_presence_of :topic_id

  belongs_to :topic
end
