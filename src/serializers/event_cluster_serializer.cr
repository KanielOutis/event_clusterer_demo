class EventClusterSerializer < BaseSerializer

  def initialize(@event_cluster : EventCluster)
  end

  def render
    {uuid: @event_cluster.uuid, data: @event_cluster.data}
  end


  # def data
  #   Array(Hash(String, String)).from_json(@event_cluster.data.to_json).to_json
  # end
end