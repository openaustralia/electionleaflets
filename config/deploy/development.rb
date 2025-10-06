# Development stage configuration
server "electionleaflets.org.au.test", user: "deploy", roles: %w{web}

set :deploy_to, "/srv/www/production"
set :dbname, "el-production"
set :branch, "master"
