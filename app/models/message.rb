require 'carrierwave/orm/activerecord'

class Message < ApplicationRecord
  mount_uploader :file, FileUploader

  belongs_to :user
  belongs_to :author, class_name: "User"

  after_create_commit { MessageBroadcastJob.perform_later self }
end
