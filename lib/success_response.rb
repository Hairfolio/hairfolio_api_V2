class SuccessResponse
  attr_accessor :data
  def initialize(data: [])
    @data = data
  end

  def success?
    true
  end
end