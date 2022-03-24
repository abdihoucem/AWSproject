#cloud-config
write_files:
  - content: |
     high_availability['mountpoint'] = ['/var/opt/gitlab/git-data','/var/opt/gitlab/.ssh','/var/opt/gitlab/gitlab-rails/uploads','/var/opt/gitlab/gitlab-rails/shared','/var/opt/gitlab/gitlab-ci/builds']
     external_url "${gitlab_url}"
     postgresql['enable'] = false
     redis['enable'] = false

     gitlab_rails['db_adapter'] = "postgresql"
     gitlab_rails['db_encoding'] = "unicode"
     gitlab_rails['db_database'] = "${postgresql_database}"
     gitlab_rails['db_username'] = "${postgresql_username}"
     gitlab_rails['db_password'] = "${postgresql_password}"
     gitlab_rails['db_host'] = "${postgresql_endpoint}"
     gitlab_rails['db_port'] = 5432
     gitlab_rails['auto_migrate'] = false

     gitlab_rails['redis_host'] = "${redis_endpoint}"
     gitlab_rails['redis_port'] = 6379

     user['uid'] = 9000
     user['gid'] = 9000
     web_server['uid'] = 9001
     web_server['gid'] = 9001
     registry['uid'] = 9002
     registry['gid'] = 9002

     gitlab-rails['monitoring_whitelist'] = ['${cidr}']
    path: /etc/gitlab/gitlab.rb
    permissions: '0600'
runcmd:
 - [gitlab-ctl,reconfigure]
output: {all: '| tee -a /var/log/devops-cloud-init-output.log'}

