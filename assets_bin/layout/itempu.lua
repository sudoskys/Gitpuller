{
  LinearLayout;
  orientation="vertical";
  layout_width="50%w",
  gravity="center";
  {
    LinearLayout;
    layout_margin="10dp",
    layout_width="fill";
    
    {
      CardView;
      CardElevation="0px";
      layout_width="fill",
      radius="10dp";
      id="卡片";
      {
        LinearLayout;
        orientation="vertical";
        layout_width="fill";
        padding="8dp";
         id="backitem";
        {
          TextView;
          id="date";
          textSize="16sp";
          layout_marginLeft="8dp";
          text="标题栏";
          style="?android:attr/textStyle";
          layout_marginRight="8dp";
        --  singleLine="true";
        };
        {
          LinearLayout;
          --layout_width="fill";
          layout_marginRight="8dp";
          layout_marginLeft="8dp";
          layout_marginTop="8dp";
          --layout_height="fill";
          orientation="vertical";
          {
            TextView;
            --layout_height="20%w";
            id="textto";
           -- layout_width="fill";
            text="信息丢失";
            --singleLine="true";
          };
          {
            TextView;
            id="likes";
            text="文件类型";
            layout_gravity="end";
            textColor="#FF171717";
            singleLine="true";
          };
          {
            TextView;
            id="roads";
            layout_height="0";
          };
        };
      };
    };
  };
};