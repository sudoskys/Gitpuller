require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "android.graphics.Color"
import "java.lang.Integer"
import"values.base"
import"mods.runbase"


--import "layout"
--activity.setTitle('AndroLua+')
--activity.setTheme(android.R.style.Theme_Holo_Light)
--activity.setContentView(loadlayout(layout))


set_flagcolor(to0x(backcolor))
opp,path=...
activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS).setStatusBarColor(to0x(backcolor))
path=path:match(".+/(.+)%..+$")


activity.ActionBar.hide()--隐藏标题栏


local str=opp
--string.rep(io.readall(activity.luaDir.."/layout.aly"),15)
one={
  LinearLayout;
  orientation="vertical";
  background="#FFFFFFFF";
  layout_width="fill";
  layout_height="fill";

  {
    ScrollView,--纵向滑动控件
    layout_width="fill",--布局宽度
    layout_height="fill",--布局高度
    overScrollMode=View.OVER_SCROLL_NEVER,--隐藏圆弧阴影
    verticalScrollBarEnabled=false,--隐藏纵向滑条
    id="op";
    {
      LinearLayout;
      orientation="vertical";
      background="#FFFFFFFF";
      layout_width="fill";
      layout_height="fill";
      {
        CardView;
        --    background="#FFFFFFFF";
        layout_width="85%w";
        layout_height="wrap";
        layout_gravity="center";
        layout_margin="20dp";
        layout_marginTop="10%w";
        CardBackgroundColor='#ffffffff';--颜色
        --左:left 右:right 中:center 顶:top 底:bottom
        elevation='7dp';--阴影
        radius='4dp';--圆角
        {
          LinearLayout;
          orientation="vertical";
          background="#FFFFFFFF";
          layout_width="fill";
          layout_height="fill";

          {
            TextView;--文本控件
            id="yy";
            gravity='left|top';--重力
            -- gravity='center';--重力
            --左:left 右:right 中:center 顶:top 底:bottom
            --[[layout_width='fill';--宽度
layout_height='fill';--高度
layout_marginTop='150dp';--顶距
layout_marginLeft='15dp';--左距
layout_marginRight='15dp';--右距
]]
            layout_margin="20dp";
            layout_width='fill';--宽度
            layout_height='fill';--高度
            --layout_marginTop='140dp';--顶距
            textColor='#FF0C0C0C';--文字颜色
            -- text="正在链接至接口";--显示文字
            textSize='14sp';--文字大小

            --  style="?android:attr/buttonBarButtonStyle";

            textIsSelectable=false--长按复制
          };
        };
      };

    };

  };
};
activity.setContentView(loadlayout(one))


yy.setText(str)


function Sharing(path)
  import "android.webkit.MimeTypeMap"
  import "android.content.Intent"
  import "android.net.Uri"
  import "java.io.File"
  FileName=tostring(File(path).Name)
  ExtensionName="txt"
  
  --FileName:match("%.(.+)")
  Mime=MimeTypeMap.getSingleton().getMimeTypeFromExtension(ExtensionName)
  intent = Intent()
  intent.setAction(Intent.ACTION_SEND)
  intent.setType(Mime)
  file = File(path)
  uri = Uri.fromFile(file)
  intent.putExtra(Intent.EXTRA_STREAM,uri)
  intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
  activity.startActivity(Intent.createChooser(intent, "分享到:"))
end



import "android.graphics.Canvas"
import "android.graphics.Bitmap"
import "java.io.FileOutputStream"
import "android.graphics.Rect"
import "android.graphics.Paint"
import "android.content.Intent"



function oldSavePicture(目录,名字,bm)
  if bm then
    local directory=File(目录)
    if not directory.exists() then
      directory.mkdirs()
    end
    local file=File(目录,名字)
    local fileOutputStream=FileOutputStream(file)
    bitmap.compress(Bitmap.CompressFormat.JPEG,100,fileOutputStream)
    local intent=Intent(Intent.ACTION_MEDIA_SCANNER_SCAN_FILE)
    intent.setData(Uri.fromFile(file))
    activity.sendBroadcast(intent)
    return true
   else
    return false
  end
