

import "java.io.File"

function errord(errors)
  if pcall(function()
      er={}
      er.idtext=os.clock()*10000
      er.myerror=errors
      er.date=os.date("%Y-%m-%d %H:%M:%S")
      import"java.io.File"
      --  f=File(tostring(File(tostring('/log.txt')).getParentFile())).mkdirs()
      io.open(tostring(activity.getLuaDir()..'/Logs/log.txt'),"a+"):write(tostring("\n"..dump(er).."\n")):close()
    end) then
   else
    --none
  end
end

function executeState2Toast(succeed,exit,num,name)
  if succeed then
    soToast(name.."成功")
   else
    soToast(name.."失败")
  end
end

function showLoadingDia(message)
  if not(loadingDia) then
    loadingDia=ProgressDialog(this)
    loadingDia.setProgressStyle(ProgressDialog.STYLE_SPINNER)
    loadingDia.setTitle("操作中...")
    loadingDia.setCancelable(false)
    loadingDia.setCanceledOnTouchOutside(false)
    loadingDia.setOnCancelListener{
      onCancel=function()
        loadingDia=nil
    end}
    loadingDia.show()
  end
  loadingDia.setMessage(message)
end

function closeLoadingDia()
  if loadingDia then
    loadingDia.dismiss()
    loadingDia=nil
  end
end


function FakeBold(ID)
  if pcall(function()
      import "android.graphics.Paint"
      ID.getPaint().setFakeBoldText(true)
    end) then
   else
    print"字体粗化设置出错"
  end
end


function shareText(t)
local f,e=pcall(function ()
  import "android.content.Intent"
  local intent=Intent(Intent.ACTION_SEND);
  intent.setType("text/plain");
  intent.putExtra(Intent.EXTRA_SUBJECT, "分享");
  intent.putExtra(Intent.EXTRA_TEXT, tostring(t));
  intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
  activity.startActivity(Intent.createChooser(intent,"分享文档"));

  end)
 if e then
  soToast("分享失败")
 end
end

function soToast(info)
  sth=tostring(info)
  body={
    CardView;
    CardBackgroundColor="#C0000000";
    elevation="0dp";
    -- layout_width="95%w";
    layout_height="42dp";
    radius="18dp";
    id="Toastbody";
    {
      TextView;
      textSize="15sp";
      TextColor="#FFffffff";
      layout_width="45%w";
      layout_height="42dp";
      gravity="center";
      text="出错";
      id="Toastmessage";
    };
  }
  local Toastbody=Toast.makeText(activity,"内容",Toast.LENGTH_SHORT).setView(loadlayout(body))
  Toastbody.setGravity(Gravity.CENTER,0,60)
  Toastmessage.Text=tostring(sth)
  Toastbody.show()
  return Toastbody
end




function ripples(id,colors)
  import "android.content.res.ColorStateList"
  local attrsArray = {android.R.attr.selectableItemBackgroundBorderless}
  local typedArray =activity.obtainStyledAttributes(attrsArray)
  ripple=typedArray.getResourceId(0,0)
  Pretend=activity.Resources.getDrawable(ripple)
  Pretend.setColor(ColorStateList(int[0].class{int{}},int{colors}))
  id.setBackground(Pretend.setColor(ColorStateList(int[0].class{int{}},int{colors})))
end

function getDirNumber(file,dirname)
  import "java.io.*"
  --      if File(tostring(file).."/"..dirname).isDirectory() then
  local file=File(tostring(file).."/"..dirname)
  local list=file.listFiles()
  local tableList=luajava.astable(list)
  local number=table.size(tableList)
  luajava.clear(file)
  luajava.clear(list)
  local tableList=nil
  return number
  --     else
  --       File(tostring(file).."/"..dirname).mkdirs()
  -- print("不存在")
  --   end
end


function getActuallyTitle(ori)
  if #ori<1 then
    return "无标题"
   else
    return ori
  end
  print (ori)
end


function getActuallyContent(ori)
  if #ori<1 then
    return "无内容"
   else
    return ori
  end
  print (ori)
end

