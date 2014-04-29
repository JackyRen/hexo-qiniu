html_tag = hexo.util.html_tag
colors = require('colors')
package_info = require('./../package.json')
qiniu_commands = require('./../qiniuCommands')(hexo)
root_path = hexo.config.root
qiniu_config = hexo.config.qiniu || false
qiniu_bucket = qiniu_config.bucket || false
qiniu_style_seperator = qiniu_config.style_seperator || '-'
qiniu_prefix = "#{qiniu_bucket}.qiniudn.com"


"""
  Qiniu commands for Hexo.
  Use `info` option to show some useful info
 
 
  Syntax:
    $ hexo qiniu [info]
"""
qiniuCommandOptions =
  desc: package_info.description
  usage: '<argument>'
  arguments: [
    "name": 'info'
    "desc": "Displays useful info, like plugin version, aurthor or GitHub links"
  ]

hexo.extend.console.register 'qiniu', package_info.description,qiniuCommandOptions,(args,callback)->
  console.log('\n'.yellow)
  console.log('    __  __                               ____     _             _         '.yellow)
  console.log('   / / / /  ___    _  __  ____          / __ \\   (_)   ____    (_)  __  __'.yellow)
  console.log('  / /_/ /  / _ \\  | |/_/ / __ \\ ______ / / / /  / /   / __ \\  / /  / / / /'.yellow)
  console.log(' / __  /  /  __/ _>  <  / /_/ //_____// /_/ /  / /   / / / / / /  / /_/ / '.yellow)
  console.log('/_/ /_/   \\___/ /_/|_|  \\____/        \\___\\_\\ /_/   /_/ /_/ /_/   \\__,_/  '.yellow)
  console.log('                                                                          '.yellow)
  console.log('                                                     Thank you'.yellow)

  opt = args._[0] || null
  switch opt
    when 'info' then qiniuCommandOptions.showInfo()
    else hexo.call 'help' ,
      _: ['qiniu'],
      callback

    


"""
  Qiniu tag renders a single link.
 
  Syntax:
    {% qiniu-img filepath [stylename] [class1,class2,class3] %}
 
"""
hexo.extend.tag.register 'qiniu-img', (args, content)->
    file_path = args[0]
    stype_name = args[1] || false
    classes = args[2] || ""
    imgAttr = {}

    if (!qiniu_config )
      throw new Error 'Qiniu configuration was not found.'
    
    if (!qiniu_bucket)
      throw new Error 'Qiniu buckete wat not sepcified.'

    classes = classes.split(',')
    classes.push('qiniu')
    classes.push('nofancybox')

    imgAttr.src = "#{qiniu_prefix}/#{file_path}"
    if stylename
      imgAttr.src = "#{imgAttr.src}#{qiniu_style_seperator}#{stylename}"
    imgAttr.class = classes.join(' ')

    return htmlTag('img', imgAttr)



