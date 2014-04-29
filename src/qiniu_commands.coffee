wrench = require('wrench')
colors = require('colors')
package_info = require('../package.json')


qiniu_commands = module.exports = (hexo) ->
  qiniu_commands.hexo = hexo
  qiniu_commands.qiniu_config = hexo.config.qiniu || false
  
  if (!qiniu_commands.qiniu_config )
    throw new Error('Qiniu configuration was not found.')

  qiniu_commands
  
  

"""
  Display useful information
"""
qiniu_commands.show_info = () ->
  
  console.log 'Version'.bold+': '+package_info.version
  console.log 'Author'.bold+':  '+package_info.author.name+' <'+package_info.author.email+'>'
  console.log 'Website'.bold+': '+package_info.author.url
  console.log 'Help'.bold+':    hexo help qiniu'
  console.log 'Github'.bold+':  '+package_info.repository.url
  console.log 'Bugs'.bold+':    '+package_info.bugs.url

  console.log '\nThank you so much for using it!\n'
