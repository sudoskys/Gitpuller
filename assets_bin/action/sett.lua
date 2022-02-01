--基本
require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "android.graphics.BitmapFactory"

--activity.overridePendingTransition(android.R.anim.fade_in,android.R.anim.fade_out)--淡入淡出
import "android.graphics.PorterDuff"
import "android.content.res.ColorStateList"
import "android.widget.ImageView"
import "android.graphics.PorterDuffColorFilter"
activity.setTitle('月笔记')
activity.ActionBar.hide()--隐藏标题栏

catkey=(activity.getGlobalData().key)
if catkey and catkey==2021/03/27 then--建议在文件中替换自己的比对key
 else
  print("Running error")
  activity.finish()--关闭当前页面
end

import"values.base"
import"mods.runbase"
catkey=(activity.getGlobalData().key)
if catkey and catkey==2021/03/27 then--建议在文件中替换自己的比对key
 else
  print("Running error")
  activity.finish()--关闭当前页面
end
--activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS).setStatusBarColor(0xFF56B2DB)
set_flagcolor(to0x(maincolor))

activity.setContentView(loadlayout("layout/formal/titlebar"))--设置窗口视图
nolist.setVisibility(View.GONE)
loadbar.setVisibility(View.GONE)
title.setText("设置")
searchs.setImageBitmap(loadbitmap("drawable/close.png"))
search.onClick=function()
  activity.finish()
end
ripples(search,to0x(sancolor))
local color={
  txtcolor="#080808",
  imagecolor="#ff33A6B8",
  zhu="#ff58B2DC",
  boqing="#ff91B493",
  back="#FFFCFAF2",
}


local laugh={
  LinearLayout;
  orientation="vertical";
  layout_width="fill";
  layout_height="fill";
  {
    ScrollView;
    layout_width="fill";
    layout_height="fill";
    backgroundColor=backcolor;
    verticalScrollBarEnabled=false,--隐藏纵向滑条
    {
      LinearLayout;
      orientation="vertical";
      layout_width="fill";
      layout_height="fill";
      {
        LinearLayout;
        layout_height="wrap";
        layout_width="fill";
        layout_marginTop="8dp";
        {
          TextView;
          layout_width="18%w";
          id="ti1";
          layout_margin="12dp";
          layout_height="fill";
          gravity="center";
          textSize="18";
          text="应用设置";
          textColor=color["txtcolor"];

        };
      };
      {
        LinearLayout;
        layout_width="fill";
        layout_height="12%w";
        id="se1";
        {
          LinearLayout;
          layout_width="12%w";
          layout_height="fill";
          gravity="center";

          {
            ImageView;
            layout_width="25dp";
            scaleType="fitCenter";
            src="drawable/savo.png";
            layout_marginLeft="20dp";
            layout_height="25dp";
            colorFilter=color["imagecolor"];
          };
        };
        {
          LinearLayout;
          layout_height="fill";
          layout_width="fill";

          {
            TextView;
            layout_width="30%w";
            layout_height="fill";
            textSize="16";
            singleLine="true";
            gravity="center";
            text="导出所有笔记";
            textColor=color["txtcolor"];

          };
        };
      };
      {
        LinearLayout;
        layout_height="12%w";
        layout_width="fill";
        id="se2";
        {
          LinearLayout;
          layout_width="12%w";
          layout_height="fill";
          gravity="center";
          {
            ImageView;
            layout_width="25dp";
            scaleType="fitCenter";
            src="drawable/poin.png";
            layout_marginLeft="20dp";
            layout_height="25dp";
            colorFilter=color["imagecolor"];
          };
        };
        {
          LinearLayout;
          layout_height="fill";
          layout_width="fill";
          {
            TextView;
            layout_width="30%w";
            layout_height="fill";
            textSize="16";
            singleLine="true";
            gravity="center";
            text="导入Md文档  ";
            textColor=color["txtcolor"];
          };
        };
      };

      {
        LinearLayout;
        orientation="vertical";
        layout_height="12%w";
        layout_width="fill";
        {
          LinearLayout;
          {
            TextView;
            layout_width='74%w';
            layout_height='60dp';
            gravity='left|center';
            textColor="#FF222222";
            text='启用瀑布流显示';
            layout_marginLeft="6%w";
            layout_marginTop='0dp';
            textSize='16';
            --   style="?android:attr/buttonBarButtonStyle";
          };
          {
            Switch;
            layout_marginTop='0dp';
            id="ispubu";
          };
        };
      };
      {
        LinearLayout;
        orientation="vertical";
        layout_height='60dp';
        layout_width="fill";
        {
          LinearLayout;
          {
            TextView;
            layout_width='74%w';
            layout_height='60dp';
            gravity='left|center';
            textColor="#FF222222";
            text='自动保存操作';
            layout_marginLeft="6%w";
            layout_marginTop='0dp';
            textSize='16';
            --   style="?android:attr/buttonBarButtonStyle";
          };
          {
            Switch;
            layout_marginTop='0dp';
            id="issave";
          };
        };
      };


      -----------+++----+++++-----
      {
        LinearLayout;
        layout_height="wrap";
        layout_width="fill";
        layout_marginTop="8dp";
        {
          TextView;
          layout_width="18%w";
          id="ti2";
          layout_margin="12dp";
          layout_height="fill";
          gravity="center";
          textSize="18";
          text="网络配置";
          textColor=color["txtcolor"];

        };
      };
      {
        LinearLayout;
        layout_width="fill";
        layout_height="12%w";
        id="se3";
        {
          LinearLayout;
          layout_width="12%w";
          layout_height="fill";
          gravity="center";

          {
            ImageView;
            layout_width="22dp";
            scaleType="fitCenter";
            src="drawable/cloud.png";
            layout_marginLeft="20dp";
            layout_height="22dp";
            colorFilter=color["imagecolor"];
          };
        };
        {
          LinearLayout;
          layout_height="fill";
          layout_width="fill";

          {
            TextView;
            layout_width="30%w";
            layout_height="fill";
            textSize="16";
            singleLine="true";
            gravity="center";
            text="Webdav同步";
            textColor=color["txtcolor"];

          };
        };
      };
      {
        LinearLayout;
        layout_height="wrap";
        layout_width="fill";
        layout_marginTop="8dp";
        {
          TextView;
          layout_width="18%w";
          id="ti3";
          layout_margin="12dp";
          layout_height="fill";
          gravity="center";
          textSize="18";
          text="其他信息";
          textColor=color["txtcolor"];

        };
      };
      {
        LinearLayout;
        layout_width="fill";
        layout_height="12%w";
        id="se4";
        {
          LinearLayout;
          layout_width="12%w";
          layout_height="fill";
          gravity="center";

          {
            ImageView;
            layout_width="25dp";
            scaleType="fitCenter";
            src="drawable/about.png";
            layout_marginLeft="20dp";
            layout_height="25dp";
            colorFilter=color["imagecolor"];
          };
        };
        {
          LinearLayout;
          layout_height="fill";
          layout_width="fill";

          {
            TextView;
            layout_width="30%w";
            layout_height="fill";
            textSize="16";
            singleLine="true";
            gravity="center";
            text="关于作者      ";
            textColor=color["txtcolor"];
          };
        };
      };
    };
  };

};


