include_attribute "conda"
include_attribute "kagent"
include_attribute "ndb"
include_attribute "hadoop_spark"
include_attribute "flink"
include_attribute "elastic"
include_attribute "zeppelin"
include_attribute "glassfish"
include_attribute "kkafka"
include_attribute "kzookeeper"
include_attribute "drelephant"
include_attribute "dela"
include_attribute "hive2"
include_attribute "hops"

default['hopsworks']['version']                  = node['install']['version']
default['hopsworks']['current_version']          = node['install']['current_version']

# Flyway needs to know the previous versions of Hopsworks to generate the .sql files.
# comma-separated string of previous versions hopsworks (not including the current version)
# E.g., "0.1.1, 0.1.2"
default['hopsworks']['versions']                 = node['install']['versions']

default['glassfish']['variant']                  = "payara"
default['hopsworks']['user']                     = node['install']['user'].empty? ? "glassfish" : node['install']['user']
default['glassfish']['user']                     = node['hopsworks']['user']
default['hopsworks']['group']                    = node['install']['user'].empty? ? "glassfish" : node['install']['user']
default['glassfish']['group']                    = node['hopsworks']['group']
default['hopsworks']['admin']['port']            = 4848
default['hopsworks']['port']                     = "8080"
default['hopsworks']['secure_port']              = "8181"
default['glassfish']['admin']['port']            = node['hopsworks']['admin']['port']
default['glassfish']['port']                     = node['hopsworks']['port'].to_i
default['glassfish']['version']                  = '4.1.2.174'  # '5.182'

default['hopsworks']['dir']                      = node['install']['dir'].empty? ? "/usr/local" : node['install']['dir']
default['glassfish']['install_dir']              = node['hopsworks']['dir']
default['glassfish']['base_dir']                 = node['glassfish']['install_dir'] + "/glassfish"
default['hopsworks']['domains_dir']              = node['install']['dir'].empty? ? node['hopsworks']['dir'] + "/domains" : node['install']['dir'] + "/domains"
default['hopsworks']['domain_name']              = "domain1"
default['glassfish']['domains_dir']              = node['hopsworks']['domains_dir']

default['hopsworks']['staging_dir']              = node['hopsworks']['dir'] + "/staging"

default['hopsworks']['jupyter_dir']              = node['hopsworks']['dir'] + "/jupyter"

default['hopsworks']['max_mem']                  = "3000"
default['glassfish']['max_mem']                  = node['hopsworks']['max_mem'].to_i
default['hopsworks']['min_mem']                  = "1024"
default['glassfish']['min_mem']                  = node['hopsworks']['min_mem'].to_i
default['hopsworks']['max_stack_size']           = "4000"
default['glassfish']['max_stack_size']           = node['hopsworks']['max_stack_size'].to_i
default['hopsworks']['max_perm_size']            = "1500"
default['glassfish']['max_perm_size']            = node['hopsworks']['max_perm_size'].to_i
default['hopsworks']['max_stack_size']           = "1500"
default['glassfish']['max_stack_size']           = node['hopsworks']['max_stack_size'].to_i
default['hopsworks']['http_logs']['enabled']     = "true"
default['hopsworks']['env_var_file']             = "#{node['hopsworks']['domains_dir']}/#{node['hopsworks']['domain_name']}_environment_variables"

default['glassfish']['package_url']              = node['download_url'] + "/payara-#{node['glassfish']['version']}.zip"
default['hopsworks']['cauth_version']            = "otp-auth-0.3.0.jar"
default['hopsworks']['cauth_url']                = "#{node['download_url']}/#{node['hopsworks']['cauth_version']}"

default['hopsworks']['war_url']                  = "#{node['download_url']}/hopsworks/#{node['hopsworks']['version']}/hopsworks-web.war"
default['hopsworks']['ca_url']                   = "#{node['download_url']}/hopsworks/#{node['hopsworks']['version']}/hopsworks-ca.war"
default['hopsworks']['ear_url']                  = "#{node['download_url']}/hopsworks/#{node['hopsworks']['version']}/hopsworks-ear.ear"

default['hopsworks']['pixiedust']['enabled']        = "false"

default['hopsworks']['admin']['user']               = "adminuser"
default['hopsworks']['admin']['password']           = "adminpw"
default['hopsworks']['twofactor_auth']              = "false"
default['hopsworks']['twofactor_exclude_groups']    = "AGENT;CLUSTER_AGENT" #semicolon separated list of roles
default['hopsworks']['blacklist_users']             = "devices@hops.io" #comma-separated list of users that are not allowed to login


default['hopsworks']['service_key_rotation_enabled'] = "false"
## Suffix can be: (defaults to minutes if omitted)
## ms: milliseconds
## s: seconds
## m: minutes (default)
## h: hours
## d: days
default['hopsworks']['cert_mater_delay']         = "3m"
default['hopsworks']['service_key_rotation_interval'] = "2d"
default['hopsworks']['application_certificate_validity_period'] = "3d"

