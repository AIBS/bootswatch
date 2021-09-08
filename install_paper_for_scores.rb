#!/usr/bin/env ruby

# Use this script to move the compiled bootstrap.css file into the SCORES applications, excluding Solicitations.
#
# To install Bootswatch for making the required local changes...
# 1. brew install npm # https://bootswatch.com/3/help/
# 2. npm install -g grunt-cli # https://gruntjs.com/getting-started#installing-the-cli
# 3. npm install # From within your bootswatch repository
# 4. grunt swatch:paper # The theme we use is paper
#
# You can use these commands to verify file changes...
# diff variables.less ../../bootswatch_170122/paper/variables.less # Example
# sha1sum ./paper/bootstrap.css # Example, gives file hash
#
# IMPORTANT
# To compare changes made here for future upgrades, diff the variables.less and bootswatch.less files here with originals from https://bootswatch.com/3/

require 'fileutils'

def timestamp
  Time.now.strftime('%y%m%d-%H%M%S')
end

source = "./paper/bootstrap.css"
destinations = [
  # '../scores_projects/app/assets/stylesheets/bootstrap.css.scss',
  # '../scores_reviews/app/assets/stylesheets/bootstrap.css.scss',
  # '../scores_contracts/app/assets/stylesheets/bootstrap.css.scss',
  '../scores_a11y_documents/a11y_assets/bootstrap.scss'
]

destinations.each do |f|
  FileUtils.mv f, "#{f}-#{timestamp}"
  FileUtils.cp source, f
  puts "\"#{f}\" was archived & current paper boostrap installed"
end
