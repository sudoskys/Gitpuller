--*utf-8*--
--[[
author:sudoskys
date:20220129
git类库，自行调试api使用
--]]
--renew
require "import"
local author="github@sudoskys"
Git = {}
function Git:new(domain,p)
  local funt = {}
  setmetatable(funt, self)
  self.__index = self
  self.domain = domain
  self.debuging = p["debug"]
  self.HOME = activity.getLuaDir()
  self.sudo = ("sudoskys")
  self.filemirror = p["filemirror"]
  self.renew = p["alwaysrenew"]
  import "android.os.Environment"
  self.ROOT = tostring(Environment.getExternalStorageDirectory())
  return funt
end
--定义类的方法
function Git:sudor()
  return self.sudo
end
function Git:dprint(msg)
  if self.debuging==true then
    print(msg)
  end
end
function Git:save(name,con)
  activity.getGlobalData()[name]=con
end
function Git:read(name,con)
  return activity.getGlobalData()[name]
end
function Git:makekey(content)
  import"android.util.Base64"
  import"javax.crypto.spec.SecretKeySpec"
  import"javax.crypto.Cipher"
  import"javax.crypto.spec.PBEKeySpec"
  import"javax.crypto.SecretKeyFactory"
  --aes加密 (By: 32552732)
  password="sudoskys"
  local jdpuk=Cipher.getInstance("AES")
  jdpuk.init(Cipher.ENCRYPT_MODE,SecretKeySpec(SecretKeyFactory.getInstance("PBKDF2WithHmacSHA1")
  .generateSecret(PBEKeySpec(String(password).toCharArray(),byte[1],1,128)
  ).getEncoded()
  ,"AES"))
  return Base64.encodeToString(jdpuk.doFinal(String(content).getBytes("UTF-8")),Base64.NO_WRAP),"By: 32552732"
end
function Git:djson(mys)
  cjson=require("cjson")
  con=cjson.decode(mys)
  return con
end
function Git:timedog(name)
  if not self.renew then
    tmp=os.date("%H")
    older=activity.getGlobalData()["_doghouse"..name]
    if tmp==older then
      return false
     else
      activity.getGlobalData()["_doghouse"..name]=tmp
      return true
    end
   else
    return true --true可以唤醒更新
  end
end
function Git:getinfo(Url,name,cookie,callback)
  header={
    ["User-Agent"]="Mozilla/5.0 (Linux; Android 8.0; MI 6 Build/OPR1.170623.027; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/48.0.2564.116 Mobile Safari/537.36 T7/10.3 SearchCraft/2.6.3 (Baidu; P1 8.0.0)"
  }
  code="utf-8"
  if not cookie then cookie="api v3" end
  -- import"http"
  import "com.androlua.Http"
  --注意，在此回调中不能使用git类的方法进行进一步操作
  if Git:timedog(name) or not activity.getGlobalData()[name] then
    Git:dprint('renew！ ')
    Http.get(Url,cookie,code,header,function(code,content)
      if code==200 then
        Git:dprint('OK '..code)
        activity.getGlobalData()[name]=content
        callback(content,true)
       else
        self:dprint('Fail '..code)
        if activity.getGlobalData()[name]~=nil then
          callback(activity.getGlobalData()[name],true)
         else
          callback(activity.getGlobalData()[name],false)
        end
      end
      if code==403 then
        dialog=AlertDialog.Builder(this)
        --dialog=MaterialAlertDialogBuilder(this) --FA2用这个
        .setTitle("403 请求限制")
        .setMessage(content)
        .setPositiveButton("确认",{onClick=function(v) end})
        --   .setNeutralButton("中立",nil)
        --   .setNegativeButton("否认",nil)
        .show()
        dialog.create()
      end
    end)
   else
    callback(activity.getGlobalData()[name],true)
    Git:dprint('no renew！ ')
  end
end
--]]

function Git:User(parm,deal)
  i=parm["i"]
  local needed=["i"]
  self.CAN=true
  for k,v in pairs(needed) do
    if parm[v] == nil then
      print("缺少参数:"..v);self.CAN=false
    end
  end
  if self.CAN==true then
    --https://api.github.com/users/sudoskys
    url="https://"..self.domain.."/users/"..i
    self:dprint(url);key=(Git:makekey(url))
    Git:getinfo(url,key,"",function(content,is)
      if rawequal(is,true) then
        cjson=require("cjson")
        con=cjson.decode(content)
        deal(con)
       else
        deal(false)
      end
    end)
  end
end

function Git:UserRepo(parm,deal)
  i=parm["i"]
  local needed=["i"]
  self.CAN=true
  for k,v in pairs(needed) do
    if parm[v] == nil then
      print("缺少参数:"..v);self.CAN=false
    end
  end
  if self.CAN==true then
    --https://api.github.com/users/用户名/repos
    url="https://"..self.domain.."/users/"..i.."/repos"
    self:dprint(url);key=(Git:makekey(url))
    Git:getinfo(url,key,"",function(content,is)
      if rawequal(is,true) then
        cjson=require("cjson")
        con=cjson.decode(content)
        deal(con)
       else
        deal(false)
      end
    end)
  end
