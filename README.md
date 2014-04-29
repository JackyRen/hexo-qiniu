## Introduction

This is a [hexo](https://github.com/tommy351/hexo) plugin which allows you to insert files in [qiniu](http://www.qiniu.com/) on your blog posts.

## Plugin installation

Run the following command in the root directory of hexo:

```
npm install hexo-qiniu --save
```

And enable the plugin in your `_config.yml`.

```
plugins:
  - hexo-qiniu
```

and this configuration

```
# hexo-qiniu plugin configuration
qiniu:
  bucket: git-repo # change it to your bucket , the default url prefix will be <bucktet>.qiniudn.com
  style_seperator: '-' # this is useful if you setup auto transform of images in qiniu
  default_key_prefix:
    image: images/ # assume your image's key is images/foo.jpg , you can just type foo.jpg  in the tag , the prefix 'images/' will automatically added

```

##Usage

#### Method 1 - Inline 

```
{% qiniu-img filename [style] [class1,class2,class3] %}
```

Example:

```
{% qiniu-img test.jpg small custom_class1,custom_class2 %}
```

Will generate the following HTML:

```
<img class="qiniu nofancybox custom_class1 custom_class2" src="http://git-repo.qiniudn.com/images/test.jpg-small">
```

here are some examples
```
{% qiniu-img test.jpg small custom_class1,custom_class2 %}
```
![](http://git-repo.qiniudn.com/images/test.jpg-big)

```
{% qiniu-img test.jpg small custom_class1,custom_class2 %}
```
![](http://git-repo.qiniudn.com/images/test.jpg-small)

