load 'deploy' if respond_to?(:namespace) # cap2 differentiator
Dir['vendor/plugins/*/recipes/*.rb'].each { |plugin| load(plugin) }

set :application, "electionleaflets.org.au"
set :repository,  "git://github.com/openaustralia/electionleaflets.git"


set :use_sudo, false
set :user, "deploy"
set :scm, :git
set :stage, "test" unless exists? :stage

if stage == "production"
  role :web, "electionleaflets.org.au"
  set :deploy_to, "/srv/www/production"
elsif stage == "test"
  role :web, "electionleaflets.org.au"
  set :deploy_to, "/srv/www/staging"
  set :branch, "test"
  set :dbname, "el-staging"
elsif stage == "development"
  role :web, "electionleaflets.org.au.test"
  set :deploy_to, "/srv/www/production"
  set :normalize_asset_timestamps, false
end

set :dbname, "el-production" unless exists? :dbname

after 'deploy:update_code', 'deploy:symlink_configuration'

namespace :deploy do
  desc "Restart doesn't do anything"
  task :restart do ; end

  desc "Link additional configuration"
  task :symlink_configuration do
    links = {
            "#{release_path}/config/general.php"         => "#{shared_path}/config/general.php",
            "#{release_path}/data"                       => "#{shared_path}/data",
            "#{release_path}/djangoleaflets/settings.py" => "#{shared_path}/djangoleaflets/settings.py",
            "/home/deploy/.my.cnf"                       => "#{shared_path}/config/my.cnf",
    }

    # "ln -sf <a> <b>" creates a symbolic link but deletes <b> if it already exists
    run links.map {|a| "ln -sf #{a.last} #{a.first}"}.join(";")

  end

  desc "Setup database schema - CAUTION THIS WILL DELETE DATA"
  task :setup_db do
    run "cat #{current_path}/schema/electionleaflets.sql | mysql #{dbname}"
    run "cat #{current_path}/schema/australian_postcodes.sql | mysql #{dbname}"
  end
end