function to0x(n)
  if #n==7 then
    nn=n:match("#(.+)")
    nnn=tonumber("0xff"..nn)
   else
    nn=n:match("#(.+)")
    nnn=tonumber("0x"..nn)
  end
  return nnn
end
function to0x(n)
  if #n==7 then
    nn=n:match("#(.+)")
    nnn=tonumber("0xff"..nn)
   else
    nn=n:match("#(.+)")
    nnn=tonumber("0x"..nn)
  end
  return nnn
end


function set_flagcolor(n)
  window=activity.getWindow()
  window.addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS)
  window.setStatusBarColor(n)
  if n==0x3f000000 then
     import "android.os.Build"
    if Build.VERSION.SDK_INT>=23 then
      window.getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR)
      window.setStatusBarColor(0xffffffff)
    end
  end
end


--文件计数
function getFileCount(path)
  --print(path)
  if File(path).listFiles()~=nil then
    local list=luajava.astable(File(path).listFiles())
    return #list
   else
    return 0
  end
end

function getFileList(path)
  if File(path).listFiles()~=nil then
    return luajava.astable(File(path).listFiles())
   else
    return {"no file"}
  end
end

function StrToTable(str)
  if str == nil or type(str) ~= "string" then
    return
  end
  return loadstring("return " .. str)()
end





--写入数据函数
function putData(name,key,value)
  this.getApplicationContext().getSharedPreferences(name,0).edit().putString(key,value).apply()--3255-2732
  return true
end

function getData(name,key)--验证
  local data=this.getApplicationContext().getSharedPreferences(name,0).getString(key,nil)--325-5273-2
  return data
end

function poToast(thingt)
  Toast.makeText(activity, thingt,Toast.LENGTH_SHORT).show()
end



--[[
function zhuanhuan(zijie)
  xinxi="";
  wenben = StringBuilder("");
  for n=1,#zijie - 1,1 do
    xinxi = Integer.toHexString(zijie[n] & 0xFF);
    if #xinxi == 1 then
      wenben.append("0"..xinxi)
     else
      wenben.append(xinxi);
    end
    wenben.append(":");
  end
  return wenben.toString():upper();
end
function getsha()
  import "java.security.MessageDigest"
  import "java.security.cert.CertificateFactory"
  import "java.io.ByteArrayInputStream"
  import "android.content.pm.PackageManager"
  local pm = activity.getPackageManager();
  local packageName = activity.getPackageName();
  local flags = PackageManager.GET_SIGNATURES;
  local packageInfo = nil;
  packageInfo = pm.getPackageInfo(packageName, flags);
  local signatures = packageInfo.signatures;
  local cert = signatures[0].toByteArray();
  local input = ByteArrayInputStream(cert);
  local zhengshu = nil;
  zhengshu = CertificateFactory.getInstance("X509");
  local c = nil;
  c = zhengshu.generateCertificate(input);
  local hexString = nil;
  local md = MessageDigest.getInstance("SHA1");
  local publicKey = md.digest(c.getEncoded());
  local hexString = zhuanhuan(publicKey);
  return hexString;
end
if getsha() ~= "59:9e:61:9b:f3:0d:5a:05:f4:35:a8:7a:45:76:cb:d8:86:21:f8:50" then

 else

end
--]]

function shared(path,types)
  if types then else
    types="txt"
    end
      if pcall(function()
          import "android.webkit.MimeTypeMap"
          import "android.content.Intent"
          import "android.net.Uri"
          import "java.io.File"
          FileName=tostring(File(path).Name)
          ExtensionName=types
          --FileName:match(".+%.(%w+)$")
          Mime=MimeTypeMap.getSingleton().getMimeTypeFromExtension(ExtensionName)
          intent=Intent()
          intent.setAction(Intent.ACTION_SEND)
          intent.setType(Mime)
          file=File(path)
          uri=Uri.fromFile(file)
          intent.putExtra(Intent.EXTRA_STREAM,uri)
          intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
          activity.startActivity(Intent.createChooser(intent,"分享"))
      end) then
     else
      print("分享出现错误....")
end
end

function copy(msg)
  activity.getSystemService(Context.CLIPBOARD_SERVICE).setText(msg)
end