end
function Git:RepoInfo(parm,deal)
  i=parm["i"]
  r=parm["repo"]
  local needed=["i","repo"]
  self.CAN=true
  for k,v in pairs(needed) do
    if parm[v] == nil then
      print("缺少参数:"..v);self.CAN=false
    end
  end
  if self.CAN==true then
    --https://github.com/sudoskys/aluabook
    url="https://"..self.domain.."/repos/"..i.."/"..r
    self:dprint(url);key=(Git:makekey(url))
    Git:getinfo(url,key,"",function(content,is)
      if rawequal(is,true) then
        cjson=require("cjson")
        con=cjson.decode(content)
        deal(con)
       else
        deal(false)
      end
    end)
  end
end
function Git:RepoContent(parm,deal)
  i=parm["i"]
  r=parm["repo"]
  p=parm["path"]
  local needed=["i","repo"]
  self.CAN=true
  for k,v in pairs(needed) do
    if parm[v] == nil then
      print("缺少参数:"..v);self.CAN=false
    end
  end
  paths=function()if p then; return p; else return "" end; end
  if self.CAN==true then
    --https://api.github.com/repos/sudoskys/aluabook/contents
    url="https://"..self.domain.."/repos/"..i.."/"..r.."/contents".."/"..paths()
    self:dprint(url);key=(Git:makekey(url))
    Git:getinfo(url,key,"",function(content,is)
      if rawequal(is,true) then
        cjson=require("cjson")
        con=cjson.decode(content)
        deal(con)
       else
        deal(false)
      end
    end)
  end
end


function Git:FlieSelf(parm,deal)
  i=parm["i"]
  r=parm["repo"]
  path=parm["path"]
  self.CAN=true
  local needed=["i","repo","path"]
  for k,v in pairs(needed) do
    if parm[v] == nil then
      print("缺少参数:"..v);self.CAN=false
    end
  end
  --https://api.github.com/repos/sudoskys/aluabook/contents/README.md
  --https://raw.githubusercontent.com/用户名/仓库名/分支名/文件路径
  if self.CAN==true then
    url="https://"..self.domain.."/repos/"..i.."/"..r.."/contents/"..path
    self:dprint(url);key=(Git:makekey(url))
    Git:getinfo(url,key,"",function(content,is)
      if rawequal(is,true) then
        cjson=require("cjson")
        con=cjson.decode(content)
        deal(con)
       else
        deal(false)
      end
    end)
  end
end

function Git:FlieGet(parm,deal)
  i=parm["i"]
  r=parm["repo"]
  tpath=parm["tpath"]
  branch=parm["branch"]
  needed=["i","repo","tpath","branch"]
  self.CAN=true
  for k,v in pairs(needed) do
    if parm[v] == nil then
      print("缺少参数:"..v);self.CAN=false
    end
  end
  --i,r,tpath,branch
  if self.CAN==true then
    --https://raw.githubusercontent.com/用户名/仓库名/分支名/文件路径
    url="https://"..self.filemirror.."/"..i.."/"..r.."/"..branch.."/"..tpath
    self:dprint(url);key=(Git:makekey(url))
    path=self.ROOT.."/Download/Git/"..r.."/"..branch.."/"
    import "java.io.File";File(path).mkdirs()
    --[
    Http.download(url,path..tpath,cookie,header,function()
      self:dprint('下载完成')
    end)
    --]]
  end
end

function Git:FlieBrow(parm,deal)
  i=parm["i"]
  r=parm["repo"]
  tpath=parm["tpath"]
  branch=parm["branch"]
  needed=["i","repo","tpath","branch"]
  self.CAN=true
  for k,v in pairs(needed) do
    if parm[v] == nil then
      print("缺少参数:"..v);self.CAN=false
    end
  end
  --i,r,tpath,branch
  if self.CAN==true then
    --https://raw.githubusercontent.com/用户名/仓库名/分支名/文件路径
    url="https://"..self.filemirror.."/"..i.."/"..r.."/"..branch.."/"..tpath
    self:dprint(url);key=(Git:makekey(url))
    path=self.ROOT.."/Download/Git/"..r.."/"..branch.."/"
    import "java.io.File";File(path).mkdirs()
    --[
    Http.download(url,path..tpath,cookie,header,function()
      self:dprint('下载完成')
    end)
    --]]
  end
end


--使用
--创建对象
--Github = Git:new("api.github.com",{debug=true,filemirror="raw.githubusercontent.com"})

--[[
--回调示例
Github:FlieSelf({i="sudoskys",repo="aluabook",path="README.md"},function(con)
  print(dump(con))
end)
--]]
--参数依次为 --主人，仓库名 ，文件路径 ，分支。函数不会做缺失检查，尽量传全
--[[
类名依次为
User
UserRepo
RepoInfo
RepoContent
FlieSelf
FlieGet

--]]








----*****------******-----其他---***----****
--访问对象属性
--print(coco.sudo)
--访问对象方法
--print(coco:sudor())

--类的继承
--[[
中文函数库 = coco:new()
function 中文函数库:new()
  o = o or yswy:new()
  setmetatable(o, self)
  self.__index = self
  return o
end
--派生类的方法
function 中文函数库:sudos()
  return self.sudo
end
--覆写类的方法
function 中文函数库:sudos()
  return "什么也没有"
end
--访问对象属性
--print(中文函数库.屏幕高度)
--访问对象方法
--print(中文函数库:获取脚本当前目录())
--]]





