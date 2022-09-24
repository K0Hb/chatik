class ActualChannel < ApplicationCable::Channel
  def unsubscribed
    current_user.update_attribute(:online, false)
  end

  def subscribed
    stream_from 'actual_channel'

    current_user.update_attribute(:online, true)
    ActionCable.server.broadcast 'actual_channel', users: User.online.as_json
  end
end
