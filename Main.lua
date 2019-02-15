-- Initiate Variables
fibaro:debug("starting debug");
local thisId= fibaro:getSelfId();
fibaro:debug("id:"..thisId);
local ipaddr= fibaro:getValue(thisId,"IPAddress");
fibaro:debug("IP:"..ipaddr);
local port= fibaro:getValue(thisId, "TCPPort");
fibaro:debug("Port:"..port);
fibaro:log('Konnected: Running');
fibaro:debug(os.date("%c"))
fibaro:call(thisId, "setProperty", "ui.dtime.value", os.date("%c"));

--ZoneResponse Function
function zoneresponse(ipaddr,port)
  konnected= Net.FHttp(ipaddr, port)
  reqstr= "/device"
  response= konnected:GET(tostring(reqstr))
  fibaro:debug("Response:" .. tostring(response))
  if (pcall(function() return json.decode(response) end)) then
	zonestate= json.decode(response)
	return zonestate
  else
	fibaro:debug("No Response from Konnected" .. tostring(response))
    fibaro:log('Konnected: Error');
	fibaro:sleep(3000)
  end
end
	
-- Get Zone States and Update Labels	
zonestate = zoneresponse(ipaddr,port)
for i in pairs(zonestate) do
fibaro:debug("Zone state:" .. tostring(zonestate[i].state) .. ",Pin:" .. tostring(zonestate[i].pin))
	if (zonestate[i].pin == 1) then
		local zone1state = zonestate[i].state
		if zone1state == 0 then
			fibaro:call(thisId, "setProperty", "ui.doorId.value","Closed")
			fibaro:debug("Zone 1 Door is Closed")
		elseif zone1state == 1 then
			fibaro:call(thisId, "setProperty", "ui.doorId.value","Opened")
			fibaro:debug("Zone 1 Door is Opened")
		end
	elseif (zonestate[i].pin == 2) then
		local zone2state = zonestate[i].state
		if zone2state == 0 then
			fibaro:call(thisId, "setProperty", "ui.motionId.value","Idle")
			fibaro:debug("Zone 2 no motion detected")
		elseif zone2state == 1 then
			fibaro:call(thisId, "setProperty", "ui.motionId.value","Detected")
			fibaro:debug("Zone 2 motion detected")
		end
	elseif (zonestate[i].pin == 5) then
		local zone3state = zonestate[i].state
		if zone3state == 0 then
			fibaro:call(thisId, "setProperty", "ui.balconyId.value","Closed")
			fibaro:debug("Zone 3 Balcony Door is Closed")
		elseif zone3state == 1 then
			fibaro:call(thisId, "setProperty", "ui.balconyId.value","Opened")
			fibaro:debug("Zone 3 Balcony Door is Opened")
		end
	elseif (zonestate[i].pin == 6) then
		local zone4state = zonestate[i].state
		if zone4state == 0 then
			fibaro:call(thisId, "setProperty", "ui.kitchedId.value","Closed")
			fibaro:debug("Zone 4 Kitchen Door is Closed")
		elseif zone4state == 1 then
			fibaro:call(thisId, "setProperty", "ui.kitchedId.value","Opened")
			fibaro:debug("Zone 4 Kitchen Door is Opened")
		end
	elseif (zonestate[i].pin == 7) then
		local zone5state = zonestate[i].state
		if zone5state == 0 then
			fibaro:call(thisId, "setProperty", "ui.bedId.value","Closed")
			fibaro:debug("Zone 5 Bedroom Door is Closed")
		elseif zone5state == 1 then
			fibaro:call(thisId, "setProperty", "ui.bedId.value","Opened")
			fibaro:debug("Zone 5 Bedroom Door is Opened")
		end
	elseif (zonestate[i].pin == 9) then
		local zone6state = zonestate[i].state
		if zone6state == 0 then
			fibaro:call(thisId, "setProperty", "ui.winId.value","Closed")
			fibaro:debug("Zone 6 Window is Closed")
		elseif zone6state == 1 then
			fibaro:call(thisId, "setProperty", "ui.winId.value","Opened")
			fibaro:debug("Zone 6 Window is Opened")
		end
	end
end	
fibaro:sleep(2000)