mainlays.addView(loadlayout(laugh))
import "android.graphics.Paint"
title.getPaint().setFakeBoldText(true)
ti1.getPaint().setFakeBoldText(true)
ti2.getPaint().setFakeBoldText(true)
ti3.getPaint().setFakeBoldText(true)
import "android.content.res.ColorStateList"
local function rippleup(id,lx,color)
  xpcall(function()
    ripple = activity.obtainStyledAttributes({android.R.attr.selectableItemBackgroundBorderless}).getResourceId(0,0)
    ripples = activity.obtainStyledAttributes({android.R.attr.selectableItemBackground}).getResourceId(0,0)
    for index,content in ipairs(id) do
      if lx=="r" then--圆形
        content.setBackgroundDrawable(activity.Resources.getDrawable(ripple).setColor(ColorStateList(int[0].class{int{}},int{color})))
      end
      if lx=="s" then--方形
        content.setBackgroundDrawable(activity.Resources.getDrawable(ripples).setColor(ColorStateList(int[0].class{int{}},int{color})))
      end
    end
  end,function(e)end)
end
--ripples(se1,to0x(imagecolor))
rippleup({se1},"s",to0x(color["imagecolor"]))
rippleup({se2},"s",to0x(color["imagecolor"]))
rippleup({se3},"s",to0x(color["imagecolor"]))
rippleup({se4},"s",to0x(color["imagecolor"]))


local function listenkake(ID,path)
  local function putData(name,key,value)
    this.getApplicationContext().getSharedPreferences(name,0).edit().putString(key,value).apply()--3255-2732
    return true
  end

  local function getData(name,key)--验证
    local data=this.getApplicationContext().getSharedPreferences(name,0).getString(key,nil)--325-5273-2
    return data
  end
  --启动模式选择监听
  if pcall(function()
      path=tostring(path)
      ID.setOnCheckedChangeListener{
        onCheckedChanged=function(g,c)
          if c==true then
            putData("switch",path,"true")
            --   io.open(path,"w+"):write("true"):close()
           else
            -- io.open(path,"w+"):write("false"):close()
            putData("switch",path,"false")
          end
      end}
      if getData("switch",path)=="true" then
        ID.setChecked(true)
       else
        ID.setChecked(false)
      end
    end) then
   else
    print("请开放存储权限")
  end
end

local function cakecolor(ID,Groove,Keys)
  if pcall(function()
      ID.ThumbDrawable.setColorFilter(PorterDuffColorFilter(Groove,PorterDuff.Mode.SRC_ATOP))
      ID.TrackDrawable.setColorFilter(PorterDuffColorFilter(Keys,PorterDuff.Mode.SRC_ATOP))
    end) then else
    print("按钮颜色设置错误")
  end
end


