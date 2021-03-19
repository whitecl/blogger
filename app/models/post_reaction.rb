class PostReaction < ApplicationRecord
  belongs_to :post
  belongs_to :user

  REACTION_KINDS = ['like', 'dislike'].freeze

  enum kind_of_reaction: REACTION_KINDS

  validates :kind_of_reaction, presence: true
end
