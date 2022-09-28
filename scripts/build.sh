#!/bin/bash
echo "Bash script to deploy hugo website to github"
echo "Setting Local Variables..."
TITLE="Advanced Analytics for Web"
DESCRIPTION="Tutorial for setting up advanced analytics on a website"
BASE_URL="https://deploy-preview-7--snowplow-axl-advanced-analytics-web.netlify.app/advanced-analytics-web-accelerator/"
AUTHOR="Agnes Kiss and Jack Keene" 
LANDING_PAGE_URL="/advanced-analytics-web-accelerator/en/introduction"
echo "Importing themes..."
mkdir main
mkdir main/themes
cp -R content main/
cp -R accelerator-web-ui-template/themes/hugo-theme-learn main/themes/
cp -R accelerator-web-ui-template/layouts main/
cp -R accelerator-web-ui-template/static main/
cp -R accelerator-web-ui-template/config.toml main/
cp -R accelerator-web-ui-template/netlify.toml main/
cd main
git submodule update --init --recursive
echo "Creating Hugo site..."
sed -i -e "s|ACCELERATOR_TITLE|$TITLE|g" config.toml
sed -i -e "s|ACCELERATOR_DESCRIPTION|$DESCRIPTION|g" config.toml
sed -i -e "s|ACCELERATOR_BASE_URL|$BASE_URL|g" config.toml
sed -i -e "s|ACCELERATOR_AUTHOR|$AUTHOR|g" config.toml
sed -i -e "s|ACCELERATOR_LANDING_PAGE_URL|$LANDING_PAGE_URL|g" config.toml
hugo
cp -R public ../
cd ..
rm -r main


