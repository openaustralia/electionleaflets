# Test/Staging stage configuration
server "electionleaflets.org.au", user: "deploy", roles: %w{web}

set :deploy_to, "/srv/www/staging"
set :dbname, "el-staging"
set :branch, "test"
