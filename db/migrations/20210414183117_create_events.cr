class CreateEvents::V20210414183117 < Avram::Migrator::Migration::V1
  def migrate
    # Learn about migrations at: https://luckyframework.org/guides/database/migrations
    
  
    create table_for(Event) do
      primary_key id : Int64
      add uuid : UUID?
      add camera_uuid : String?
      add event_type : String?
      add detected_time : String?
      add webhook_send_time : String?
      add company_uuid : String?
      add snapshot_url : String?
      add extra : JSON::Any?
      add_timestamps
      
    end

    alter table_for(Event) do
      execute("ALTER TABLE events ALTER COLUMN uuid SET DEFAULT gen_random_uuid();")
    end
    enable_extension "pgcrypto"
    #execute("ALTER TABLE events ALTER COLUMN id SET DEFAULT gen_random_uuid();")

    
  end
  
  def rollback
    drop table_for(Event)
  end
end
