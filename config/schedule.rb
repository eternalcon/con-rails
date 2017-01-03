# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron
set :production_dump_file, "/tmp/production_dump_daily.sql.gz"
#set :remote_dump_file, "dumper@app.mydomain.com:/tmp/production_dump_daily.sql.gz"
set :staging_dump_file, "/tmp/production_dump_daily.sql.gz"

if environment == "production" || environment == "staging"
  # normal crons goes here
end

if environment == "production"
  # Export daily dump
  every :day, at: "12:00am" do
    command "cd #{path} && #{environment_variable}=#{environment} FILE=#{production_dump_file} bin/rake dump:export"
  end
end

if environment == "staging"
  # Import daily dump
  every :day, at: "12:30am" do
    command "cd #{path} && #{environment_variable}=#{environment} FILE=#{staging_dump_file} bin/rake dump:retrieve dump:barrier maintenance:enable db:drop db:create dump:import db:migrate maintenance:restart maintenance:disable"
  end
end

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
