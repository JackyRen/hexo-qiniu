// Generated by CoffeeScript 1.7.1
var colors, html_tag, package_info, qiniuCommandOptions, qiniu_bucket, qiniu_commands, qiniu_config, qiniu_default_key_prefix, qiniu_prefix, qiniu_style_seperator, root_path;

html_tag = hexo.util.html_tag;

colors = require('colors');

package_info = require('./../package.json');

qiniu_commands = require('./../qiniuCommands')(hexo);

root_path = hexo.config.root;

qiniu_config = hexo.config.qiniu || false;

qiniu_bucket = qiniu_config.bucket || false;

qiniu_style_seperator = qiniu_config.style_seperator || '-';

qiniu_prefix = "" + qiniu_bucket + ".qiniudn.com";

qiniu_default_key_prefix = qiniu_config.default_key_prefix || false;

" Qiniu commands for Hexo.\n Use `info` option to show some useful info\n\n\n Syntax:\n   $ hexo qiniu [info]";

qiniuCommandOptions = {
  desc: package_info.description,
  usage: '<argument>',
  "arguments": [
    {
      "name": 'info',
      "desc": "Displays useful info, like plugin version, aurthor or GitHub links"
    }
  ]
};

hexo.extend.console.register('qiniu', package_info.description, qiniuCommandOptions, function(args, callback) {
  var opt;
  console.log('\n'.yellow);
  console.log('    __  __                               ____     _             _         '.yellow);
  console.log('   / / / /  ___    _  __  ____          / __ \\   (_)   ____    (_)  __  __'.yellow);
  console.log('  / /_/ /  / _ \\  | |/_/ / __ \\ ______ / / / /  / /   / __ \\  / /  / / / /'.yellow);
  console.log(' / __  /  /  __/ _>  <  / /_/ //_____// /_/ /  / /   / / / / / /  / /_/ / '.yellow);
  console.log('/_/ /_/   \\___/ /_/|_|  \\____/        \\___\\_\\ /_/   /_/ /_/ /_/   \\__,_/  '.yellow);
  console.log('                                                                          '.yellow);
  console.log('                                                     Thank you'.yellow);
  opt = args._[0] || null;
  switch (opt) {
    case 'info':
      return qiniuCommandOptions.showInfo();
    default:
      return hexo.call('help', {
        _: ['qiniu']
      }, callback);
  }
});

" Qiniu tag renders a single link.\n\n Syntax:\n   {% qiniu-img filepath [stylename] [class1,class2,class3] %}\n";

hexo.extend.tag.register('qiniu-img', function(args, content) {
  var classes, file_path, imgAttr, stype_name;
  file_path = args[0];
  stype_name = args[1] || false;
  classes = args[2] || "";
  imgAttr = {};
  if (!qiniu_config) {
    throw new Error('Qiniu configuration was not found.');
  }
  if (!qiniu_bucket) {
    throw new Error('Qiniu buckete wat not sepcified.');
  }
  if (!qiniu_default_key_prefix || !qiniu_default_key_prefix.image) {
    console.warn("no default key prefix for image");
  }
  classes = classes.split(',');
  classes.push('qiniu');
  classes.push('nofancybox');
  imgAttr.src = "" + qiniu_default_key_prefix.image + qiniu_prefix + "/" + file_path;
  if (stylename) {
    imgAttr.src = "" + imgAttr.src + qiniu_style_seperator + stylename;
  }
  console.log(imgAttr.src);
  imgAttr["class"] = classes.join(' ');
  return htmlTag('img', imgAttr);
});
