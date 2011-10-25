$Config = YAML.load_file(RAILS_ROOT + '/config/config.yml').symbolize_keys
APP_CONFIG = $Config
