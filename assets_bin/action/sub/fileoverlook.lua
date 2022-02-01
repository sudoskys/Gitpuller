
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
  FrameLayout;
  layout_height="match_parent";
  layout_width="match_parent";
  {
    ScrollView;
    layout_height="match_parent";
    layout_width="match_parent";
    {
      LinearLayout;
      layout_width="match_parent";
      orientation="horizontal";
      layout_height="match_parent";
      {
        TextView;
        layout_width="wrap_content";
        layout_height="wrap_content";
        id="行数";
        textSize="16sp";
        gravity="center|right";
      };
      {
        EditText;
        text=[==[--no data]==];
        layout_width="-1";
        layout_height="wrap_content";
        id="edit";
        layout_marginLeft="2px";
        textSize="16sp";
        background="#00ffffff";
        gravity="center|left";
      };
    };
  };
}
))
ROOTUSER.setVisibility(View.GONE)
title.setText(" Filebrow")

downurl,size,title,path,users=...


import"mods.Gitkit"
Github = Git:new("api.github.com",{alwaysrenew=false,debug=true,filemirror="raw.githubusercontent.com"})
Http.get(downurl,cookie,code,header,function(code,content)
  if code==200 then
    loadbar.setVisibility(View.GONE)
    nolist.setVisibility(View.GONE)

    要高亮的代码={
      print=0xf486790,
    }
    import "mods.kit.Axs_plus"--导入模块
    edit.setText(content)
  end
end)