end
--图萌开源
function addBitmapToAlbum(bitmap, displayName)--api29以下用另一个方法
  values = ContentValues()
  values.put(MediaStore.MediaColumns.DISPLAY_NAME, displayName)
  values.put(MediaStore.MediaColumns.MIME_TYPE, "image/png")
  --if Build.VERSION.SDK_INT >= 29 then
  values.put(MediaStore.MediaColumns.RELATIVE_PATH, Environment.DIRECTORY_PICTURES)
  --else
  --values.put(MediaStore.MediaColumns.DATA, "${Environment.getExternalStorageDirectory().path}/${Environment.DIRECTORY_PICTURES}/$displayName")
  --end
  uri = activity.getContentResolver().insert(MediaStore.Images.Media.EXTERNAL_CONTENT_URI, values)
  --uri="content://com.android.externalstorage.documents/tree/primary%3AAcFun"
  if uri ~= nil then
    outputStream = activity.getContentResolver().openOutputStream(uri)
    if outputStream ~= nil then
      bitmap.compress(Bitmap.CompressFormat.PNG, 100, outputStream)
      outputStream.close()
    end
  end
end

import "android.os.Build"
function savePicToAlbum(bitmap,paths,name)
  local directory=File(paths)
  if not directory.exists() then
    directory.mkdirs()
  end
  if tonumber(Build.VERSION.SDK) <=28 then
    oldSavePicture(paths,name,bitmap)
   else
    addBitmapToAlbum(bitmap,name)
  end
  Toast.makeText(activity, "已保存到\nPictures/monote/"..name,Toast.LENGTH_SHORT).show()
end



local 短截图=function(截图控件,截图目录,截图文件名)
  import"android.graphics.Bitmap"
  import"java.io.FileOutputStream"
  import"android.content.Intent"
  import"android.net.Uri"
  截图控件.setDrawingCacheEnabled(false)
  截图控件.setDrawingCacheEnabled(true)
  截图控件.destroyDrawingCache()
  截图控件.buildDrawingCache()
  local drawingCache=截图控件.getDrawingCache()
  if drawingCache==nil then
    print("截图失败惹")
   else
    local bitmap=Bitmap.createBitmap(drawingCache)
    local directory=File(截图目录)
    if not directory.exists() then
      directory.mkdirs()
    end
    local file=File(截图目录,截图文件名)
    local fileOutputStream=FileOutputStream(file)
    bitmap.compress(Bitmap.CompressFormat.JPEG,100,fileOutputStream)
    local intent=Intent(Intent.ACTION_MEDIA_SCANNER_SCAN_FILE)
    intent.setData(Uri.fromFile(file))
    activity.sendBroadcast(intent)
    --  print("已保存到 "..截图目录.."/"..截图文件名)
  end
end


local 长截图=function(ID,截图目录,文件名)
  --Bitmap.getScrollViewBitmap
  hig=0
  s=ID.getChildCount()
  s=s-1
  for i=0,s do
    st=ID.getChildAt(i).getHeight()
    hig=hig+st
  end
  bitmap=Bitmap.createBitmap(ID.getWidth(),hig,Bitmap.Config.ARGB_8888)
  canvas = Canvas(bitmap)
  paint = Paint()
  paint.setARGB(100,0,250,0)
  paint.setStrokeWidth(20)
  paint.setTextSize(28)
  paint.setAntiAlias(true);
  colors = 0xff424242;
  paint.setColor(colors);

  rect = Rect(0, 0, bitmap.getWidth(), bitmap.getHeight());
  canvas.drawBitmap(bitmap, rect, rect, paint);
  ID.draw(canvas)


  import"android.graphics.Bitmap"
  import"java.io.FileOutputStream"
  import"android.content.Intent"
  import"android.net.Uri"
  savePicToAlbum(bitmap,截图目录,文件名)
  return bitmap
  --bitmap = Bitmap.createBitmap(scrollView.getWidth(),h)
  --    local bitmap=Bitmap.createBitmap(drawingCache)
end


yy.onClick=function()
  local 截图控件=op
  --activity.getDecorView()--只截网页就换成 webView
  --getDecorView
  local 截图目录=Environment.getExternalStorageDirectory().toString().."/Pictures/monote/"
  local 文件名="share_"..path..".jpg"
  --操作
  长截图(op,截图目录,文件名)
  Sharing(截图目录..文件名)
end





