require 'aws-sdk-s3'

class BackupService
  def self.call
    config = Rails.configuration.database_configuration[Rails.env]

    puts "Backing up data.."
    FileUtils.cp config['database'],"#{dump_path}"
    puts "Data has been backed up at #{dump_path}"

    s3 = Aws::S3::Resource.new(
      region: ENV['S3_REGION'],
      access_key_id: ENV['S3_ACCESS_KEY_ID'],
      secret_access_key: ENV['S3_SECRET_ACCESS_KEY'],
      endpoint: ENV['S3_ENDPOINT']
    )
    name = File.basename(dump_path)
    obj = s3.bucket(ENV['S3_BUCKET']).object("villa-helena-backups/#{name}")
    obj.upload_file(dump_path)
    FileUtils.rm dump_path

    puts "Back-up complete"
  end

  private

  def self.dump_path
    Rails.root.join("db/dump-#{Time.now.strftime("%m-%d-%Y")}.sqlite3").to_path
  end
end