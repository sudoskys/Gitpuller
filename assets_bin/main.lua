--基本
require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
--导入graphics类
import "android.graphics.PorterDuffColorFilter"
import "android.graphics.Color"
import "android.graphics.PorterDuff"
import "android.content.res.ColorStateList"
import "android.support.v4.widget.*"
import "android.view.animation.AnimationUtils"
import "android.view.animation.LayoutAnimationController"
import "android.content.res.ColorStateList"
--values and run library
import"mods.runbase"
import"values.color.softcolor"

--待办
--优化架构与库文件
--优化首页
--完成设置页与开源声明页
--完成多种文件选择预览
--完成克隆本地功能(右上角本地库)
--精简砍切函数库便于开源
--做开源处理

--预期
--增生api类
--开发提交功能
--gui
activity.setTitle('Github pull')
activity.ActionBar.hide()--隐藏标题栏
set_flagcolor(to0x(maincolor))
activity.setContentView(loadlayout("layout/formal/titlebar"))
loadbar.IndeterminateDrawable.setColorFilter(PorterDuffColorFilter(to0x(subcolor),PorterDuff.Mode.SRC_ATOP))

-------
import"mods.kit.gui"
import"mods.kit.userask"
ROOTUSER.onClick=function()
  _userdo()
end
setbitmap(ROOTUSER,"https://i0.hdslb.com/bfs/face/7865ed1e1a9bb699ebed3838b81cda09b0655f8e.jpg")
import"layout.mainitem"
--prepare
import "android.support.v7.widget.*"
import "com.LuaRecyclerAdapter"
import "com.LuaRecyclerHolder"
import "com.AdapterCreator"
--带v4的Glide
import "com.bumptech.glide.*"
mainlays.addView(loadlayout(
{
  RecyclerView,
  layout_height="fill",
  layout_width="fill",
  background=backcolor,
  id="repolist",
}
))

function setwaterfall(repolist)
  --创建一个适配器对象
  import"mods.waterboat"
  import"mods.runbase"
  datas={}
  adapter=LuaRecyclerAdapter(AdapterCreator({
    getItemCount=function()
      return #datas
    end,
    getItemViewType=function(position)
      return 0
    end,
    onCreateViewHolder=function(parent,viewType)
      local views={}
      holder=LuaRecyclerHolder(loadlayout(itempu,views))
      holder.view.setTag(views)
      return holder
    end,
    onBindViewHolder=function(holder,position)
      view=holder.view.getTag()
      view.date.Text=(SubStringUTF8((datas[position+1]["date"]),1,40))
      view.textto.Text=(SubStringUTF8((datas[position+1]["textto"]),1,100).."...")
      view.roads.Text=(datas[position+1]["roads"])
      view.likes.Text=(datas[position+1]["likes"])
      local function round(边宽度,边框色,背景色,圆角度)
        import "android.graphics.drawable.GradientDrawable"
        drawable = GradientDrawable()
        drawable.setShape(GradientDrawable.RECTANGLE)
        drawable.setStroke(边宽度,tonumber(边框色))
        drawable.setColor(tonumber(背景色))
        drawable.setCornerRadius(圆角度)
        return drawable
      end
      view.卡片.BackgroundDrawable=round(3,to0x(maincolor),to0x(backcolor),14)
      ripples(view.backitem,to0x(maincolor))
      --子项目点击事件
      view.卡片.onClick=function(v)
        local roadt=(datas[position+1]["roads"])
        local titles=(datas[position+1]["date"])
        local texts=(datas[position+1]["textto"])
        local types=(datas[position+1]["likes"])
        task(150,function()
          activity.newActivity("action/sub/listv",{getData("set","user"),titles,roadt})
        end)
        return true
      end
      --子项目里面的控件长按事件
      view.date.onLongClick=function(v)
        print("长按"..v.Text)
        return true
      end
    end,
  }))
  --瀑布流管理器(第一个参数:几行,第二个参数:方向)
  repolist.setLayoutManager(StaggeredGridLayoutManager(2,StaggeredGridLayoutManager.VERTICAL))
  --RecyclerView绑定适配器
  repolist.setAdapter(adapter)
end
--setwaterfall()

--[[
mainlays.addView(loadlayout ( {
  ListView;
  dividerHeight="0";
  layout_width="fill";
  background=backcolor;
  layout_height="fill";
  id="repolist";
}))
datas={}
adp=LuaAdapter(activity,datas,mainitem)
repolist.Adapter=adp
animation = AnimationUtils.loadAnimation(activity,android.R.anim.fade_in)
lac = LayoutAnimationController(animation).setOrder(LayoutAnimationController.ORDER_NORMAL).setDelay(0.4)-- as 1s
--listView.setAdapter(adp)
repolist.setLayoutAnimation(lac)
--]]

------================-==-=--------==-=-=-=-=-=
run=function()
  import"mods.Gitkit"
  Github = Git:new("api.github.com",{alwaysrenew=false,debug=true,filemirror="raw.githubusercontent.com"})
  --主逻辑
  Github:User({i=users},function(con)
    if con then
      --userimg = json["avatar_url"];
      setbitmap(ROOTUSER,con["avatar_url"])
      title.setText(con["login"])
     else
      print("NO user")
    end
  end)
  Github:UserRepo({i=users},function(con)
    import"mods.kit.gui"
    if con then
      --userimg = json["avatar_url"];
      loadbar.setVisibility(View.GONE)
      nolist.setVisibility(View.GONE)
      numb = #con
      --userimg = json["avatar_url"];
      for i = 1,numb do
        -- 提取data中的第i个
        name = con[i]["name"];
        des = con[i]["description"];
        dl = con[i]["downloads_url"];
        table.insert(datas,{
          date=name,
          textto=des,
          likes="",
          roads=dl,
          卡片={BackgroundDrawable=边框圆角(2,to0x(maincolor),to0x(backcolor),14)},
        })
      end
     else
      print("NO repo data")
      loadbar.setVisibility(View.GONE)
    end
  end)
end
---------=====__==_====_

--_userdo()
users=getData("set","user")
if users==nil then
  _userdo()
 else
  function water(repolist)
    require "import"
    Thread.sleep(20)--延迟1000毫秒
    --线程内不能更新UI
    call("setwaterfall",repolist)
    call("run","")
  end
  thread(water,repolist)
end


--[[
repolist.onItemClick=function(l, v, d, p)
  local names=datas[p].date
  local roads=datas[p].roads
  local textto=datas[p].textto
  -- print(names)
  -- print(textto)
  --print(roads)
  activity.newActivity("action/sub/listv",{users,names,roads})
end
--]]
