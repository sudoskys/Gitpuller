{
  LinearLayout;
  orientation="vertical";
  layout_width="fill";
  layout_height="fill";
  {
    LinearLayout;
    background=maincolor;
    elevation="2dp";
    layout_width="fill";
    id="status_bar";
  };

  {
    LinearLayout;
    orientation="horizontal";
    layout_width="fill";
    background=maincolor;
    layout_height="54dp";
    elevation="3dp";
    {
      LinearLayout;
      orientation="horizontal";
      layout_height="fill";
      layout_weight="1";
            {
        CircleImageView;
        layout_margin="10dp";
        layout_height="40dp";
        layout_gravity="center";
        id="ROOTUSER";
        layout_width="40dp";
      };
      {
        TextView;
        layout_marginLeft="4dp";
        text="NO_USER";
        id="title";
        textSize="22sp";
        layout_gravity="center";
        textColor=txtcolor;
        layout_margin="3dp";
      };


      {
        LinearLayout;
        gravity="end";
        layout_gravity="end";
        layout_height="fill";
        layout_width="fill";



        {
          LinearLayout;
          layout_height="fill";
          layout_gravity="center";
          layout_width="24%w";
          layout_margin="10dp";

        };


        {
          LinearLayout;
          gravity="center";
          layout_height="fill";
          layout_width="10%w";
          id="sets";
          {
            ImageView;
            layout_width="25dp";
            src="res/drawable/set.png";
            colorFilter=imagecolor;
            layout_height="25dp";
          };
        };


        {
          LinearLayout;
          gravity="center";
          layout_height="fill";
          layout_width="16%w";
          id="search";
          {
            ImageView;
            layout_width="25dp";
            src="res/drawable/search.png";
            colorFilter=imagecolor;
            layout_height="25dp";
            id="searchs";
          };
        };

      };
    };
  };
  {
    FrameLayout;
    layout_width="fill";
    layout_height="fill";
    {
      LinearLayout;
      orientation="vertical";
      layout_width="fill";
      background="#ffffffff";
      layout_height="fill";
      gravity="center";
      id="mainlays";
      {
        ProgressBar;
        layout_gravity="center";
        layout_height="fill";
        id="loadbar";
      };
      {
        LinearLayout;
        layout_width="fill";
        layout_height="fill";
        orientation="vertical";
        background="#efffffff";
        gravity="center";
        id="nolist";
        {
          ImageView;
          src="res/drawable/nothing.png";
          scaleType="centerInside";
          layout_width="fill";
          layout_height="50%w";
          layout_margin="5dp";
        };
        {
          TextView;
          text="ここは空いている";
          layout_width="wrap";
          gravity="center";
          layout_height="wrap";
          textColor="#EB919191";
          id="reloads";
        };
        --   };--删去下滑刷新，解决冲突

      };
    };
    {
      CardView;
      layout_margin="16dp";
      layout_width="0";
      layout_height="56dp";
      radius="28dp";
      layout_gravity="bottom|right";
      --  backgroundColor=backcolor;
      CardElevation="12px";
      {
        LinearLayout;
        layout_height="fill";
        layout_width="fill";
        gravity="center";
        id="newone";
        {
          ImageView;
          --     src="drawable/add.png";
          layout_height="24dp";
          --     colorFilter=maincolor;
          layout_width="24dp";
        };
      };
    };
  };
};