listenkake(issave,"是否保存")
listenkake(ispubu,"是否瀑布")
cakecolor(issave,to0x(color["zhu"]),to0x(color["boqing"]))
cakecolor(ispubu,to0x(color["zhu"]),to0x(color["boqing"]))

se1.onClick=function()
  import"mods.saveout"
  saveouts()
end
se2.onClick=function()
  import"mods.importin"
  task(50,function()
    ChoicePath(Environment.getExternalStorageDirectory().toString(),
    function(path,note)
      --print(path)
      task(400,function()
        importmd(path,note)
      end)
    end)
  end)
end
se3.onClick=function()
  --selectd=1
  activity.newActivity("mods/Wdup",{})
end

--[[
--弹窗布局
local ll={
  LinearLayout;
  orientation="horizontal";
  layout_height="50%h";
  {
    LinearLayout;
    layout_width="fill";
    id="主框架";
    orientation="vertical";
    layout_height="fill";
    {
      ScrollView;
      layout_width="fill";
      verticalScrollBarEnabled=false;
      layout_height="fill";
      {
        LinearLayout;
        layout_width="fill";
        id="滑动框架";
        orientation="vertical";
        layout_height="fill";
        {
          CardView;
          layout_width="fill";
          layout_marginTop="10dp";
          CardBackgroundColor="#ffffffff";
          layout_margin="7dp";
          id="介绍卡片";
          elevation="2dp";
          layout_height="wrap";
          radius="5dp";
          {
            LinearLayout;
            layout_width="fill";
            orientation="vertical";
            layout_height="fill";
            {
              ImageView;
              layout_width="fill";
              scaleType="centerInside";
              src="drawable/code.png";
              layout_margin="5dp";
              layout_height="40%w";
              id="介绍卡片_图片";
            };
            {
              LinearLayout;
              layout_width="fill";
              gravity="right";
              layout_height="wrap";
              {
                TextView;
                layout_width="80%w";
                text=[==[本应用仍在继续完善...
                
]==];
                layout_gravity="right";
                layout_margin="6dp";
                gravity="end";
                layout_height="wrap";
                textColor="#FF8A8A8A";
                textSize="12sp";
              };
            };
          };
        };
        {
          CardView;
          layout_width="fill";
          layout_marginTop="10dp";
          layout_margin="7dp";
          radius="5dp";
          CardBackgroundColor="#ffffffff";
          layout_height="wrap";
          elevation="2dp";
          {
            LinearLayout;
            layout_width="fill";
            backgroundColor="#ffffffff";
            orientation="vertical";
            layout_height="wrap";
            {
              TextView;
              layout_width="fill";
              text="开发者";
              layout_marginLeft="10dp";
              layout_height="45dp";
              gravity="left|center";
              id="Developer_title";
              textColor="#FF56B2DB";
              textSize="15sp";
            };
            {
              LinearLayout;
              layout_width="fill";
              orientation="horizontal";
              layout_height="wrap";
              {
                LinearLayout;
                layout_width="fill";
                backgroundColor="#ffffffff";
                orientation="vertical";
                layout_height="wrap";
                {
                  LinearLayout;
                  layout_width="fill";
                  layout_height="wrap";
                  backgroundColor="#ffffffff";
                  orientation="horizontal";
                  id="Developer02";
                  {
                    CircleImageView;
                    layout_width="40dp";
                    layout_gravity="center";
                    layout_margin="10dp";
                    id="Developer_01";
                    layout_height="40dp";
                  };
                  {
                    LinearLayout;
                    layout_width="fill";
                    orientation="vertical";
                    layout_gravity="center";
                    layout_height="wrap";
                    {
                      TextView;
                      id="Developer_name01";
                      text="洛樱";
                      textColor="#F5141414";
                      textSize="16";
                    };
                    {
                      TextView;
                      text="本应用开发者";
                      id="Developer_info01";
                    };
                  };
                };
              };
            };
          };
        };
      };
    };
  };
};


import "com.dingyi.dialog.BottomDialog"

--创建Dialog弹窗
dialog=BottomDialog(activity)--R.style.BottomDialog)
--设置弹窗布局
dialog.setView(loadlayout(ll))
--设置弹窗位置
dialog.setGravity(Gravity.BOTTOM)
--设置弹窗高度,宽度，最低高度
dialog.setHeight(activity.getHeight()*0.8)
dialog.setMinHeight(activity.getHeight()*0.6)
dialog.setWidth(activity.getWidth())
--设置圆角
dialog.setRadius(20,to0x(color["back"]))
local function setbitmap(ID,address)
  if pcall(function()
      address=tostring(address)
      ID.setImageBitmap(loadbitmap(address))
    end) then
   else
    -- print"图片设置错误"
  end
end
]]
se4.onClick=function()
  --selectd=1
  activity.newActivity("mods/abouts")--跳转页面
  --[[
  task(400,function()
    dialog.show()
    --设置触摸弹窗外部隐藏弹窗
    dialog.setCanceledOnTouchOutside(true);
  end)
setbitmap(Developer_01,"https://i0.hdslb.com/bfs/face/7865ed1e1a9bb699ebed3838b81cda09b0655f8e.jpg")
]]
end
