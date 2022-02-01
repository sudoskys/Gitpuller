
--基本
require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
activity.setTitle('LIST')
activity.ActionBar.hide()--隐藏标题栏

--values and your run library
import"mods.runbase"
import"values.url.gits"
import"values.color.softcolor"

set_flagcolor(to0x(maincolor))
activity.setContentView(loadlayout("layout/formal/titlebar"))
--control the vivw item
import "android.graphics.PorterDuffColorFilter"
import "android.graphics.PorterDuff"
import "android.widget.ListView"
import "android.view.animation.AnimationUtils"
import "android.view.animation.LayoutAnimationController"
--import "com.google.android.material.animation.AnimationUtils"

loadbar.IndeterminateDrawable.setColorFilter(PorterDuffColorFilter(to0x(subcolor),PorterDuff.Mode.SRC_ATOP))
mainlays.addView(loadlayout (
{
  FrameLayout,
  -- orientation="vertical",
  layout_width="fill",
  layout_height="fill",
  {
    ListView;
    dividerHeight="0";
    layout_width="fill";
    layout_marginTop="4dp",
    background=backcolor;
    layout_height="fill";
    id="list";
  },
  {
    ProgressBar,
    layout_marginTop="-4dp",
    id="progressbar",
    visibility=8,
    indeterminate=true,
    style="?android:attr/progressBarStyleHorizontal",
    layout_width="fill",
    layout_height="16dp",
    progress=0;
    max=100;
  },
}))
ROOTUSER.setVisibility(View.GONE)
title.setText(" Repo")
progressbar.IndeterminateDrawable.setColorFilter(PorterDuffColorFilter(to0x("#C5CAE9"),PorterDuff.Mode.SRC_ATOP))



--[
import"layout.fileitem"
data={}
adp=LuaAdapter(activity,data,fileitem)
list.Adapter=adp
--]]
animation = AnimationUtils.loadAnimation(activity,android.R.anim.fade_in)
lac = LayoutAnimationController(animation).setOrder(LayoutAnimationController.ORDER_NORMAL).setDelay(0.1)-- as 1s
--listView.setAdapter(adp)
list.setLayoutAnimation(lac)
users,names,textto,roads=...
path=""



------================-==-=--------==-=-=-=-=-=
import"mods.Gitkit"
Github = Git:new("api.github.com",{alwaysrenew=false,debug=true,filemirror="raw.githubusercontent.com"})
data=[]
function PathImage(type)
  if type=="dir" then
    return "drawable/image/folder.png"
   else
    return "drawable/image/file.png"
  end
end

function catrun(result,deep,index,data)
  task(function(result)
    -- table.sort(result,lambda a,b:(rawequal(a.type,"dir")~=rawequal(b.type,"dir") and rawequal(a.type,"dir")) or ((rawequal(a.type,"dir")==rawequal(b.type,"dir")) and a.name<b.name))
    return result
    end,result,function(ls)
    if ls~=nil and ls~="" then
      --ls=luajava.astable(ls,true)
     else
      ls={}
    end
    table.foreach(ls,function(k,v)
      if data and data.next.rotation~=45 then
        data.next.rotation=45
      end
      table.insert(list.adapter.data,index and index+k or #(list.adapter.data)+1,{
        data=cjson.encode({
          path=v.path,
          deep=deep,
          title=v.title,
          size=v.size,
          downurl=v.download_url,
        }),
        title={
          text=tostring(v.name),
        },
        root={
          x=dp2px(deep*6),
        },
        next={
          rotation=0,
          visibility=rawequal(v.type,"dir") and 0 or 4
        },
        now=PathImage(v.type)
      })

    end)
    list.adapter.notifyDataSetChanged()
    progressbar.visibility=8
  end)
end
local function add(p,tab,data)
  Github:RepoContent({i=users,repo=names,path=tab.path},function(con)
    import"mods.kit.gui"
    if con then
      loadbar.setVisibility(View.GONE)
      nolist.setVisibility(View.GONE)
      numb = #con
      progressbar.visibility=0
      for i = 1,numb do
        table.insert(data,con[i])
      end
      --print(dump(datas))
      catrun(con,tab.deep+1,p,data)
      --print(dump(data))
     else
      print("NO repo data")
      loadbar.setVisibility(View.GONE)
    end
  end)

end

local function remove(p,tab)
  local pos=p+1
  local len=0
  while true do
    local data=list.adapter.data[pos]
    local file=cjson.decode(data.data)
    if file.deep>tab.deep then
      table.remove(list.adapter.data,pos)
     else
      break
    end
    len=len+1
  end
  return len
end



Github:RepoContent({i=users,repo=names,path=path},function(con)
  import"mods.kit.gui"
  if con then
    loadbar.setVisibility(View.GONE)
    nolist.setVisibility(View.GONE)
    numb = #con
    progressbar.visibility=0
    for i = 1,numb do
      table.insert(data,con[i])
    end
    --print(dump(data))
    table.sort(data, function(a, b)
      return (rawequal(a.type,"dir")~=rawequal(b.type,"dir") and rawequal(a.type,"dir")) or ((rawequal(a.type,"dir")==rawequal(b.type,"dir")) and a.name<b.name)
    end)
    --table.sort(data,lambda a,b:(rawequal(a.type,"dir")~=rawequal(b.type,"dir") and rawequal(a.type,"dir")) or ((rawequal(a.type,"dir")==rawequal(b.type,"dir")) and a.name<b.name))
    catrun(data,1)
    --print(dump(data))
    --print(dump(data))
   else
    print("NO repo data")
    loadbar.setVisibility(View.GONE)
  end
end)


list.onItemClick=function(l,v,p,i)
  local data=list.adapter.data[i]
  if data.next.visibility==0 then
    if progressbar.visibility==0 then
      return
    end
    if data.next.rotation==0 then
      add(i,cjson.decode(data.data),data)
     else
      local len=remove(i,cjson.decode(data.data))
      if len>0 then
        data.next.rotation=0
      end
      list.adapter.notifyDataSetChanged()
    end
   else
    dos=(cjson.decode(data.data))
    activity.newActivity("action/sub/fileoverlook",{dos.downurl,dos.size,dos.title,dos.path,dos.users})

  end

end


--]]