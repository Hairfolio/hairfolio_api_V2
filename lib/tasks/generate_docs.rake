namespace :generate do
  desc "TODO"
  task :docs => :environment do
    system('calamum -f api_docs.json -t twitter -p /opt/lampp/htdocs/Ruby-project/hairfolio_api_v2/public')
  end
end
