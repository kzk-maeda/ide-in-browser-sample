require('net/ssh')

class TerminalChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "terminal_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def terminal_operation(data)
    logger.info "terminal_operation is executed"
    logger.info data
    Net::SSH.start('localhost', 'term_user', password: 'passw0rd', port: 2222) do |ssh|
      output = ssh.exec!(data['command'])
      logger.info output
      ActionCable.server.broadcast "terminal_channel", message: output
    end
  end
end
