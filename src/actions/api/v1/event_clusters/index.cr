class Api::V1::EventClusters::Index < ApiAction
  before check_auth

  get "/event_clusters" do
    events = EventClusterQuery.new

    json EventClusterSerializer.for_collection(events)
  end
end