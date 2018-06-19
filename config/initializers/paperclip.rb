Paperclip::UriAdapter.register
# Paperclip::DataUriAdapter.register
if Rails.env.test?
  if ENV['PARALLEL_TEST_GROUPS']
    Paperclip::Attachment.default_options[:path] = ":rails_root/spec/fixtures/paperclip/:rails_env/#{ENV['TEST_ENV_NUMBER'].to_i}/:class/:attachment/:id_partition/:filename"
  else
    Paperclip::Attachment.default_options[:path] = ":rails_root/spec/fixtures/paperclip/:rails_env/:class/:attachment/:id_partition/:filename"
  end
else
  Paperclip::Attachment.default_options[:storage] = :s3
  Paperclip::Attachment.default_options[:s3_host_name] = "s3-#{ENV['BUCKETEER_AWS_REGION']}.amazonaws.com"
  Paperclip::Attachment.default_options[:s3_protocol] = :https
  Paperclip::Attachment.default_options[:s3_region] = ENV.fetch("BUCKETEER_AWS_REGION", "eu-west-1")
  Paperclip::Attachment.default_options[:s3_credentials] = {
    bucket: ENV.fetch('BUCKETEER_BUCKET_NAME'),
    access_key_id: ENV.fetch('BUCKETEER_AWS_ACCESS_KEY_ID'),
    secret_access_key: ENV.fetch('BUCKETEER_AWS_SECRET_ACCESS_KEY')
  }

  if ENV["AWS_CLOUDFRONT_HOST"].present?
    Paperclip::Attachment.default_options[:path] = ":class/:attachment/:id_partition/:style/:filename"
    Paperclip::Attachment.default_options[:url] = ":s3_alias_url"
    Paperclip::Attachment.default_options[:s3_host_alias] = ENV["AWS_CLOUDFRONT_HOST"]
  end
end
