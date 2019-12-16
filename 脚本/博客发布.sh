
#!/bin/sh

#npm audit fix --force
#
#npm audit
#
#npm install hexo - deployer - git-- save

hexo clean #清除缓存 网页正常情况下可以忽略此条命令

hexo g #生成静态网页

hexo d #开始部署

open 'https://ccsh.github.io'


