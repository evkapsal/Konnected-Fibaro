fibaro:debug("starting debug");
local thisId= fibaro:getSelfId();
fibaro:debug("id:"..thisId);
local ipaddr= fibaro:getValue(thisId,"IPAddress");
fibaro:debug("IP:"..ipaddr);
local port= fibaro:getValue(thisId, "TCPPort");
fibaro:debug("Port:"..port);
fibaro:log('Device: Running');
fibaro:debug(os.date("%c"))
fibaro:call(thisId, "setProperty", "ui.dtime.value", os.date("%c"));

--ZoneResponse Function

function zoneresponse(ipaddr,port,zonenum)
  konnected= Net.FHttp(ipaddr, port)
  reqstr= "/device?pin=" .. zonenum
  response= konnected:GET(tostring(reqstr))
  while tostring(response) ~= nil
  do
    if (response) then
      zonestate= json.decode(response)
      fibaro:debug("Pin:" .. zonenum .. ",State:" .. tostring(zonestate[1].state))
      return zonestate[1].state
    else
      fibaro:debug("No Response from Konnected" .. tostring(response))
      fibaro:sleep(3000)
    end
  end
end
	

--Zone1
zone1= zoneresponse(ipaddr,port,1);
if (zone1 == 0 or zone1 == 1) then 
  fibaro:debug("Zone Status:"..zone1)
  local zone1state = zone1
  if zone1state == 0 then
    fibaro:call(thisId, "setProperty", "ui.doorId.value","Closed")
    fibaro:debug("Zone 1 Door is Closed")
  elseif zone1state == 1 then
    fibaro:call(thisId, "setProperty", "ui.doorId.value","Opened")
    fibaro:debug("Zone 1 Door is Opened")
  end
else
  fibaro:debug('[ERROR] Invalid JSON:' .. tostring(zone1))
end


--Zone 2
zone2= zoneresponse(ipaddr,port,2);
if (zone2 == 0 or zone2 == 1) then
  fibaro:debug("Zone Status:"..zone2)
  local zone2state = zone2
  if zone2state == 0 then
    fibaro:call(thisId, "setProperty", "ui.motionId.value","Idle")
    fibaro:debug("Zone 2 no motion detected")
  elseif zone2state == 1 then
    fibaro:call(thisId, "setProperty", "ui.motionId.value","Detected")
    fibaro:debug("Zone 2 motion detected")
  end

end

--Zone3
zone3= zoneresponse(ipaddr,port,5);
if (zone3 == 0 or zone3 == 1) then
  fibaro:debug("Zone Status:"..zone3)
  local zone3state = zone3
  if zone3state == 0 then
    fibaro:call(thisId, "setProperty", "ui.balconyId.value","Closed")
    fibaro:debug("Zone 3 Balcony Door is Closed")
  elseif zone3state == 1 then
    fibaro:call(thisId, "setProperty", "ui.balconyId.value","Opened")
    fibaro:debug("Zone 3 Balcony Door is Opened")
  end
else
  fibaro:debug('[ERROR] Invalid JSON:' .. tostring(zone3))
end


--Zone4
zone4= zoneresponse(ipaddr,port,6);
if (zone4 == 0 or zone4 == 1) then 
  fibaro:debug("Zone Status:"..zone4)
  local zone4state = zone4
  if zone4state == 0 then
    fibaro:call(thisId, "setProperty", "ui.kitchedId.value","Closed")
    fibaro:debug("Zone 4 Kitchen Door is Closed")
  elseif zone4state == 1 then
    fibaro:call(thisId, "setProperty", "ui.kitchedId.value","Opened")
    fibaro:debug("Zone 4 Kitchen Door is Opened")
  end
else
  fibaro:debug('[ERROR] Invalid JSON:' .. tostring(zone4))
end


--Zone5
zone5= zoneresponse(ipaddr,port,7);
if (zone5 == 0 or zone5 == 1) then
  fibaro:debug("Zone Status:"..zone5)
  local zone5state = zone5
  if zone5state == 0 then
    fibaro:call(thisId, "setProperty", "ui.bedId.value","Closed")
    fibaro:debug("Zone 5 Bedroom Door is Closed")
  elseif zone5state == 1 then
    fibaro:call(thisId, "setProperty", "ui.bedId.value","Opened")
    fibaro:debug("Zone 5 Bedroom Door is Opened")
  end
else
  fibaro:debug('[ERROR] Invalid JSON:' .. tostring(zone5))
end

--Zone6
zone6= zoneresponse(ipaddr,port,9);
if (zone6 == 0 or zone6 == 1) then
  fibaro:debug("Zone Status:"..zone6)
  local zone6state = zone6
  if zone6state == 0 then
    fibaro:call(thisId, "setProperty", "ui.winId.value","Closed")
    fibaro:debug("Zone 6 Window is Closed")
  elseif zone6state == 1 then
    fibaro:call(thisId, "setProperty", "ui.winId.value","Opened")
    fibaro:debug("Zone 6 Window is Opened")
  end
else
  fibaro:debug('[ERROR] Invalid JSON:' .. tostring(zone6))
end

fibaro:sleep(3000);
