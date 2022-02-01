github={}
github.user=function (user)
  return "https://api.github.com/users/"..user
  end
  
 github.repo=function (user)
  return "https://api.github.com/users/"..user.."/repos"
  end