#Time in milliseconds to wait after a TensorBoard is requested before considering it old (and should be killed)
default['hopsworks']['tensorboard_max_last_accessed'] = "1140000"

#Max number of bytes of logs to show in Spark UI
default['hopsworks']['spark_ui_logs_offset'] = "512000"
#Log level of REST API
default['hopsworks']['hopsworks_rest_log_level'] = "PROD"

default['hopsworks']['mysql_connector_url']         = "#{node['download_url']}/mysql-connector-java-5.1.29-bin.jar"

default['hopsworks']['cert']['cn']                  = "sics.se"
default['hopsworks']['cert']['o']                   = "swedish ict"
default['hopsworks']['cert']['ou']                  = "sics"
default['hopsworks']['cert']['l']                   = "kista"
default['hopsworks']['cert']['s']                   = "stockholm"
default['hopsworks']['cert']['c']                   = "se"

default['hopsworks']['cert']['password']            = "changeit"
default['hopsworks']['master']['password']          = "adminpw"



default['hopsworks']['cert']['user_cert_valid_days'] = "12"

default['hopsworks']['public_ips']                  = ['10.0.2.15']
default['hopsworks']['private_ips']                 = ['10.0.2.15']
#default['hopsworks']['http_secure_enabled']         = "1"

default['kagent']['enabled']                     = "false"

default['hopsworks']['smtp']                     = node['smtp']['host']
default['hopsworks']['smtp_port']                = node['smtp']['port']
default['hopsworks']['smtp_ssl_port']            = node['smtp']['ssl_port']
default['hopsworks']['email']                    = node['smtp']['email']
default['hopsworks']['email_password']           = node['smtp']['email_password']

default['hopsworks']['alert_email_addrs']        = ""

default['hopsworks']['support_email_addr']       = "support@hops.io"

# #quotas
default['hopsworks']['yarn_default_quota_mins']          = "1000000"
default['hopsworks']['hdfs_default_quota_mbs']           = "500000"
default['hopsworks']['hive_default_quota_mbs']           = "250000"
default['hopsworks']['featurestore_default_quota_mbs']   = "250000"
default['hopsworks']['max_num_proj_per_user']            = "10"

# file preview and download
default['hopsworks']['file_preview_image_size']  = "10000000"
default['hopsworks']['file_preview_txt_size']    = "100"
default['hopsworks']['download_allowed']         = "true"

default['hops']['user_envs']                     = "false"

default['hopsworks']['systemd']                  = "true"


default['hopsworks']['kafka_num_replicas']       = "1"
default['hopsworks']['kafka_num_partitions']     = "1"

default['glassfish']['ciphersuite']				= "+TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256,+TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256,+TLS_RSA_WITH_AES_128_CBC_SHA256,+TLS_ECDH_ECDSA_WITH_AES_128_CBC_SHA256,+TLS_ECDH_RSA_WITH_AES_128_CBC_SHA256,+TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA,+TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA,+TLS_RSA_WITH_AES_128_CBC_SHA,+TLS_ECDH_ECDSA_WITH_AES_128_CBC_SHA,+TLS_ECDH_RSA_WITH_AES_128_CBC_SHA,+TLS_ECDHE_ECDSA_WITH_3DES_EDE_CBC_SHA,+TLS_ECDHE_RSA_WITH_3DES_EDE_CBC_SHA,+TLS_ECDH_ECDSA_WITH_3DES_EDE_CBC_SHA,+TLS_ECDH_RSA_WITH_3DES_EDE_CBC_SHA"
default['hopsworks']['monitor_max_status_poll_try'] = "5"

default['hopsworks']['org_name']                       = "hopsworks"
default['hopsworks']['org_domain']                     = "www.hops.io"
default['hopsworks']['org_email']                      = "user@hops.site"
default['hopsworks']['org_country_code']               = "SE"
default['hopsworks']['org_city']                       = "Stockholm"

default['hopsworks']['recovery_path']            = "hopsworks-api/api/auth/recover"
default['hopsworks']['verification_path']        = "hopsworks-api/api/auth/verify"
# Master encryption password
default['hopsworks']['encryption_password']      = "adminpw"

