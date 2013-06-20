require 'aws-sdk'
require 'bson'
require 'json'

AWS.config access_key_id: ENV['S3_ACCESS_ID'], secret_access_key: ENV['S3_SECRET_KEY']
s3 = AWS::S3.new
bucket = s3.buckets['zooniverse-demo']

subjects = File.open('manifest_wise.txt', 'a')
if ARGV[2]
  metadata = File.open(ARGV[2], 'r').map do |line|
    line.scan(/.*HIP\s([0-9]+)[a-z\s]*([-0-9]{0,3}\.[0-9]+)[a-z\s]*([-0-9]{0,3}\.[0-9]+)/)[0]
  end.reject { |i| i.nil? }
else 
  metadata = []
end

dir = ARGV[0]
image_sets = Dir["#{dir}/*.png"].group_by do |image|
  if ARGV[1] == 'hip'
    File.basename(image).scan(/^fc_HIP_([0-9]+).*\.png$/)[0][0]
  else
   File.basename(image).scan(/^fc_([0-9\.]+)\+([0-9\.]+)_.*.png$/)[0] 
  end
end

image_sets.each do |hip_id, images|
  bson_id = BSON::ObjectId.new
  original_file_names = images.map {|i| File.basename(i)}
  surveys = images.map{|i| i.scan(/^.+_(.+).png$/)[0][0]}
  image_urls = surveys.map {|s| "http://zooniverse-demo.s3.amazonaws.com/wise/subjects/standard/#{bson_id}-#{s}.png"}
  images_hash = Hash[surveys.zip image_urls]
  images_hash['standard'] = image_urls.first

  if metadata.empty?
    coords = hip_id
  else
    coords = metadata.select{|m| m[0] == hip_id}[0].drop(1)
  end

  subject = {
    _id: bson_id,
    location: images_hash,
    coords: coords,
    metadata: {
      files: original_file_names,
      image_bands: surveys,
      hip_id: if hip_id.kind_of? Array then nil else hip_id end
    }
  }

  images.each do |i|
    content_type = `file --mime-type -b "#{i}"`.chomp
    filename = "wise/subjects/standard/#{bson_id}-#{i.scan(/^.+_(.+).png$/)[0][0]}.png"
    bucket.objects[filename].write file: i, acl: :public_read, content_type: content_type 
  end

  subjects.puts(subject.to_json)
end

