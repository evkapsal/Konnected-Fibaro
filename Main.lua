fibaro:debug("starting debug");
local thisId= fibaro:getSelfId();
fibaro:debug("id:"..thisId);
local ipaddr= fibaro:getValue(thisId,"IPAddress");
fibaro:debug("IP:"..ipaddr);
local port= fibaro:getValue(thisId, "TCPPort");
fibaro:debug("Port:"..port);
konnected= Net.FHttp(ipaddr, port);
fibaro:log('Device: Running');


--Zone1
zone1response= konnected:GET("/device?pin=1");
local zone1= json.decode(zone1response);
fibaro:debug(zone1[1].state);
local zone1state = zone1[1].state;


if zone1state == 0 then
  fibaro:call(thisId, "setProperty", "ui.doorId.value","Closed")
  fibaro:debug("Zone 1 Door is Closed")
elseif zone1state == 1 then
  fibaro:call(thisId, "setProperty", "ui.doorId.value","Opened")
  fibaro:debug("Zone 1 Door is Opened")
end

--Zone2
zone2response= konnected:GET("/device?pin=2");
local zone2= json.decode(zone2response);
fibaro:debug(zone2[1].state);
local zone2state = zone2[1].state;

if zone2state == 0 then
  fibaro:call(thisId, "setProperty", "ui.motionId.value","Idle")
  fibaro:debug("Zone 2 no motion detected")
elseif zone2state == 1 then
  fibaro:call(thisId, "setProperty", "ui.motionId.value","Detected")
  fibaro:debug("Zone 2 motion detected")
end

--Zone3
zone3response= konnected:GET("/device?pin=5");
local zone3= json.decode(zone3response);
fibaro:debug(zone3[1].state);
local zone3state = zone3[1].state;

if zone3state == 0 then
  fibaro:call(thisId, "setProperty", "ui.balconyId.value","Closed")
  fibaro:debug("Zone 3 Balcony Door is Closed")
elseif zone3state == 1 then
  fibaro:call(thisId, "setProperty", "ui.balconyId.value","Opened")
  fibaro:debug("Zone 3 Balcony Door is Opened")
end

--Zone4
zone4response= konnected:GET("/device?pin=6");
local zone4= json.decode(zone4response);
fibaro:debug(zone4[1].state);
local zone4state = zone4[1].state;

if zone4state == 0 then
  fibaro:call(thisId, "setProperty", "ui.kitchedId.value","Closed")
  fibaro:debug("Zone 4 Kitchen Door is Closed")
elseif zone4state == 1 then
  fibaro:call(thisId, "setProperty", "ui.kitchedId.value","Opened")
  fibaro:debug("Zone 4 Kitchen Door is Opened")
end

--Zone5
zone5response= konnected:GET("/device?pin=7");
local zone5= json.decode(zone5response);
fibaro:debug(zone5[1].state);
local zone5state = zone5[1].state;

if zone5state == 0 then
  fibaro:call(thisId, "setProperty", "ui.bedId.value","Closed")
  fibaro:debug("Zone 5 Bedroom Door is Closed")
elseif zone5state == 1 then
  fibaro:call(thisId, "setProperty", "ui.bedId.value","Opened")
  fibaro:debug("Zone 5 Bedroom Door is Opened")
end

--Zone6
zone6response= konnected:GET("/device?pin=9");
local zone6= json.decode(zone6response);
fibaro:debug(zone6[1].state);
local zone6state = zone6[1].state;

if zone6state == 0 then
  fibaro:call(thisId, "setProperty", "ui.winId.value","Closed")
  fibaro:debug("Zone 6 WC Window is Closed")
elseif zone6state == 1 then
  fibaro:call(thisId, "setProperty", "ui.winId.value","Opened")
  fibaro:debug("Zone 6 WC Window is Opened")
end

fibaro:sleep(3000);
