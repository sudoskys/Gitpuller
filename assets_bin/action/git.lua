require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "android.content.*"
import "android.net.Uri"
import "android.graphics.*"
import "android.view.animation.AnimationUtils"
import "android.view.animation.LayoutAnimationController"
import"values.base"


catkey=(activity.getGlobalData().key)
if catkey and catkey==2021/03/27 then--建议在文件中替换自己的比对key
 else
  print("Running error")
  activity.finish()--关闭当前页面
end
local about=
{
  LinearLayout;
  layout_width="fill";
  orientation="vertical";
  layout_height="fill";
  {
    LinearLayout;
    layout_width="fill";
    id="status_bar";
    background=maincolor;
    elevation="2dp";
  };
  {
    LinearLayout;
    layout_width="fill";
    layout_height="54dp";
    elevation="2dp";
    orientation="horizontal";
    background=maincolor;
    {
      LinearLayout;
      layout_width="55dp";
      layout_height="55dp";
      gravity="center";
      id="Sideslip";
      {
        ImageView;
        layout_width="25dp";
        colorFilter=imagecolor;
        src="drawable/back.png";
        layout_height="28dp";
      };
    };
    {
      LinearLayout;
      layout_weight="1";
      orientation="horizontal";
      layout_height="fill";
      {
        TextView;
        textSize="22sp";
        textColor=txtcolor;
        text="开源使用";
        layout_gravity="center";
        id="title";
      };
      {
        TextView;
        textSize="12sp";
        textColor="#ffffffff";
        text="     Thanks for Mlua/Ylua";
        layout_gravity="center";
       layout_width="fill";
      };
    };
  };
  {
    LinearLayout;
    layout_width="fill";
    layout_height="fill";
    orientation="vertical";
    id="主框架";
    {
      LinearLayout;
      layout_width="fill";
      layout_height="fill";
      orientation="vertical";
      {
        ListView;
        layout_height="match_parent";
        VerticalScrollBarEnabled=false;
        layout_width="match_parent";
        backgroundColor="#DFF7F7F7";
        dividerHeight=0;
        id="github_list";
      };
    
    };
    
  };

};


activity.setContentView(loadlayout(about))--设置窗口视图
activity.overridePendingTransition(android.R.anim.fade_in,android.R.anim.fade_out)--淡入淡出
activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS).setStatusBarColor(0xFF56B2DB)


activity.ActionBar.hide()--隐藏标题栏

Sideslip.onClick=function()
  activity.finish()--关闭当前页面
end
local function 波纹(id,颜色)
  import "android.content.res.ColorStateList"
  local attrsArray = {android.R.attr.selectableItemBackgroundBorderless}
  local typedArray =activity.obtainStyledAttributes(attrsArray)
  ripple=typedArray.getResourceId(0,0)
  Pretend=activity.Resources.getDrawable(ripple)
  Pretend.setColor(ColorStateList(int[0].class{int{}},int{颜色}))
  id.setBackground(Pretend.setColor(ColorStateList(int[0].class{int{}},int{颜色})))
end
local function FakeBoldText(ID)
  if pcall(function()
      import "android.graphics.Paint"
      ID.getPaint().setFakeBoldText(true)
    end) then
   else
    print"字体粗化设置出错"
  end
end
local function 浏览器打开(链接)
  if pcall(function()
      import "android.content.Intent"
      import "android.net.Uri"
      viewIntent = Intent("android.intent.action.VIEW",Uri.parse(链接))
      activity.startActivity(viewIntent)
    end) then
   else
    print"抱歉暂无开源地址"
  end
end

local function setbitmap(ID,address)
  if pcall(function()
      address=tostring(address)
      ID.setImageBitmap(loadbitmap(address))
    end) then
   else
    print"图片设置错误"
  end
end


波纹(Sideslip,0x98FFFFFF)


--反馈.onClick=function()
--activity.newActivity("post")--跳转页面
--end





