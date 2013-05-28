require 'aws-sdk'
require 'bson'
require 'json'

AWS.config access_key_id: ENV['S3_ACCESS_ID'], secret_access_key: ENV['S3_SECRET_KEY']
s3 = AWS::S3.new
bucket = s3.buckets['zooniverse-demo']

subjects = File.open('manifest_wise.txt', 'w')

dir = '/home/edward/Downloads/wise'
image_sets = Dir["#{dir}/*.png"].group_by do |image|
  File.basename(image).scan(/^fc_([0-9\.]+)\+([0-9\.]+)_.*.png$/)[0]
end

image_sets.each do |coords, images|
  bson_id = BSON::ObjectId.new
  original_file_names = images.map {|i| File.basename(i)}
  surveys = images.map{|i| i.scan(/^.+_(.+).png$/)[0][0]}
  image_urls = surveys.map {|s| "http://zooniverse-demo.s3.amazonaws.com/wise/subjects/standard/#{bson_id}-#{s}.png"}
  images_hash = Hash[surveys.zip image_urls]
  images_hash['standard'] = image_urls.first

  subject = {
    _id: bson_id,
    location: images_hash,
    coords: coords,
    metadata: {
      files: original_file_names
    }
  }

  images.each do |i|
    content_type = `file --mime-type -b "#{i}"`.chomp
    filename = "wise/subjects/standard/#{bson_id}-#{i.scan(/^.+_(.+).png$/)[0][0]}.png"
    bucket.objects[filename].write file: i, acl: :public_read, content_type: content_type 
  end

  subjects.puts(subject.to_json)
end

