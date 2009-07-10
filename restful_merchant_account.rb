# A template used for the basis of a typical user authenticated app which would charge a monthly subscription fee.
# Caveats: Rspec, cucumber, active_merchant, restful_auth and subdomain_fu
run "echo TODO > README"
#adding gems for rspec, cucumber w/ webrat, will paginate and subdomain_fu
gem 'webrat'
gem 'carlosbrando-remarkable', :lib => 'remarkable', :source => 'http://gems.github.com'
gem 'thoughtbot-factory_girl', :lib => 'factory_girl', :source => 'http://gems.github.com'
gem 'rspec-rails', :lib => false
gem 'rspec', :lib => false
gem 'faker'
gem 'cucumber'
gem 'mislav-will_paginate', :lib => 'will_paginate', :source => 'http://gems.github.com'
gem 'mbleigh-subdomain-fu', :source => "http://gems.github.com", :lib => "subdomain-fu"
gem 'thoughtbot-clearance', :source => "http://gems.github.com", :lib => 'clearance'
rake "gems:install", :sudo => true

#plugins for active merchant and restful_auth.
plugin 'active_merchant', :git => 'git://github.com/Shopify/active_merchant.git'


#generator scripts used to run restful_auth
generate "rspec"
generate "clearance"
generate "clearance_features"
generate "cucumber"
generate "rspec_scaffold", "account", "sub_domain:string", "user_id:integer", "description:string", "site_name:string"
generate "rspec_controller", "site", "index", "about_us", "contact_us"

#delete any files not needed.
run "rm -Rf public/index.html"
#stick this all into a git repo
git :init

file ".gitignore", <<-END
.DS_Store
log/*.log
tmp/**/*
config/database.yml
db/*.sqlite3
END

run "touch tmp/.gitignore log/.gitignore vendor/.gitignore"

git :add => ".", :commit => "-m 'initial commit'"