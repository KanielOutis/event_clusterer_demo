class SaveEventCluster < EventCluster::SaveOperation
  # To save user provided params to the database, you must permit them
  # https://luckyframework.org/guides/database/validating-saving#perma-permitting-columns
  #
  include JSON::Serializable
  permit_columns data, camera_uuid, company_uuid

  def self.add_to_cluster(event : Event)

    cluster = EventClusterQuery.new.camera_uuid(event.camera_uuid.not_nil!).first?

    unless cluster
      cluster = SaveEventCluster.create!(camera_uuid: event.camera_uuid)
      arr = Array(Hash(String, String)).from_json(%([]))
      arr << Hash(String, String).from_json(EventSerializer.new(event).to_json)
      SaveEventCluster.update!(cluster, data: JSON::Any.new(arr.to_json))
    end
    
    arr = Array(Hash(String, String)).from_json(cluster.data.to_s)
    arr << Hash(String, String).from_json(EventSerializer.new(event).to_json)
    print arr.to_json
    SaveEventCluster.update!(cluster, data: JSON::Any.new(arr.to_json))
  end
end