#
# Dela  - please do not change without consulting dela code
#
default['hopsworks']['public_https_port']              = node['hopsworks']['secure_port']
default['hopsworks']['dela']['enabled']                = "false"
default['hopsworks']['dela']['public_hopsworks_port']  = node['hopsworks']['port']
default['hopsworks']['dela']['cluster_http_port']      = 42000 #TODO - fix to read from dela recipe
# Dela - hopssite settings
default['hopsworks']['hopssite']['version']            = "none" # default for {hops, bbc5}
if(node['hopsworks']['hopssite']['version'].eql? "none")
  default['hopsworks']['dela']['enabled']              = "false"
  default['hopsworks']['dela']['client']               = "FULL_CLIENT"
  default['hopsworks']['hopssite']['domain']           = "hops.site"
  default['hopsworks']['hopssite']['port']             = 51081
  default['hopsworks']['hopssite']['register_port']    = 443
  default['hopssite']['url']                           = "https://"+ node['hopsworks']['hopssite']['domain'] + ":" + node['hopsworks']['hopssite']['register_port'].to_s
end
if(node['hopsworks']['hopssite']['version'].eql? "hops")
  default['hopsworks']['dela']['enabled']              = "true"
  default['hopsworks']['dela']['client']               = "FULL_CLIENT"
  default['hopsworks']['hopssite']['domain']           = "hops.site"
  default['hopsworks']['hopssite']['port']             = 51081
  default['hopsworks']['hopssite']['register_port']    = 443
  default['hopssite']['url']                           = "https://"+ node['hopsworks']['hopssite']['domain'] + ":" + node['hopsworks']['hopssite']['register_port'].to_s
end
if(node['hopsworks']['hopssite']['version'].eql? "hops-demo")
  default['hopsworks']['dela']['enabled']              = "true"
  default['hopsworks']['dela']['client']               = "BASE_CLIENT"
  default['hopsworks']['hopssite']['domain']           = "hops.site"
  default['hopsworks']['hopssite']['port']             = 51081
  default['hopsworks']['hopssite']['register_port']    = 443
  default['hopssite']['url']                           = "https://"+ node['hopsworks']['hopssite']['domain'] + ":" + node['hopsworks']['hopssite']['register_port'].to_s
end
if(node['hopsworks']['hopssite']['version'].eql? "bbc5")
  default['hopsworks']['dela']['enabled']              = "true"
  default['hopsworks']['dela']['client']               = "BASE_CLIENT"
  default['hopsworks']['hopssite']['domain']           = "bbc5.sics.se"
  default['hopsworks']['hopssite']['port']             = 43080
  default['hopsworks']['hopssite']['register_port']    = 8080
  default['hopssite']['url']                           = "http://"+ node['hopsworks']['hopssite']['domain'] + ":" + node['hopsworks']['hopssite']['register_port'].to_s
end
default['hopsworks']['hopssite']['base_uri']  = "https://" + node['hopsworks']['hopssite']['domain'] + ":" + node['hopsworks']['hopssite']['port'].to_s  + "/hops-site/api"
default['hopsworks']['hopssite']['heartbeat']          = "600000"
#
# hops.site settings for cert signing
#
default['hopssite']['download_url']                    = "#{node['download_url']}/hopssite/hops-site.war"
default['hopssite']['manual_register']                 = "false"
default['hopssite']['dela']['version']                 = "0.1.0"
default['hopssite']['dir']                             = node['install']['dir'].empty? ? "/usr/local" : node['install']['dir']
default['hopssite']['home']                            = node['hopssite']['dir'] + "/hopssite"
default['hopssite']['user']                            = node['hopsworks']['email']
default['hopssite']['password']                        = "admin"
default['hopssite']['base_dir']                        = node['hopsworks']['domains_dir'] + "/" + node['hopsworks']['domain_name']
default['hopssite']['certs_dir']                       = "#{node['hopsworks']['dir']}/certs-dir/hops-site-certs"
default['hopssite']['keystore_dir']                    = "#{node['hopssite']['certs_dir']}/keystores"
default['hopssite']['retry_interval']                  = 60
default['hopssite']['max_retries']                     = 5
default['hopssite']['admin']['password']               = "adminpw"
#
# Hopssite cert
#
default['hopssite']['cert']['email']                   = node['hopssite']['user']
default['hopssite']['cert']['o']                       = node['hopssite']['cert']['email'].split("@")[0]
default['hopssite']['cert']['ou']                      = node['hopssite']['cert']['email'].split("@")[1]
default['hopssite']['cert']['cn']                      = node['hopssite']['cert']['o'] + "_" + node['hopssite']['cert']['ou']
default['hopssite']['cert']['l']                       = node['hopsworks']['cert']['l']
default['hopssite']['cert']['s']                       = node['hopsworks']['cert']['s']
default['hopssite']['cert']['c']                       = node['hopsworks']['cert']['c']
# Dela end

default['hopsworks']['max_gpu_request_size']           = 1
default['hopsworks']['max_cpu_request_size']           = 1

default['hopsworks']['anaconda_enabled']               = "true"

# Comma separated list of IPs on which you should not enable conda.
default['hopsworks']['nonconda_hosts']               = ""

