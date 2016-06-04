# usage: place schlaf.txt (containing data for the raw_data model) in sleepdata's
# root directory, then issue the command "rake db:import_schlafdaten"
# refactoring: replace regexp with substring selection for one character, e.g.
# if line[4] == "|"     -> run benchmark to test if it actually does something!

namespace :db do

  desc "import data from schlafdaten.txt"
  task :import_schlafdaten => :environment do
    Rake::Task['db:reset'].invoke
    File.open("schlaf.txt", "r").each_line do |line|
      if line[1,3] =~ /^\d{1}\D{1}\d/
        RawDatum.create!(:timestamp => line[3,19],
                         :status => line[23..-1])
      elsif line[1,4] =~ /^\d{2}\D{1}\d/
        RawDatum.create!(:timestamp => line[4,19],
                         :status => line[24..-1])
      elsif line[1,5] =~ /^\d{3}\D{1}\d/
        RawDatum.create!(:timestamp => line[5,19],
                         :status => line[25..-1])
      end
    end
  end

end
