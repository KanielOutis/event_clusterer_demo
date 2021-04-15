class Api::V1::EventClusters::Show < ApiAction
  before check_auth

  get "/event_clusters/:uuid" do
    event = EventClusterQuery.new.uuid(params.get(:uuid)).first

    arr = EventData.new(event.data)
  
    json SinglEventClusterSerializer.new(event, arr), status: :ok
  end
end