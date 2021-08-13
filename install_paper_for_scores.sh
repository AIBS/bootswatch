#! /bin/bash

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

timestamp() {
  date +"%y%m%d-%H%M%S";
}

# Update this array to control which applications are updated
apps_to_update=("scores_contracts" "scores_projects" "scores_reviews") # All applications
# apps_to_update=("scores_projects") # N applications

for app in "${apps_to_update[@]}"; do
  mv "../$app/app/assets/stylesheets/bootstrap.css.scss" "../$app/app/assets/stylesheets/bootstrap.css.scss-$(timestamp)"
  cp "./paper/bootstrap.css" "../$app/app/assets/stylesheets/bootstrap.css.scss"
  echo "$app bootstrap.css.scss backed up, current build installed";
done
