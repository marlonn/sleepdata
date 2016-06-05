namespace :db do

  desc "wipe table processed_data"
  task :wipe_proc_table => :environment do
    ProcessedDatum.delete_all
  end

end
