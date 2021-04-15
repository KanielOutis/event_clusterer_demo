class SinglEventClusterSerializer < BaseSerializer

  def initialize(@event_cluster : EventCluster, @data : EventData)
    puts @data.to_array()
  end

  def render
    {uuid: @event_cluster.uuid, data: @data.to_array()}
  end


  # def data
  #   Array(Hash(String, String)).from_json(@event_cluster.data.to_json).to_json
  # end
end