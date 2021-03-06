#!/bin/bash

set -u
set -o errexit

PWD="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$PWD/install/set_mc_root_dir.inc.sh"

cd "$MC_ROOT_DIR"

if [ `getconf LONG_BIT` != '64' ]; then
   echo "Install failed, you must have a 64 bit OS."
   exit 1
fi

if [ ! -f mediawords.yml ]; then
    # Don't overrride the existing configuration (if any)
    cp mediawords.yml.dist mediawords.yml
fi

./install/install_mediacloud_package_dependencies.sh
./install/install_python_dependencies.sh
./install/set_kernel_parameters.sh
./install/set_postgresql_parameters.sh
./install/install_mc_perlbrew_and_modules.sh

echo "install complete"
echo "creating new database"

# "create_default_db_user_and_databases.sh" uses configuration mediawords.yml
# so it needs a working Carton environment
sudo ./install/create_default_db_user_and_databases.sh
./script/run_with_carton.sh ./script/mediawords_create_db.pl

echo "creating new user 'jdoe@mediacloud.org' with password 'mediacloud'"
./script/run_with_carton.sh ./script/mediawords_manage_users.pl \
    --action=add \
    --email="jdoe@mediacloud.org" \
    --full_name="John Doe" \
    --notes="Media Cloud administrator" \
    --roles="admin" \
    --password="mediacloud"

echo "Setting up Git pre-commit hooks..."
./install/setup_git_precommit_hooks.sh

echo "Media Cloud install succeeded!!!!"
echo "See doc/ for more information on using Media Cloud"
echo "Run ./script/start_mediacloud_server.sh to start the Media Cloud server"
echo "(Log in with email address 'jdoe@mediacloud.org' and password 'mediacloud')"
