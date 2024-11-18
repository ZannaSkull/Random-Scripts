

local marketplaceService = game:GetService("MarketplaceService")
 
local isSuccessful, info = pcall(marketplaceService.GetProductInfo, marketplaceService, Game.PlaceId)
if isSuccessful then
 
local wh = 'https://discord.com/api/webhooks/1287821403571359859/uTUu5Cv4sI1lGHNKUlRBhA6-yIoHT5QF9SmdwRCQPZ24i1BnEMtP7LnG02Je6yWZ5sxE'
local embed1 = {
       ['title'] = 'Beginning of Message logs on '..info.Name.." at "..tostring(os.date("%m/%d/%y at time %X"))
   }
local a = request({
   Url = wh,
   Headers = {['Content-Type'] = 'application/json'},
   Body = game:GetService("HttpService"):JSONEncode({['embeds'] = {embed1}, ['content'] = ''}),
   Method = "POST"
})
function logMsg(Webhook, Player, Message)
   local embed = {
       ['description'] = Player..": "..Message.."  " ..tostring(os.date("| time %X")) 
   }
   local a = request({
       Url = Webhook,
       Headers = {['Content-Type'] = 'application/json'},
       Body = game:GetService("HttpService"):JSONEncode({['embeds'] = {embed}, ['content'] = ''}),
       Method = "POST"
   })
end
for i,v in pairs(game.Players:GetPlayers()) do
   v.Chatted:Connect(function(msg)
       logMsg(wh, v.Name, msg)
   end)
end
 
game.Players.PlayerAdded:Connect(function(plr)
   plr.Chatted:Connect(function(msg)
       logMsg(wh, plr.Name, msg)
   end)
end)
end