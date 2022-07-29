# Gitpuller

使用Androlua实现的一款Github & Gitee手机浏览实例，包含GIThub api 类库封装


<p align="center">
<img src="https://img.shields.io/badge/language-lua-blue.svg"/>
<img src="https://img.shields.io/badge/license-MIT-blue"/>
<img src="https://img.shields.io/badge/Androlua+-5.0.19-blue"/></a>
</p>



项目含有 Gitkit 库文件来使用GithubApi ，并含有一个 列表展开示例。


## 库文件自述

库文件位置 `assets_bin/mods/Gitkit.lua` 
示例使用 `assets_bin/action/sub/listv.lua`

库采用回调机制，执行代码需要写在 callback 中。

比如

```
Github = Git:new("api.github.com",{debug=true,filemirror="raw.githubusercontent.com"})
Github:FlieSelf({i="sudoskys",repo="aluabook",path="README.md"},function(con)
  print(dump(con))
end)
```

## 方法说明

### 构建类

```
Github = Git:new("api.github.com",{debug=true,filemirror="raw.githubusercontent.com",alwaysrenew=false})
```

|参数|说明|
|------|-----|
|`debug`|debug开关，提供一个预留参数|
|`filemirror`|raw文件镜像可选|
|`alwaysrenew`|是否启用自带的垃圾缓存机制，关闭则不存取|

 


### 使用方法


|接口|所属|描述|返回|
|------|-----|-----|-----|
|`Git:dprint`|工具接口|放心的打印数据，由构建使用 debug 参数开关 |传入参数 |
|`Git:makekey`|内部工具接口|自带AES加密方法，为timedog提供唯一的存储键 |加密后的 Key |
|`Git:timedog`|内部工具接口|使用全局存储策略的缓冲库设计 |标准 Json |
|`Git:getinfo`|内部工具接口|获取 URL 数据并解析返回 |标准 Json |
|`Git:User`|调用接口|调用接口，获取用户信息 |标准 Json |
|`Git:UserRepo`|调用接口|获取用户的所有公开仓库 |标准 Json |
|`Git:RepoInfo`|调用接口|获取仓库信息 |标准 Json |
|`Git:RepoContent`|调用接口|仓库根路径信息 |标准 Json |
|`Git:FlieSelf`|调用接口|仓库路径文件 |标准 Json |
|`Git:FlieGet`|调用接口|下载对应文件 | 调用文件下载器 |
|`Git:FlieBrow`|预留接口|预留浏览文件get的接口 |与 FileGet 相同 |

**返回**



#### 注意

本库自带一个粗糙的数据缓冲设计，投入生产环境会造成SP存储库体积暴增！
但是如果频繁请求会导致 403

建议取消 `timedog` 函数的使用，并使用 [Cache.lua](https://gist.github.com/sudoskys/8e6426dc3132d25874b947f1809dfb3c) 数据缓冲库。


![counter](https://count.getloli.com/get/@sudoskys-github-Gitpuller?theme=moebooru)


#### Support
[![s](https://img.shields.io/badge/Sponsor-Alipay-ff69b4)](https://azz.net/ly233)