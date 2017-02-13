class Message < ApplicationRecord
  belongs_to :user
  belongs_to :author, class_name: "User"

  after_create_commit { MessageBroadcastJob.perform_later self }
end
