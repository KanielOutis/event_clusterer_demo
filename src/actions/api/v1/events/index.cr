class Api::V1::Events::Index < ApiAction
  before check_auth

  get "/events" do
    events = EventQuery.new

    json EventSerializer.for_collection(events), status: :ok
  end
end
