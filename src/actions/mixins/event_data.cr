class EventData
  include JSON::Serializable

  def initialize(data : JSON::Any)
    @data = Array(Hash(String, String)).from_json(data.to_s)
  end

  def to_array()
    @data
  end
end  