# config valid for current version and patch releases of Capistrano
lock "~> 3.19.2"

set :application, "electionleaflets.org.au"
set :repo_url, "https://github.com/openaustralia/electionleaflets.git"

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", 'config/master.key'

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "tmp/webpacker", "public/system", "vendor", "storage"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure

# Don't use sudo
set :use_sudo, false

# SSH user
set :user, "deploy"

# Linked files and directories
append :linked_files, "config/general.php", "djangoleaflets/settings.py"
append :linked_dirs, "data"

# Custom tasks
namespace :deploy do
  desc "Restart doesn't do anything"
  task :restart do
    # This is a PHP application, no restart needed
  end

  desc "Link additional configuration"
  task :symlink_configuration do
    on roles(:web) do
      execute :ln, "-sf", "/home/deploy/.my.cnf", "#{shared_path}/config/my.cnf"
    end
  end

  desc "Setup database schema - CAUTION THIS WILL DELETE DATA"
  task :setup_db do
    on roles(:web) do
      dbname = fetch(:dbname)
      execute :cat, "#{current_path}/schema/electionleaflets.sql", "|", :mysql, dbname
      execute :cat, "#{current_path}/schema/australian_postcodes.sql", "|", :mysql, dbname
    end
  end

  after :publishing, :symlink_configuration
end
