<?php
namespace Deployer;

require 'recipe/yii2-app-basic.php';

// Project name
set('application', 'asantehene.nl');

// Project repository
set('repository', 'git@github.com:pinuno-com-gh/asantehene.nl.git');

// [Optional] Allocate tty for git clone. Default value is false.
set('git_tty', true); 

// Shared files/dirs between deploys 
add('shared_files', [
	'config/db.php',
	'config/params.php',
	'web/index.php',
	'yii',
]);
add('shared_dirs', []);

// Writable dirs by web server 
add('writable_dirs', []);


// Hosts

host('asantehene.nl')   
    ->stage('prod')
    ->set('deploy_path', '/opt/sites');    
    
// Tasks

task('build', function () {
    run('cd {{release_path}} && build');
});

// [Optional] if deploy fails automatically unlock.
after('deploy:failed', 'deploy:unlock');