#
# Jupyter
#
default['jupyter']['base_dir']                         = node['install']['dir'].empty? ? node['hopsworks']['dir'] + "/jupyter" : node['install']['dir'] + "/jupyter"
default['jupyter']['user']                             = node['install']['user'].empty? ? "jupyter" : node['install']['user']
default['jupyter']['group']                            = node['install']['user'].empty? ? "jupyter" : node['install']['user']
default['jupyter']['python']                           = "true"

#
# TensorFlow Serving
#
default['tfserving']['base_dir']                       = node['install']['dir'].empty? ? node['hopsworks']['dir'] + "/staging" : node['install']['dir'] + "/staging"
default['tfserving']['user']                           = node['install']['user'].empty? ? "tfserving" : node['install']['user']
default['tfserving']['group']                          = node['install']['user'].empty? ? "tfserving" : node['install']['user']
default['tfserving']['pool_size']                      = "40"
default['tfserving']['max_route_connections']          = "10"

#
# PyPi
#
default['hopsworks']['pypi_rest_endpoint']             = "https://pypi.org/pypi/{package}/json"

# Livy
default['hopsworks']['livy_zeppelin_session_timeout']  = "3600"

# Zeppelin
default['hopsworks']['zeppelin_interpreters']  = "org.apache.zeppelin.hopshive.HopsHiveInterpreter"


#
# Database upgrades
#
# "https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/5.0.3/flyway-commandline-5.0.3-linux-x64.tar.gz"
default['hopsworks']['flyway']['version']              = "5.0.3"
default['hopsworks']['flyway_url']                     = node['download_url'] + "/flyway-commandline-#{node['hopsworks']['flyway']['version']}-linux-x64.tar.gz"


#
#
# Virtualbox Image support
#

default["lightdm"]["service_name"] = "lightdm"
default["lightdm"]["sysconfig_file"] = "/etc/sysconfig/displaymanager"
default["lightdm"]["users_file"] = "/etc/lightdm/users.conf"
default["lightdm"]["keys_file"] = "/etc/lightdm/keys.conf"
default["lightdm"]["config_file"] = "/etc/lightdm/lightdm.conf"
default["lightdm"]["minimum_uid"] = 1000
default["lightdm"]["hidden_users"] = %w(nobody)
default["lightdm"]["hidden_shells"] = %w(/bin/false /sbin/nologin)
default["lightdm"]["keyrings"] = {}

#
# LDAP
#
default['ldap']['enabled']                           = "false"
default['ldap']['group_mapping']                     = ""
default['ldap']['user_id']                           = "uid"
default['ldap']['user_givenName']                    = "givenName"
default['ldap']['user_surname']                      = "sn"
default['ldap']['user_email']                        = "mail"
default['ldap']['user_search_filter']                = "uid=%s"
default['ldap']['group_search_filter']               = "member=%d"
default['ldap']['attr_binary']                       = "java.naming.ldap.attributes.binary"
default['ldap']['group_target']                      = "cn"
default['ldap']['dyn_group_target']                  = "memberOf"
default['ldap']['user_dn']                           = ""
default['ldap']['group_dn']                          = ""
default['ldap']['account_status']                    = 4

#LDAP External JNDI Resource
default['ldap']['provider_url']                      = ""
default['ldap']['jndilookupname']                    = ""
default['ldap']['attr_binary_val']                   = "entryUUID"
default['ldap']['security_auth']                     = "none"
default['ldap']['security_principal']                = ""
default['ldap']['security_credentials']              = ""
default['ldap']['referral']                          = "follow"
default['ldap']['additional_props']                  = ""

default['dtrx']['version']                           = "dtrx-7.1.tar.gz"
default['rstudio']['deb']                            = "rstudio-server-1.1.447-amd64.deb"
default['rstudio']['rpm']                            = "rstudio-server-rhel-1.1.447-x86_64.rpm"
default['rstudio']['enabled']                        = "false"

default['hopsworks']['kafka_max_num_topics']                   = '100'

#
# JWT
#

default['hopsworks']['jwt']['signature_algorithm']   = 'HS512'
default['hopsworks']['jwt']['lifetime_ms']           = '1800000'
default['hopsworks']['jwt']['exp_leeway_sec']        = '900'
default['hopsworks']['jwt']['signing_key_name']      = 'apiKey'
default['hopsworks']['jwt']['issuer']                = 'hopsworks@logicalclocks.com'

#
# EXPAT
#
 
default['hopsworks']['expat_url']                    = "#{node['download_url']}/expat/#{node['install']['version']}/expat-#{node['install']['version']}.tar.gz"
default['hopsworks']['expat_dir']                    = "#{node['install']['dir']}/expat-#{node['install']['version']}"

#
# Feature Store
#
default['hopsworks']['featurestore_default_storage_format']   = "ORC"
