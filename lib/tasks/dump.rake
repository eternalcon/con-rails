require "erb"
require "yaml"

namespace :dump do
  desc "Fails if FILE doesn’t exists"
  task :barrier do
    file = ENV["FILE"]
    raise "Need a FILE" unless file

    File.exists?(file) or raise "No file found (path given by FILE)"
  end

  desc "Retrieve the dump file"
  task :retrieve do
    remote = ENV["REMOTE"]
    raise "Need a REMOTE file" unless remote
    file = ENV["FILE"]
    raise "Need a FILE" unless file

    # here you copy remote into file
    # via scp (prefered) or http GET
    do_whatever_is_needed or raise "Can’t retrieve #{remote}"
  end

  desc "Export the database"
  task :export do
    file = ENV["FILE"]
    raise "Need a FILE" unless file

    env = ENV["RAILS_ENV"]
    raise "Need a RAILS_ENV" unless env

    db_config = current_db_config(env)
    system "#{mysqldump(db_config)} | gzip -c > #{file}"
  end

  desc "Import a database"
  task :import => :barrier do
    file = ENV["FILE"]
    raise "Need a FILE" unless file

    env = ENV["RAILS_ENV"]
    raise "Need a RAILS_ENV" unless env
    raise "Import on production is forbidden" if env == "production"

    db_config = current_db_config(env)
    system "gzip -d -c #{file} | #{mysql(db_config)}"
  end

  def current_db_config(env)
    YAML::load(ERB.new(IO.read(File.join(File.dirname(__FILE__), "../../config/database.yml"))).result)[env]
  end

  def mysql(config)
    sql_cmd("mysql", config)
  end

  def mysqldump(config)
    sql_cmd("mysqldump", config) + " --add-drop-table --extended-insert=TRUE --disable-keys --complete-insert=FALSE --triggers=FALSE"
  end

  def sql_cmd(sql_command, config)
    "".tap do |cmd|
      cmd << sql_command
      cmd << " "
      cmd << "-u#{config["username"]} " if config["username"]
      cmd << "-p#{config["password"]} " if config["password"]
      cmd << "-h#{config["host"]} " if config["host"]
      cmd << "-P#{config["port"]} " if config["port"]
      cmd << "--default-character-set utf8 "
      cmd << config["database"] if config["database"]
    end
  end
end
