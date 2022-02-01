


_userdo=function()
  local function 圆角(控件,背景色,角度)
    import "android.graphics.drawable.GradientDrawable"
    local gd=GradientDrawable()
    .setShape(GradientDrawable.RECTANGLE)
    .setColor(背景色)
    .setCornerRadii(角度)
    if 控件 then
      控件.setBackgroundDrawable(gd)
    end
    return gd
  end
  --输入对话框
  local input={
    LinearLayout;
    orientation="vertical";
    Focusable=true,
    FocusableInTouchMode=true,
    {
      TextView;
      id="tokend",
      textSize="15sp",
      layout_marginTop="10dp";
      layout_marginLeft="3dp",
      layout_width="80%w";
      layout_gravity="center",
      text="链接至";
    };
    {
      EditText;
      hint="NAME";
      layout_marginTop="5dp";
      layout_width="80%w";
      layout_gravity="center",
      id="users";
      --InputType="textPassword";--设置密码输入

    };
  };

  ding=AlertDialog.Builder(this)
  ding.setTitle("Choose User")
  ding.setView(loadlayout(input))
  ding.setPositiveButton("OK",{onClick=function(v)
      if users.Text then
        putData("set","user",users.Text)
        activity.recreate()--重构activity
      end
  end})
  ding.setNegativeButton("NO",nil)
  local dings=ding.show()
  圆角(dings.getWindow(),0xfffafafa,{16,16,16,16,16,16,16,16})
end