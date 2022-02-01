--gui
function setbitmap(ID,address)
  if pcall(function()
      address=tostring(address)
      ID.setImageBitmap(loadbitmap(address))
    end) then
   else
    --errord("Unable to set the picture"..address)
  end
end
function 边框圆角(边宽度,边框色,背景色,圆角度)
  import "android.graphics.drawable.GradientDrawable"
  drawable = GradientDrawable()
  drawable.setShape(GradientDrawable.RECTANGLE)
  drawable.setStroke(边宽度,tonumber(边框色))
  drawable.setColor(tonumber(背景色))
  drawable.setCornerRadius(圆角度)
  return drawable
end

function getdeep(str)
  local _,n=str:gsub('/','')
  return n+1
end

function dp2px(dpValue)
  local scale = activity.getResources().getDisplayMetrics().scaledDensity
  return dpValue * scale + 0.5
end