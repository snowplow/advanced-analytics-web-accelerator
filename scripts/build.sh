#!/bin/bash
echo "Bash script to deploy hugo website to github"
echo "Setting Local Variables..."
export TITLE="Advanced Analytics for Web"
export DESCRIPTION="Tutorial for setting up advanced analytics on a website"
export BASE_URL="https://docs.snowplow.io/advanced-analytics-web-accelerator/"
export AUTHOR="Agnes Kiss and Jack Keene" 
export LANDING_PAGE_URL="/advanced-analytics-web-accelerator/en/introduction"

echo "Importing themes..."
mkdir main
mkdir main/themes
cp -R content main/
cp -R accelerator-web-ui-template/themes/hugo-theme-learn main/themes/
cp -R accelerator-web-ui-template/layouts main/
cp -R accelerator-web-ui-template/static main/
cp -R accelerator-web-ui-template/config.toml main/
cd main
sed  "s|ACCELERATOR_TITLE|$TITLE|g" config.toml | sponge config.toml
sed  "s|ACCELERATOR_DESCRIPTION|$DESCRIPTION|g" config.toml | sponge config.toml
sed "s|ACCELERATOR_BASE_URL|$BASE_URL|g" config.toml | sponge config.toml
sed "s|ACCELERATOR_AUTHOR|$AUTHOR|g" config.toml | sponge config.toml
sed  "s|ACCELERATOR_LANDING_PAGE_URL|$LANDING_PAGE_URL|g" config.toml | sponge config.toml
echo "Creating Hugo site..."
hugo
cp -R public ../
cd ..
rm -r main


