class UserChannel < ApplicationCable::Channel
  def subscribe(data)
    #stream_from "user_channel"
    stream_from "users:#{data['user_id'].to_i}:messages"
    #user = User.find(params[:id])
    #stream_for user
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak
    Message.create! content: data['content'], user_id: data['user_id'], author_id: data['author_id'], status: "new"
  end
end
