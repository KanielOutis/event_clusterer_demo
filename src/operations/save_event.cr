class SaveEvent < Event::SaveOperation
  # To save user provided params to the database, you must permit them
  # https://luckyframework.org/guides/database/validating-saving#perma-permitting-columns
  #
  permit_columns camera_uuid, event_type, detected_time, webhook_send_time, company_uuid, snapshot_url, \
                 extra
end
