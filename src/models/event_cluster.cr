class EventCluster < BaseModel
  table do
    column uuid : UUID?
    column data : JSON::Any?
    column camera_uuid : String?
    column company_uuid : String?
  end
end
