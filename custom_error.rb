class CustomError < StandardError
  attr_accessor :message

  def initialize(message = 'An error happened while getting the weather')
    @message = message
  end
end
