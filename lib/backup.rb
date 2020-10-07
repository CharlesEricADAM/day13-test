def like(button)
  client.search("#bonjour_monde", result_type: "recent").take(25).collect.each {|favorites| client.favorite(favorites)} 
end

#Follow last 20 people with #bonjour_monde
def follow(user)
  client.search("#bonjour_monde", result_type: "recent").take(20).collect.each {|name| client.follow(name.user.screen_name)}
end

#Like and follow in live
def stream(event)
exp = ["#bonjour_monde"]
  client.event(track: exp.join(",")) do |object|
    stream(var_like, var_follow)
  end
end

def perform
  strem_all = stream.each {|event| client.filter(event)}
  
end
perform