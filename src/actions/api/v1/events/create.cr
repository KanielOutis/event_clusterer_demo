class Api::V1::Events::Create < ApiAction
  post "/events" do
    event = SaveEvent.create!(params)

    SaveEventCluster.add_to_cluster(event)

    json EventSerializer.new(event)
  end
end