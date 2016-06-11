# used tyler rick's method:
# http://stackoverflow.com/questions/4235782/rails-3-library-not-loading-until-require

Dir[Rails.root + 'lib/monkeypatches/*.rb'].each do |file|
  require file
end
