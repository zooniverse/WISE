var fs = require('fs'),
  cheerio = require('cheerio'),
  clean = require('clean-css'),
  uglify = require('uglify-js'),
  zlib = require('zlib'),
  AWS = require('aws-sdk'),
  sh = require('execSync');

AWS.config.loadFromPath('./.aws-cred.json');

var s3bucket = new AWS.S3({params: {Bucket: 'www.diskdetective.org'}});
var $ = cheerio.load(fs.readFileSync("./public/index.html"));
var version = require('./package').version
prefix = ''

console.log("Building WISE-ZOO Version: ", version);

// Upload Images
uploadImgs = function(dir) {
  fs.readdir(dir, function(err, imgs) {
    if (err)
      return console.log("Failed to read img dir");
    dirs = imgs.filter(function(i) {
      stat = fs.lstatSync(dir + "/" + i);
      return stat.isDirectory();
    });

    imgs.filter(function(i) { return !(i in dirs) })
      .forEach(function(img) {
        fs.readFile(dir + "/" + img, function(err, file) {
          var d = dir.slice(9)
          if (err)
            return console.log("Failed to read: ", d + "/" + img);
          var fileType = img.split('.').slice(-1)[0],
            contentType = (fileType === "svg") ? "image/svg+xml" : "image/" + fileType;
          s3bucket.putObject({
            ACL: 'public-read',
            Body: file,
            Key: prefix + d + '/' + img,
            ContentType: contentType 
          }, function(err) {
            if (err)
              console.log("Failed to upload: ", d + "/" + img)
            else
              console.log("Uploaded: ", d + "/" + img)
          });
        });
      });
    dirs.forEach(function(d) { uploadImgs(dir + "/" + d) });
  });
};

uploadImgs('./public/img');

// Compress CSS - Write to ./output/css/

console.log("Build CSS");

var cssInput = [
  "./public/css/vendor.css",
  "./public/css/app.css"
];

var css = clean.process(cssInput.map(function(f) { 
  return fs.readFileSync(f); 
}).join('\n'));

console.log("Upload CSS to s3");

zlib.gzip(css, function(err, result) {
  if (err)
    throw err;
  s3bucket.putObject({
    ACL: 'public-read',
    Body: result,
    Key: prefix + 'css/style.' + version + '.css',
    ContentEncoding: 'gzip',
    ContentType: 'text/css'
  }, function(err) {
    if (err)
      console.log(err);
    else
      console.log('Uploaded css/style.css');
  });
});


// Compress JS - Write to ./output/js/
console.log("Build JS");

sh.run('brunch build --production');

var jsInput = [
  "./public/js/vendor.js",
  "./public/js/app.js"
];

var js = uglify.minify(jsInput, {outSourceMap: 'app.js.map'});

console.log("Upload JS to s3");

zlib.gzip(js.code, function(err, result) {
  if (err)
    throw err;
  s3bucket.putObject({
    ACL: 'public-read',
    Body: result,
    Key: prefix + 'js/app.' + version + '.js',
    ContentEncoding: 'gzip',
    ContentType: 'application/javascript'
  }, function(err) {
    if (err)
      console.log(err);
    else
      console.log('Uploaded js/app.js');
  });
});


// Modify and Save HTML

console.log("Update HTML");
$('link.removeable').remove();
$('script.removeable').remove();
$('head').append('<link rel="stylesheet" type="text/css" href="css/style.' + version + '.css">');
$('body').append('<script src="js/app.' + version + '.js" onload="require(' + "'init'" + ')();"></script>');

console.log("Upload HTML to s3");

zlib.gzip($.html(), function(err, result) {
  if (err)
    throw err;
  s3bucket.putObject({
    ACL: 'public-read',
    Body: result,
    Key: prefix + 'index.html',
    ContentEncoding: 'gzip',
    CacheControl: 'no-cache, must-revalidate',
    ContentType: 'text/html'
  }, function(err) {
    if (err)
      console.log(err);
    else
      console.log('Uploaded index.html');
  });
});