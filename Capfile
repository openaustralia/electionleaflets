load 'deploy' if respond_to?(:namespace) # cap2 differentiator
Dir['vendor/plugins/*/recipes/*.rb'].each { |plugin| load(plugin) }

set :application, "electionleaflets.org.au"
set :repository,  "git://github.com/openaustralia/electionleaflets.git"

role :web, "kedumba.openaustraliafoundation.org.au"

set :use_sudo, false
set :user, "deploy"
set :scm, :git
set :stage, "test" unless exists? :stage

if stage == "production"
  set :deploy_to, "/srv/www/www.#{application}"
elsif stage == "test"
  set :deploy_to, "/srv/www/test.#{application}"
  set :branch, "test"
end

namespace :deploy do
  desc "Restart doesn't do anything"
  task :restart do ; end
  
  desc "Once the deploy is symlinked, we link additional config"
  before "deploy:symlink" do
    links = {
            "#{release_path}/config/general.php"         => "#{shared_path}/config/general.php",
            "#{release_path}/data"                       => "#{shared_path}/data",
            "#{release_path}/djangoleaflets/settings.py" => "#{shared_path}/djangoleaflets/settings.py"
    }

    # "ln -sf <a> <b>" creates a symbolic link but deletes <b> if it already exists
    run links.map {|a| "ln -sf #{a.last} #{a.first}"}.join(";")
  end
end
