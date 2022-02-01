--存储数据


import"android.util.Base64"
import"javax.crypto.spec.SecretKeySpec"
import"javax.crypto.Cipher"
import"javax.crypto.spec.PBEKeySpec"
import"javax.crypto.SecretKeyFactory"


--改良了一下

function ensave(names,sths,sm)
  if sm then else
    sm=function()
    end
  end
  local DataPassword="[passke_"..this.packageName..Build.SERIAL..Build.FINGERPRINT

  fl="/data/data/"..activity.getPackageName().."/"

  if fl==nil or sths==nil or names==nil then else
    sths=tostring(sths)
    local function encrypt(content,password)
      --数据加密 (By: 32552732)
      local jdpuk=Cipher.getInstance("AES")
      jdpuk.init(Cipher.ENCRYPT_MODE,SecretKeySpec(SecretKeyFactory.getInstance("PBKDF2WithHmacSHA1")
      .generateSecret(PBEKeySpec(String(password).toCharArray(),byte[1],1,128)
      ).getEncoded()
      ,"AES"))
      return Base64.encodeToString(jdpuk.doFinal(String(content).getBytes("UTF-8"))
      ,Base64.NO_WRAP)
      ,"By: 32552732"
    end
    if pcall(function()
        sths=encrypt(sths,DataPassword)
      end) then
     else
      --加密失败
      local sths=sths

    end
    --写入文件函数
    local wrt=function(path,sth)
      import"java.io.File"
      f=File(tostring(File(tostring(path)).getParentFile())).mkdirs()
      io.open(tostring(path),"w"):write(tostring(sth)):close()
    end
    --写入的戳
    local fl=fl--根目录
    local en=".xml"
    local stmps=fl..names..en
    wrt(stmps,sths)
  end
  return true and sm()
end





function deread(names,sm)
  if sm then else
    sm=function()

    end
  end
  local DataPassword="[passke_"..this.packageName..Build.SERIAL..Build.FINGERPRINT

  fl="/data/data/"..activity.getPackageName().."/"

  if fl==nil or names==nil then
    return("The key or name is missing")
   else
    local function decrypt(content,password)
      --数据解密 (By: 32552732)
      local jdpuk=Cipher.getInstance("AES")
      jdpuk.init(Cipher.DECRYPT_MODE,SecretKeySpec(SecretKeyFactory.getInstance("PBKDF2WithHmacSHA1")
      .generateSecret(PBEKeySpec(String(password).toCharArray(),byte[1],1,128)
      ).getEncoded()
      ,"AES"))
      return String(jdpuk.doFinal(Base64.decode(content,Base64.NO_WRAP))
      ),"By: 32552732"
    end
    --写入的戳
    local fl=fl--根目录
    local en=".xml"
    local stmps=fl..names..en

    local rwt=function(path)
      import "java.io.*"
      if pcall(function()
          sths=io.open(path):read("*a")
        end) then
        return sths
       else
        return false and ""
      end
    end

    local sths=rwt(stmps)

    if pcall(function()
        sthss=decrypt(sths,DataPassword)
      end) then
      sths=sthss
     else
      --解密失败
      sths=sths
    end
    return sths
  end
  return true and sm()
end


--[[


fl="/storage/emulated/0/Lucky App/datas/".."";--存储的目录
sm=(deread("test",nil))
print(sm)

ensave("test","12323",function()end)--第一个是key，第二个是数据内容

]]
