require 'aws-sdk-s3'
namespace :db do
  
  config = Rails.configuration.database_configuration[Rails.env]
  
  desc "Backs-up the database to S3"
  task :backup do
    BackupService.call
  end
  
  desc "Restores the database from S3"
  task :restore, [:dump_date] do |task, args|
    puts "Restoring the data.."
    #FileUtils.cp "#{dump_path}",config['database']
    s3 = Aws::S3::Client.new(
      region: ENV['S3_REGION'],
      access_key_id: ENV['S3_ACCESS_KEY_ID'],
      secret_access_key: ENV['S3_SECRET_ACCESS_KEY'],
      endpoint: ENV['S3_ENDPOINT']
    )

    #s3.list_objects(bucket:ENV['S3_BUCKET'], prefix: 'villa-helena-backups').each do |response|
    #  puts response.contents
    #end
  
    File.open(config['database'], 'wb') do |file|
      reap = s3.get_object({ bucket: ENV['S3_BUCKET'], key: "villa-helena-backups/dump-#{args[:dump_date]}.sqlite3" }, target: file)
    end
    puts "Data restored"
  end
  
  def dump_path
    Rails.root.join("db/dump-#{Time.now.strftime("%m-%d-%Y")}.sqllite3").to_path
  end

end