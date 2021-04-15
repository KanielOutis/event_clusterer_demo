class Event < BaseModel
  table do
    column uuid : UUID?
    column camera_uuid : String?
    column event_type : String?
    column extra : JSON::Any?
    column snapshot_url : String?
    column company_uuid : String?
    column webhook_send_time : String?
    column detected_time : String?
  end
end
