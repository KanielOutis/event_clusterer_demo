class CreateEventClusters::V20210415082332 < Avram::Migrator::Migration::V1
  def migrate
    # Learn about migrations at: https://luckyframework.org/guides/database/migrations
    create table_for(EventCluster) do
      primary_key id : Int64
      add_timestamps
      add uuid : UUID?
      add data : JSON::Any?
      add camera_uuid : String?
      add company_uuid : String?
    end

    alter table_for(Event) do
      execute("ALTER TABLE event_clusters ALTER COLUMN uuid SET DEFAULT gen_random_uuid();")
    end
  end

  def rollback
    drop table_for(EventCluster)
  end
end
