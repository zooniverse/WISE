require 'aws-sdk'
require 'json'

AWS.config access_key_id: ENV['S3_ACCESS_ID'], secret_access_key: ENV['S3_SECRET_KEY']
s3 = AWS::S3.new
bucket = s3.buckets['zooniverse-demo']

hip = (ARGV[1] == 'hip')

image_sets = Dir["#{ARGV[0]}/*.png"].group_by do |image|
  if hip
    File.basename(image).scan(/^fc_HIP_([0-9]+).*\.png$/)[0][0]
  else
    File.basename(image).scan(/^fc_([0-9\.]+)\+([0-9\.]+)_.*.png$/)[0]
  end
end

manifest = File.open('manifest_wise.txt', 'r').map {|line| JSON.parse(line)}

image_sets.each do |id, images|
  if hip
    subject = manifest.select { |s| s['metadata']['hip_id'] == id }
  else
    subject = manifest.select { |s| s['coords'] == id }
  end
  
  images.each do |i|
    content_type = `file --mime-type -b "#{i}"`.chomp
    filename = "wise/subjects/standard/#{subject[0]['_id']['$oid']}-#{i.scan(/^.+_(.+).png$/)[0][0]}.png"
    bucket.objects[filename].write file: i, acl: :public_read, content_type: content_type
  end
end
