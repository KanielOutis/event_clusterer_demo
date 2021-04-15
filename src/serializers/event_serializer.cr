class EventSerializer < BaseSerializer
  def initialize(@event : Event)
  end

  def render
    {
      snapshot_url: @event.snapshot_url, 
      uuid: @event.uuid,
      camera_uuid: @event.camera_uuid,
      company_uuid: @event.company_uuid,
      detected_time: @event.detected_time,
      webhook_send_time: @event.webhook_send_time,
      extra: @event.extra,
      event_type: @event.event_type
    }
  end
end