local luoying={
  LinearLayout;
  layout_width="fill";
  {
  LinearLayout;
  layout_width="fill";
  orientation="vertical";
  gravity="center";
  layout_height="wrap";
  {
    CardView;
    layout_width="fill";
    layout_margin="8dp";
    elevation="3dp";
    radius="6dp";
    layout_height="22%w";
    CardBackgroundColor="#ffffffff";
    id="列表card";
    {
      LinearLayout;
      layout_width="fill";
      layout_margin="4dp";
      orientation="horizontal";
      layout_height="fill";
      {
        LinearLayout;
        layout_width="16%w";
        gravity="center";
        layout_height="fill";
        {
          CircleImageView;
          layout_width="40dp";
          layout_margin="10dp";
          layout_height="40dp";
          layout_gravity="center";
          id="pic";
        };
      };
      {
        LinearLayout;
        layout_width="fill";
        gravity="center";
        orientation="vertical";
        layout_height="fill";
        {
          LinearLayout;
          layout_width="fill";
          layout_height="11%w";
          {
            TextView;
            textSize="18sp";
            textColor="#FF222222";
            layout_height="fill";
            gravity="center";
            layout_margin="6dp";
            text="开源工程";
            id="name";
          };
        };
        {
          LinearLayout;
          layout_width="fill";
          layout_height="11%w";
          {
            TextView;
            layout_margin="6dp";
            text="此工程的介绍FF222222FF222222FF222222FF222222";
            id="jianjie";
          };
          {
            TextView;
            layout_width="0";
            layout_height="0";
            id="url";
          };
        };
      }
      };
    };
  };
};



--载入布局事件
data={}
adp=LuaAdapter(activity,data,luoying)
github_list.Adapter=adp
--列表点击事件
--miao_list.onItemLongClick
github_list.onItemClick=function(parent,v,pos,id)
  local links=v.Tag.url.text
  --调用方法
  浏览器打开(links)
end
--长按动画
github_list.onItemLongClick=function(parent,v,pos,id)
end


pics="drawable/review.png"
pic2="drawable/github.png"
piclua="https://avatar.csdnimg.cn/6/0/D/3_fenrir_sun_1553656511.jpg"

adp.add{name="Material_24dp",jianjie="本应用图标来源",pic=loadbitmap(pics),url=""}
adp.add{name="FA工程备份",jianjie="luoying",pic=loadbitmap(pics),url="https://gitee.com/luo-ying2020/FA-backup-tool"}
adp.add{name="小记事",jianjie="Ayaka_Ago",pic=loadbitmap(pics),url=""}
adp.add{name="钉钉平台",jianjie="dingtalk",pic=loadbitmap(pics),url="https://developers.dingtalk.com/document/app/travis-robot"}
adp.add{name="dingyi底部弹窗",jianjie="dingyi",pic=loadbitmap(pics),url=""}
adp.add{name="LuaMarkdown",jianjie="Calvin Rose <calsrose@gmail.com>",pic=loadbitmap(pic2),url=""}
adp.add{name="Lua string.sub截取UTF8",jianjie="菰城茧1990",pic=loadbitmap(piclua),url="https://blog.csdn.net/fenrir_sun/article/details/52232723"}
adp.add{name="图萌",jianjie="提取bitmap的缓存",pic=loadbitmap("https://avatars.githubusercontent.com/u/47238156?v=4"),url="https://github.com/daisukiKaffuChino/TuMeng"}
adp.add{name="Webdav",jianjie="狸猫",pic=loadbitmap("http://q1.qlogo.cn/g?b=qq&nk=762259384&s=640"),url=""}


--    adp=ArrayAdapter(activity,android.R.layout.simple_list_item_1,String(datas))
animation = AnimationUtils.loadAnimation(activity,android.R.anim.slide_in_left)
lac = LayoutAnimationController(animation)
lac.setOrder(LayoutAnimationController.ORDER_NORMAL)
lac.setDelay(0.7)--单位是秒
--    listView.setAdapter(adp)
github_list.setLayoutAnimation(lac)
