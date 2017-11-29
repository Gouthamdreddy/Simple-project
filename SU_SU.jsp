<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page errorPage="BEErrorHandler.jsp" %>
<%@page import="java.util.Iterator,java.util.ArrayList,au.com.fujitsu.dslsa.tnd.ovsa.beans.CMNSNSBossResultBean,au.com.fujitsu.dslsa.common.StringTokenUtil,au.com.fujitsu.dslsa.tnd.ovsa.actions.BENtuConfig,java.util.List,java.util.HashMap,java.util.Map,au.com.fujitsu.dslsa.tnd.ovsa.constants.RequestAttributeMapping,au.com.fujitsu.dslsa.tnd.ovsa.constants.GUIParamMapping,au.com.fujitsu.dslsa.tnd.ovsa.constants.BEConstants,au.com.fujitsu.dslsa.common.PropertiesHelper"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	
	String winId = (String) request.getParameter("winId");
	String Ethernet = (String) request.getParameter("Ethernet");
	if(Ethernet==null || Ethernet=="")
	{
	 Ethernet=(String)request.getAttribute("Ethernet");
	}
	System.out.println("Ethernet" + Ethernet);

	System.out.println("winId222" + winId);
	if (winId == null) {
		winId = (String) request.getAttribute("winId");
		System.out.println("winId" + winId);
		
	}
	String exception="true";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>

  <meta charset="UTF-8">
  <title>JointJS HTML Elements</title>

  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">   
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>

  
  
  <script>
   function dialog() {
		$( "#dialog" ).dialog({height: 100,width:300});
				} 
  </script>
  <link rel="stylesheet" type="text/css" href="css/joint.min.css" />
  <script src="js/lodash.min.js"></script>
  <script src="js/backbone-min.js"></script>

  <script src="javascript/contextMenu.js"></script>
  <script src="js/jqueryUI.js"></script>
  <script src="js/joint.min.js"></script>
 <script>
 function popOnClick()
 {
 if(document.getElementById("Ethernet").value=="HPSE")
 window.location = 'EthernetDiagnosticsDirect.jsp';
 else
  window.location = 'BEMainMenu.jsp';
 }
 </script>
 
<style>
.dropdown {
    position: relative;
    display: inline-block;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    overflow: auto;
    border: 2px solid black;
    /*box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);*/
    z-index: 1;
	left: 1300px;
	top: 230px;
	visibility: visible;
}

.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: flex;
    font-family: verdana;
    font-size:24px;
    
}
.dropdown-content a:hover {
    display: flex;
    background-color: #aaaaaa;
    font-weight: bold;
    font-size: 26px;
}



.show {display:block;}

  .link-tools .tool-remove { display: none } 
  
  .backButton {
    //color: black;
    //padding: 12px 16px;
    text-decoration: none;
    //display: block;
    font-family: arial;
    font-size:20px;
	text-alignment:center;
	width:35px;
	align:center;
    
}
  
    

</style>
</head>
<body  onclick="f();"  id="body">
<input type="hidden" name="equipValue" id="equipValue" value="" />  
<input type="hidden" name="redundancyValue" id="redundancyValue" value="" />   
<input type="hidden" name="Ethernet" id="Ethernet" value="<%=Ethernet%>" />  

  <div id="dialog" title="Error Message"  style="visibility:hidden">
  <B>Inconclusive Data,Failed to generate NV Diagram</B>
	<br/><br/>
  <center><button class="backButton" onclick="popOnClick();">    Cancel</button></center>
 </div>
<div id="myholder" >
  <div id="nbnNTU1Dropdown" class="dropdown-content">
	  <a onclick="setportCommands();">Port Commands</a>
      <a onclick="setDeviceCommands();">Device Commands</a>
      <a onclick="setInterfaceCommands();">Interface Commands</a>
      <a onclick="setEFMCommands();">EFM Commands</a>
      <a onclick="setSeriveEndPointCommands();">SeriveEndPoint Commands</a>
      <a onclick="setFaultIsolation();">Fault Isolation</a>
      <a onclick="setSearchServiceImpact();">Search Service Impact</a>
      <a onclick="setVDSLCommands();">VDSL Commands</a>
  </div>
  <div id="nbnNTU2Dropdown" class="dropdown-content" >
      <a onclick="setportCommands();">Port Commands</a>
      <a onclick="setDeviceCommands();">Device Commands</a>
      <a onclick="setInterfaceCommands();">Interface Commands</a>
      <a onclick="setEFMCommands();">EFM Commands</a>
      <a onclick="setSeriveEndPointCommands();">SeriveEndPoint Commands</a>
	  <a onclick="setFaultIsolation();">Fault Isolation</a>
      <a onclick="setSearchServiceImpact();">Search Service Impact</a>
   </div>
    <div id="nonNBNNTU1Dropdown" class="dropdown-content" >
        <a onclick="setportCommands();">Port Commands</a>
      <a onclick="setDeviceCommands();">Device Commands</a>
      <a onclick="setInterfaceCommands();">Interface Commands</a>
      <a onclick="setEFMCommands();">EFM Commands</a>
      <a onclick="setSeriveEndPointCommands();">SeriveEndPoint Commands</a>
	  <a onclick="setFaultIsolation();">Fault Isolation</a>
      <a onclick="setSearchServiceImpact();">Search Service Impact</a>
   </div>
    <div id="nonNBNNTU2Dropdown" class="dropdown-content" >
     <a onclick="setportCommands();">Port Commands</a>
      <a onclick="setDeviceCommands();">Device Commands</a>
      <a onclick="setInterfaceCommands();">Interface Commands</a>
      <a onclick="setEFMCommands();">EFM Commands</a>
      <a onclick="setSeriveEndPointCommands();">SeriveEndPoint Commands</a>
	  <a onclick="setFaultIsolation();">Fault Isolation</a>
      <a onclick="setSearchServiceImpact();">Search Service Impact</a>
   </div>

   <div id="tidNTUDropdown" class="dropdown-content" >
      <a onclick="setportCommands();">Port Commands</a>
      <a onclick="setDeviceCommands();">Device Commands</a>
      <a onclick="setInterfaceCommands();">Interface Commands</a>
      <a onclick="setEFMCommands();">EFM Commands</a>
      <a onclick="setSeriveEndPointCommands();">SeriveEndPoint Commands</a>
      <a onclick="setSearchServiceImpact();">Search Service Impact</a>
      <a onclick="setVDSLCommands();">VDSL Commands</a>
   </div>
   <div id="nbnCloudDropdown" class="dropdown-content" >
		<a onclick="setNBNCommands();">NBN Commands</a>
   </div>
   <div id="nbnREX1Dropdown" class="dropdown-content" >
          <a onclick="setRexSepBundleCommands();">SEP Bundle Commands</a>
          <a onclick="setRexNGBGSBundleCommands();">NGBGS Bundle Commands</a>
          <a onclick="setRexGRECommands();">GRE Commands</a>
          <a onclick="setRexMACAddress();">MAC Address Learnt Per Service</a>
          <a onclick="setRexShowBridgeDomain();">Show Bridge Domain</a>
          <a onclick="setRexGreRouting();">REX GRE Routing</a>
    </div>
    <div id="nbnREX2Dropdown" class="dropdown-content" >
          <a onclick="setRexSepBundleCommands();">SEP Bundle Commands</a>
          <a onclick="setRexNGBGSBundleCommands();">NGBGS Bundle Commands</a>
          <a onclick="setRexGRECommands();">GRE Commands</a>
          <a onclick="setRexMACAddress();">MAC Address Learnt Per Service</a>
          <a onclick="setRexShowBridgeDomain();">Show Bridge Domain</a>
          <a onclick="setRexGreRouting();">REX GRE Routing</a>
    </div>
    <div id="nbnASDropdown" class="dropdown-content" >
      <a onclick="setportCommands();">Port Commands</a>
      <a onclick="setDeviceCommands();">Device Commands</a>
      <a onclick="setInterfaceCommands();">Interface Commands</a>
      <a onclick="setEFMCommands();">EFM Commands</a>
      <a onclick="setSearchServiceImpact();">Search Service Impact</a>
   </div>
    <div id="nonNBNAS1Dropdown" class="dropdown-content" >
      <a onclick="setportCommands();">Port Commands</a>
      <a onclick="setDeviceCommands();">Device Commands</a>
      <a onclick="setInterfaceCommands();">Interface Commands</a>
      <a onclick="setEFMCommands();">EFM Commands</a>
      <a onclick="setSearchServiceImpact();">Search Service Impact</a>
	  </div> 
    <div id="nonNBNAS2Dropdown" class="dropdown-content" >
     <a onclick="setportCommands();">Port Commands</a>
      <a onclick="setDeviceCommands();">Device Commands</a>
      <a onclick="setInterfaceCommands();">Interface Commands</a>
      <a onclick="setEFMCommands();">EFM Commands</a>
      <a onclick="setSearchServiceImpact();">Search Service Impact</a>
   </div>
   <div id="nbnASR1Dropdown" class="dropdown-content" >
      <a onclick="setSepInterfaceCommands();">Interface Commands</a>
      <a onclick="setSepBundleCommands();">Bundle Commands</a>
      <a onclick="setSepEFMCommands();">EFM Loopback Commands</a>
      <a onclick="setSepShowBridgeDomain();">Show Bridge Domain</a>
      <a onclick="setSepMACAddress();">MAC Addresses Learnt Per Service</a>
   </div>
   <div id="nbnASR2Dropdown" class="dropdown-content" >
      <a onclick="setSepInterfaceCommands();">Interface Commands</a>
      <a onclick="setSepBundleCommands();">Bundle Commands</a>
      <a onclick="setSepEFMCommands();">EFM Loopback Commands</a>
      <a onclick="setSepShowBridgeDomain();">Show Bridge Domain</a>
      <a onclick="setSepMACAddress();">MAC Addresses Learnt Per Service</a>
   </div>
   <div id="nbnASR3Dropdown" class="dropdown-content" >
      <a onclick="setSepInterfaceCommands();">Interface Commands</a>
      <a onclick="setSepBundleCommands();">Bundle Commands</a>
      <a onclick="setSepEFMCommands();">EFM Loopback Commands</a>
      <a onclick="setSepShowBridgeDomain();">Show Bridge Domain</a>
      <a onclick="setSepMACAddress();">MAC Addresses Learnt Per Service</a>
   </div>
   <div id="nonNBNASR1Dropdown" class="dropdown-content" >
      <a onclick="setSepInterfaceCommands();">Interface Commands</a>
      <a onclick="setSepBundleCommands();">Bundle Commands</a>
      <a onclick="setSepEFMCommands();">EFM Loopback Commands</a>
      <a onclick="setSepShowBridgeDomain();">Show Bridge Domain</a>
      <a onclick="setSepMACAddress();">MAC Addresses Learnt Per Service</a>
   </div>
   <div id="nonNBNASR2Dropdown" class="dropdown-content" >
      <a onclick="setSepInterfaceCommands();">Interface Commands</a>
      <a onclick="setSepBundleCommands();">Bundle Commands</a>
      <a onclick="setSepEFMCommands();">EFM Loopback Commands</a>
      <a onclick="setSepShowBridgeDomain();">Show Bridge Domain</a>
      <a onclick="setSepMACAddress();">MAC Addresses Learnt Per Service</a>
   </div>
   <div id="nbnMSE1Dropdown" class="dropdown-content">
        <a onclick="globalHardwareCommands();">Global Hardware Commands</a>
        <a onclick="globalUNICKTCommands();">Global UNI/CKT Commands</a>
        <a onclick="globalMPLSCommands();">Global MPLS Commands</a>
        <a onclick="setSearchServiceImpact();">Search Service Impact</a>
   </div>
  <div id="nbnMSE2Dropdown" class="dropdown-content">
        <a onclick="globalHardwareCommands();">Global Hardware Commands</a>
        <a onclick="globalUNICKTCommands();">Global UNI/CKT Commands</a>
        <a onclick="globalMPLSCommands();">Global MPLS Commands</a>
        <a onclick="setSearchServiceImpact();">Search Service Impact</a>
  </div>
  <div id="nbnMSE3Dropdown" class="dropdown-content">
        <a onclick="globalHardwareCommands();">Global Hardware Commands</a>
        <a onclick="globalUNICKTCommands();">Global UNI/CKT Commands</a>
        <a onclick="globalMPLSCommands();">Global MPLS Commands</a>
        <a onclick="setSearchServiceImpact();">Search Service Impact</a>
  </div>
  <div id="nonNBNMSE1Dropdown" class="dropdown-content">
        <a onclick="globalHardwareCommands();">Global Hardware Commands</a>
        <a onclick="globalUNICKTCommands();">Global UNI/CKT Commands</a>
        <a onclick="globalMPLSCommands();">Global MPLS Commands</a>
        <a onclick="setSearchServiceImpact();">Search Service Impact</a>
  </div>
  <div id="nonNBNMSE2Dropdown" class="dropdown-content">
        <a onclick="globalHardwareCommands();">Global Hardware Commands</a>
        <a onclick="globalUNICKTCommands();">Global UNI/CKT Commands</a>
        <a onclick="globalMPLSCommands();">Global MPLS Commands</a>
        <a onclick="setSearchServiceImpact();">Search Service Impact</a>
  </div>
</div>     
    
<script type="text/javascript">

var graph = new joint.dia.Graph;
    
var paper = new joint.dia.Paper({
      el: $('#myholder'),
      width: 4500,
      height: 600,
      model: graph,
      gridSize: 1,
      interactive: false
  });
    
joint.shapes.basic.DecoratedRectZoom = joint.shapes.basic.Generic.extend({
	    markup: '<g class="rotatable"><g class="scalable"><rect/></g><image/><text class="text1"/><text class="text2"/><text class="text3"/></g>',
	    defaults: joint.util.deepSupplement({
            type: 'basic.DecoratedRectZoom',
	        size: { width: 100, height: 60 },
	        attrs: {
	            'rect': { fill: '#FFFFFF', stroke: 'white', width: 5, height: 5 },
                'image': { 'ref-x': 1, 'ref-y': 0.1, ref: 'rect', width: 50, height: 50 }
                 
	        },

	    }, joint.shapes.basic.Generic.prototype.defaults)
	});
        
var zoomIN = new joint.shapes.basic.DecoratedRectZoom({
    position: { x: 120, y: 1 },
    size: { width:5, height: 5},
    attrs: { 
        image: { 'xlink:href': 'nvImages/ZoomIn.png'}
            }
	       });
    
var zoomOUT = new joint.shapes.basic.DecoratedRectZoom({
	   position: { x: 180, y: 1},
	   size: { width:5, height: 5},
       attrs: { 
        image: { 'xlink:href': 'nvImages/ZoomOut.png'}
              }
	       });

 
if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
    
//xmlhttp.open("GET","N6660012Q.xml",false);
//xmlhttp.send();
//xmlDoc=xmlhttp.responseXML;
try
{
var invDoc='<%=session.getAttribute(winId+"invDoc")%>';
xmlDoc=ParseXML(invDoc);
rfsName=xmlDoc.getElementsByTagName("RFSName");
for(var i=0;i<rfsName.length;i++)
    {   
        name=rfsName[i].getAttribute("Name");
        switching=rfsName[i].getAttribute("Switching");
        topology=rfsName[i].getAttribute("Topology");
        topologyType=rfsName[i].getAttribute("TopologyType");
        serviceType=rfsName[i].getAttribute("ServiceType");
        serviceStatus=rfsName[i].getAttribute("ServiceStatus");
        useStatus=rfsName[i].getAttribute("UseStatus");
        rexTraffic=rfsName[i].getAttribute("REXTraffic");
    }
if(serviceStatus.toUpperCase()==="ACTIVE")
    {
        lineColor="#00cc00";
        lagImage="nvImages/lagGreen.png"
		lagFR="nvImages/lagGreenFR.png";
        serviceStatusDisplay="["+serviceStatus+"]";
    }
else if(serviceStatus.toUpperCase()==="CREATED"||serviceStatus.toUpperCase()==="IN PROGRESS")
    {
        lineColor="#4b0082";
        lagImage="nvImages/lagPurple.png"
		lagFR="nvImages/lagPurpleFR.png";
        serviceStatusDisplay="["+serviceStatus+"]";
    }
else if(serviceStatus.toUpperCase()==="CANCELLED"||serviceStatus.toUpperCase()==="DISCOUNTINUED"||serviceStatus.toUpperCase()==="NOT APPLICABLE")
    {
        lineColor="#d41515";
        lagImage="nvImages/lagRed.png"
		lagFR="nvImages/lagRedFR.png";
        serviceStatusDisplay="["+serviceStatus+"]";
    }
else 
    {
        lineColor="#000000";
        lagImage="nvImages/lagBlack.png"
		lagFR="nvImages/lagBlackFR.png";
        serviceStatusDisplay="";
        
    }
joint.shapes.basic.DecoratedRectServiceType= joint.shapes.basic.Generic.extend({
             markup: '<g class="rotatable"><g class="scalable"><rect/></g><image/><text class="text1"/><text class="text2"/><text class="text3"/></g>',
             defaults: joint.util.deepSupplement({
                attrs: {
	               'rect': { fill: '#FFFFFF', stroke: 'white', width: 100, height: 100 },
	               'text': { 'font-size': 24,'font-family':'Arial','font-weight':'bold', text: '', 'ref-x': 60, 'ref-y': 60, ref: 'rect', 'y-alignment': 'left', 'x-alignment': 'middle', fill: 'black' },
                        },
                    }, joint.shapes.basic.Generic.prototype.defaults)
             	});  
joint.shapes.basic.DecoratedRectServiceStatus = joint.shapes.basic.Generic.extend({
             markup: '<g class="rotatable"><g class="scalable"><rect/></g><image/><text class="text1"/><text class="text2"/><text class="text3"/></g>',
             defaults: joint.util.deepSupplement({
                attrs: {
	               'rect': { fill: '#FFFFFF', stroke: 'white', width: 100, height: 100 },
	               'text': { 'font-size': 24,'font-family':'Arial','font-weight':'bold', text: '', 'ref-x': 60, 'ref-y': 60, ref: 'rect', 'y-alignment': 'left', 'x-alignment': 'middle', fill: lineColor },
                        },
                    }, joint.shapes.basic.Generic.prototype.defaults)
             	});    
joint.shapes.basic.DecoratedRectUseStatus = joint.shapes.basic.Generic.extend({
             markup: '<g class="rotatable"><g class="scalable"><rect/></g><image/><text class="text1"/><text class="text2"/><text class="text3"/></g>',
             defaults: joint.util.deepSupplement({
                attrs: {
	               'rect': { fill: '#FFFFFF', stroke: 'white', width: 100, height: 100 },
	               'text': { 'font-size': 20,'font-family':'Arial','font-weight':'bold', text: '', 'ref-x': 60, 'ref-y': 60, ref: 'rect', 'y-alignment': 'left', 'x-alignment': 'middle', fill: 'red' },
                        },
                    }, joint.shapes.basic.Generic.prototype.defaults)
             	});  
    
if(topologyType.toUpperCase()==="TIDTOPOLOGY"){serviceType="FNN";}
    
var serviceTypeNode = new joint.shapes.basic.DecoratedRectServiceType({
                        position: { x: 100, y: 5 },
                        attrs: { 
                                 text: { text:serviceType+" ID: "+name}
                               }
                            });    
var serviceStatusNode = new joint.shapes.basic.DecoratedRectServiceStatus({
                        position: { x: 300, y: 5 },
                        attrs: { 
                                text: { text:serviceStatusDisplay}
                               }
                            });
var useStatusNode = new joint.shapes.basic.DecoratedRectUseStatus({
                        position: { x: 450, y: 5},
                        attrs: { 
                                text: { text:'{'+useStatus+'}'}
                               }
                            });

    
flgNTU=1;
flgREX=1;
flgASR=1;
flgMSE=1;
flgAS=1;
flgADM=1;
flgVPLS=0;
flgEoSDH=0;
flgCloud=0;
arrayOfDevices=[];
arrayDropdown=[];
conArray3ToCloud=false;
//posArray3ToCloud=0;
conArray4ToCloud=true;
    
        
        x=xmlDoc.getElementsByTagName("DeviceData");
      
        for(var counter=0; counter<x.length;counter++)
            {    
                type=x[counter].getAttribute("Type");
                if(type.toUpperCase()==="NTU")
                    {
                            
                        var obj={position:"",equipmentName:"",role:"",type:"",count:"",zPort:"",efmPort:"",custPort:"",uniFNN:"",wanIP:"",avcID:"",aLag:"",zLag:"",aPort:"",primaryTracID:"",fnnType:""};
                                    
                                    
                                    obj.position=(x[counter].getElementsByTagName("Position")[0].childNodes[0].nodeValue);
                                    obj.equipmentName=(x[counter].getElementsByTagName("EquipmentName")[0].childNodes[0].nodeValue);
                                    obj.role=(x[counter].getElementsByTagName("Role")[0].childNodes[0].nodeValue);
                                    obj.type=x[counter].getAttribute("Type");
                                    obj.count=flgNTU;
                                    obj.efmPort=(x[counter].getElementsByTagName('EFMPort')[0].childNodes[0].nodeValue);
                                    obj.custPort=(x[counter].getElementsByTagName('CustPort')[0].childNodes[0].nodeValue);
                                    obj.uniFNN=(x[counter].getElementsByTagName('UniFnn')[0].childNodes[0].nodeValue);
                                    //obj.aLag=(x[counter].getElementsByTagName("AEndLagID")[0].textContent);
                                    //obj.zLag=(x[counter].getElementsByTagName("ZEndLagID")[0].textContent);
                                    obj.fnnType=x[counter].getElementsByTagName('FnnType')[0].childNodes[0].nodeValue
                                    if(x[counter].getElementsByTagName('AEndLagID').length>0)
                                        {
                                             obj.aLag=(x[counter].getElementsByTagName("AEndLagID")[0].textContent);
                                        }
                                    if(x[counter].getElementsByTagName('ZEndLagID').length>0)
                                        {
                                            obj.zLag=(x[counter].getElementsByTagName("ZEndLagID")[0].textContent);
                                        }
                                    if(x[counter].getElementsByTagName('ZPort').length>0)
                                        {
                                            obj.zPort=(x[counter].getElementsByTagName('ZPort')[0].childNodes[0].nodeValue);
                                        }
                                    if(x[counter].getElementsByTagName('WANIP').length>0)
                                        {
                                            obj.wanIP=(x[counter].getElementsByTagName('WANIP')[0].childNodes[0].nodeValue);
                                        }
                                    if(x[counter].getElementsByTagName('AVCID').length>0)
                                        {
                                            obj.avcID=(x[counter].getElementsByTagName('AVCID')[0].childNodes[0].nodeValue);
                                        }
                                    
                                    if(x[counter].getElementsByTagName('APort').length>0)
                                        {
                                            obj.aPort=(x[counter].getElementsByTagName('APort')[0].childNodes[0].nodeValue);
                                        }
                                    
                                    if(x[counter].getElementsByTagName("PrimaryTracID").length>0)
                                        {
                                            obj.primaryTracID=x[counter].getElementsByTagName('PrimaryTracID')[0].textContent;
                                        }
                                    
                                    
                                    arrayOfDevices.push(obj);
                                    flgNTU++;
                                }
                            
                if(type.toUpperCase()==="REX")
                    {
                            
                        var obj={position:"",equipmentName:"",role:"",type:"",count:"",zPort:"",greIP:"",aLag:"",zLag:"",primaryTracID:""};
                                    
                                    
                                    obj.position=(x[counter].getElementsByTagName("Position")[0].childNodes[0].nodeValue);
                                    obj.equipmentName=(x[counter].getElementsByTagName("EquipmentName")[0].childNodes[0].nodeValue);
                                    obj.role=(x[counter].getElementsByTagName("Role")[0].childNodes[0].nodeValue);
                                    obj.type=x[counter].getAttribute("Type");
                                    obj.count=flgREX;
                                    
                                    
                                    obj.greIP=(x[counter].getElementsByTagName('GREIP')[0].childNodes[0].nodeValue);
                                    //obj.aLag=(x[counter].getElementsByTagName("AEndLagID")[0].textContent);
                                    //obj.zLag=(x[counter].getElementsByTagName("ZEndLagID")[0].textContent);
									if(x[counter].getElementsByTagName('AEndLagID').length>0)
                                        {
                                             obj.aLag=(x[counter].getElementsByTagName("AEndLagID")[0].textContent);
                                        }
                                    if(x[counter].getElementsByTagName('ZEndLagID').length>0)
                                        {
                                            obj.zLag=(x[counter].getElementsByTagName("ZEndLagID")[0].textContent);
                                        }
                                    nl = x[counter].getElementsByTagName("PrimaryTracID");
                                    if (nl.length > 0) 
                                        {
                                            obj.primaryTracID=(x[counter].getElementsByTagName('PrimaryTracID')[0].textContent);
                                        }
                                    nl1 = x[counter].getElementsByTagName("ZPort");
                                    if (nl1.length > 0) 
                                        {
                                            obj.zPort=(x[counter].getElementsByTagName('ZPort')[0].childNodes[0].nodeValue);
                                        }
                                    arrayOfDevices.push(obj);
                                    flgREX++;
                    }
                if(type.toUpperCase()==="ASR")
                    {
                            
                        var obj={position:"",equipmentName:"",role:"",type:"",count:"",aPort:"",zPort:"",aLag:"",zLag:""};
                                    
                                    
                                    obj.position=(x[counter].getElementsByTagName("Position")[0].childNodes[0].nodeValue);
                                    obj.equipmentName=(x[counter].getElementsByTagName("EquipmentName")[0].childNodes[0].nodeValue);
                                    obj.role=(x[counter].getElementsByTagName("Role")[0].childNodes[0].nodeValue);
                                    obj.type=x[counter].getAttribute("Type");
                                    obj.count=flgASR;
                                    
                                    //obj.aLag=(x[counter].getElementsByTagName("AEndLagID")[0].textContent);
                                   // obj.zLag=(x[counter].getElementsByTagName("ZEndLagID")[0].textContent);
									
                                    if(x[counter].getElementsByTagName('AEndLagID').length>0)
                                        {
                                             obj.aLag=(x[counter].getElementsByTagName("AEndLagID")[0].textContent);
                                        }
                                    if(x[counter].getElementsByTagName('ZEndLagID').length>0)
                                        {
                                            obj.zLag=(x[counter].getElementsByTagName("ZEndLagID")[0].textContent);
                                        }
                                    if(x[counter].getElementsByTagName("PrimaryTracID").length>0)
                                        {
                                            obj.primaryTracID=x[counter].getElementsByTagName('PrimaryTracID')[0].textContent;
                                        }
                                    if(x[counter].getElementsByTagName('APort').length>0)
                                        {
                                            obj.aPort=(x[counter].getElementsByTagName('APort')[0].childNodes[0].nodeValue);
                                        }
                                    if(x[counter].getElementsByTagName('ZPort').length>0)
                                        {
                                            obj.zPort=(x[counter].getElementsByTagName('ZPort')[0].childNodes[0].nodeValue);
                                        }
                                    arrayOfDevices.push(obj);
                                    
                                    flgASR++;
                    }
                if(type.toUpperCase()==="MSE")
                    {
                            
                        var obj={position:"",equipmentName:"",role:"",type:"",count:"",aPort:"",zPort:"",aLag:"",zLag:"",primaryTracID:""};
                                    
                                    
                                    obj.position=(x[counter].getElementsByTagName("Position")[0].childNodes[0].nodeValue);
                                    obj.equipmentName=(x[counter].getElementsByTagName("EquipmentName")[0].childNodes[0].nodeValue);
                                    obj.role=(x[counter].getElementsByTagName("Role")[0].childNodes[0].nodeValue);
                                    obj.type=x[counter].getAttribute("Type");
                                    obj.count=flgMSE;
                                   
                                    //obj.aLag=(x[counter].getElementsByTagName("AEndLagID")[0].textContent);
                                    //obj.zLag=(x[counter].getElementsByTagName("ZEndLagID")[0].textContent);
                                    if(x[counter].getElementsByTagName('AEndLagID').length>0)
                                        {
                                             obj.aLag=(x[counter].getElementsByTagName("AEndLagID")[0].textContent);
                                        }
                                    if(x[counter].getElementsByTagName('ZEndLagID').length>0)
                                        {
                                            obj.zLag=(x[counter].getElementsByTagName("ZEndLagID")[0].textContent);
                                        }
										
                                    if(x[counter].getElementsByTagName("PrimaryTracID").length>0)
                                        {
                                            obj.primaryTracID=x[counter].getElementsByTagName('PrimaryTracID')[0].textContent;
                                        }
                                    if(x[counter].getElementsByTagName('APort').length>0)
                                        {
                                            obj.aPort=(x[counter].getElementsByTagName('APort')[0].childNodes[0].nodeValue);
                                        }
                                    if(x[counter].getElementsByTagName('ZPort').length>0)
                                        {
                                            obj.zPort=(x[counter].getElementsByTagName('ZPort')[0].childNodes[0].nodeValue);
                                        }
                                    arrayOfDevices.push(obj);
                                    flgMSE++;
                    }
                
                if(type.toUpperCase()==="AS")
                    {
                            
                        var obj={position:"",equipmentName:"",role:"",type:"",count:"",aPort:"",zPort:"",aLag:"",zLag:"",primaryTracID:""};
                                    
                                    
                                    obj.position=(x[counter].getElementsByTagName("Position")[0].childNodes[0].nodeValue);
                                    obj.equipmentName=(x[counter].getElementsByTagName("EquipmentName")[0].childNodes[0].nodeValue);
                                    obj.role=(x[counter].getElementsByTagName("Role")[0].childNodes[0].nodeValue);
                                    obj.type=x[counter].getAttribute("Type");
                                    obj.count=flgAS;
                                    
                                    //obj.aLag=(x[counter].getElementsByTagName("AEndLagID")[0].textContent);
                                    //obj.zLag=(x[counter].getElementsByTagName("ZEndLagID")[0].textContent);
                                    if(x[counter].getElementsByTagName('AEndLagID').length>0)
                                        {
                                             obj.aLag=(x[counter].getElementsByTagName("AEndLagID")[0].textContent);
                                        }
                                    if(x[counter].getElementsByTagName('ZEndLagID').length>0)
                                        {
                                            obj.zLag=(x[counter].getElementsByTagName("ZEndLagID")[0].textContent);
                                        }
                                    if(x[counter].getElementsByTagName("PrimaryTracID").length>0)
                                        {
                                            obj.primaryTracID=x[counter].getElementsByTagName('PrimaryTracID')[0].textContent;
                                        }
                                    if(x[counter].getElementsByTagName('APort').length>0)
                                        {
                                            obj.aPort=(x[counter].getElementsByTagName('APort')[0].childNodes[0].nodeValue);
                                        }
                                    if(x[counter].getElementsByTagName('ZPort').length>0)
                                        {
                                            obj.zPort=(x[counter].getElementsByTagName('ZPort')[0].childNodes[0].nodeValue);
                                        }
                                    arrayOfDevices.push(obj);
                                    flgAS++;
                    }
                if(type.toUpperCase()==="ADM")
                    {
                            
                        var obj={position:"",equipmentName:"",role:"",type:"",count:"",aPort:"",zPort:"",aLag:"",zLag:""};
                                    
                                   
                                    obj.position=(x[counter].getElementsByTagName("Position")[0].childNodes[0].nodeValue);
                                    obj.equipmentName=(x[counter].getElementsByTagName("EquipmentName")[0].childNodes[0].nodeValue);
                                    obj.role=(x[counter].getElementsByTagName("Role")[0].childNodes[0].nodeValue);
                                    obj.type=x[counter].getAttribute("Type");
                                    obj.count=flgADM;
											
                                    
                                    if(x[counter].getElementsByTagName('APort').length>0)
                                        {
                                            obj.aPort=(x[counter].getElementsByTagName('APort')[0].childNodes[0].nodeValue);
                                        }
                                    if(x[counter].getElementsByTagName('ZPort').length>0)
                                        {
                                            obj.zPort=(x[counter].getElementsByTagName('ZPort')[0].childNodes[0].nodeValue);
                                        }
                                    if(x[counter].getElementsByTagName('AEndLagID').length>0)
                                        {
                                             obj.aLag=(x[counter].getElementsByTagName("AEndLagID")[0].textContent);
                                        }
                                    if(x[counter].getElementsByTagName('ZEndLagID').length>0)
                                        {
                                            obj.zLag=(x[counter].getElementsByTagName("ZEndLagID")[0].textContent);
                                        }
                                    if(x[counter].getElementsByTagName("PrimaryTracID").length>0)
                                        {
                                            obj.primaryTracID=x[counter].getElementsByTagName('PrimaryTracID')[0].textContent;
                                        }
                                    arrayOfDevices.push(obj);
                                    flgADM++;
                    }
					
            }
			
								
								
								
			/*----------------------------ZOOM-------------------------------*/							
			graph.addCells(zoomIN,zoomOUT); 	
			/*--------------------------StatusNode---------------------------*/							
			graph.addCells(serviceTypeNode,serviceStatusNode);
			if(!useStatus.toUpperCase()==="-UNDEFINED-")
				{
					graph.addCell(useStatusNode);
				}
 
		}
			
		catch(err) 
			{
			arrayOfDevices=null;
			document.getElementById("dialog").style.visibility="visible";
			dialog();
			} 
			
			
console.log(arrayOfDevices);
array1=[];
array1Cred=[];
array2=[];
array2Cred=[];
array3=[];
array3Cred=[];
array4=[];
array4Cred=[];
arrayNonNBN=[];
arrayNonNBNCred=[];
previousZLag=0;
joint.shapes.basic.DecoratedRect = joint.shapes.basic.Generic.extend({
                   markup: '<g class="rotatable"><g class="scalable"><rect/></g><image/><text class="text1"/><text class="text2"/><text class="text3"/><text class="text4"/></g>',
                   defaults: joint.util.deepSupplement({
                        attrs: {
	                           'rect': { fill: '#FFFFFF', stroke: 'white', width: 100, height: 100 },
	                           'image': { 'ref-x': 10, 'ref-y': 20, ref: 'rect', width: 100, height: 100 }
                               },
                        }, joint.shapes.basic.Generic.prototype.defaults)
	               });
joint.shapes.basic.DecoratedRectCloud = joint.shapes.basic.Generic.extend({
             markup: '<g class="rotatable"><g class="scalable"><rect/></g><image/><text class="text1"/><text class="text2"/><text class="text3"/></g>',
             defaults: joint.util.deepSupplement({
                type: 'basic.DecoratedRectCloud',
	           size: { width: 100, height: 60 },
	           attrs: {
	               'rect': { fill: '#FFFFFF', stroke: 'white', width: 10, height: 10 },
	               'text': { 'font-size': 20, 'font-family':'Arial','font-weight':'bold',text: '', 'ref-x': 80, 'ref-y': 155, ref: 'image', 'y-alignment': 'middle', 'x-alignment': 'middle', fill: 'blue' },
                    'image': { 'ref-x': 1, 'ref-y': 1, ref: 'rect', width: 150, height: 150 }
                        },
                    }, joint.shapes.basic.Generic.prototype.defaults)
             	});
joint.shapes.basic.DecoratedRectText = joint.shapes.basic.Generic.extend({
             markup: '<g class="rotatable"><g class="scalable"><rect/></g><image/><text class="text1"/><text class="text2"/><text class="text3"/></g>',
             defaults: joint.util.deepSupplement({
                attrs: {
	               'rect': { fill: '#FFFFFF', stroke: 'white', width: 100, height: 100 },
	               'text': { 'font-size': 20,'font-family':'Arial','font-weight':'bold', text: '', 'ref-x': 60, 'ref-y': 120, ref: 'rect', 'y-alignment': 'left', 'x-alignment': 'middle', fill: 'blue' },
                        },
                    }, joint.shapes.basic.Generic.prototype.defaults)
             	});
joint.shapes.basic.DecoratedRectLeftPort = joint.shapes.basic.Generic.extend({
             markup: '<g class="rotatable"><g class="scalable"><rect/></g><image/><text class="text1"/><text class="text2"/><text class="text3"/></g>',
             defaults: joint.util.deepSupplement({
                attrs: {
	               'rect': { fill: '#FFFFFF', stroke: 'white', width: 100, height: 100 },
	               'text': { 'font-size': 18, 'font-family':'Arial', text: '', 'ref-x':10, 'ref-y':60, ref: 'image', 'y-alignment': 'right', 'x-alignment': 'right',fill: 'gray' },
                        },
                    }, joint.shapes.basic.Generic.prototype.defaults)
             	});
joint.shapes.basic.DecoratedRectLeftPortLong = joint.shapes.basic.Generic.extend({
             markup: '<g class="rotatable"><g class="scalable"><rect/></g><image/><text class="text1"/><text class="text2"/><text class="text3"/></g>',
             defaults: joint.util.deepSupplement({
                attrs: {
	               'rect': { fill: '#FFFFFF', stroke: 'white', width: 100, height: 100 },
	               'text': { 'font-size': 18, 'font-family':'Arial', text: '', 'ref-x':10, 'ref-y':60, ref: 'image', 'y-alignment': 'right', 'x-alignment': 'right',fill: 'gray' },
                        },
                    }, joint.shapes.basic.Generic.prototype.defaults)
             	});
joint.shapes.basic.DecoratedRectRightPort = joint.shapes.basic.Generic.extend({
             markup: '<g class="rotatable"><g class="scalable"><rect/></g><image/><text class="text1"/><text class="text2"/><text class="text3"/></g>',
             defaults: joint.util.deepSupplement({
                attrs: {
	               'rect': { fill: '#FFFFFF', stroke: 'white', width: 100, height: 100 },
	               'text': { 'font-size': 18,'font-family':'Arial', text: '', 'ref-x':120, 'ref-y':70, ref: 'image', 'y-alignment': 'right', 'x-alignment': 'right',fill: 'gray' },
                        },
                    }, joint.shapes.basic.Generic.prototype.defaults)
             	});
joint.shapes.basic.DecoratedRectRightPortLong = joint.shapes.basic.Generic.extend({
             markup: '<g class="rotatable"><g class="scalable"><rect/></g><image/><text class="text1"/><text class="text2"/><text class="text3"/></g>',
             defaults: joint.util.deepSupplement({
                attrs: {
	               'rect': { fill: '#FFFFFF', stroke: 'white', width: 100, height: 100 },
	               'text': { 'font-size': 18, 'font-family':'Arial',text: '', 'ref-x':160, 'ref-y':70, ref: 'image', 'y-alignment': 'right', 'x-alignment': 'right',fill: 'gray' },
                        },
                    }, joint.shapes.basic.Generic.prototype.defaults)
             	});
joint.shapes.basic.DecoratedRectLag = joint.shapes.basic.Generic.extend({
             markup: '<g class="rotatable"><g class="scalable"><rect/></g><image/><text class="text1"/><text class="text2"/><text class="text3"/></g>',
             defaults: joint.util.deepSupplement({
                type: 'basic.DecoratedRectLag',
	           size: { width: 1000, height: 160 },
	           attrs: {
	               'rect': { fill: '#FFFFFF', stroke: 'white', width: 2000, height: 100 },
	               'image': { 'ref-x': 1, 'ref-y': 1, ref: 'rect', width:200, height: 200 }
                        },
                    }, joint.shapes.basic.Generic.prototype.defaults)
             	});    
joint.shapes.basic.DecoratedRectLagFR = joint.shapes.basic.Generic.extend({
             markup: '<g class="rotatable"><g class="scalable"><rect/></g><image/><text class="text1"/><text class="text2"/><text class="text3"/></g>',
             defaults: joint.util.deepSupplement({
                type: 'basic.DecoratedRectLagFR',
	           size: { width: 1000, height: 160 },
	           attrs: {
	               'image': { 'ref-x': 1, 'ref-y': 1, ref: 'rect', width:200, height: 290 }
                        },
                    }, joint.shapes.basic.Generic.prototype.defaults)
             	});
joint.shapes.basic.DecoratedRectPrimaryTracID = joint.shapes.basic.Generic.extend({
    markup: '<g class="rotatable"><g class="scalable"><rect/></g><image/><text class="text1"/><text class="text2"/><text class="text3"/><text class="text4"/></g>',
    defaults: joint.util.deepSupplement({
        type: 'basic.DecoratedRectTrackID',
	    size: { width: 1, height: 1 },
	    attrs: {
	               'rect': { fill: '#FFFFFF', stroke: 'white', width: 1, height: 1 },
	               'text': { 'font-size': 18, 'font-family':'Arial','letter-spacing':'2px',text: '', 'ref-x': 100, 'ref-y': 100, 'y-alignment': 'right', 'x-alignment': 'middle', fill: 'gray' },
	           },
                }, joint.shapes.basic.Generic.prototype.defaults)
    });   
if(topologyType.toUpperCase()==="NBNTOPOLOGY")
{
    for(i=0;i<arrayOfDevices.length;i++)
        {
        if(arrayOfDevices[i].type.toUpperCase()==="NTU" && arrayOfDevices[i].count==1)
            {
                objDropdown={deviceName:"",id:"",deviceCount:"",xCord:"",yCord:"",eName:""};
                var NTU1 = new joint.shapes.basic.DecoratedRect({
                               position: { x: 100+(parseInt(arrayOfDevices[i].position))*400, y: 410 },
                               attrs: { 
                                        image: { 'xlink:href': 'nvImages/NTU.png'}
                                      }
                                });
                array1.push(NTU1);
                objDropdown.deviceName=arrayOfDevices[i].type.toUpperCase();
                objDropdown.deviceCount=arrayOfDevices[i].count;
				objDropdown.eName=arrayOfDevices[i].equipmentName;
                objDropdown.id=NTU1.id;
                objDropdown.xCord=100+(parseInt(arrayOfDevices[i].position))*400;
                objDropdown.yCord=410;
                arrayDropdown.push(objDropdown);
                var equipName = new joint.shapes.basic.DecoratedRectText({
                               position: { x: 100+(parseInt(arrayOfDevices[i].position))*400, y: 420 },
                               attrs: { 
                                        text: { text: arrayOfDevices[i].equipmentName}
                                      }
                                });
                array1Cred.push(equipName);
                r=arrayOfDevices[i].role.split(' ');
                var role = new joint.shapes.basic.DecoratedRectText({
                               position: { x: 100+(parseInt(arrayOfDevices[i].position))*400, y: 440 },
                               attrs: { 
                                        text: { text: r[r.length-1]}
                                      }
                                });
                array1Cred.push(role);
                var type = new joint.shapes.basic.DecoratedRectText({
                               position: { x: 100+(parseInt(arrayOfDevices[i].position))*400, y: 460 },
                               attrs: { 
                                        text: { text: arrayOfDevices[i].type}
                                      }
                                });
                array1Cred.push(type);
                var uniFNN = new joint.shapes.basic.DecoratedRectText({
                               position: { x: 100+(parseInt(arrayOfDevices[i].position))*400, y: 260 },
                               attrs: { 
                                        text: { text: 'UNI FNN:'+arrayOfDevices[i].uniFNN}
                                      }
                                });
                array1Cred.push(uniFNN);
                var wanIP = new joint.shapes.basic.DecoratedRectText({
                               position: { x: 100+(parseInt(arrayOfDevices[i].position))*400, y: 290 },
                               attrs: { 
                                        text: { text: 'NTU WAN IP:'+arrayOfDevices[i].wanIP}
                                      }
                                });
                array1Cred.push(wanIP);
                
                var nbnCloud=new joint.shapes.basic.DecoratedRectCloud({
                               position: { x: 100+((parseInt(arrayOfDevices[i].position))+1)*400, y: 385 },
                               attrs: { 
                                        text: { text: 'NBN Cloud' },
	                                    image: { 'xlink:href': 'nvImages/CLOUD.png'}
                                      }
                               });
                array1.push(nbnCloud);
                
                objDropdown={deviceName:"",id:"",deviceCount:"",xCord:"",yCord:"",eName:""};
                var telstraASPCloud=new joint.shapes.basic.DecoratedRectCloud({
                               position: { x: 100+((parseInt(arrayOfDevices[i].position))+2)*400, y: 385 },
                               attrs: { 
                                        text: { text: 'Telstra ASP Cloud' },
	                                    image: { 'xlink:href': 'nvImages/CLOUD.png'}
                                      }
                                });
                array1.push(telstraASPCloud);
                objDropdown.deviceName="NBNCLOUD";
                objDropdown.deviceCount=1;
				objDropdown.eName='Telstra ASP Cloud';
                objDropdown.id=telstraASPCloud.id;
                objDropdown.xCord=100+((parseInt(arrayOfDevices[i].position))+2)*400;
                objDropdown.yCord=385;
                arrayDropdown.push(objDropdown);
                var avcID = new joint.shapes.basic.DecoratedRectText({
                               position: { x: 100+((parseInt(arrayOfDevices[i].position))+2)*400, y: 260 },
                               attrs: { 
                                        text: { text:arrayOfDevices[i].avcID}
                                      }
                                });
                array1Cred.push(avcID);
                var leftPort= new joint.shapes.basic.DecoratedRectLeftPort({
                               position: { x: 100+(parseInt(arrayOfDevices[i].position))*400, y: 410 },
                               attrs: { 
                                        text: { text:arrayOfDevices[i].custPort}
                                      }
                                });
                array1Cred.push(leftPort);
                var rightPort= new joint.shapes.basic.DecoratedRectRightPort({
                               position: { x: 100+(parseInt(arrayOfDevices[i].position))*400, y: 410 },
                               attrs: { 
                                        text: { text:arrayOfDevices[i].zPort}
                                      }
                                });
                array1Cred.push(rightPort);
            }
        if(arrayOfDevices[i].type.toUpperCase()==="NTU" && flgVPLS!=0)
            {
                
                if(flgEoSDH==1)
                    {
                      p=100+((parseInt(arrayOfDevices[i].position))+2)*400;  
                    }
                else
                    {
                      p=100+((parseInt(arrayOfDevices[i].position))+1)*400;
                    }
                
								ln=array4.length;
                                if(ln==0)
                                    {
										posArray4ToCloud=p;
                                       if(arrayOfDevices[i].aLag!="")
                                           {
											   conArray4ToCloud=true;
                                               a=arrayOfDevices[i].aLag.split('-');
                                               left_port=a[a.length-1];
                                               right_port=arrayOfDevices[i].custPort;
                                           }
                                        else
                                            {
                                                right_port=arrayOfDevices[i].custPort;
                                            }
                                    }
							else
							{
                                if(arrayOfDevices[i].aLag!="" && previousZLag!=0)
                                    {
                                        p-=100;
                                        a=arrayOfDevices[i].aLag.split('-');
                                        left_port=a[a.length-1];
                                        right_port=arrayOfDevices[i].custPort;
                                        
                                        objNBN={device_name:"",device_pos:"",node:""};
                                        var Lag = new joint.shapes.basic.DecoratedRectLag({
                                                       position: { x: 110+posPrevDev, y: 375 },
                                                       size: { width:100, height: 6},
                                                       attrs: { 
                                                            image: { 'xlink:href': lagImage}
                                                               }
                                                           });
                                        objNBN.device_name="LAG"
                                        objNBN.device_pos=110+posPrevDev;
                                        objNBN.node=Lag;
                                        array4.push(objNBN);
                                        trackID="";
                                        previousZLag=0;
                                    }
                                else
                                    {
                                        left_port=arrayOfDevices[i].efmPort;
                                        right_port=arrayOfDevices[i].custPort;
                                        trackID="";
                                    }
                        
                            }
                        
                        objDropdown={deviceName:"",id:"",deviceCount:"",xCord:"",yCord:"",eName:""};
                        objNBN={device_name:"",device_pos:"",node:""};
                        var NTU = new joint.shapes.basic.DecoratedRect({
                                       position: { x: p, y: 410 },
                                       attrs: { 
                                                image: { 'xlink:href': 'nvImages/NTU.png'}
                                              }
                                        });
                        
                        objNBN.device_name=arrayOfDevices[i].type.toUpperCase();
                        objNBN.device_pos=p;
                        objNBN.node=NTU;
                        array4.push(objNBN);
                        
                        objDropdown.deviceName=arrayOfDevices[i].type.toUpperCase();
                        objDropdown.deviceCount=arrayOfDevices[i].count;
						objDropdown.eName=arrayOfDevices[i].equipmentName;
                        objDropdown.id=NTU.id;
                        objDropdown.xCord=p;
                        objDropdown.yCord=410;
                        arrayDropdown.push(objDropdown);
                        
                        var equipName = new joint.shapes.basic.DecoratedRectText({
                                       position: { x: p, y: 420 },
                                       attrs: { 
                                                text: { text: arrayOfDevices[i].equipmentName}
                                              }
                                        });
                        array4Cred.push(equipName);
                        r=arrayOfDevices[i].role.split(' ');
                        var role = new joint.shapes.basic.DecoratedRectText({
                                       position: { x: p, y: 440 },
                                       attrs: { 
                                                text: { text: r[r.length-1]}
                                              }
                                        });
                        array4Cred.push(role);
                        var type = new joint.shapes.basic.DecoratedRectText({
                                       position: { x: p, y: 460 },
                                       attrs: { 
                                                text: { text: arrayOfDevices[i].type}
                                              }
                                        });
                        array4Cred.push(type);
                        if(arrayOfDevices[i].fnnType.toUpperCase()==="ENNI"){enni=arrayOfDevices[i].fnnType;}
                        else{enni="UNI";}
                        var uniFNN = new joint.shapes.basic.DecoratedRectText({
                                       position: { x: p, y: 260 },
                                       attrs: { 
                                                text: { text: enni+" FNN:"+arrayOfDevices[i].uniFNN}
                                              }
                                        });
                        array4Cred.push(uniFNN);
                        
                        
                    
                        var leftPort= new joint.shapes.basic.DecoratedRectLeftPort({
                                       position: { x: p, y: 410 },
                                       attrs: { 
                                                text: { text:left_port}
                                              }
                                        });
                        array4Cred.push(leftPort);
                        var rightPort= new joint.shapes.basic.DecoratedRectRightPort({
                                       position: { x: p, y: 410 },
                                       attrs: { 
                                                text: { text:arrayOfDevices[i].custPort}
                                              }
                                        });
                        array4Cred.push(rightPort);
                        var primaryTrac = new joint.shapes.basic.DecoratedRectPrimaryTracID({
                                       position: { x: 150+p, y: 380 },
                                       attrs: { 
                                                text: { text:trackID}
                                              }
                                        });
                        array4Cred.push(primaryTrac);
                        posPrevDev=p;
                
              
            }
       
        
        
        
    if(arrayOfDevices[i].type.toUpperCase()==="REX" && arrayOfDevices[i].count==1)
            {
                objDropdown={deviceName:"",id:"",deviceCount:"",xCord:"",yCord:"",eName:""};
				obj={name:"",node:""};
                var REX1 = new joint.shapes.basic.DecoratedRect({
                               position: { x: 100+((parseInt(arrayOfDevices[i].position))+2)*400, y: 410 },
                               attrs: { 
                                        image: { 'xlink:href': 'nvImages/REX1.png'}
                                      }
                                });
				obj.name="REX";
				obj.node=REX1;
                array2.push(obj);
                objDropdown.deviceName=arrayOfDevices[i].type.toUpperCase();
                objDropdown.deviceCount=arrayOfDevices[i].count;
				objDropdown.eName=arrayOfDevices[i].equipmentName;
                objDropdown.id=REX1.id;
                objDropdown.xCord=100+((parseInt(arrayOfDevices[i].position))+2)*400;
                objDropdown.yCord=410;
                arrayDropdown.push(objDropdown);
                var equipName = new joint.shapes.basic.DecoratedRectText({
                               position: { x: 100+((parseInt(arrayOfDevices[i].position))+2)*400, y: 420 },
                               attrs: { 
                                        text: { text: arrayOfDevices[i].equipmentName}
                                      }
                                });
                array2Cred.push(equipName);
                
                var role = new joint.shapes.basic.DecoratedRectText({
                               position: { x: 100+((parseInt(arrayOfDevices[i].position))+2)*400, y: 440 },
                               attrs: { 
                                        text: { text:arrayOfDevices[i].role }
                                      }
                                });
                array2Cred.push(role);
                var type = new joint.shapes.basic.DecoratedRectText({
                               position: { x: 100+((parseInt(arrayOfDevices[i].position))+2)*400, y: 460 },
                               attrs: { 
                                        text: { text: arrayOfDevices[i].type}
                                      }
                                });
                array2Cred.push(type);
                
                var greIP = new joint.shapes.basic.DecoratedRectText({
                               position: { x: 100+((parseInt(arrayOfDevices[i].position))+2)*400, y: 290 },
                               attrs: { 
                                        text: { text: 'REX TUNNEL IP:'+arrayOfDevices[i].greIP}
                                      }
                                });
                array2Cred.push(greIP);
                if(arrayOfDevices[i].zLag!="")
                    {
                        z=arrayOfDevices[i].zLag.split('-');
                        z1=z[z.length-1];
                        if(z1.length>=2)
                            {
                                var rightPort= new joint.shapes.basic.DecoratedRectRightPortLong({
                                       position: { x: 100+((parseInt(arrayOfDevices[i].position))+2)*400, y: 420 },
                                       attrs: { 
                                                text: { text:z1}
                                              }
                                        });
                                    array2Cred.push(rightPort);
                            }
                        else
                            {
                                var rightPort= new joint.shapes.basic.DecoratedRectRightPort({
                                       position: { x: 100+((parseInt(arrayOfDevices[i].position))+2)*400, y: 420 },
                                       attrs: { 
                                                text: { text:z1}
                                              }
                                        });
                                    array2Cred.push(rightPort);
                            }

                
						obj={name:"",node:""};
                        var Lag = new joint.shapes.basic.DecoratedRectLag({
	                                   position: { x: 204+((parseInt(arrayOfDevices[i].position))+2)*400, y: 380 },
	                                   size: { width:100, height: 6},
                                       attrs: { 
                                            image: { 'xlink:href': lagImage}
                                               }
	                                       });
						obj.name="LAG";
						obj.node=Lag;
                        array2.push(obj);
                    }
                else
                    {
                        z=arrayOfDevices[i].zPort;
                        z1=z[z.length-1];
                        if(z1.length>=2)
                            {
                                var rightPort= new joint.shapes.basic.DecoratedRectRightPortLong({
                                       position: { x: 100+((parseInt(arrayOfDevices[i].position))+2)*400, y: 420 },
                                       attrs: { 
                                                text: { text:z1}
                                              }
                                        });
                                    array2Cred.push(rightPort);
                            }
                        else
                            {
                                var rightPort= new joint.shapes.basic.DecoratedRectRightPort({
                                       position: { x: 100+((parseInt(arrayOfDevices[i].position))+2)*400, y: 420 },
                                       attrs: { 
                                                text: { text:z1}
                                              }
                                        });
                                    array2Cred.push(rightPort);
                            }
                         var primaryTrac = new joint.shapes.basic.DecoratedRectPrimaryTracID({
                                       position: { x: 350+((parseInt(arrayOfDevices[i].position))+2)*400, y: 380 },
                                       attrs: { 
                                                text: { text:arrayOfDevices[i].primaryTracID}
                                              }
                                        });
                                    array2Cred.push(primaryTrac);
                    }
                
            }
    if(arrayOfDevices[i].type.toUpperCase()==="REX" && arrayOfDevices[i].count==2)
            {
                objDropdown={deviceName:"",id:"",deviceCount:"",xCord:"",yCord:"",eName:""};
                var REX2 = new joint.shapes.basic.DecoratedRect({
                               position: { x: 100+((parseInt(arrayOfDevices[i].position))+1)*400, y: 130 },
                               attrs: { 
                                        image: { 'xlink:href': 'nvImages/REX1.png'}
                                      }
                                });
                array3.push(REX2);
                objDropdown.deviceName=arrayOfDevices[i].type.toUpperCase();
                objDropdown.deviceCount=arrayOfDevices[i].count;
				objDropdown.eName=arrayOfDevices[i].equipmentName;
                objDropdown.id=REX2.id;
                objDropdown.xCord=100+((parseInt(arrayOfDevices[i].position))+1)*400;
                objDropdown.yCord=130;
                arrayDropdown.push(objDropdown);
                var equipName = new joint.shapes.basic.DecoratedRectText({
                               position: { x: 100+((parseInt(arrayOfDevices[i].position))+1)*400, y: 130 },
                               attrs: { 
                                        text: { text: arrayOfDevices[i].equipmentName}
                                      }
                                });
                array3Cred.push(equipName);
                
                var role = new joint.shapes.basic.DecoratedRectText({
                               position: { x: 100+((parseInt(arrayOfDevices[i].position))+1)*400, y: 150 },
                               attrs: { 
                                        text: { text:arrayOfDevices[i].role }
                                      }
                                });
                array3Cred.push(role);
                var type = new joint.shapes.basic.DecoratedRectText({
                               position: { x: 100+((parseInt(arrayOfDevices[i].position))+1)*400, y: 170 },
                               attrs: { 
                                        text: { text: arrayOfDevices[i].type}
                                      }
                                });
                array3Cred.push(type);
                
                var greIP = new joint.shapes.basic.DecoratedRectText({
                               position: { x: 100+((parseInt(arrayOfDevices[i].position))+1)*400, y: 10 },
                               attrs: { 
                                        text: { text: 'REX TUNNEL IP:'+arrayOfDevices[i].greIP}
                                      }
                                });
                array3Cred.push(greIP);
                if(arrayOfDevices[i].zLag!="")
                    {
                        z=arrayOfDevices[i].zLag.split('-');
                        z1=z[z.length-1];
                        if(z1.length>=2)
                            {
                                var rightPort= new joint.shapes.basic.DecoratedRectRightPortLong({
                                       position: { x: 100+((parseInt(arrayOfDevices[i].position))+1)*400, y: 140 },
                                       attrs: { 
                                                text: { text:z1}
                                              }
                                        });
                                    array3Cred.push(rightPort);
                            }
                        else
                            {
                                var rightPort= new joint.shapes.basic.DecoratedRectRightPort({
                                       position: { x: 100+((parseInt(arrayOfDevices[i].position))+1)*400, y: 140 },
                                       attrs: { 
                                                text: { text:z1}
                                              }
                                        });
                                    array3Cred.push(rightPort);
                            }
                        var Lag = new joint.shapes.basic.DecoratedRectLag({
	                                   position: { x: 204+((parseInt(arrayOfDevices[i].position))+1)*400, y: 100 },
	                                   size: { width:100, height: 6},
                                       attrs: { 
                                            image: { 'xlink:href': lagImage}
                                               }
	                                       });
                        array3.push(Lag);
                        
                        }
                else
                    {
                        z=arrayOfDevices[i].zPort;
                        z1=z[z.length-1];
                        if(z1.length>=2)
                            {
                                var rightPort= new joint.shapes.basic.DecoratedRectRightPortLong({
                                       position: { x: 100+((parseInt(arrayOfDevices[i].position))+1)*400, y: 140 },
                                       attrs: { 
                                                text: { text:z1}
                                              }
                                        });
                                    array3Cred.push(rightPort);
                            }
                        else
                            {
                                var rightPort= new joint.shapes.basic.DecoratedRectRightPort({
                                       position: { x: 100+((parseInt(arrayOfDevices[i].position))+1)*400, y: 140 },
                                       attrs: { 
                                                text: { text:z1}
                                              }
                                        });
                                    array3Cred.push(rightPort);
                            }
                        var primaryTrac = new joint.shapes.basic.DecoratedRectPrimaryTracID({
                                       position: { x: 350+((parseInt(arrayOfDevices[i].position))+1)*400, y: 100 },
                                       attrs: { 
                                                text: { text:arrayOfDevices[i].primaryTracID}
                                              }
                                        });
                                    array3Cred.push(primaryTrac);
                    }
                
            }
           
    if(arrayOfDevices[i].type.toUpperCase()==="ASR" && arrayOfDevices[i].count==1 && flgVPLS==0)
            {
                objDropdown={deviceName:"",id:"",deviceCount:"",xCord:"",yCord:"",eName:""};
				obj={name:"",node:""};
                var ASR1 = new joint.shapes.basic.DecoratedRect({
                               position: { x: ((parseInt(arrayOfDevices[i].position))+3)*400, y: 410 },
                               attrs: { 
                                        image: { 'xlink:href': 'nvImages/ASR.png'}
                                      }
                                });
				obj.name="ASR";
				obj.node=ASR1;
                array2.push(obj);
                objDropdown.deviceName=arrayOfDevices[i].type.toUpperCase();
                objDropdown.deviceCount=arrayOfDevices[i].count;
				objDropdown.eName=arrayOfDevices[i].equipmentName;
                objDropdown.id=ASR1.id;
                objDropdown.xCord=((parseInt(arrayOfDevices[i].position))+3)*400;
                objDropdown.yCord=410;
                arrayDropdown.push(objDropdown);
                var equipName = new joint.shapes.basic.DecoratedRectText({
                               position: { x: ((parseInt(arrayOfDevices[i].position))+3)*400, y: 420 },
                               attrs: { 
                                        text: { text: arrayOfDevices[i].equipmentName}
                                      }
                                });
                array2Cred.push(equipName);
                r=arrayOfDevices[i].role.split(' ');
                var role = new joint.shapes.basic.DecoratedRectText({
                               position: { x: ((parseInt(arrayOfDevices[i].position))+3)*400, y: 440 },
                               attrs: { 
                                        text: { text:r[r.length-1] }
                                      }
                                });
                array2Cred.push(role);
                var type = new joint.shapes.basic.DecoratedRectText({
                               position: { x: ((parseInt(arrayOfDevices[i].position))+3)*400, y: 460 },
                               attrs: { 
                                        text: { text: arrayOfDevices[i].type}
                                      }
                                });
                array2Cred.push(type);
                
                
                if(arrayOfDevices[i].aLag!="")
                    {
                        a=arrayOfDevices[i].aLag.split('-');
                        a1=a[a.length-1];
                        if(a1.length>=2)
                            {
                                var leftPort= new joint.shapes.basic.DecoratedRectLeftPortLong({
                                       position: { x: ((parseInt(arrayOfDevices[i].position))+3)*400, y: 430 },
                                       attrs: { 
                                                text: { text:a1}
                                              }
                                        });
                                    array2Cred.push(leftPort);
                            }
                        else
                            {
                                var leftPort= new joint.shapes.basic.DecoratedRectLeftPort({
                                       position: { x: ((parseInt(arrayOfDevices[i].position))+3)*400, y: 430 },
                                       attrs: { 
                                                text: { text:a1}
                                              }
                                        });
                                    array2Cred.push(leftPort);
                            }
                    }
                else
                    {
                        a=arrayOfDevices[i].aPort.substr(7);
                        a1=a[a.length-1];
                        if(a1.length>=2)
                            {
                                var leftPort= new joint.shapes.basic.DecoratedRectLeftPortLong({
                                       position: { x: ((parseInt(arrayOfDevices[i].position))+3)*400, y: 430 },
                                       attrs: { 
                                                text: { text:a1}
                                              }
                                        });
                                    array2Cred.push(leftPort);
                            }
                        else
                            {
                                var leftPort= new joint.shapes.basic.DecoratedRectLeftPort({
                                       position: { x: ((parseInt(arrayOfDevices[i].position))+3)*400, y: 430 },
                                       attrs: { 
                                                text: { text:a1}
                                              }
                                        });
                                    array2Cred.push(leftPort);
                            }
                    }
					
				if(arrayOfDevices[i].zLag!="")
                    {
                        z=arrayOfDevices[i].zLag.split('-');
                        z1=z[z.length-1];
                        if(z1.length>=2)
                            {
                                var rightPort= new joint.shapes.basic.DecoratedRectRightPortLong({
                                       position: { x: 100+((parseInt(arrayOfDevices[i].position))+3)*400, y: 420 },
                                       attrs: { 
                                                text: { text:z1}
                                              }
                                        });
                                    array2Cred.push(rightPort);
                            }
                        else
                            {
                                var rightPort= new joint.shapes.basic.DecoratedRectRightPort({
                                       position: { x: 100+((parseInt(arrayOfDevices[i].position))+3)*400, y: 420 },
                                       attrs: { 
                                                text: { text:z1}
                                              }
                                        });
                                    array2Cred.push(rightPort);
                            }

                
						obj={name:"",node:""};
                        var Lag = new joint.shapes.basic.DecoratedRectLag({
	                                   position: { x: 204+((parseInt(arrayOfDevices[i].position))+3)*400, y: 380 },
	                                   size: { width:100, height: 6},
                                       attrs: { 
                                            image: { 'xlink:href': lagImage}
                                               }
	                                       });
						obj.name="LAG";
						obj.node=Lag;
                        array2.push(obj);
                    }
			   obj={name:"",node:""};
               var VPLSCloud=new joint.shapes.basic.DecoratedRectCloud({
                               position: { x: ((parseInt(arrayOfDevices[i].position))+4)*400, y: 385 },
                               attrs: { 
                                        text: { text: 'VPLS Cloud' },
	                                    image: { 'xlink:href': 'nvImages/CLOUD.png'}
                                      }
                                });
				obj.name="CLOUD";
				obj.node=VPLSCloud;
                array2.push(obj); 
                flgVPLS++;
            }
        else if(arrayOfDevices[i].type.toUpperCase()==="ASR" && arrayOfDevices[i].count==2 && flgVPLS!=0)
            {
                objDropdown={deviceName:"",id:"",deviceCount:"",xCord:"",yCord:"",eName:""};
                var ASR2 = new joint.shapes.basic.DecoratedRect({
                               position: { x: ((parseInt(arrayOfDevices[i].position))+2)*400, y: 130 },
                               attrs: { 
                                        image: { 'xlink:href': 'nvImages/ASR.png'}
                                      }
                                });
                array3.push(ASR2);
                objDropdown.deviceName=arrayOfDevices[i].type.toUpperCase();
                objDropdown.deviceCount=arrayOfDevices[i].count;
				objDropdown.eName=arrayOfDevices[i].equipmentName;
                objDropdown.id=ASR2.id;
                objDropdown.xCord=((parseInt(arrayOfDevices[i].position))+2)*400;
                objDropdown.yCord=130;
                arrayDropdown.push(objDropdown);
                var equipName = new joint.shapes.basic.DecoratedRectText({
                               position: { x: ((parseInt(arrayOfDevices[i].position))+2)*400, y: 130 },
                               attrs: { 
                                        text: { text: arrayOfDevices[i].equipmentName}
                                      }
                                });
                array3Cred.push(equipName);
                r=arrayOfDevices[i].role.split(' ');
                var role = new joint.shapes.basic.DecoratedRectText({
                               position: { x: ((parseInt(arrayOfDevices[i].position))+2)*400, y: 150 },
                               attrs: { 
                                        text: { text:r[r.length-1] }
                                      }
                                });
                array3Cred.push(role);
                var type = new joint.shapes.basic.DecoratedRectText({
                               position: { x: ((parseInt(arrayOfDevices[i].position))+2)*400, y: 170 },
                               attrs: { 
                                        text: { text: arrayOfDevices[i].type}
                                      }
                                });
                array3Cred.push(type);
                
                
                if(arrayOfDevices[i].aLag!="")
                    {
                        a=arrayOfDevices[i].aLag.split('-');
                        a1=a[a.length-1];
                        if(a1.length>=2)
                            {
                                var leftPort= new joint.shapes.basic.DecoratedRectLeftPortLong({
                                       position: { x: ((parseInt(arrayOfDevices[i].position))+2)*400, y: 150 },
                                       attrs: { 
                                                text: { text:a1}
                                              }
                                        });
                                    array3Cred.push(leftPort);
                            }
                        else
                            {
                                var leftPort= new joint.shapes.basic.DecoratedRectLeftPort({
                                       position: { x: ((parseInt(arrayOfDevices[i].position))+2)*400, y: 150 },
                                       attrs: { 
                                                text: { text:a1}
                                              }
                                        });
                                    array3Cred.push(leftPort);
                            }
                    }
                else
                    {
                        a=arrayOfDevices[i].aPort.substr(7);
                        a1=a[a.length-1];
                        if(a1.length>=2)
                            {
                                var leftPort= new joint.shapes.basic.DecoratedRectLeftPortLong({
                                       position: { x: ((parseInt(arrayOfDevices[i].position))+2)*400, y: 150 },
                                       attrs: { 
                                                text: { text:a1}
                                              }
                                        });
                                    array3Cred.push(leftPort);
                            }
                        else
                            {
                                var leftPort= new joint.shapes.basic.DecoratedRectLeftPort({
                                       position: { x: ((parseInt(arrayOfDevices[i].position))+2)*400, y: 150 },
                                       attrs: { 
                                                text: { text:a1}
                                              }
                                        });
                                    array3Cred.push(leftPort);
                            }
                    }
					
				if(arrayOfDevices[i].zLag!="")
                    {
						conArray3ToCloud=true;
						posArray3ToCloud=(((parseInt(arrayOfDevices[i].position))+2)*400);
                        z=arrayOfDevices[i].zLag.substr(11);
                        
                        if(z.length>=2)
                            {
                                var rightPort= new joint.shapes.basic.DecoratedRectRightPortLong({
                                       position: { x:((parseInt(arrayOfDevices[i].position))+2)*400, y: 100 },
                                       attrs: { 
                                                text: { text:z}
                                              }
                                        });
                                    array3Cred.push(rightPort);
                            }
                        else
                            {
                                var rightPort= new joint.shapes.basic.DecoratedRectRightPort({
                                       position: { x: ((parseInt(arrayOfDevices[i].position))+2)*400, y: 100  },
                                       attrs: { 
                                                text: { text:z}
                                              }
                                        });
                                    array3Cred.push(rightPort);
                            }
                    }
               
            }
        else if(arrayOfDevices[i].type.toUpperCase()==="ASR" && flgVPLS!=0)
            {   
                                if(flgEoSDH==1)
                                    {
                                      p=100+((parseInt(arrayOfDevices[i].position))+2)*400;
                                    }
                                else 
                                     {
                                       p=100+((parseInt(arrayOfDevices[i].position))+1)*400;
                                     }
									 
								ln=array4.length;
                                if(ln==0)
                                    {
										posArray4ToCloud=p;
                                       if(arrayOfDevices[i].aLag!="")
                                           {
											   conArray4ToCloud=true;
                                               a=arrayOfDevices[i].aLag.split('-');
                                               left_port=a[a.length-1];
                                               if(arrayOfDevices[i].zLag!=""){right_port=arrayOfDevices[i].zLag.substr(11);trackID="";}
                                               else
                                                    {
                                                        
                                                        right_port=arrayOfDevices[i].zPort.substr(7);
                                                        trackID=arrayOfDevices[i].primaryTracID;
                                                    }
                                               
                                           }
                                        else
                                            {
                                                if(arrayOfDevices[i].zLag!=""){previousZLag++;right_port=arrayOfDevices[i].zLag.substr(11);trackID="";left_port="";}
                                                else
                                                    {
                                                        left_port="";
                                                        right_port=arrayOfDevices[i].zPort.substr(7);
                                                        trackID=arrayOfDevices[i].primaryTracID;
                                                    }
                                            }
                                    }
									
						else
						{
                                if(arrayOfDevices[i].zLag!="" )
                                                {
                                                    previousZLag++;
                                                    
                                                    right_port=arrayOfDevices[i].zLag.substr(11);
                                                    left_port=arrayOfDevices[i].aPort;
                                                    trackID="";
                                                    if(arrayOfDevices[i].aLag!="")
                                                        {
                                                           a=arrayOfDevices[i].aLag.split('-');
                                                           left_port=a[a.length-1]; 
                                                        }
                                                }
                                    else if(arrayOfDevices[i].aLag!="" && previousZLag!=0)
                                                {
                                                    p-=100;
                                                    
                                                    left_port=arrayOfDevices[i].aLag.substr(11);
                                                    right_port=arrayOfDevices[i].zPort;
                                                    trackID=arrayOfDevices[i].primaryTracID;

                                                    objNBN={device_name:"",device_pos:"",node:""};
                                                    var Lag = new joint.shapes.basic.DecoratedRectLag({
                                                                   position: { x: 110+posPrevDev, y: 375 },
                                                                   size: { width:100, height: 6},
                                                                   attrs: { 
                                                                        image: { 'xlink:href': lagImage}
                                                                           }
                                                                       });
                                                    objNBN.device_name="LAG"
                                                    objNBN.device_pos=110+posPrevDev;
                                                    objNBN.node=Lag;
                                                    array4.push(objNBN);

                                                    previousZLag=0;

                                                    if(arrayOfDevices[i].zLag!="")
                                                        {
                                                           z=arrayOfDevices[i].zLag.split('-');
                                                           right_port=z[z.length-1]; 
                                                           trackID="";
                                                        }
                                                }
                                            else if(arrayOfDevices[i].aLag=="" && arrayOfDevices[i].zLag=="")
                                                {
                                                    left_port=arrayOfDevices[i].aPort.substr(7);
                                                    right_port=arrayOfDevices[i].zPort.substr(7);
                                                    trackID=arrayOfDevices[i].primaryTracID;
                                                }
						}
                        
                                    objDropdown={deviceName:"",id:"",deviceCount:"",xCord:"",yCord:"",eName:""};
                                    objNBN={device_name:"",device_pos:"",node:""};
                                    var ASR = new joint.shapes.basic.DecoratedRect({
                                                   position: { x: p, y: 410 },
                                                   attrs: { 
                                                            image: { 'xlink:href': 'nvImages/ASR.png'}
                                                          }
                                                    });

                                    objNBN.device_name=arrayOfDevices[i].type.toUpperCase();
                                    objNBN.device_pos=p;
                                    objNBN.node=ASR;
                                    array4.push(objNBN);

                                    objDropdown.deviceName=arrayOfDevices[i].type.toUpperCase();
                                    objDropdown.deviceCount=arrayOfDevices[i].count;
									objDropdown.eName=arrayOfDevices[i].equipmentName;
                                    objDropdown.id=ASR.id;
                                    objDropdown.xCord=p;
                                    objDropdown.yCord=410;
                                    arrayDropdown.push(objDropdown);

                                    var equipName = new joint.shapes.basic.DecoratedRectText({
                                                   position: { x: p, y: 420 },
                                                   attrs: { 
                                                            text: { text: arrayOfDevices[i].equipmentName}
                                                          }
                                                    });
                                    array4Cred.push(equipName);
                                    r=arrayOfDevices[i].role.split(' ');
                                    var role = new joint.shapes.basic.DecoratedRectText({
                                                   position: { x: p, y: 440 },
                                                   attrs: { 
                                                            text: { text: r[r.length-1]}
                                                          }
                                                    });
                                    array4Cred.push(role);
                                    var type = new joint.shapes.basic.DecoratedRectText({
                                                   position: { x: p, y: 460 },
                                                   attrs: { 
                                                            text: { text: arrayOfDevices[i].type}
                                                          }
                                                    });
                                    array4Cred.push(type);
                                    



                                    var leftPort= new joint.shapes.basic.DecoratedRectLeftPortLong({
                                                   position: { x: p, y: 390 },
                                                   attrs: { 
                                                            text: { text:left_port}
                                                          }
                                                    });
                                    array4Cred.push(leftPort);
                                    var rightPort= new joint.shapes.basic.DecoratedRectRightPortLong({
                                                   position: { x: 7+p, y: 380 },
                                                   attrs: { 
                                                            text: { text:right_port}
                                                          }
                                                    });
                                    array4Cred.push(rightPort);
                                    var primaryTrac = new joint.shapes.basic.DecoratedRectPrimaryTracID({
                                                   position: { x: 150+p, y: 380 },
                                                   attrs: { 
                                                            text: { text:trackID}
                                                          }
                                                    });
                                    array4Cred.push(primaryTrac);
                                    posPrevDev=p;

            }
         if(arrayOfDevices[i].type.toUpperCase()==="MSE" && arrayOfDevices[i].count==1 && flgVPLS==0)
            {   
                objDropdown={deviceName:"",id:"",deviceCount:"",xCord:"",yCord:"",eName:""};
				obj={name:"",node:""};
                var MSE1 = new joint.shapes.basic.DecoratedRect({
                               position: { x: ((parseInt(arrayOfDevices[i].position))+3)*400, y: 410 },
                               attrs: { 
                                        image: { 'xlink:href': 'nvImages/MSE.png'}
                                      }
                                });
				obj.name="MSE";
				obj.node=MSE1;
                array2.push(obj);
                objDropdown.deviceName=arrayOfDevices[i].type.toUpperCase();
                objDropdown.deviceCount=arrayOfDevices[i].count;
				objDropdown.eName=arrayOfDevices[i].equipmentName;
                objDropdown.id=MSE1.id;
                objDropdown.xCord=((parseInt(arrayOfDevices[i].position))+3)*400;
                objDropdown.yCord=410;
                arrayDropdown.push(objDropdown);
                var equipName = new joint.shapes.basic.DecoratedRectText({
                               position: { x: ((parseInt(arrayOfDevices[i].position))+3)*400, y: 420 },
                               attrs: { 
                                        text: { text: arrayOfDevices[i].equipmentName}
                                      }
                                });
                array2Cred.push(equipName);
                r=arrayOfDevices[i].role.split(' ');
                var role = new joint.shapes.basic.DecoratedRectText({
                               position: { x: ((parseInt(arrayOfDevices[i].position))+3)*400, y: 440 },
                               attrs: { 
                                        text: { text:r[r.length-1] }
                                      }
                                });
                array2Cred.push(role);
                var type = new joint.shapes.basic.DecoratedRectText({
                               position: { x: ((parseInt(arrayOfDevices[i].position))+3)*400, y: 460 },
                               attrs: { 
                                        text: { text: arrayOfDevices[i].type}
                                      }
                                });
                array2Cred.push(type);
                
                
                if(arrayOfDevices[i].aLag!="")
                    {
                        a=arrayOfDevices[i].aLag.split('-');
                        a1=a[a.length-1];
                        if(a1.length>=2)
                            {
                                var leftPort= new joint.shapes.basic.DecoratedRectLeftPortLong({
                                       position: { x: ((parseInt(arrayOfDevices[i].position))+3)*400, y: 430 },
                                       attrs: { 
                                                text: { text:a1}
                                              }
                                        });
                                    array2Cred.push(leftPort);
                            }
                        else
                            {
                                var leftPort= new joint.shapes.basic.DecoratedRectLeftPort({
                                       position: { x: ((parseInt(arrayOfDevices[i].position))+3)*400, y: 430 },
                                       attrs: { 
                                                text: { text:a1}
                                              }
                                        });
                                    array2Cred.push(leftPort);
                            }
                    }
                else
                    {
                        a=arrayOfDevices[i].aPort;
                        
                        if(a.length>=2)
                            {
                                var rightPort= new joint.shapes.basic.DecoratedRectRightPortLong({
                                       position: { x: ((parseInt(arrayOfDevices[i].position))+3)*400, y: 430 },
                                       attrs: { 
                                                text: { text:a}
                                              }
                                        });
                                    array2Cred.push(leftPort);
                            }
                        else
                            {
                                var rightPort= new joint.shapes.basic.DecoratedRectRightPort({
                                       position: { x: ((parseInt(arrayOfDevices[i].position))+3)*400, y: 430 },
                                       attrs: { 
                                                text: { text:a}
                                              }
                                        });
                                    array2Cred.push(leftPort);
                            }
                    }
				if(arrayOfDevices[i].zLag!="")
                    {
                        z=arrayOfDevices[i].zLag.split('-');
                        z1=z[z.length-1];
                        if(z1.length>=2)
                            {
                                var rightPort= new joint.shapes.basic.DecoratedRectRightPortLong({
                                       position: { x: 100+((parseInt(arrayOfDevices[i].position))+3)*400, y: 420 },
                                       attrs: { 
                                                text: { text:z1}
                                              }
                                        });
                                    array2Cred.push(rightPort);
                            }
                        else
                            {
                                var rightPort= new joint.shapes.basic.DecoratedRectRightPort({
                                       position: { x: 100+((parseInt(arrayOfDevices[i].position))+3)*400, y: 420 },
                                       attrs: { 
                                                text: { text:z1}
                                              }
                                        });
                                    array2Cred.push(rightPort);
                            }

                
						obj={name:"",node:""};
                        var Lag = new joint.shapes.basic.DecoratedRectLag({
	                                   position: { x: 204+((parseInt(arrayOfDevices[i].position))+3)*400, y: 380 },
	                                   size: { width:100, height: 6},
                                       attrs: { 
                                            image: { 'xlink:href': lagImage}
                                               }
	                                       });
						obj.name="LAG";
						obj.node=Lag;
                        array2.push(obj);
                    }
			   obj={name:"",node:""};
               var VPLSCloud=new joint.shapes.basic.DecoratedRectCloud({
                               position: { x: ((parseInt(arrayOfDevices[i].position))+4)*400, y: 385 },
                               attrs: { 
                                        text: { text: 'VPLS Cloud' },
	                                    image: { 'xlink:href': 'nvImages/CLOUD.png'}
                                      }
                                });
                obj.name="CLOUD";
				obj.node=VPLSCloud;
                array2.push(obj);
                VPLSCloud++;
            }
         else if(arrayOfDevices[i].type.toUpperCase()==="MSE" && arrayOfDevices[i].count==2 && flgVPLS!=0)
            {
                objDropdown={deviceName:"",id:"",deviceCount:"",xCord:"",yCord:"",eName:""};
                var MSE2 = new joint.shapes.basic.DecoratedRect({
                               position: { x: ((parseInt(arrayOfDevices[i].position))+2)*400, y: 130 },
                               attrs: { 
                                        image: { 'xlink:href': 'nvImages/MSE.png'}
                                      }
                                });
                array3.push(MSE2);
                objDropdown.deviceName=arrayOfDevices[i].type.toUpperCase();
                objDropdown.deviceCount=arrayOfDevices[i].count;
				objDropdown.eName=arrayOfDevices[i].equipmentName;
                objDropdown.id=MSE2.id;
                objDropdown.xCord=((parseInt(arrayOfDevices[i].position))+2)*400;
                objDropdown.yCord=130;
                arrayDropdown.push(objDropdown);
                var equipName = new joint.shapes.basic.DecoratedRectText({
                               position: { x: ((parseInt(arrayOfDevices[i].position))+2)*400, y: 130 },
                               attrs: { 
                                        text: { text: arrayOfDevices[i].equipmentName}
                                      }
                                });
                array3Cred.push(equipName);
                r=arrayOfDevices[i].role.split(' ');
                var role = new joint.shapes.basic.DecoratedRectText({
                               position: { x: ((parseInt(arrayOfDevices[i].position))+2)*400, y: 150 },
                               attrs: { 
                                        text: { text:r[r.length-1] }
                                      }
                                });
                array3Cred.push(role);
                var type = new joint.shapes.basic.DecoratedRectText({
                               position: { x: ((parseInt(arrayOfDevices[i].position))+2)*400, y: 170 },
                               attrs: { 
                                        text: { text: arrayOfDevices[i].type}
                                      }
                                });
                array3Cred.push(type);
                
                
                if(arrayOfDevices[i].aLag!="")
                    {
                        a=arrayOfDevices[i].aLag.split('-');
                        a1=a[a.length-1];
                        if(a1.length>=2)
                            {
                                var leftPort= new joint.shapes.basic.DecoratedRectLeftPortLong({
                                       position: { x: ((parseInt(arrayOfDevices[i].position))+2)*400, y: 150 },
                                       attrs: { 
                                                text: { text:a1}
                                              }
                                        });
                                    array3Cred.push(leftPort);
                            }
                        else
                            {
                                var leftPort= new joint.shapes.basic.DecoratedRectLeftPort({
                                       position: { x: ((parseInt(arrayOfDevices[i].position))+2)*400, y: 150 },
                                       attrs: { 
                                                text: { text:a1}
                                              }
                                        });
                                    array3Cred.push(leftPort);
                            }
                    }
                else
                    {
                        a=arrayOfDevices[i].aPort;
                        
                        if(a.length>=2)
                            {
                                var leftPort= new joint.shapes.basic.DecoratedRectLeftPortLong({
                                       position: { x: ((parseInt(arrayOfDevices[i].position))+2)*400, y: 150 },
                                       attrs: { 
                                                text: { text:a}
                                              }
                                        });
                                    array3Cred.push(leftPort);
                            }
                        else
                            {
                                var leftPort= new joint.shapes.basic.DecoratedLeftPortPort({
                                       position: { x: ((parseInt(arrayOfDevices[i].position))+2)*400, y: 150 },
                                       attrs: { 
                                                text: { text:a}
                                              }
                                        });
                                    array3Cred.push(leftPort);
                            }
                    }
					if(arrayOfDevices[i].zLag!="")
                    {
						conArray3ToCloud=true;
						posArray3ToCloud=((parseInt(arrayOfDevices[i].position))+2)*400;
                        z=arrayOfDevices[i].zLag.substr(11);
                        
                        if(z.length>=2)
                            {
                                var rightPort= new joint.shapes.basic.DecoratedRectRightPortLong({
                                       position: { x:((parseInt(arrayOfDevices[i].position))+2)*400, y: 100 },
                                       attrs: { 
                                                text: { text:z}
                                              }
                                        });
                                    array3Cred.push(rightPort);
                            }
                        else
                            {
                                var rightPort= new joint.shapes.basic.DecoratedRectRightPort({
                                       position: { x: ((parseInt(arrayOfDevices[i].position))+2)*400, y: 100  },
                                       attrs: { 
                                                text: { text:z}
                                              }
                                        });
                                    array3Cred.push(rightPort);
                            }
                    }
               
            }
         else if(arrayOfDevices[i].type.toUpperCase()==="MSE" && flgVPLS!=0)
            {   
                
                                if(flgEoSDH==1)
                                    {
                                      p=100+((parseInt(arrayOfDevices[i].position))+2)*400;
                                    }
                                else 
                                     {
                                       p=100+((parseInt(arrayOfDevices[i].position))+1)*400;
                                     }
									 
						ln=array4.length;
                                if(ln==0)
                                    {
										posArray4ToCloud=p;
                                       if(arrayOfDevices[i].aLag!="")
                                           {
											   conArray4ToCloud=true;
                                               a=arrayOfDevices[i].aLag.split('-');
                                               left_port=a[a.length-1];
                                               if(arrayOfDevices[i].zLag!=""){right_port=arrayOfDevices[i].zLag.substr(11);trackID="";}
                                               else
                                                    {
                                                        
                                                        right_port=arrayOfDevices[i].zPort.substr(7);
                                                        trackID=arrayOfDevices[i].primaryTracID;
                                                    }
                                               
                                           }
                                        else
                                            {
                                                if(arrayOfDevices[i].zLag!=""){previousZLag++;right_port=arrayOfDevices[i].zLag.substr(11);trackID="";left_port="";}
                                                else
                                                    {
                                                        left_port="";
                                                        right_port=arrayOfDevices[i].zPort.substr(7);
                                                        trackID=arrayOfDevices[i].primaryTracID;
                                                    }
                                            }
                                    }
                        else
						{
                                    if(arrayOfDevices[i].zLag!="" )
                                                {
                                                    previousZLag++;
                                                    
                                                    right_port=arrayOfDevices[i].zLag.substr(11);
                                                    left_port=arrayOfDevices[i].aPort;
                                                    trackID="";
                                                    if(arrayOfDevices[i].aLag!="")
                                                        {
                                                           a=arrayOfDevices[i].aLag.split('-');
                                                           left_port=a[a.length-1]; 
                                                        }


                                                }


                                            else if(arrayOfDevices[i].aLag!="" && previousZLag!=0)
                                                {
                                                    p-=100;
                                                    
                                                    left_port=arrayOfDevices[i].aLag.substr(11);
                                                    right_port=arrayOfDevices[i].zPort;
                                                    trackID=arrayOfDevices[i].primaryTracID;

                                                    objNBN={device_name:"",device_pos:"",node:""};
                                                    var Lag = new joint.shapes.basic.DecoratedRectLag({
                                                                   position: { x: 110+posPrevDev, y: 375 },
                                                                   size: { width:100, height: 6},
                                                                   attrs: { 
                                                                        image: { 'xlink:href': lagImage}
                                                                           }
                                                                       });
                                                    objNBN.device_name="LAG"
                                                    objNBN.device_pos=110+posPrevDev;
                                                    objNBN.node=Lag;
                                                    array4.push(objNBN);

                                                    previousZLag=0;

                                                    if(arrayOfDevices[i].zLag!="")
                                                        {
                                                           z=arrayOfDevices[i].zLag.split('-');
                                                           right_port=z[z.length-1]; 
                                                           trackID="";
                                                        }
                                                }
                                            else if(arrayOfDevices[i].aLag=="" && arrayOfDevices[i].zLag=="")
                                                {
                                                    left_port=arrayOfDevices[i].aPort;
                                                    right_port=arrayOfDevices[i].zPort;
                                                    trackID=arrayOfDevices[i].primaryTracID;
                                                }
						}
                                    objDropdown={deviceName:"",id:"",deviceCount:"",xCord:"",yCord:"",eName:""};
                                    objNBN={device_name:"",device_pos:"",node:""};
                                    var MSE = new joint.shapes.basic.DecoratedRect({
                                                   position: { x: p, y: 410 },
                                                   attrs: { 
                                                            image: { 'xlink:href': 'nvImages/MSE.png'}
                                                          }
                                                    });

                                    objNBN.device_name=arrayOfDevices[i].type.toUpperCase();
                                    objNBN.device_pos=p;
                                    objNBN.node=MSE;
                                    array4.push(objNBN);

                                    objDropdown.deviceName=arrayOfDevices[i].type.toUpperCase();
                                    objDropdown.deviceCount=arrayOfDevices[i].count;
									objDropdown.eName=arrayOfDevices[i].equipmentName;
                                    objDropdown.id=MSE.id;
                                    objDropdown.xCord=p;
                                    objDropdown.yCord=410;
                                    arrayDropdown.push(objDropdown);

                                    var equipName = new joint.shapes.basic.DecoratedRectText({
                                                   position: { x: p, y: 420 },
                                                   attrs: { 
                                                            text: { text: arrayOfDevices[i].equipmentName}
                                                          }
                                                    });
                                    array4Cred.push(equipName);
                                    r=arrayOfDevices[i].role.split(' ');
                                    var role = new joint.shapes.basic.DecoratedRectText({
                                                   position: { x: p, y: 440 },
                                                   attrs: { 
                                                            text: { text: r[r.length-1]}
                                                          }
                                                    });
                                    array4Cred.push(role);
                                    var type = new joint.shapes.basic.DecoratedRectText({
                                                   position: { x: p, y: 460 },
                                                   attrs: { 
                                                            text: { text: arrayOfDevices[i].type}
                                                          }
                                                    });
                                    array4Cred.push(type);

                                    var leftPort= new joint.shapes.basic.DecoratedRectLeftPortLong({
                                                   position: { x: p, y: 385 },
                                                   attrs: { 
                                                            text: { text:left_port}
                                                          }
                                                    });
                                    array4Cred.push(leftPort);
                                    var rightPort= new joint.shapes.basic.DecoratedRectRightPortLong({
                                                   position: { x: 10+p, y: 380 },
                                                   attrs: { 
                                                            text: { text:right_port}
                                                          }
                                                    });
                                    array4Cred.push(rightPort);
                                    var primaryTrac = new joint.shapes.basic.DecoratedRectPrimaryTracID({
                                                   position: { x: 150+p, y: 380 },
                                                   attrs: { 
                                                            text: { text:trackID}
                                                          }
                                                    });
                                    array4Cred.push(primaryTrac);
                                    posPrevDev=p;

                
            }
        if(arrayOfDevices[i].type.toUpperCase()==="AS" && flgVPLS!=0)
            {   
                
                if(flgEoSDH==1)
                    {
                      p=100+((parseInt(arrayOfDevices[i].position))+2)*400;  
                    }
                else
                    {
                      p=100+((parseInt(arrayOfDevices[i].position))+1)*400;
                    }
							ln=array4.length;
                                if(ln==0)
                                    {
										posArray4ToCloud=p;
                                       if(arrayOfDevices[i].aLag!="")
                                           {
											   conArray4ToCloud=true;
                                               a=arrayOfDevices[i].aLag.split('-');
                                               left_port=a[a.length-1];
                                               if(arrayOfDevices[i].zLag!="")
                                                    {
                                                        z=arrayOfDevices[i].zLag.split('-');
                                                        right_port=z[z.length-1];
                                                        trackID="";
                                                    }
                                               else
                                                    {
                                                        
                                                        right_port=arrayOfDevices[i].zPort;
                                                        trackID=arrayOfDevices[i].primaryTracID;
                                                    }
                                               
                                           }
                                        else
                                            {
                                                if(arrayOfDevices[i].zLag!="")
                                                {
                                                    previousZLag++;
                                                    z=arrayOfDevices[i].zLag.split('-');
                                                    right_port=z[z.length-1];
                                                    trackID="";left_port="";
                                                }
                                                else
                                                    {
                                                        left_port="";
                                                        z=arrayOfDevices[i].zLag.split('-');
                                                        right_port=z[z.length-1];
                                                        trackID=arrayOfDevices[i].primaryTracID;
                                                    }
                                            }
                                    }
				
				
								else
								{
                                  if(arrayOfDevices[i].zLag!="" )
                                                {
                                                    previousZLag++;
                                                    z=arrayOfDevices[i].zLag.split('-');
                                                    right_port=z[z.length-1];
                                                    left_port=arrayOfDevices[i].aPort;
                                                    trackID="";
                                                    if(arrayOfDevices[i].aLag!="")
                                                        {
                                                           a=arrayOfDevices[i].aLag.split('-');
                                                           left_port=a[a.length-1]; 
                                                        }
                                                }

                                    else if(arrayOfDevices[i].aLag!="" && previousZLag!=0)
                                                {
                                                    p-=100;
                                                    a=arrayOfDevices[i].aLag.split('-');
                                                    left_port=a[a.length-1];
                                                    right_port=arrayOfDevices[i].zPort;
                                                    trackID=arrayOfDevices[i].primaryTracID;

                                                    objNBN={device_name:"",device_pos:"",node:""};
                                                    var Lag = new joint.shapes.basic.DecoratedRectLag({
                                                                   position: { x: 110+posPrevDev, y: 375 },
                                                                   size: { width:100, height: 6},
                                                                   attrs: { 
                                                                        image: { 'xlink:href': lagImage}
                                                                           }
                                                                       });
                                                    objNBN.device_name="LAG"
                                                    objNBN.device_pos=110+posPrevDev;
                                                    objNBN.node=Lag;
                                                    array4.push(objNBN);

                                                    previousZLag=0;

                                                    if(arrayOfDevices[i].zLag!="")
                                                        {
                                                           z=arrayOfDevices[i].zLag.split('-');
                                                           right_port=z[z.length-1]; 
                                                           trackID="";
                                                        }
                                                }
                                    else if(arrayOfDevices[i].aLag=="" && arrayOfDevices[i].zLag=="")
                                        {
                                            left_port=arrayOfDevices[i].aPort;
                                            right_port=arrayOfDevices[i].zPort;
                                            trackID=arrayOfDevices[i].primaryTracID;
                                        }
								}
                                   objDropdown={deviceName:"",id:"",deviceCount:"",xCord:"",yCord:"",eName:""};
                                   objNBN={device_name:"",device_pos:"",node:""};
                                    var AS = new joint.shapes.basic.DecoratedRect({
                                                   position: { x: p, y: 410 },
                                                   attrs: { 
                                                            image: { 'xlink:href': 'nvImages/AS.png'}
                                                          }
                                                    });

                                    objNBN.device_name=arrayOfDevices[i].type.toUpperCase();
                                    objNBN.device_pos=p;
                                    objNBN.node=AS;
                                    array4.push(objNBN);

                                    objDropdown.deviceName=arrayOfDevices[i].type.toUpperCase();
                                    objDropdown.deviceCount=arrayOfDevices[i].count;
									objDropdown.eName=arrayOfDevices[i].equipmentName;
                                    objDropdown.id=AS.id;
                                    objDropdown.xCord=p;
                                    objDropdown.yCord=410;
                                    arrayDropdown.push(objDropdown);

                                    var equipName = new joint.shapes.basic.DecoratedRectText({
                                                   position: { x: p, y: 420 },
                                                   attrs: { 
                                                            text: { text: arrayOfDevices[i].equipmentName}
                                                          }
                                                    });
                                    array4Cred.push(equipName);
                                    r=arrayOfDevices[i].role.split(' ');
                                    var role = new joint.shapes.basic.DecoratedRectText({
                                                   position: { x: p, y: 440 },
                                                   attrs: { 
                                                            text: { text: r[r.length-1]}
                                                          }
                                                    });
                                    array4Cred.push(role);
                                    var type = new joint.shapes.basic.DecoratedRectText({
                                                   position: { x: p, y: 460 },
                                                   attrs: { 
                                                            text: { text: arrayOfDevices[i].type}
                                                          }
                                                    });
                                    array4Cred.push(type);
                            
                                    var leftPort= new joint.shapes.basic.DecoratedRectLeftPort({
                                                   position: { x: p, y: 390 },
                                                   attrs: { 
                                                            text: { text:left_port}
                                                          }
                                                    });
                                    array4Cred.push(leftPort);
                                    var rightPort= new joint.shapes.basic.DecoratedRectRightPort({
                                                   position: { x: 10+p, y: 410 },
                                                   attrs: { 
                                                            text: { text:right_port}
                                                          }
                                                    });
                                    array4Cred.push(rightPort);
                                    var primaryTrac = new joint.shapes.basic.DecoratedRectPrimaryTracID({
                                                   position: { x: 180+p, y: 380 },
                                                   attrs: { 
                                                            text: { text:trackID}
                                                          }
                                                    });
                                    array4Cred.push(primaryTrac);
                                    posPrevDev=p;
                
            }
        
        if(arrayOfDevices[i].type.toUpperCase()==="ADM" && flgVPLS!=0)
            {   
                if(flgEoSDH==1)
                    {
                      p=100+((parseInt(arrayOfDevices[i].position))+2)*400;  
                    }
                else
                    {
                      p=100+((parseInt(arrayOfDevices[i].position))+1)*400;
                    }
					
					
							ln=array4.length;
                                if(ln==0)
                                    {
										posArray4ToCloud=p;
                                       if(arrayOfDevices[i].aLag!="")
                                           {
											   conArray4ToCloud=true;
                                               a=arrayOfDevices[i].aLag.split('-');
                                               left_port=a[a.length-1];
                                               if(arrayOfDevices[i].zLag!="")
                                                    {
                                                        z=arrayOfDevices[i].zLag.split('-');
                                                        right_port=z[z.length-1];
                                                        trackID="";
                                                    }
                                               else
                                                    {
                                                        
                                                        right_port=arrayOfDevices[i].zPort;
                                                        trackID=arrayOfDevices[i].primaryTracID;
                                                    }
                                               
                                           }
                                        else
                                            {
                                                if(arrayOfDevices[i].zLag!="")
                                                {
                                                    previousZLag++;
                                                    z=arrayOfDevices[i].zLag.split('-');
                                                    right_port=z[z.length-1];
                                                    trackID="";left_port="";
                                                }
                                                else
                                                    {
                                                        left_port="";
                                                        z=arrayOfDevices[i].zLag.split('-');
                                                        right_port=z[z.length-1];
                                                        trackID=arrayOfDevices[i].primaryTracID;
                                                    }
                                            }
                                    }
				
                              else
							  {
								  if(arrayOfDevices[i].zLag!="" )
                                                {
                                                    previousZLag++;
                                                    z=arrayOfDevices[i].zLag.split('-');
                                                    right_port=z[z.length-1];
                                                    left_port=arrayOfDevices[i].aPort;
                                                    trackID="";
                                                    if(arrayOfDevices[i].aLag!="")
                                                        {
                                                           a=arrayOfDevices[i].aLag.split('-');
                                                           left_port=a[a.length-1]; 
                                                        }
                                                }

                                    else if(arrayOfDevices[i].aLag!="" && previousZLag!=0)
                                                {
                                                    p-=100;
                                                    a=arrayOfDevices[i].aLag.split('-');
                                                    left_port=a[a.length-1];
                                                    right_port=arrayOfDevices[i].zPort;
                                                    trackID=arrayOfDevices[i].primaryTracID;

                                                    objNBN={device_name:"",device_pos:"",node:""};
                                                    var Lag = new joint.shapes.basic.DecoratedRectLag({
                                                                   position: { x: 110+posPrevDev, y: 385 },
                                                                   size: { width:100, height: 6},
                                                                   attrs: { 
                                                                        image: { 'xlink:href': lagImage}
                                                                           }
                                                                       });
                                                    objNBN.device_name="LAG"
                                                    objNBN.device_pos=110+posPrevDev;
                                                    objNBN.node=Lag;
                                                    array4.push(objNBN);

                                                    previousZLag=0;

                                                    if(arrayOfDevices[i].zLag!="")
                                                        {
                                                           z=arrayOfDevices[i].zLag.split('-');
                                                           right_port=z[z.length-1]; 
                                                           trackID="";
                                                        }
                                                }
                                    else if(arrayOfDevices[i].aLag=="" && arrayOfDevices[i].zLag=="")
                                        {
                                            left_port=arrayOfDevices[i].aPort;
                                            right_port=arrayOfDevices[i].zPort;
                                            trackID=arrayOfDevices[i].primaryTracID;
                                        }
							  }   
                        objDropdown={deviceName:"",id:"",deviceCount:"",xCord:"",yCord:"",eName:""};
                        objNBN={device_name:"",device_pos:"",node:""};
                                    var ADM = new joint.shapes.basic.DecoratedRect({
                                                   position: { x: p, y: 410 },
                                                   attrs: { 
                                                            image: { 'xlink:href': 'nvImages/ADM.png'}
                                                          }
                                                    });

                                    objNBN.device_name=arrayOfDevices[i].type.toUpperCase();
                                    objNBN.device_pos=p;
                                    objNBN.node=ADM;
                                    array4.push(objNBN);

                                    objDropdown.deviceName=arrayOfDevices[i].type.toUpperCase();
                                    objDropdown.deviceCount=arrayOfDevices[i].count;
									objDropdown.eName=arrayOfDevices[i].equipmentName;
                                    objDropdown.id=ADM.id;
                                    objDropdown.xCord=p;
                                    objDropdown.yCord=410;
                                    arrayDropdown.push(objDropdown);

                                    var equipName = new joint.shapes.basic.DecoratedRectText({
                                                   position: { x: p, y: 420 },
                                                   attrs: { 
                                                            text: { text: arrayOfDevices[i].equipmentName}
                                                          }
                                                    });
                                    array4Cred.push(equipName);
                                    r=arrayOfDevices[i].role.split(' ');
                                    var role = new joint.shapes.basic.DecoratedRectText({
                                                   position: { x: p, y: 440 },
                                                   attrs: { 
                                                            text: { text: r[r.length-1]}
                                                          }
                                                    });
                                    array4Cred.push(role);
                                    var type = new joint.shapes.basic.DecoratedRectText({
                                                   position: { x: p, y: 460 },
                                                   attrs: { 
                                                            text: { text: arrayOfDevices[i].type}
                                                          }
                                                    });
                                    array4Cred.push(type);
                        
                                    if(flgEoSDH==0)
                                        {
                                            objNBN={device_name:"",device_pos:"",node:""};
                                            var EoSDH=new joint.shapes.basic.DecoratedRectCloud({
                                                               position: { x: p+400, y: 385 },
                                                               attrs: { 
                                                                        text: { text: 'EoSDH' },
                                                                        image: { 'xlink:href': 'nvImages/EoSDH.png'}
                                                                      }
                                                                });
                                              objNBN.device_name="EoSDH";
                                              objNBN.device_pos=p;
                                              objNBN.node=EoSDH;
                                              array4.push(objNBN);
                                            
                                              flgEoSDH++;
                                            
                                              trackID="";
                                              right_port="";
                                        }

                                    var leftPort= new joint.shapes.basic.DecoratedRectLeftPortLong({
                                                   position: { x: p, y: 390 },
                                                   attrs: { 
                                                            text: { text:left_port}
                                                          }
                                                    });
                                    array4Cred.push(leftPort);
                                    var rightPort= new joint.shapes.basic.DecoratedRectRightPortLong({
                                                   position: { x: 5+p, y: 380 },
                                                   attrs: { 
                                                            text: { text:right_port}
                                                          }
                                                    });
                                    array4Cred.push(rightPort);
                                    var primaryTrac = new joint.shapes.basic.DecoratedRectPrimaryTracID({
                                                   position: { x: 180+p, y: 380 },
                                                   attrs: { 
                                                            text: { text:trackID}
                                                          }
                                                    });
                                    array4Cred.push(primaryTrac);
                                    posPrevDev=p;
                   
            }
    }
}
    
    
else if(topologyType.toUpperCase()==="TIDTOPOLOGY")
    {
        for(i=0;i<arrayOfDevices.length;i++)
        {
        if(arrayOfDevices[i].type.toUpperCase()==="NTU")
            {
                objDropdown={deviceName:"",id:"",deviceCount:"",xCord:"",yCord:"",eName:""};
                var tidNTU = new joint.shapes.basic.DecoratedRect({
                               position: { x: 100+(parseInt(arrayOfDevices[i].position))*400, y: 410 },
                               attrs: { 
                                        image: { 'xlink:href': 'nvImages/NTU.png'}
                                      }
                                });
                array1.push(tidNTU);
                objDropdown.deviceName="TIDNTU";
                objDropdown.deviceCount=arrayOfDevices[i].count;
				objDropdown.eName=arrayOfDevices[i].equipmentName;
                objDropdown.id=tidNTU.id;
                objDropdown.xCord=100+(parseInt(arrayOfDevices[i].position))*400;
                objDropdown.yCord=410;
                arrayDropdown.push(objDropdown);
                var equipName = new joint.shapes.basic.DecoratedRectText({
                               position: { x: 100+(parseInt(arrayOfDevices[i].position))*400, y: 420 },
                               attrs: { 
                                        text: { text: arrayOfDevices[i].equipmentName}
                                      }
                                });
                array1Cred.push(equipName);
                r=arrayOfDevices[i].role.split(' ');
                var role = new joint.shapes.basic.DecoratedRectText({
                               position: { x: 100+(parseInt(arrayOfDevices[i].position))*400, y: 440 },
                               attrs: { 
                                        text: { text: r[r.length-1]}
                                      }
                                });
                array1Cred.push(role);
                var type = new joint.shapes.basic.DecoratedRectText({
                               position: { x: 100+(parseInt(arrayOfDevices[i].position))*400, y: 460 },
                               attrs: { 
                                        text: { text: arrayOfDevices[i].type}
                                      }
                                });
                array1Cred.push(type);
                var uniFNN = new joint.shapes.basic.DecoratedRectText({
                               position: { x: 100+(parseInt(arrayOfDevices[i].position))*400, y: 260 },
                               attrs: { 
                                        text: { text: 'UNI FNN:'+arrayOfDevices[i].uniFNN}
                                      }
                                });
                array1Cred.push(uniFNN);
                var wanIP = new joint.shapes.basic.DecoratedRectText({
                               position: { x: 100+(parseInt(arrayOfDevices[i].position))*400, y: 290 },
                               attrs: { 
                                        text: { text: 'NTU WAN IP:'+arrayOfDevices[i].wanIP}
                                      }
                                });
                array1Cred.push(wanIP);
                
                var nbnCloud=new joint.shapes.basic.DecoratedRectCloud({
                               position: { x: 100+((parseInt(arrayOfDevices[i].position))+1)*400, y: 385 },
                               attrs: { 
                                        text: { text: 'NBN Cloud' },
	                                    image: { 'xlink:href': 'nvImages/CLOUD.png'}
                                      }
                               });
                array1.push(nbnCloud);
                
                objDropdown={deviceName:"",id:"",deviceCount:"",xCord:"",yCord:"",eName:""};
                var telstraASPCloud=new joint.shapes.basic.DecoratedRectCloud({
                               position: { x: 100+((parseInt(arrayOfDevices[i].position))+2)*400, y: 385 },
                               attrs: { 
                                        text: { text: 'Telstra ASP Cloud' },
	                                    image: { 'xlink:href': 'nvImages/CLOUD.png'}
                                      }
                                });
                array1.push(telstraASPCloud);
                objDropdown.deviceName="NBNCLOUD";
                objDropdown.deviceCount=1;
				objDropdown.eName=arrayOfDevices[i].equipmentName;
                objDropdown.id=telstraASPCloud.id;
                objDropdown.xCord=100+((parseInt(arrayOfDevices[i].position))+2)*400;
                objDropdown.yCord=385;
                arrayDropdown.push(objDropdown);
                var avcID = new joint.shapes.basic.DecoratedRectText({
                               position: { x: 100+((parseInt(arrayOfDevices[i].position))+2)*400, y: 260 },
                               attrs: { 
                                        text: { text:arrayOfDevices[i].avcID}
                                      }
                                });
                array1Cred.push(avcID);
                var leftPort= new joint.shapes.basic.DecoratedRectLeftPort({
                               position: { x: 100+(parseInt(arrayOfDevices[i].position))*400, y: 410 },
                               attrs: { 
                                        text: { text:arrayOfDevices[i].custPort}
                                      }
                                });
                array1Cred.push(leftPort);
                var rightPort= new joint.shapes.basic.DecoratedRectRightPort({
                               position: { x: 100+(parseInt(arrayOfDevices[i].position))*400, y: 410 },
                               attrs: { 
                                        text: { text:arrayOfDevices[i].zPort}
                                      }
                                });
                array1Cred.push(rightPort);
            }
        if(arrayOfDevices[i].type.toUpperCase()==="REX" && arrayOfDevices[i].count==1)
            {
                objDropdown={deviceName:"",id:"",deviceCount:"",xCord:"",yCord:"",eName:""};
				obj={name:"",node:""};
                var REX1 = new joint.shapes.basic.DecoratedRect({
                               position: { x: 100+((parseInt(arrayOfDevices[i].position))+2)*400, y: 410 },
                               attrs: { 
                                        image: { 'xlink:href': 'nvImages/REX1.png'}
                                      }
                                });
				obj.name="REX";
				obj.node=REX1;
                array2.push(obj);
                objDropdown.deviceName=arrayOfDevices[i].type.toUpperCase();
                objDropdown.deviceCount=arrayOfDevices[i].count;
				objDropdown.eName=arrayOfDevices[i].equipmentName;
                objDropdown.id=REX1.id;
                objDropdown.xCord=100+((parseInt(arrayOfDevices[i].position))+2)*400;
                objDropdown.yCord=410;
                arrayDropdown.push(objDropdown);
                var equipName = new joint.shapes.basic.DecoratedRectText({
                               position: { x: 100+((parseInt(arrayOfDevices[i].position))+2)*400, y: 420 },
                               attrs: { 
                                        text: { text: arrayOfDevices[i].equipmentName}
                                      }
                                });
                array2Cred.push(equipName);
                
                var role = new joint.shapes.basic.DecoratedRectText({
                               position: { x: 100+((parseInt(arrayOfDevices[i].position))+2)*400, y: 440 },
                               attrs: { 
                                        text: { text:arrayOfDevices[i].role }
                                      }
                                });
                array2Cred.push(role);
                var type = new joint.shapes.basic.DecoratedRectText({
                               position: { x: 100+((parseInt(arrayOfDevices[i].position))+2)*400, y: 460 },
                               attrs: { 
                                        text: { text: arrayOfDevices[i].type}
                                      }
                                });
                array2Cred.push(type);
                
                var greIP = new joint.shapes.basic.DecoratedRectText({
                               position: { x: 100+((parseInt(arrayOfDevices[i].position))+2)*400, y: 290 },
                               attrs: { 
                                        text: { text: 'REX TUNNEL IP:'+arrayOfDevices[i].greIP}
                                      }
                                });
                array2Cred.push(greIP);
                if(arrayOfDevices[i].zLag!="")
                    {
                        z=arrayOfDevices[i].zLag.split('-');
                        z1=z[z.length-1];
                        if(z1.length>=2)
                            {
                                var rightPort= new joint.shapes.basic.DecoratedRectRightPortLong({
                                       position: { x: 100+((parseInt(arrayOfDevices[i].position))+2)*400, y: 420 },
                                       attrs: { 
                                                text: { text:z1}
                                              }
                                        });
                                    array2Cred.push(rightPort);
                            }
                        else
                            {
                                var rightPort= new joint.shapes.basic.DecoratedRectRightPort({
                                       position: { x: 100+((parseInt(arrayOfDevices[i].position))+2)*400, y: 420 },
                                       attrs: { 
                                                text: { text:z1}
                                              }
                                        });
                                    array2Cred.push(rightPort);
                            }

                
						obj={name:"",node:""};
                        var Lag = new joint.shapes.basic.DecoratedRectLag({
	                                   position: { x: 204+((parseInt(arrayOfDevices[i].position))+2)*400, y: 380 },
	                                   size: { width:100, height: 6},
                                       attrs: { 
                                            image: { 'xlink:href': lagImage}
                                               }
	                                       });
						obj.name="LAG";
						obj.node=Lag;
                        array2.push(obj);
                    }
                else
                    {
                        z=arrayOfDevices[i].zPort.split('-');
                        z1=z[z.length-1];
                        if(z1.length>=2)
                            {
                                var rightPort= new joint.shapes.basic.DecoratedRectRightPortLong({
                                       position: { x: 100+((parseInt(arrayOfDevices[i].position))+2)*400, y: 420 },
                                       attrs: { 
                                                text: { text:z1}
                                              }
                                        });
                                    array2Cred.push(rightPort);
                            }
                        else
                            {
                                var rightPort= new joint.shapes.basic.DecoratedRectRightPort({
                                       position: { x: 100+((parseInt(arrayOfDevices[i].position))+2)*400, y: 420 },
                                       attrs: { 
                                                text: { text:z1}
                                              }
                                        });
                                    array2Cred.push(rightPort);
                            }
                         var primaryTrac = new joint.shapes.basic.DecoratedRectPrimaryTracID({
                                       position: { x: 350+((parseInt(arrayOfDevices[i].position))+2)*400, y: 420 },
                                       attrs: { 
                                                text: { text:arrayOfDevices[i].primaryTracID}
                                              }
                                        });
                                    array2Cred.push(primaryTrac);
                    }
                
            }
        if(arrayOfDevices[i].type.toUpperCase()==="REX" && arrayOfDevices[i].count==2)
            {
                objDropdown={deviceName:"",id:"",deviceCount:"",xCord:"",yCord:"",eName:""};
                var REX2 = new joint.shapes.basic.DecoratedRect({
                               position: { x: 100+((parseInt(arrayOfDevices[i].position))+1)*400, y: 130 },
                               attrs: { 
                                        image: { 'xlink:href': 'nvImages/REX1.png'}
                                      }
                                });
                array3.push(REX2);
                objDropdown.deviceName=arrayOfDevices[i].type.toUpperCase();
                objDropdown.deviceCount=arrayOfDevices[i].count;
				objDropdown.eName=arrayOfDevices[i].equipmentName;
                objDropdown.id=REX2.id;
                objDropdown.xCord=100+((parseInt(arrayOfDevices[i].position))+1)*400;
                objDropdown.yCord=130;
                arrayDropdown.push(objDropdown);
                var equipName = new joint.shapes.basic.DecoratedRectText({
                               position: { x: 100+((parseInt(arrayOfDevices[i].position))+1)*400, y: 130 },
                               attrs: { 
                                        text: { text: arrayOfDevices[i].equipmentName}
                                      }
                                });
                array3Cred.push(equipName);
                
                var role = new joint.shapes.basic.DecoratedRectText({
                               position: { x: 100+((parseInt(arrayOfDevices[i].position))+1)*400, y: 150 },
                               attrs: { 
                                        text: { text:arrayOfDevices[i].role }
                                      }
                                });
                array3Cred.push(role);
                var type = new joint.shapes.basic.DecoratedRectText({
                               position: { x: 100+((parseInt(arrayOfDevices[i].position))+1)*400, y: 170 },
                               attrs: { 
                                        text: { text: arrayOfDevices[i].type}
                                      }
                                });
                array3Cred.push(type);
                
                var greIP = new joint.shapes.basic.DecoratedRectText({
                               position: { x: 100+((parseInt(arrayOfDevices[i].position))+1)*400, y: 10 },
                               attrs: { 
                                        text: { text: 'REX TUNNEL IP:'+arrayOfDevices[i].greIP}
                                      }
                                });
                array3Cred.push(greIP);
                if(arrayOfDevices[i].zLag!="")
                    {
                        z=arrayOfDevices[i].zLag.split('-');
                        z1=z[z.length-1];
                        if(z1.length>=2)
                            {
                                var rightPort= new joint.shapes.basic.DecoratedRectRightPortLong({
                                       position: { x: 100+((parseInt(arrayOfDevices[i].position))+1)*400, y: 140 },
                                       attrs: { 
                                                text: { text:z1}
                                              }
                                        });
                                    array3Cred.push(rightPort);
                            }
                        else
                            {
                                var rightPort= new joint.shapes.basic.DecoratedRectRightPort({
                                       position: { x: 100+((parseInt(arrayOfDevices[i].position))+1)*400, y: 140 },
                                       attrs: { 
                                                text: { text:z1}
                                              }
                                        });
                                    array3Cred.push(rightPort);
                            }
                        var Lag = new joint.shapes.basic.DecoratedRectLag({
	                                   position: { x: 204+((parseInt(arrayOfDevices[i].position))+1)*400, y: 100 },
	                                   size: { width:100, height: 6},
                                       attrs: { 
                                            image: { 'xlink:href': lagImage}
                                               }
	                                       });
                        array3.push(Lag);
                        
                        }
                else
                    {
                        z=arrayOfDevices[i].zPort.split('-');
                        z1=z[z.length-1];
                        if(z1.length>=2)
                            {
                                var rightPort= new joint.shapes.basic.DecoratedRectRightPortLong({
                                       position: { x: 100+((parseInt(arrayOfDevices[i].position))+1)*400, y: 140 },
                                       attrs: { 
                                                text: { text:z1}
                                              }
                                        });
                                    array3Cred.push(rightPort);
                            }
                        else
                            {
                                var rightPort= new joint.shapes.basic.DecoratedRectRightPort({
                                       position: { x: 100+((parseInt(arrayOfDevices[i].position))+1)*400, y: 140 },
                                       attrs: { 
                                                text: { text:z1}
                                              }
                                        });
                                    array3Cred.push(rightPort);
                            }
                        var primaryTrac = new joint.shapes.basic.DecoratedRectPrimaryTracID({
                                       position: { x: 350+((parseInt(arrayOfDevices[i].position))+1)*400, y: 140 },
                                       attrs: { 
                                                text: { text:arrayOfDevices[i].primaryTracID}
                                              }
                                        });
                                    array3Cred.push(primaryTrac);
                    }
                
            }
           
        if(arrayOfDevices[i].type.toUpperCase()==="ASR" && arrayOfDevices[i].count==1 && flgVPLS==0)
            {
                objDropdown={deviceName:"",id:"",deviceCount:"",xCord:"",yCord:"",eName:""};
				obj={name:"",node:""};
                var ASR1 = new joint.shapes.basic.DecoratedRect({
                               position: { x: ((parseInt(arrayOfDevices[i].position))+3)*400, y: 410 },
                               attrs: { 
                                        image: { 'xlink:href': 'nvImages/ASR.png'}
                                      }
                                });
				obj.name="ASR";
				obj.node=ASR1;
                array2.push(obj);
                objDropdown.deviceName=arrayOfDevices[i].type.toUpperCase();
                objDropdown.deviceCount=arrayOfDevices[i].count;
				objDropdown.eName=arrayOfDevices[i].equipmentName;
                objDropdown.id=ASR1.id;
                objDropdown.xCord=((parseInt(arrayOfDevices[i].position))+3)*400;
                objDropdown.yCord=410;
                arrayDropdown.push(objDropdown);
                var equipName = new joint.shapes.basic.DecoratedRectText({
                               position: { x: ((parseInt(arrayOfDevices[i].position))+3)*400, y: 420 },
                               attrs: { 
                                        text: { text: arrayOfDevices[i].equipmentName}
                                      }
                                });
                array2Cred.push(equipName);
                r=arrayOfDevices[i].role.split(' ');
                var role = new joint.shapes.basic.DecoratedRectText({
                               position: { x: ((parseInt(arrayOfDevices[i].position))+3)*400, y: 440 },
                               attrs: { 
                                        text: { text:r[r.length-1] }
                                      }
                                });
                array2Cred.push(role);
                var type = new joint.shapes.basic.DecoratedRectText({
                               position: { x: ((parseInt(arrayOfDevices[i].position))+3)*400, y: 460 },
                               attrs: { 
                                        text: { text: arrayOfDevices[i].type}
                                      }
                                });
                array2Cred.push(type);
                
                
                if(arrayOfDevices[i].aLag!="")
                    {
                        a=arrayOfDevices[i].aLag.split('-');
                        a1=a[a.length-1];
                        if(a1.length>=2)
                            {
                                var leftPort= new joint.shapes.basic.DecoratedRectLeftPortLong({
                                       position: { x: ((parseInt(arrayOfDevices[i].position))+3)*400, y: 430 },
                                       attrs: { 
                                                text: { text:a1}
                                              }
                                        });
                                    array2Cred.push(leftPort);
                            }
                        else
                            {
                                var leftPort= new joint.shapes.basic.DecoratedRectLeftPort({
                                       position: { x: ((parseInt(arrayOfDevices[i].position))+3)*400, y: 430 },
                                       attrs: { 
                                                text: { text:a1}
                                              }
                                        });
                                    array2Cred.push(leftPort);
                            }
                    }
                else
                    {
                        a=arrayOfDevices[i].aPort.split('-');
                        a1=a[a.length-1];
                        if(a1.length>=2)
                            {
                                var leftPort= new joint.shapes.basic.DecoratedRectLeftPortLong({
                                       position: { x: ((parseInt(arrayOfDevices[i].position))+3)*400, y: 430 },
                                       attrs: { 
                                                text: { text:a1}
                                              }
                                        });
                                    array2Cred.push(leftPort);
                            }
                        else
                            {
                                var leftPort= new joint.shapes.basic.DecoratedRectLeftPort({
                                       position: { x: ((parseInt(arrayOfDevices[i].position))+3)*400, y: 430 },
                                       attrs: { 
                                                text: { text:a1}
                                              }
                                        });
                                    array2Cred.push(leftPort);
                            }
                    }
			   obj={name:"",node:""};
               var VPLSCloud=new joint.shapes.basic.DecoratedRectCloud({
                               position: { x: ((parseInt(arrayOfDevices[i].position))+4)*400, y: 385 },
                               attrs: { 
                                        text: { text: 'VPLS Cloud' },
	                                    image: { 'xlink:href': 'nvImages/CLOUD.png'}
                                      }
                                });
				obj.name="CLOUD";
				obj.node=VPLSCloud;
                array2.push(obj); 
                flgVPLS++;
            }
        else if(arrayOfDevices[i].type.toUpperCase()==="ASR" && arrayOfDevices[i].count==2 && flgVPLS!=0)
            {
                objDropdown={deviceName:"",id:"",deviceCount:"",xCord:"",yCord:"",eName:""};
                var ASR2 = new joint.shapes.basic.DecoratedRect({
                               position: { x: ((parseInt(arrayOfDevices[i].position))+2)*400, y: 130 },
                               attrs: { 
                                        image: { 'xlink:href': 'nvImages/ASR.png'}
                                      }
                                });
                array3.push(ASR2);
                objDropdown.deviceName=arrayOfDevices[i].type.toUpperCase();
                objDropdown.deviceCount=arrayOfDevices[i].count;
				objDropdown.eName=arrayOfDevices[i].equipmentName;
                objDropdown.id=ASR2.id;
                objDropdown.xCord=((parseInt(arrayOfDevices[i].position))+2)*400;
                objDropdown.yCord=130;
                arrayDropdown.push(objDropdown);
                var equipName = new joint.shapes.basic.DecoratedRectText({
                               position: { x: ((parseInt(arrayOfDevices[i].position))+2)*400, y: 130 },
                               attrs: { 
                                        text: { text: arrayOfDevices[i].equipmentName}
                                      }
                                });
                array3Cred.push(equipName);
                r=arrayOfDevices[i].role.split(' ');
                var role = new joint.shapes.basic.DecoratedRectText({
                               position: { x: ((parseInt(arrayOfDevices[i].position))+2)*400, y: 150 },
                               attrs: { 
                                        text: { text:r[r.length-1] }
                                      }
                                });
                array3Cred.push(role);
                var type = new joint.shapes.basic.DecoratedRectText({
                               position: { x: ((parseInt(arrayOfDevices[i].position))+2)*400, y: 170 },
                               attrs: { 
                                        text: { text: arrayOfDevices[i].type}
                                      }
                                });
                array3Cred.push(type);
                
                
                if(arrayOfDevices[i].aLag!="")
                    {
                        a=arrayOfDevices[i].aLag.split('-');
                        a1=a[a.length-1];
                        if(a1.length>=2)
                            {
                                var leftPort= new joint.shapes.basic.DecoratedRectLeftPortLong({
                                       position: { x: ((parseInt(arrayOfDevices[i].position))+2)*400, y: 150 },
                                       attrs: { 
                                                text: { text:a1}
                                              }
                                        });
                                    array3Cred.push(leftPort);
                            }
                        else
                            {
                                var leftPort= new joint.shapes.basic.DecoratedRectLeftPort({
                                       position: { x: ((parseInt(arrayOfDevices[i].position))+2)*400, y: 150 },
                                       attrs: { 
                                                text: { text:a1}
                                              }
                                        });
                                    array3Cred.push(leftPort);
                            }
                    }
                else
                    {
                        a=arrayOfDevices[i].aPort.split('-');
                        a1=a[a.length-1];
                        if(a1.length>=2)
                            {
                                var rightPort= new joint.shapes.basic.DecoratedRectRightPortLong({
                                       position: { x: ((parseInt(arrayOfDevices[i].position))+2)*400, y: 150 },
                                       attrs: { 
                                                text: { text:a1}
                                              }
                                        });
                                    array3Cred.push(leftPort);
                            }
                        else
                            {
                                var rightPort= new joint.shapes.basic.DecoratedRectRightPort({
                                       position: { x: ((parseInt(arrayOfDevices[i].position))+2)*400, y: 150 },
                                       attrs: { 
                                                text: { text:a1}
                                              }
                                        });
                                    array3Cred.push(leftPort);
                            }
                    }
               
            }
    }

    }
    
else if(topologyType.toUpperCase()==="NON-NBNTOPOLOGY")
    {
        
            for(i=0;i<arrayOfDevices.length;i++)
                {
                if(arrayOfDevices[i].type.toUpperCase()==="NTU")
                    {
                        if(flgCloud==0 && flgEoSDH==0)
                                {
                                  p=100+(parseInt(arrayOfDevices[i].position))*400;  
                                }
                            else if(flgCloud==1 && flgEoSDH==0)
                                 {
                                   p=100+((parseInt(arrayOfDevices[i].position))+1)*400;
                                 }
                            else if(flgCloud==0 && flgEoSDH==1)
                                 {
                                   p=100+((parseInt(arrayOfDevices[i].position))+1)*400;
                                 }
                            else if(flgCloud==1 && flgEoSDH==1)
                                 {
                                   p=100+((parseInt(arrayOfDevices[i].position))+2)*400;
                                 }
                        
                        if(arrayOfDevices[i].count==1)
                            {
                                if(arrayOfDevices[i].zLag!="" )
                                    {
                                        previousZLag++;
                                        z=arrayOfDevices[i].zLag.split('-');
                                        right_port=z[z.length-1];
                                        left_port=arrayOfDevices[i].custPort;
                                        trackID="";
                                    }
                                else
                                    {
                                        left_port=arrayOfDevices[i].custPort;
                                        right_port=arrayOfDevices[i].zPort;
                                        trackID=arrayOfDevices[i].primaryTracID;
                                    }
                                
                            }
                        else
                            {
                                if(arrayOfDevices[i].aLag!="" && previousZLag!=0)
                                    {
                                        p-=100;
                                        a=arrayOfDevices[i].aLag.split('-');
                                        left_port=a[a.length-1];
                                        right_port=arrayOfDevices[i].custPort;
                                        
                                        objNON_NBN={device_name:"",device_pos:"",node:""};
                                        var Lag = new joint.shapes.basic.DecoratedRectLag({
                                                       position: { x: 110+posPrevDev, y: 150 },
                                                       size: { width:100, height: 6},
                                                       attrs: { 
                                                            image: { 'xlink:href': lagImage}
                                                               }
                                                           });
                                        objNON_NBN.device_name="LAG"
                                        objNON_NBN.device_pos=110+posPrevDev;
                                        objNON_NBN.node=Lag;
                                        arrayNonNBN.push(objNON_NBN);
                                        trackID="";
                                        previousZLag=0;
                                    }
                                else
                                    {
                                        left_port=arrayOfDevices[i].aPort;
                                        right_port=arrayOfDevices[i].custPort;
                                        trackID="";
                                    }
                        
                            }
                        
                        objDropdown={deviceName:"",id:"",deviceCount:"",xCord:"",yCord:"",eName:""};
                        objNON_NBN={device_name:"",device_pos:"",node:""};
                        var NTU = new joint.shapes.basic.DecoratedRect({
                                       position: { x: p, y: 180 },
                                       attrs: { 
                                                image: { 'xlink:href': 'nvImages/NTU.png'}
                                              }
                                        });
                        
                        objNON_NBN.device_name=arrayOfDevices[i].type.toUpperCase();
                        objNON_NBN.device_pos=p;
                        objNON_NBN.node=NTU;
                        arrayNonNBN.push(objNON_NBN);
                        
                        objDropdown.deviceName="nonNBN_NTU";
                        objDropdown.deviceCount=arrayOfDevices[i].count;
						objDropdown.eName=arrayOfDevices[i].equipmentName;
                        objDropdown.id=NTU.id;
                        objDropdown.xCord=p;
                        objDropdown.yCord=180;
                        arrayDropdown.push(objDropdown);
                        
                        var equipName = new joint.shapes.basic.DecoratedRectText({
                                       position: { x: p, y: 190 },
                                       attrs: { 
                                                text: { text: arrayOfDevices[i].equipmentName}
                                              }
                                        });
                        arrayNonNBNCred.push(equipName);
                        r=arrayOfDevices[i].role.split(' ');
                        var role = new joint.shapes.basic.DecoratedRectText({
                                       position: { x: p, y: 210 },
                                       attrs: { 
                                                text: { text: r[r.length-1]}
                                              }
                                        });
                        arrayNonNBNCred.push(role);
                        var type = new joint.shapes.basic.DecoratedRectText({
                                       position: { x: p, y: 230 },
                                       attrs: { 
                                                text: { text: arrayOfDevices[i].type}
                                              }
                                        });
                        arrayNonNBNCred.push(type);
                        var uniFNN = new joint.shapes.basic.DecoratedRectText({
                                       position: { x: p, y: 30 },
                                       attrs: { 
                                                text: { text: 'UNI FNN:'+arrayOfDevices[i].uniFNN}
                                              }
                                        });
                        arrayNonNBNCred.push(uniFNN);
                        
                        
                    
                        var leftPort= new joint.shapes.basic.DecoratedRectLeftPort({
                                       position: { x: p, y: 170 },
                                       attrs: { 
                                                text: { text:left_port}
                                              }
                                        });
                        arrayNonNBNCred.push(leftPort);
                        var rightPort= new joint.shapes.basic.DecoratedRectRightPort({
                                       position: { x: 3+p, y: 180 },
                                       attrs: { 
                                                text: { text:right_port}
                                              }
                                        });
                        arrayNonNBNCred.push(rightPort);
                        var primaryTrac = new joint.shapes.basic.DecoratedRectPrimaryTracID({
                                       position: { x: 150+p, y: 150 },
                                       attrs: { 
                                                text: { text:trackID}
                                              }
                                        });
                        arrayNonNBNCred.push(primaryTrac);
                        posPrevDev=p;
                       
                    }
                if(arrayOfDevices[i].type.toUpperCase()==="MSE")
                    {
                        if(switching.toUpperCase()==="LOCAL")
                            {
                                if(flgEoSDH==1)
                                    {
                                      p=100+((parseInt(arrayOfDevices[i].position))+1)*400;
                                    }
                                else 
                                     {
                                       p=100+(parseInt(arrayOfDevices[i].position))*400;
                                     }
                        
                                    if(arrayOfDevices[i].zLag!="" )
                                                {
                                                    previousZLag++;
                                                    
                                                    right_port=arrayOfDevices[i].zLag.substr(11);
                                                    left_port=arrayOfDevices[i].aPort;
                                                    trackID="";
                                                    if(arrayOfDevices[i].aLag!="")
                                                        {
                                                           left_port=arrayOfDevices[i].aLag.substr(11); 
                                                        }


                                                }


                                            else if(arrayOfDevices[i].aLag!="" && previousZLag!=0)
                                                {
                                                    p-=100;
                                                    
                                                    left_port=arrayOfDevices[i].aLag.substr(11);
                                                    right_port=arrayOfDevices[i].zPort;
                                                    trackID=arrayOfDevices[i].primaryTracID;

                                                    objNON_NBN={device_name:"",device_pos:"",node:""};
                                                    var Lag = new joint.shapes.basic.DecoratedRectLag({
                                                                   position: { x: 110+posPrevDev, y: 150 },
                                                                   size: { width:100, height: 6},
                                                                   attrs: { 
                                                                        image: { 'xlink:href': lagImage}
                                                                           }
                                                                       });
                                                    objNON_NBN.device_name="LAG"
                                                    objNON_NBN.device_pos=110+posPrevDev;
                                                    objNON_NBN.node=Lag;
                                                    arrayNonNBN.push(objNON_NBN);

                                                    previousZLag=0;

                                                    if(arrayOfDevices[i].zLag!="")
                                                        {
                                                           right_port=arrayOfDevices[i].zLag.substr(11);
                                                           trackID="";
                                                        }
                                                }
                                            else if(arrayOfDevices[i].aLag=="" && arrayOfDevices[i].zLag=="")
                                                {
                                                    left_port=arrayOfDevices[i].aPort;
                                                    right_port=arrayOfDevices[i].zPort;
                                                    trackID=arrayOfDevices[i].primaryTracID;
                                                }

                                    objDropdown={deviceName:"",id:"",deviceCount:"",xCord:"",yCord:"",eName:""};
                                    objNON_NBN={device_name:"",device_pos:"",node:""};
                                    var MSE = new joint.shapes.basic.DecoratedRect({
                                                   position: { x: p, y: 180 },
                                                   attrs: { 
                                                            image: { 'xlink:href': 'nvImages/MSE.png'}
                                                          }
                                                    });

                                    objNON_NBN.device_name=arrayOfDevices[i].type.toUpperCase();
                                    objNON_NBN.device_pos=p;
                                    objNON_NBN.node=MSE;
                                    arrayNonNBN.push(objNON_NBN);

                                    objDropdown.deviceName="nonNBN_MSE";
                                    objDropdown.deviceCount=arrayOfDevices[i].count;
									objDropdown.eName=arrayOfDevices[i].equipmentName;
                                    objDropdown.id=MSE.id;
                                    objDropdown.xCord=p;
                                    objDropdown.yCord=180;
                                    arrayDropdown.push(objDropdown);

                                    var equipName = new joint.shapes.basic.DecoratedRectText({
                                                   position: { x: p, y: 190 },
                                                   attrs: { 
                                                            text: { text: arrayOfDevices[i].equipmentName}
                                                          }
                                                    });
                                    arrayNonNBNCred.push(equipName);
                                    r=arrayOfDevices[i].role.split(' ');
                                    var role = new joint.shapes.basic.DecoratedRectText({
                                                   position: { x: p, y: 210 },
                                                   attrs: { 
                                                            text: { text: r[r.length-1]}
                                                          }
                                                    });
                                    arrayNonNBNCred.push(role);
                                    var type = new joint.shapes.basic.DecoratedRectText({
                                                   position: { x: p, y: 230 },
                                                   attrs: { 
                                                            text: { text: arrayOfDevices[i].type}
                                                          }
                                                    });
                                    arrayNonNBNCred.push(type);

                                    var leftPort= new joint.shapes.basic.DecoratedRectLeftPortLong({
                                                   position: { x: p, y: 155 },
                                                   attrs: { 
                                                            text: { text:left_port}
                                                          }
                                                    });
                                    arrayNonNBNCred.push(leftPort);
                                    var rightPort= new joint.shapes.basic.DecoratedRectRightPortLong({
                                                   position: { x: 10+p, y: 150 },
                                                   attrs: { 
                                                            text: { text:right_port}
                                                          }
                                                    });
                                    arrayNonNBNCred.push(rightPort);
                                    var primaryTrac = new joint.shapes.basic.DecoratedRectPrimaryTracID({
                                                   position: { x: 150+p, y: 150 },
                                                   attrs: { 
                                                            text: { text:trackID}
                                                          }
                                                    });
                                    arrayNonNBNCred.push(primaryTrac);
                                    posPrevDev=p;
                            }
                    else
                        {
                            if(flgCloud==0 && flgEoSDH==0)
                                {
                                  p=100+(parseInt(arrayOfDevices[i].position))*400;  
                                }
                            else if(flgCloud==1 && flgEoSDH==0)
                                 {
                                   p=100+((parseInt(arrayOfDevices[i].position))+1)*400;
                                 }
                            else if(flgCloud==0 && flgEoSDH==1)
                                 {
                                   p=100+((parseInt(arrayOfDevices[i].position))+1)*400;
                                 }
                            else if(flgCloud==1 && flgEoSDH==1)
                                 {
                                   p=100+((parseInt(arrayOfDevices[i].position))+2)*400;
                                 }
                                    if(arrayOfDevices[i].zLag!="" )
                                                {
                                                    previousZLag++;
                                                    
                                                    right_port=arrayOfDevices[i].zLag.substr(11);
                                                    left_port=arrayOfDevices[i].aPort;
                                                    trackID="";
                                                    if(arrayOfDevices[i].aLag!="")
                                                        {
                                                           left_port=arrayOfDevices[i].aLag.substr(11); 
                                                        }
                                                }

                                    else if(arrayOfDevices[i].aLag!="" && previousZLag!=0)
                                                {
                                                    p-=100;
                                                    
                                                    left_port=arrayOfDevices[i].aLag.substr(11);
                                                    right_port=arrayOfDevices[i].zPort;
                                                    trackID=arrayOfDevices[i].primaryTracID;

                                                    objNON_NBN={device_name:"",device_pos:"",node:""};
                                                    var Lag = new joint.shapes.basic.DecoratedRectLag({
                                                                   position: { x: 110+posPrevDev, y: 150 },
                                                                   size: { width:100, height: 6},
                                                                   attrs: { 
                                                                        image: { 'xlink:href': lagImage}
                                                                           }
                                                                       });
                                                    objNON_NBN.device_name="LAG"
                                                    objNON_NBN.device_pos=110+posPrevDev;
                                                    objNON_NBN.node=Lag;
                                                    arrayNonNBN.push(objNON_NBN);

                                                    previousZLag=0;

                                                    if(arrayOfDevices[i].zLag!="")
                                                        {
                                                           right_port=arrayOfDevices[i].zLag.substr(11); 
                                                           trackID="";
                                                        }
                                                }
                                    else if(arrayOfDevices[i].aLag=="" && arrayOfDevices[i].zLag=="")
                                        {
                                            left_port=arrayOfDevices[i].aPort;
                                            right_port=arrayOfDevices[i].zPort;
                                            trackID=arrayOfDevices[i].primaryTracID;
                                        }
                                    
                                    objDropdown={deviceName:"",id:"",deviceCount:"",xCord:"",yCord:"",eName:""};
                                    objNON_NBN={device_name:"",device_pos:"",node:""};
                                    var MSE = new joint.shapes.basic.DecoratedRect({
                                                   position: { x: p, y: 180 },
                                                   attrs: { 
                                                            image: { 'xlink:href': 'nvImages/MSE.png'}
                                                          }
                                                    });

                                    objNON_NBN.device_name=arrayOfDevices[i].type.toUpperCase();
                                    objNON_NBN.device_pos=p;
                                    objNON_NBN.node=MSE;
                                    arrayNonNBN.push(objNON_NBN);

                                    objDropdown.deviceName="nonNBN_MSE";
                                    objDropdown.deviceCount=arrayOfDevices[i].count;
									objDropdown.eName=arrayOfDevices[i].equipmentName;
                                    objDropdown.id=MSE.id;
                                    objDropdown.xCord=p;
                                    objDropdown.yCord=180;
                                    arrayDropdown.push(objDropdown);

                                    var equipName = new joint.shapes.basic.DecoratedRectText({
                                                   position: { x: p, y: 190 },
                                                   attrs: { 
                                                            text: { text: arrayOfDevices[i].equipmentName}
                                                          }
                                                    });
                                    arrayNonNBNCred.push(equipName);
                                    r=arrayOfDevices[i].role.split(' ');
                                    var role = new joint.shapes.basic.DecoratedRectText({
                                                   position: { x: p, y: 210 },
                                                   attrs: { 
                                                            text: { text: r[r.length-1]}
                                                          }
                                                    });
                                    arrayNonNBNCred.push(role);
                                    var type = new joint.shapes.basic.DecoratedRectText({
                                                   position: { x: p, y: 230 },
                                                   attrs: { 
                                                            text: { text: arrayOfDevices[i].type}
                                                          }
                                                    });
                                    arrayNonNBNCred.push(type);
                            
                                    
                                    if(flgCloud==0)
                                        {
                                            objNON_NBN={device_name:"",device_pos:"",node:""};
                                            var Cloud=new joint.shapes.basic.DecoratedRectCloud({
                                                               position: { x:400+p, y: 157 },
                                                               attrs: { 
                                                                        text: { text: 'Pseudo Wire Circuit' },
                                                                        image: { 'xlink:href': 'nvImages/CLOUD.png'}
                                                                      }
                                                                });
                                              objNON_NBN.device_name="CLOUD";
                                              objNON_NBN.device_pos=p;
                                              objNON_NBN.node=Cloud;
                                              arrayNonNBN.push(objNON_NBN);
                                            
                                              flgCloud++;
                                            
                                              trackID="";
                                              right_port="";
                                        }

                                    var leftPort= new joint.shapes.basic.DecoratedRectLeftPortLong({
                                                   position: { x: p, y: 155 },
                                                   attrs: { 
                                                            text: { text:left_port}
                                                          }
                                                    });
                                    arrayNonNBNCred.push(leftPort);
                                    var rightPort= new joint.shapes.basic.DecoratedRectRightPortLong({
                                                   position: { x: 10+p, y: 150 },
                                                   attrs: { 
                                                            text: { text:right_port}
                                                          }
                                                    });
                                    arrayNonNBNCred.push(rightPort);
                                    var primaryTrac = new joint.shapes.basic.DecoratedRectPrimaryTracID({
                                                   position: { x: 150+p, y: 150 },
                                                   attrs: { 
                                                            text: { text:trackID}
                                                          }
                                                    });
                                    arrayNonNBNCred.push(primaryTrac);
                                    posPrevDev=p;
                        }
                        
                    }
                if(arrayOfDevices[i].type.toUpperCase()==="ASR")
                    {
                        if(switching.toUpperCase()==="LOCAL")
                            {
                                if(flgEoSDH==1)
                                    {
                                      p=100+((parseInt(arrayOfDevices[i].position))+1)*400;
                                    }
                                else 
                                     {
                                       p=100+(parseInt(arrayOfDevices[i].position))*400;
                                     }
                                if(arrayOfDevices[i].zLag!="" )
                                                {
                                                    previousZLag++;
                                                    
                                                    right_port=arrayOfDevices[i].zLag.substr(11);
                                                    left_port=arrayOfDevices[i].aPort;
                                                    trackID="";
                                                    if(arrayOfDevices[i].aLag!="")
                                                        {
                                                           left_port=arrayOfDevices[i].aLag.substr(11); 
                                                        }
                                                }
                                    else if(arrayOfDevices[i].aLag!="" && previousZLag!=0)
                                                {
                                                    p-=100;
                                                    
                                                    left_port=arrayOfDevices[i].aLag.substr(11);
                                                    right_port=arrayOfDevices[i].zPort;
                                                    trackID=arrayOfDevices[i].primaryTracID;

                                                    objNON_NBN={device_name:"",device_pos:"",node:""};
                                                    var Lag = new joint.shapes.basic.DecoratedRectLag({
                                                                   position: { x: 110+posPrevDev, y: 150 },
                                                                   size: { width:100, height: 6},
                                                                   attrs: { 
                                                                        image: { 'xlink:href': lagImage}
                                                                           }
                                                                       });
                                                    objNON_NBN.device_name="LAG"
                                                    objNON_NBN.device_pos=110+posPrevDev;
                                                    objNON_NBN.node=Lag;
                                                    arrayNonNBN.push(objNON_NBN);

                                                    previousZLag=0;

                                                    if(arrayOfDevices[i].zLag!="")
                                                        {
                                                           right_port=arrayOfDevices[i].zLag.substr(11); 
                                                           trackID="";
                                                        }
                                                }
                                            else if(arrayOfDevices[i].aLag=="" && arrayOfDevices[i].zLag=="")
                                                {
                                                    left_port=arrayOfDevices[i].aPort.substr(7);
                                                    right_port=arrayOfDevices[i].zPort.substr(7);
                                                    trackID=arrayOfDevices[i].primaryTracID;
                                                }

                        
                                    objDropdown={deviceName:"",id:"",deviceCount:"",xCord:"",yCord:"",eName:""};
                                    objNON_NBN={device_name:"",device_pos:"",node:""};
                                    var ASR = new joint.shapes.basic.DecoratedRect({
                                                   position: { x: p, y: 180 },
                                                   attrs: { 
                                                            image: { 'xlink:href': 'nvImages/ASR.png'}
                                                          }
                                                    });

                                    objNON_NBN.device_name=arrayOfDevices[i].type.toUpperCase();
                                    objNON_NBN.device_pos=p;
                                    objNON_NBN.node=ASR;
                                    arrayNonNBN.push(objNON_NBN);

                                    objDropdown.deviceName="nonNBN_ASR";
                                    objDropdown.deviceCount=arrayOfDevices[i].count;
									objDropdown.eName=arrayOfDevices[i].equipmentName;
                                    objDropdown.id=ASR.id;
                                    objDropdown.xCord=p;
                                    objDropdown.yCord=180;
                                    arrayDropdown.push(objDropdown);

                                    var equipName = new joint.shapes.basic.DecoratedRectText({
                                                   position: { x: p, y: 190 },
                                                   attrs: { 
                                                            text: { text: arrayOfDevices[i].equipmentName}
                                                          }
                                                    });
                                    arrayNonNBNCred.push(equipName);
                                    r=arrayOfDevices[i].role.split(' ');
                                    var role = new joint.shapes.basic.DecoratedRectText({
                                                   position: { x: p, y: 210 },
                                                   attrs: { 
                                                            text: { text: r[r.length-1]}
                                                          }
                                                    });
                                    arrayNonNBNCred.push(equipName);
                                    var type = new joint.shapes.basic.DecoratedRectText({
                                                   position: { x: p, y: 230 },
                                                   attrs: { 
                                                            text: { text: arrayOfDevices[i].type}
                                                          }
                                                    });
                                    arrayNonNBNCred.push(equipName);
                                    



                                    var leftPort= new joint.shapes.basic.DecoratedRectLeftPortLong({
                                                   position: { x: p, y: 160},
                                                   attrs: { 
                                                            text: { text:left_port}
                                                          }
                                                    });
                                    arrayNonNBNCred.push(leftPort);
                                    var rightPort= new joint.shapes.basic.DecoratedRectRightPortLong({
                                                   position: { x: 10+p, y: 160 },
                                                   attrs: { 
                                                            text: { text:right_port}
                                                          }
                                                    });
                                    arrayNonNBNCred.push(rightPort);
                                    var primaryTrac = new joint.shapes.basic.DecoratedRectPrimaryTracID({
                                                   position: { x: 150+p, y: 160 },
                                                   attrs: { 
                                                            text: { text:trackID}
                                                          }
                                                    });
                                    arrayNonNBNCred.push(primaryTrac);
                                    posPrevDev=p;
                            }
                    else
                        {
                            if(flgCloud==0 && flgEoSDH==0)
                                {
                                  p=100+(parseInt(arrayOfDevices[i].position))*400;  
                                }
                            else if(flgCloud==1 && flgEoSDH==0)
                                 {
                                   p=100+((parseInt(arrayOfDevices[i].position))+1)*400;
                                 }
                            else if(flgCloud==0 && flgEoSDH==1)
                                 {
                                   p=100+((parseInt(arrayOfDevices[i].position))+1)*400;
                                 }
                            else if(flgCloud==1 && flgEoSDH==1)
                                 {
                                   p=100+((parseInt(arrayOfDevices[i].position))+2)*400;
                                 }
                                    
                            
                                    if(arrayOfDevices[i].zLag!="" )
                                                {
                                                    previousZLag++;
                                                    
                                                    right_port=arrayOfDevices[i].zLag.substr(11);
                                                    left_port=arrayOfDevices[i].aPort;
                                                    trackID="";
                                                    if(arrayOfDevices[i].aLag!="")
                                                        {
                                                           left_port=arrayOfDevices[i].aLag.substr(11); 
                                                        }
                                                }

                                    else if(arrayOfDevices[i].aLag!="" && previousZLag!=0)
                                                {
                                                    p-=100;
                                                    left_port=arrayOfDevices[i].aLag.substr(11);
                                                    
                                                    right_port=arrayOfDevices[i].zPort;
                                                    trackID=arrayOfDevices[i].primaryTracID;

                                                    objNON_NBN={device_name:"",device_pos:"",node:""};
                                                    var Lag = new joint.shapes.basic.DecoratedRectLag({
                                                                   position: { x: 110+posPrevDev, y: 150 },
                                                                   size: { width:100, height: 6},
                                                                   attrs: { 
                                                                        image: { 'xlink:href': lagImage}
                                                                           }
                                                                       });
                                                    objNON_NBN.device_name="LAG"
                                                    objNON_NBN.device_pos=110+posPrevDev;
                                                    objNON_NBN.node=Lag;
                                                    arrayNonNBN.push(objNON_NBN);

                                                    previousZLag=0;

                                                    if(arrayOfDevices[i].zLag!="")
                                                        {
                                                           right_port=arrayOfDevices[i].zLag.substr(11); 
                                                           trackID="";
                                                        }
                                                }
                                    else if(arrayOfDevices[i].aLag=="" && arrayOfDevices[i].zLag=="")
                                        {
                                            left_port=arrayOfDevices[i].aPort.substr(7);
                                            right_port=arrayOfDevices[i].zPort.substr(7);
                                            trackID=arrayOfDevices[i].primaryTracID;
                                        }
                                    objDropdown={deviceName:"",id:"",deviceCount:"",xCord:"",yCord:"",eName:""};
                                    objNON_NBN={device_name:"",device_pos:"",node:""};
                                    var ASR = new joint.shapes.basic.DecoratedRect({
                                                   position: { x: p, y: 180 },
                                                   attrs: { 
                                                            image: { 'xlink:href': 'nvImages/ASR.png'}
                                                          }
                                                    });

                                    objNON_NBN.device_name=arrayOfDevices[i].type.toUpperCase();
                                    objNON_NBN.device_pos=p;
                                    objNON_NBN.node=ASR;
                                    arrayNonNBN.push(objNON_NBN);

                                    objDropdown.deviceName="nonNBN_ASR";
                                    objDropdown.deviceCount=arrayOfDevices[i].count;
									objDropdown.eName=arrayOfDevices[i].equipmentName;
                                    objDropdown.id=ASR.id;
                                    objDropdown.xCord=p;
                                    objDropdown.yCord=180;
                                    arrayDropdown.push(objDropdown);

                                    var equipName = new joint.shapes.basic.DecoratedRectText({
                                                   position: { x: p, y: 190 },
                                                   attrs: { 
                                                            text: { text: arrayOfDevices[i].equipmentName}
                                                          }
                                                    });
                                    arrayNonNBNCred.push(equipName);
                                    r=arrayOfDevices[i].role.split(' ');
                                    var role = new joint.shapes.basic.DecoratedRectText({
                                                   position: { x: p, y: 210 },
                                                   attrs: { 
                                                            text: { text: r[r.length-1]}
                                                          }
                                                    });
                                    arrayNonNBNCred.push(role);
                                    var type = new joint.shapes.basic.DecoratedRectText({
                                                   position: { x: p, y: 230 },
                                                   attrs: { 
                                                            text: { text: arrayOfDevices[i].type}
                                                          }
                                                    });
                                    arrayNonNBNCred.push(type);
                                    
                                    if(flgCloud==0)
                                        {
                                            objNON_NBN={device_name:"",device_pos:"",node:""};
                                            var Cloud=new joint.shapes.basic.DecoratedRectCloud({
                                                               position: { x: p+400, y: 157 },
                                                               attrs: { 
                                                                        text: { text: 'Pseudo Wire Circuit' },
                                                                        image: { 'xlink:href': 'nvImages/CLOUD.png'}
                                                                      }
                                                                });
                                              objNON_NBN.device_name="CLOUD";
                                              objNON_NBN.device_pos=p;
                                              objNON_NBN.node=Cloud;
                                              arrayNonNBN.push(objNON_NBN);
                                            
                                              flgCloud++;
                                            
                                              trackID="";
                                              right_port="";
                                        }

                                    var leftPort= new joint.shapes.basic.DecoratedRectLeftPortLong({
                                                   position: { x: p, y: 160 },
                                                   attrs: { 
                                                            text: { text:left_port}
                                                          }
                                                    });
                                    arrayNonNBNCred.push(leftPort);
                                    var rightPort= new joint.shapes.basic.DecoratedRectRightPortLong({
                                                   position: { x: 10+p, y: 150 },
                                                   attrs: { 
                                                            text: { text:right_port}
                                                          }
                                                    });
                                    arrayNonNBNCred.push(rightPort);
                                    var primaryTrac = new joint.shapes.basic.DecoratedRectPrimaryTracID({
                                                   position: { x: 150+p, y: 160 },
                                                   attrs: { 
                                                            text: { text:trackID}
                                                          }
                                                    });
                                    arrayNonNBNCred.push(primaryTrac);
                                    posPrevDev=p;
                        }
                        
                    }
                if(arrayOfDevices[i].type.toUpperCase()==="ADM")
                    {
                        
                        if(flgCloud==0 && flgEoSDH==0)
                                {
                                  p=100+(parseInt(arrayOfDevices[i].position))*400;  
                                }
                            else if(flgCloud==1 && flgEoSDH==0)
                                 {
                                   p=100+((parseInt(arrayOfDevices[i].position))+1)*400;
                                 }
                            else if(flgCloud==0 && flgEoSDH==1)
                                 {
                                   p=100+((parseInt(arrayOfDevices[i].position))+1)*400;
                                 }
                            else if(flgCloud==1 && flgEoSDH==1)
                                 {
                                   p=100+((parseInt(arrayOfDevices[i].position))+2)*400;
                                 }
                        
                        if(arrayOfDevices[i].zLag!="" )
                                                {
                                                    previousZLag++;
                                                    z=arrayOfDevices[i].zLag.split('-');
                                                    right_port=z[z.length-1];
                                                    left_port=arrayOfDevices[i].aPort;
                                                    trackID="";
                                                    if(arrayOfDevices[i].aLag!="")
                                                        {
                                                           a=arrayOfDevices[i].aLag.split('-');
                                                           left_port=a[a.length-1]; 
                                                        }
                                                }

                                    else if(arrayOfDevices[i].aLag!="" && previousZLag!=0)
                                                {
                                                    p-=100;
                                                    a=arrayOfDevices[i].aLag.split('-');
                                                    left_port=a[a.length-1];
                                                    right_port=arrayOfDevices[i].zPort;
                                                    trackID=arrayOfDevices[i].primaryTracID;

                                                    objNON_NBN={device_name:"",device_pos:"",node:""};
                                                    var Lag = new joint.shapes.basic.DecoratedRectLag({
                                                                   position: { x: 110+posPrevDev, y: 150 },
                                                                   size: { width:100, height: 6},
                                                                   attrs: { 
                                                                        image: { 'xlink:href': lagImage}
                                                                           }
                                                                       });
                                                    objNON_NBN.device_name="LAG"
                                                    objNON_NBN.device_pos=110+posPrevDev;
                                                    objNON_NBN.node=Lag;
                                                    arrayNonNBN.push(objNON_NBN);

                                                    previousZLag=0;

                                                    if(arrayOfDevices[i].zLag!="")
                                                        {
                                                           z=arrayOfDevices[i].zLag.split('-');
                                                           right_port=z[z.length-1]; 
                                                           trackID="";
                                                        }
                                                }
                                    else if(arrayOfDevices[i].aLag=="" && arrayOfDevices[i].zLag=="")
                                        {
                                            left_port=arrayOfDevices[i].aPort;
                                            right_port=arrayOfDevices[i].zPort;
                                            trackID=arrayOfDevices[i].primaryTracID;
                                        }
                                    
                        objDropdown={deviceName:"",id:"",deviceCount:"",xCord:"",yCord:"",eName:""};
                        objNON_NBN={device_name:"",device_pos:"",node:""};
                                    var ADM = new joint.shapes.basic.DecoratedRect({
                                                   position: { x: p, y: 180 },
                                                   attrs: { 
                                                            image: { 'xlink:href': 'nvImages/ADM.png'}
                                                          }
                                                    });

                                    objNON_NBN.device_name=arrayOfDevices[i].type.toUpperCase();
                                    objNON_NBN.device_pos=p;
                                    objNON_NBN.node=ADM;
                                    arrayNonNBN.push(objNON_NBN);

                                    objDropdown.deviceName=arrayOfDevices[i].type.toUpperCase();
                                    objDropdown.deviceCount=arrayOfDevices[i].count;
									objDropdown.eName=arrayOfDevices[i].equipmentName;
                                    objDropdown.id=ADM.id;
                                    objDropdown.xCord=p;
                                    objDropdown.yCord=180;
                                    arrayDropdown.push(objDropdown);

                                    var equipName = new joint.shapes.basic.DecoratedRectText({
                                                   position: { x: p, y: 190 },
                                                   attrs: { 
                                                            text: { text: arrayOfDevices[i].equipmentName}
                                                          }
                                                    });
                                    arrayNonNBNCred.push(equipName);
                                    r=arrayOfDevices[i].role.split(' ');
                                    var role = new joint.shapes.basic.DecoratedRectText({
                                                   position: { x: p, y: 210 },
                                                   attrs: { 
                                                            text: { text: r[r.length-1]}
                                                          }
                                                    });
                                    arrayNonNBNCred.push(role);
                                    var type = new joint.shapes.basic.DecoratedRectText({
                                                   position: { x: p, y: 230 },
                                                   attrs: { 
                                                            text: { text: arrayOfDevices[i].type}
                                                          }
                                                    });
                                    arrayNonNBNCred.push(type);
                        
                                    if(flgEoSDH==0)
                                        {
                                            objNON_NBN={device_name:"",device_pos:"",node:""};
                                            var EoSDH=new joint.shapes.basic.DecoratedRectCloud({
                                                               position: { x: p+400, y: 155 },
                                                               attrs: { 
                                                                        text: { text: 'EoSDH' },
                                                                        image: { 'xlink:href': 'nvImages/EoSDH.png'}
                                                                      }
                                                                });
                                              objNON_NBN.device_name="EoSDH";
                                              objNON_NBN.device_pos=p;
                                              objNON_NBN.node=EoSDH;
                                              arrayNonNBN.push(objNON_NBN);
                                            
                                              flgEoSDH++;
                                            
                                              trackID="";
                                              right_port="";
                                        }

                                    var leftPort= new joint.shapes.basic.DecoratedRectLeftPortLong({
                                                   position: { x: p, y: 160 },
                                                   attrs: { 
                                                            text: { text:left_port}
                                                          }
                                                    });
                                    arrayNonNBNCred.push(leftPort);
                                    var rightPort= new joint.shapes.basic.DecoratedRectRightPortLong({
                                                   position: { x: 5+p, y: 150 },
                                                   attrs: { 
                                                            text: { text:right_port}
                                                          }
                                                    });
                                    arrayNonNBNCred.push(rightPort);
                                    var primaryTrac = new joint.shapes.basic.DecoratedRectPrimaryTracID({
                                                   position: { x: 180+p, y: 150 },
                                                   attrs: { 
                                                            text: { text:trackID}
                                                          }
                                                    });
                                    arrayNonNBNCred.push(primaryTrac);
                                    posPrevDev=p;
                        }
                if(arrayOfDevices[i].type.toUpperCase()==="AS")
                    {
                        
                        if(flgCloud==0 && flgEoSDH==0)
                                {
                                  p=100+(parseInt(arrayOfDevices[i].position))*400;  
                                }
                            else if(flgCloud==1 && flgEoSDH==0)
                                 {
                                   p=100+((parseInt(arrayOfDevices[i].position))+1)*400;
                                 }
                            else if(flgCloud==0 && flgEoSDH==1)
                                 {
                                   p=100+((parseInt(arrayOfDevices[i].position))+1)*400;
                                 }
                            else if(flgCloud==1 && flgEoSDH==1)
                                 {
                                   p=100+((parseInt(arrayOfDevices[i].position))+2)*400;
                                 }
                                  
                        
                                    if(arrayOfDevices[i].zLag!="" )
                                                {
                                                    previousZLag++;
                                                    z=arrayOfDevices[i].zLag.split('-');
                                                    right_port=z[z.length-1];
                                                    left_port=arrayOfDevices[i].aPort;
                                                    trackID="";
                                                    if(arrayOfDevices[i].aLag!="")
                                                        {
                                                           a=arrayOfDevices[i].aLag.split('-');
                                                           left_port=a[a.length-1]; 
                                                        }
                                                }

                                    else if(arrayOfDevices[i].aLag!="" && previousZLag!=0)
                                                {
                                                    p-=100;
                                                    a=arrayOfDevices[i].aLag.split('-');
                                                    left_port=a[a.length-1];
                                                    right_port=arrayOfDevices[i].zPort;
                                                    trackID=arrayOfDevices[i].primaryTracID;

                                                    objNON_NBN={device_name:"",device_pos:"",node:""};
                                                    var Lag = new joint.shapes.basic.DecoratedRectLag({
                                                                   position: { x: 110+posPrevDev, y: 150 },
                                                                   size: { width:100, height: 6},
                                                                   attrs: { 
                                                                        image: { 'xlink:href': lagImage}
                                                                           }
                                                                       });
                                                    objNON_NBN.device_name="LAG"
                                                    objNON_NBN.device_pos=110+posPrevDev;
                                                    objNON_NBN.node=Lag;
                                                    arrayNonNBN.push(objNON_NBN);

                                                    previousZLag=0;

                                                    if(arrayOfDevices[i].zLag!="")
                                                        {
                                                           z=arrayOfDevices[i].zLag.split('-');
                                                           right_port=z[z.length-1]; 
                                                           trackID="";
                                                        }
                                                }
                                    else if(arrayOfDevices[i].aLag=="" && arrayOfDevices[i].zLag=="")
                                        {
                                            left_port=arrayOfDevices[i].aPort;
                                            right_port=arrayOfDevices[i].zPort;
                                            trackID=arrayOfDevices[i].primaryTracID;
                                        }
                                    
                                   objDropdown={deviceName:"",id:"",deviceCount:"",xCord:"",yCord:"",eName:""};
                                   objNON_NBN={device_name:"",device_pos:"",node:""};
                                    var AS = new joint.shapes.basic.DecoratedRect({
                                                   position: { x: p, y: 180 },
                                                   attrs: { 
                                                            image: { 'xlink:href': 'nvImages/AS.png'}
                                                          }
                                                    });

                                    objNON_NBN.device_name=arrayOfDevices[i].type.toUpperCase();
                                    objNON_NBN.device_pos=p;
                                    objNON_NBN.node=AS;
                                    arrayNonNBN.push(objNON_NBN);

                                    objDropdown.deviceName="nonNBN_AS";
                                    objDropdown.deviceCount=arrayOfDevices[i].count;
									objDropdown.eName=arrayOfDevices[i].equipmentName;
                                    objDropdown.id=AS.id;
                                    objDropdown.xCord=p;
                                    objDropdown.yCord=180;
                                    arrayDropdown.push(objDropdown);

                                    var equipName = new joint.shapes.basic.DecoratedRectText({
                                                   position: { x: p, y: 190 },
                                                   attrs: { 
                                                            text: { text: arrayOfDevices[i].equipmentName}
                                                          }
                                                    });
                                    arrayNonNBNCred.push(equipName);
                                    r=arrayOfDevices[i].role.split(' ');
                                    var role = new joint.shapes.basic.DecoratedRectText({
                                                   position: { x: p, y: 210 },
                                                   attrs: { 
                                                            text: { text: r[r.length-1]}
                                                          }
                                                    });
                                    arrayNonNBNCred.push(role);
                                    var type = new joint.shapes.basic.DecoratedRectText({
                                                   position: { x: p, y: 230 },
                                                   attrs: { 
                                                            text: { text: arrayOfDevices[i].type}
                                                          }
                                                    });
                                    arrayNonNBNCred.push(type);
                            
                                    var leftPort= new joint.shapes.basic.DecoratedRectLeftPort({
                                                   position: { x: p, y: 190 },
                                                   attrs: { 
                                                            text: { text:left_port}
                                                          }
                                                    });
                                    arrayNonNBNCred.push(leftPort);
                                    var rightPort= new joint.shapes.basic.DecoratedRectRightPort({
                                                   position: { x: 12+p, y: 190 },
                                                   attrs: { 
                                                            text: { text:right_port}
                                                          }
                                                    });
                                    arrayNonNBNCred.push(rightPort);
                                    var primaryTrac = new joint.shapes.basic.DecoratedRectPrimaryTracID({
                                                   position: { x: 180+p, y: 150 },
                                                   attrs: { 
                                                            text: { text:trackID}
                                                          }
                                                    });
                                    arrayNonNBNCred.push(primaryTrac);
                                    posPrevDev=p;
                        }
                        
                }
        
    for(k=0;k<arrayNonNBN.length;k++)
       { 
          if(arrayNonNBN[k].device_name==="LAG")
               {
                   continue;
               }
           else
                {
                    
                     if(k==arrayNonNBN.length-1)
                         {
                             graph.addCell(arrayNonNBN[k].node);
                         }
                     else
                         {
                             if(arrayNonNBN[k+1].device_name==="LAG" )
                                {
                                    graph.addCells(arrayNonNBN[k].node,arrayNonNBN[k+1].node);
                                }
                             else
                                    {
                                    var link = new joint.dia.Link({
                                    source: { id: arrayNonNBN[k].node.id },
                                    target: { id: arrayNonNBN[k+1].node.id },
                                    attrs : {
                                        '.connection' : {
                                        'stroke' : lineColor,
                                        'stroke-width' : 3,
                                        },
                                        },
                                    
                                    });
                                    graph.addCells(arrayNonNBN[k].node,arrayNonNBN[k+1].node,link);
                                    }
                         }
                      }
            }
            for(k=0;k<arrayNonNBNCred.length;k++)
                {
                    console.log(arrayNonNBNCred[k]);
                    graph.addCell(arrayNonNBNCred[k]);
                }
        
            
    }

   
    

  
if(topologyType.toUpperCase()==="NBNTOPOLOGY"||topologyType.toUpperCase()==="TIDTOPOLOGY")   
    {
        for(j=0;j<array1.length-1;j++)
            {
                var linkArray1 = new joint.dia.Link({
                      source: { id: array1[j].id },
                      target: { id: array1[j+1].id },
                      attrs : {
                          '.connection' : {
                              'stroke' : '#EFD009',
                              'stroke-width' : 9,
                                           },
                              },
                    });
                graph.addCells(array1[j],array1[j+1],linkArray1);
            }

        for(k=0;k<array1Cred.length;k++)
            {
                graph.addCell(array1Cred[k]);
            }
        /*if(array2.length>=3)
            {
               for(j=0;j<array2.length-1;j++)
                {
                    graph.addCell(array2[j]);
                }

                var linkArray2AndCloud = new joint.dia.Link({
                    source: { id: array2[2].id },
                    target: { id: array2[3].id },
                    attrs : {
                              '.connection' : {
                              'stroke' : lineColor,
                              'stroke-width' : 3,
                                            },
                            },
                        });
             graph.addCells(array2[2],array2[3],linkArray2AndCloud);
            }


        else
            {
               for(j=0;j<array2.length-1;j++)
                    {
                        var linkArray2 = new joint.dia.Link({
                              source: { id: array2[j].id },
                              target: { id: array2[j+1].id },
                              attrs : {
                                  '.connection' : {
                                      'stroke' : lineColor,
                                      'stroke-width' : 3,
                                                   },
                                      },
                            });
                    graph.addCells(array2[j],array2[j+1],linkArray2);
                    }

            }*/
			
	for(k=0;k<array2.length;k++)
            { console.log(array2[k].name);
          if(array2[k].name==="LAG")
               {
                   continue;
               }
           else
                {
                    
                     if(k==array2.length-1)
                         {
                             graph.addCell(array2[k].node);
                         }
                     else
                         {
                             if(array2[k+1].name==="LAG" )
                                {
                                    graph.addCells(array2[k].node,array2[k+1].node);
                                }
                             else
                                    {
                                    var link = new joint.dia.Link({
                                    source: { id: array2[k].node.id },
                                    target: { id: array2[k+1].node.id },
                                    attrs : {
                                        '.connection' : {
                                        'stroke' : lineColor,
                                        'stroke-width' : 3,
                                        },
                                        },
                                    
                                    });
                                    graph.addCells(array2[k].node,array2[k+1].node,link);
                                    }
                         }
                      }
            }


                for(k=0;k<array2Cred.length;k++)
                    {
                        graph.addCell(array2Cred[k]);
                    }

                if(array3.length>=3)
                    {
                       for(j=0;j<array3.length;j++)
                        {
                            graph.addCell(array3[j]);
                        }
                    }
                else
                    {
                       for(j=0;j<array3.length-1;j++)
                            {
                                var linkArray3 = new joint.dia.Link({
                                      source: { id: array3[j].id },
                                      target: { id: array3[j+1].id },
                                      attrs : {
                                          '.connection' : {
                                              'stroke' : lineColor,
                                              'stroke-width' : 3,
                                                           },
                                              },
                                    });
                            graph.addCells(array3[j],array3[j+1],linkArray3);
                            }
                    }

                for(k=0;k<array3Cred.length;k++)
                    {
                        graph.addCell(array3Cred[k]);
                    }
if(rexTraffic.toUpperCase()==="TRUE")
    {
        var linkBetweenArray1And2 = new joint.dia.Link({
                              source: { id: array1[2].id },
                              target: { id: array2[0].node.id },
                              attrs : {
                                  '.connection' : {
                                      'stroke' : lineColor,
                                      'stroke-width' : 3,
                                                   },
                                      },
                            });
        var linkBetweenArray1And3 = new joint.dia.Link({
                              source: { id: array3[0].id },
                              target: { id: array1[2].id },
                              router: { name: 'orthogonal' },

                              attrs : {
                                  '.connection' : {
                                      'stroke' : '#EFD009',
                                      'stroke-width' : 9,
                                                   },
                                      },


                            });
    }
else
    {
        var linkBetweenArray1And2 = new joint.dia.Link({
                              source: { id: array1[2].id },
                              target: { id: array2[0].node.id },
                              attrs : {
                                  '.connection' : {
                                      'stroke' : '#EFD009',
                                      'stroke-width' : 9,
                                                   },
                                      },
                            });
        var linkBetweenArray1And3 = new joint.dia.Link({
                              source: { id: array3[0].id },
                              target: { id: array1[2].id },
                              router: { name: 'orthogonal' },
                              attrs : {
                                  '.connection' : {
                                      'stroke' : lineColor,
                                      'stroke-width' : 3,
                                                   },
                                      },


                            });
    }
                
linkBetweenArray1And2.addTo(graph);
linkBetweenArray1And3.addTo(graph);

				var LagFR = new joint.shapes.basic.DecoratedRectLagFR({
                               position: { x: posArray3ToCloud+110, y: 180 },
                               attrs: { 
                                        image: { 'xlink:href': lagFR}
                                      }
                                });

                var linkBetweenArray2And3 = new joint.dia.Link({
                              source: { id: array3[2].id },
                              target: { id: array2[array2.length-1].node.id },
                              router: { name: 'orthogonal' },

                              attrs : {
                                  '.connection' : {
                                      'stroke' : lineColor,
                                      'stroke-width' : 3,
                                                   },
                                      },


                            });
							
				if(conArray3ToCloud==true){graph.addCell(LagFR);}
				else{linkBetweenArray2And3.addTo(graph);}
                
    }
    
        
if(topologyType.toUpperCase()==="NBNTOPOLOGY")
    {
        for(k=0;k<array4.length;k++)
            { 
          if(array4[k].device_name==="LAG")
               {
                   continue;
               }
           else
                {
                    
                     if(k==array4.length-1)
                         {
                             graph.addCell(array4[k].node);
                         }
                     else
                         {
                             if(array4[k+1].device_name==="LAG" )
                                {
                                    graph.addCells(array4[k].node,array4[k+1].node);
                                }
                             else
                                    {
                                    var link = new joint.dia.Link({
                                    source: { id: array4[k].node.id },
                                    target: { id: array4[k+1].node.id },
                                    attrs : {
                                        '.connection' : {
                                        'stroke' : lineColor,
                                        'stroke-width' : 3,
                                        },
                                        },
                                    
                                    });
                                    graph.addCells(array4[k].node,array4[k+1].node,link);
                                    }
                         }
                      }
            }

        for(k=0;k<array4Cred.length;k++)
            {
              graph.addCell(array4Cred[k]);  
            }


        var linkBetweenArray2And4 = new joint.dia.Link({
                                      source: { id: array2[array2.length-1].node.id },
                                      target: { id: array4[0].node.id },

                                      attrs : {
                                          '.connection' : {
                                              'stroke' : lineColor,
                                              'stroke-width' : 3,
                                                           },
                                              },


                                    });
		var Lag = new joint.shapes.basic.DecoratedRectLagImage({
                               position: { x: posArray4ToCloud-160, y: 380 },
							   size: { width:60, height: 3},
                               attrs: { 
                                        image: { 'xlink:href': lagImage}
                                      }
                                });
				
		if(conArray4ToCloud==true){graph.addCell(Lag);}
		else{linkBetweenArray2And4.addTo(graph);}
        //linkBetweenArray2And4.addTo(graph);
    }



tidNTU=nbnNTU1=nbnNTU2=nbnCloud=nbnREX1=nbnREX2=nbnASR1=nbnASR2=nbnASR3=nbnMSE1=nbnMSE2=nbnMSE3=nbnAS=nonNBN_NTU1=nonNBN_ASR1=nonNBN_MSE1=nonNBN_AS1=nonNBN_NTU2=nonNBN_ASR2=nonNBN_MSE2=nonNBN_AS2=null;
xtidNTU=xNBNNTU1=xNBNNTU2=xNBNCloud=xNBNREX1=xNBNREX2=xNBNASR1=xNBNASR2=xNBNASR3=xNBNMSE1=xNBNMSE2=xNBNMSE3=xNBNAS=xnonNBN_NTU1=xnonNBN_ASR1=xnonNBN_MSE1=xnonNBN_AS1=xnonNBN_NTU2=xnonNBN_ASR2=xnonNBN_MSE2=xnonNBN_AS2=0;
ytidNTU=yNBNNTU1=yNBNNTU2=yNBNCloud=yNBNREX1=yNBNREX2=yNBNASR1=yNBNASR2=yNBNASR3=yNBNMSE1=yNBNMSE2=yNBNMSE3=yNBNAS=ynonNBN_NTU1=ynonNBN_ASR1=ynonNBN_MSE1=ynonNBN_AS1=ynonNBN_NTU2=ynonNBN_ASR2=ynonNBN_MSE2=ynonNBN_AS2=0;
vtidNTU=vnbnNTU1=vnbnNTU2=vnbnCloud=vnbnREX1=vnbnREX2=vnbnASR1=vnbnASR2=vnbnASR3=vnbnMSE1=vnbnMSE2=vnbnMSE3=vnbnAS=vnonNBN_NTU1=vnonNBN_ASR1=vnonNBN_MSE1=vnonNBN_AS1=vnonNBN_NTU2=vnonNBN_ASR2=vnonNBN_MSE2=vnonNBN_AS2=null;    
    
for(var t=0;t<arrayDropdown.length;t++)
    {   
       if(arrayDropdown[t].deviceName==="nonNBN_NTU" && arrayDropdown[t].deviceCount==1)   
           {
               nonNBN_NTU1=arrayDropdown[t].id;
               xnonNBN_NTU1=arrayDropdown[t].xCord;
               ynonNBN_NTU1=arrayDropdown[t].yCord;
			   vnonNBN_NTU1=arrayDropdown[t].eName;
           }
        if(arrayDropdown[t].deviceName==="nonNBN_NTU" && arrayDropdown[t].deviceCount==2)   
           {
               nonNBN_NTU2=arrayDropdown[t].id;
               xnonNBN_NTU2=arrayDropdown[t].xCord;
               ynonNBN_NTU2=arrayDropdown[t].yCord;
			   vnonNBN_NTU2=arrayDropdown[t].eName;
           }
        if(arrayDropdown[t].deviceName==="nonNBN_MSE" && arrayDropdown[t].deviceCount==1)   
           {
               nonNBN_MSE1=arrayDropdown[t].id;
               xnonNBN_MSE1=arrayDropdown[t].xCord;
               ynonNBN_MSE1=arrayDropdown[t].yCord;
			   vnonNBN_MSE1=arrayDropdown[t].eName;
           }
        if(arrayDropdown[t].deviceName==="nonNBN_MSE" && arrayDropdown[t].deviceCount==2)   
           {
               nonNBN_MSE2=arrayDropdown[t].id;
               xnonNBN_MSE2=arrayDropdown[t].xCord;
               ynonNBN_MSE2=arrayDropdown[t].yCord;
			   vnonNBN_MSE2=arrayDropdown[t].eName;
           }
        if(arrayDropdown[t].deviceName==="nonNBN_ASR" && arrayDropdown[t].deviceCount==1)   
           {
               nonNBN_ASR1=arrayDropdown[t].id;
               xnonNBN_ASR1=arrayDropdown[t].xCord;
               ynonNBN_ASR1=arrayDropdown[t].yCord;
			   vnonNBN_ASR1=arrayDropdown[t].eName;
           }
        if(arrayDropdown[t].deviceName==="nonNBN_ASR" && arrayDropdown[t].deviceCount==2)   
           {
               nonNBN_ASR2=arrayDropdown[t].id;
               xnonNBN_ASR2=arrayDropdown[t].xCord;
               ynonNBN_ASR2=arrayDropdown[t].yCord;
			   vnonNBN_ASR2=arrayDropdown[t].eName;
           }
        if(arrayDropdown[t].deviceName==="nonNBN_AS" && arrayDropdown[t].deviceCount==1)   
           {
               nonNBN_AS1=arrayDropdown[t].id;
               xnonNBN_AS1=arrayDropdown[t].xCord;
               ynonNBN_AS1=arrayDropdown[t].yCord;
			   vnonNBN_AS1=arrayDropdown[t].eName;
           }
        if(arrayDropdown[t].deviceName==="nonNBN_AS" && arrayDropdown[t].deviceCount==2)   
           {
               nonNBN_AS2=arrayDropdown[t].id;
               xnonNBN_AS2=arrayDropdown[t].xCord;
               ynonNBN_AS2=arrayDropdown[t].yCord;
			   vnonNBN_AS2=arrayDropdown[t].eName;
           }
	   if(arrayDropdown[t].deviceName==="TIDNTU")   
           {
               tidNTU=arrayDropdown[t].id;
               xtidNTU=arrayDropdown[t].xCord;
               ytidNTU=arrayDropdown[t].yCord;
			   vtidNTU=arrayDropdown[t].eName;
           } 
	   if(arrayDropdown[t].deviceName==="NTU" && arrayDropdown[t].deviceCount==1)   
           {
               nbnNTU1=arrayDropdown[t].id;
               xNBNNTU1=arrayDropdown[t].xCord;
               yNBNNTU1=arrayDropdown[t].yCord;
			   vnbnNTU1=arrayDropdown[t].eName;
           }
        if(arrayDropdown[t].deviceName==="NTU" && arrayDropdown[t].deviceCount==2)   
           {
               nbnNTU2=arrayDropdown[t].id;
               xNBNNTU2=arrayDropdown[t].xCord;
               yNBNNTU2=arrayDropdown[t].yCord;
			   vnbnNTU2=arrayDropdown[t].eName;
           }
        if(arrayDropdown[t].deviceName==="NBNCLOUD" )   
           {
               nbnCloud=arrayDropdown[t].id;
               xNBNCloud=arrayDropdown[t].xCord;
               yNBNCloud=arrayDropdown[t].yCord;
			   vnbnCloud=arrayDropdown[t].eName;
           }
        if(arrayDropdown[t].deviceName==="REX" && arrayDropdown[t].deviceCount==1)   
           {
               nbnREX1=arrayDropdown[t].id;
               xNBNREX1=arrayDropdown[t].xCord;
               yNBNREX1=arrayDropdown[t].yCord;
			   vnbnREX1=arrayDropdown[t].eName;
           }
        if(arrayDropdown[t].deviceName==="REX" && arrayDropdown[t].deviceCount==2)   
           {
               nbnREX2=arrayDropdown[t].id;
               xNBNREX2=arrayDropdown[t].xCord;
               yNBNREX2=arrayDropdown[t].yCord;
			   vnbnREX2=arrayDropdown[t].eName;
           }
        if(arrayDropdown[t].deviceName==="ASR" && arrayDropdown[t].deviceCount==1)   
           {
               nbnASR1=arrayDropdown[t].id;
               xNBNASR1=arrayDropdown[t].xCord;
               yNBNASR1=arrayDropdown[t].yCord;
			   vnbnASR1=arrayDropdown[t].eName;
           }
        if(arrayDropdown[t].deviceName==="ASR" && arrayDropdown[t].deviceCount==2)   
           {
               nbnASR2=arrayDropdown[t].id;
               xNBNASR2=arrayDropdown[t].xCord;
               yNBNASR2=arrayDropdown[t].yCord;
			   vnbnASR2=arrayDropdown[t].eName;
           }
        if(arrayDropdown[t].deviceName==="ASR" && arrayDropdown[t].deviceCount==3)   
           {
               nbnASR3=arrayDropdown[t].id;
               xNBNASR3=arrayDropdown[t].xCord;
               yNBNASR3=arrayDropdown[t].yCord;
			   vnbnASR3=arrayDropdown[t].eName;
           }
       if(arrayDropdown[t].deviceName==="MSE" && arrayDropdown[t].deviceCount==1)   
           {
               nbnMSE1=arrayDropdown[t].id;
               xNBNMSE1=arrayDropdown[t].xCord;
               yNBNMSE1=arrayDropdown[t].yCord;
			   vnbnMSE1=arrayDropdown[t].eName;
           }
       if(arrayDropdown[t].deviceName==="MSE" && arrayDropdown[t].deviceCount==2)   
           {
               nbnMSE2=arrayDropdown[t].id;
               xNBNMSE2=arrayDropdown[t].xCord;
               yNBNMSE2=arrayDropdown[t].yCord;
			   vnbnMSE2=arrayDropdown[t].eName;
           }
       if(arrayDropdown[t].deviceName==="MSE" && arrayDropdown[t].deviceCount==3)   
           {
               nbnMSE3=arrayDropdown[t].id;
               xNBNMSE3=arrayDropdown[t].xCord;
               yNBNMSE3=arrayDropdown[t].yCord;
			   vnbnMSE3=arrayDropdown[t].eName;
           }
       if(arrayDropdown[t].deviceName==="AS")   
           {
               nbnAS=arrayDropdown[t].id;
               xNBNAS=arrayDropdown[t].xCord;
               yNBNAS=arrayDropdown[t].yCord;
			   vnbnAS=arrayDropdown[t].eName;
           }
       
    }

var currentZoom=0.4;    
    
paper.on('cell:pointerdown', function(cellView) {
	    selected = cellView.model;

    
        if (selected.id==nonNBN_NTU1) 
	   	  	{
	    	
                document.getElementById("nonNBNNTU1Dropdown").classList.toggle("show");
                document.getElementById("nonNBNNTU1Dropdown").style.left = xnonNBN_NTU1+'px';
                document.getElementById("nonNBNNTU1Dropdown").style.top = ynonNBN_NTU1+100+'px';
                document.getElementById("nonNBNNTU1Dropdown").style.visibility='visible';

                    
                    
                    if(document.getElementById("nonNBNNTU2Dropdown").style.visibility==='visible'){document.getElementById("nonNBNNTU2Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nonNBNASR1Dropdown").style.visibility==='visible'){document.getElementById("nonNBNASR1Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nonNBNASR2Dropdown").style.visibility==='visible'){document.getElementById("nonNBNASR2Dropdown").style.visibility='hidden'};
                    
                    if(document.getElementById("nonNBNAS1Dropdown").style.visibility==='visible'){document.getElementById("nonNBNAS1Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nonNBNAS2Dropdown").style.visibility==='visible'){document.getElementById("nonNBNAS2Dropdown").style.visibility='hidden'};
                    
                    if(document.getElementById("nonNBNMSE1Dropdown").style.visibility==='visible'){document.getElementById("nonNBNMSE1Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nonNBNMSE2Dropdown").style.visibility==='visible'){document.getElementById("nonNBNMSE2Dropdown").style.visibility='hidden'};
                    
					document.getElementById("equipValue").value=vnonNBN_NTU1;

            }
        if (selected.id==nonNBN_NTU2) 
	   	  	{
	    	
                document.getElementById("nonNBNNTU2Dropdown").classList.toggle("show");
                document.getElementById("nonNBNNTU2Dropdown").style.left = xnonNBN_NTU2+'px';
                document.getElementById("nonNBNNTU2Dropdown").style.top = ynonNBN_NTU2+100+'px';
                document.getElementById("nonNBNNTU2Dropdown").style.visibility='visible';

                    
                    
                    if(document.getElementById("nonNBNNTU1Dropdown").style.visibility==='visible'){document.getElementById("nonNBNNTU1Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nonNBNASR1Dropdown").style.visibility==='visible'){document.getElementById("nonNBNASR1Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nonNBNASR2Dropdown").style.visibility==='visible'){document.getElementById("nonNBNASR2Dropdown").style.visibility='hidden'};
                    
                    if(document.getElementById("nonNBNAS1Dropdown").style.visibility==='visible'){document.getElementById("nonNBNAS1Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nonNBNAS2Dropdown").style.visibility==='visible'){document.getElementById("nonNBNAS2Dropdown").style.visibility='hidden'};
                    
                    if(document.getElementById("nonNBNMSE1Dropdown").style.visibility==='visible'){document.getElementById("nonNBNMSE1Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nonNBNMSE2Dropdown").style.visibility==='visible'){document.getElementById("nonNBNMSE2Dropdown").style.visibility='hidden'};
                    
					document.getElementById("equipValue").value=vnonNBN_NTU2;

            }
        if (selected.id==nonNBN_ASR1) 
	   	  	{
	    	
                document.getElementById("nonNBNASR1Dropdown").classList.toggle("show");
                document.getElementById("nonNBNASR1Dropdown").style.left = xnonNBN_ASR1+'px';
                document.getElementById("nonNBNASR1Dropdown").style.top = ynonNBN_ASR1+100+'px';
                document.getElementById("nonNBNASR1Dropdown").style.visibility='visible';

                    
                    
                    if(document.getElementById("nonNBNNTU1Dropdown").style.visibility==='visible'){document.getElementById("nonNBNNTU1Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nonNBNNTU2Dropdown").style.visibility==='visible'){document.getElementById("nonNBNNTU2Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nonNBNASR2Dropdown").style.visibility==='visible'){document.getElementById("nonNBNASR2Dropdown").style.visibility='hidden'};
                    
                    if(document.getElementById("nonNBNAS1Dropdown").style.visibility==='visible'){document.getElementById("nonNBNAS1Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nonNBNAS2Dropdown").style.visibility==='visible'){document.getElementById("nonNBNAS2Dropdown").style.visibility='hidden'};
                    
                    if(document.getElementById("nonNBNMSE1Dropdown").style.visibility==='visible'){document.getElementById("nonNBNMSE1Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nonNBNMSE2Dropdown").style.visibility==='visible'){document.getElementById("nonNBNMSE2Dropdown").style.visibility='hidden'};
                    
					document.getElementById("equipValue").value=vnonNBN_ASR1;

            }
        if (selected.id==nonNBN_ASR2) 
	   	  	{
	    	
                document.getElementById("nonNBNASR2Dropdown").classList.toggle("show");
                document.getElementById("nonNBNASR2Dropdown").style.left = xnonNBN_ASR2+'px';
                document.getElementById("nonNBNASR2Dropdown").style.top = ynonNBN_ASR2+100+'px';
                document.getElementById("nonNBNASR2Dropdown").style.visibility='visible';

                    
                    
                    if(document.getElementById("nonNBNNTU1Dropdown").style.visibility==='visible'){document.getElementById("nonNBNNTU1Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nonNBNNTU2Dropdown").style.visibility==='visible'){document.getElementById("nonNBNNTU2Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nonNBNASR1Dropdown").style.visibility==='visible'){document.getElementById("nonNBNASR1Dropdown").style.visibility='hidden'};
                    
                    if(document.getElementById("nonNBNAS1Dropdown").style.visibility==='visible'){document.getElementById("nonNBNAS1Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nonNBNAS2Dropdown").style.visibility==='visible'){document.getElementById("nonNBNAS2Dropdown").style.visibility='hidden'};
                    
                    if(document.getElementById("nonNBNMSE1Dropdown").style.visibility==='visible'){document.getElementById("nonNBNMSE1Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nonNBNMSE2Dropdown").style.visibility==='visible'){document.getElementById("nonNBNMSE2Dropdown").style.visibility='hidden'};
                    
					document.getElementById("equipValue").value=vnonNBN_ASR2;

            }
        if (selected.id==nonNBN_AS1) 
	   	  	{
	    	
                document.getElementById("nonNBNAS1Dropdown").classList.toggle("show");
                document.getElementById("nonNBNAS1Dropdown").style.left = xnonNBN_AS1+'px';
                document.getElementById("nonNBNAS1Dropdown").style.top = ynonNBN_AS1+100+'px';
                document.getElementById("nonNBNAS1Dropdown").style.visibility='visible';

                    
                    
                    if(document.getElementById("nonNBNNTU1Dropdown").style.visibility==='visible'){document.getElementById("nonNBNNTU1Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nonNBNNTU2Dropdown").style.visibility==='visible'){document.getElementById("nonNBNNTU2Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nonNBNASR2Dropdown").style.visibility==='visible'){document.getElementById("nonNBNASR2Dropdown").style.visibility='hidden'};
                    
                    if(document.getElementById("nonNBNASR1Dropdown").style.visibility==='visible'){document.getElementById("nonNBNASR1Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nonNBNAS2Dropdown").style.visibility==='visible'){document.getElementById("nonNBNAS2Dropdown").style.visibility='hidden'};
                    
                    if(document.getElementById("nonNBNMSE1Dropdown").style.visibility==='visible'){document.getElementById("nonNBNMSE1Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nonNBNMSE2Dropdown").style.visibility==='visible'){document.getElementById("nonNBNMSE2Dropdown").style.visibility='hidden'};
                    
					document.getElementById("equipValue").value=vnonNBN_AS1;

            }
        if (selected.id==nonNBN_AS2) 
	   	  	{
	    	
                document.getElementById("nonNBNAS2Dropdown").classList.toggle("show");
                document.getElementById("nonNBNAS2Dropdown").style.left = xnonNBN_AS2+'px';
                document.getElementById("nonNBNAS2Dropdown").style.top = ynonNBN_AS2+100+'px';
                document.getElementById("nonNBNAS2Dropdown").style.visibility='visible';

                    
                    
                    if(document.getElementById("nonNBNNTU1Dropdown").style.visibility==='visible'){document.getElementById("nonNBNNTU1Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nonNBNNTU2Dropdown").style.visibility==='visible'){document.getElementById("nonNBNNTU2Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nonNBNASR1Dropdown").style.visibility==='visible'){document.getElementById("nonNBNASR1Dropdown").style.visibility='hidden'};
                    
                    if(document.getElementById("nonNBNAS1Dropdown").style.visibility==='visible'){document.getElementById("nonNBNAS1Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nonNBNASR2Dropdown").style.visibility==='visible'){document.getElementById("nonNBNASR2Dropdown").style.visibility='hidden'};
                    
                    if(document.getElementById("nonNBNMSE1Dropdown").style.visibility==='visible'){document.getElementById("nonNBNMSE1Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nonNBNMSE2Dropdown").style.visibility==='visible'){document.getElementById("nonNBNMSE2Dropdown").style.visibility='hidden'};
                    
					document.getElementById("equipValue").value=vnonNBN_AS2;

            }
        if (selected.id==nonNBN_MSE1) 
	   	  	{
	    	
                document.getElementById("nonNBNMSE1Dropdown").classList.toggle("show");
                document.getElementById("nonNBNMSE1Dropdown").style.left = xnonNBN_MSE1+'px';
                document.getElementById("nonNBNMSE1Dropdown").style.top = ynonNBN_MSE1+100+'px';
                document.getElementById("nonNBNMSE1Dropdown").style.visibility='visible';

                    
                    
                    if(document.getElementById("nonNBNNTU1Dropdown").style.visibility==='visible'){document.getElementById("nonNBNNTU1Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nonNBNNTU2Dropdown").style.visibility==='visible'){document.getElementById("nonNBNNTU2Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nonNBNASR1Dropdown").style.visibility==='visible'){document.getElementById("nonNBNASR1Dropdown").style.visibility='hidden'};
                    
                    if(document.getElementById("nonNBNAS1Dropdown").style.visibility==='visible'){document.getElementById("nonNBNAS1Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nonNBNAS2Dropdown").style.visibility==='visible'){document.getElementById("nonNBNAS2Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nonNBNASR2Dropdown").style.visibility==='visible'){document.getElementById("nonNBNASR2Dropdown").style.visibility='hidden'};
                    
                    
                    if(document.getElementById("nonNBNMSE2Dropdown").style.visibility==='visible'){document.getElementById("nonNBNMSE2Dropdown").style.visibility='hidden'};
                    
					document.getElementById("equipValue").value=vnonNBN_MSE1;

            }
        if (selected.id==nonNBN_MSE2) 
	   	  	{
	    	
                document.getElementById("nonNBNMSE2Dropdown").classList.toggle("show");
                document.getElementById("nonNBNMSE2Dropdown").style.left = xnonNBN_MSE2+'px';
                document.getElementById("nonNBNMSE2Dropdown").style.top = ynonNBN_MSE2+100+'px';
                document.getElementById("nonNBNMSE2Dropdown").style.visibility='visible';

                    
                    
                    if(document.getElementById("nonNBNNTU1Dropdown").style.visibility==='visible'){document.getElementById("nonNBNNTU1Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nonNBNNTU2Dropdown").style.visibility==='visible'){document.getElementById("nonNBNNTU2Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nonNBNASR1Dropdown").style.visibility==='visible'){document.getElementById("nonNBNASR1Dropdown").style.visibility='hidden'};
                    
                    if(document.getElementById("nonNBNAS1Dropdown").style.visibility==='visible'){document.getElementById("nonNBNAS1Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nonNBNAS2Dropdown").style.visibility==='visible'){document.getElementById("nonNBNAS2Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nonNBNASR2Dropdown").style.visibility==='visible'){document.getElementById("nonNBNASR2Dropdown").style.visibility='hidden'};
                    
                    
                    if(document.getElementById("nonNBNMSE1Dropdown").style.visibility==='visible'){document.getElementById("nonNBNMSE1Dropdown").style.visibility='hidden'};
                    
					document.getElementById("equipValue").value=vnonNBN_MSE2;

            }
        if (selected.id==tidNTU) 
	   	  	{
	    	
                document.getElementById("tidNTUDropdown").classList.toggle("show");
                document.getElementById("tidNTUDropdown").style.left = xtidNTU+'px';
                document.getElementById("tidNTUDropdown").style.top = ytidNTU+100+'px';
                document.getElementById("tidNTUDropdown").style.visibility='visible';

                    
                    
                    if(document.getElementById("nbnCloudDropdown").style.visibility==='visible'){document.getElementById("nbnCloudDropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnREX1Dropdown").style.visibility==='visible'){document.getElementById("nbnREX1Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnREX2Dropdown").style.visibility==='visible'){document.getElementById("nbnREX2Dropdown").style.visibility='hidden'};
                    
                    if(document.getElementById("nbnASR1Dropdown").style.visibility==='visible'){document.getElementById("nbnASR1Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnASR2Dropdown").style.visibility==='visible'){document.getElementById("nbnASR2Dropdown").style.visibility='hidden'};
                    
                    if(document.getElementById("nbnMSE1Dropdown").style.visibility==='visible'){document.getElementById("nbnMSE1Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnMSE2Dropdown").style.visibility==='visible'){document.getElementById("nbnMSE2Dropdown").style.visibility='hidden'};
                    
					document.getElementById("equipValue").value=vtidNTU;
            }
        if (selected.id==nbnNTU1) 
	   	  	{
	    	
                document.getElementById("nbnNTU1Dropdown").classList.toggle("show");
                document.getElementById("nbnNTU1Dropdown").style.left = xNBNNTU1+'px';
                document.getElementById("nbnNTU1Dropdown").style.top = yNBNNTU1+100+'px';
                document.getElementById("nbnNTU1Dropdown").style.visibility='visible';

                    
                    if(document.getElementById("nbnNTU2Dropdown").style.visibility==='visible'){document.getElementById("nbnNTU2Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnCloudDropdown").style.visibility==='visible'){document.getElementById("nbnCloudDropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnREX1Dropdown").style.visibility==='visible'){document.getElementById("nbnREX1Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnREX2Dropdown").style.visibility==='visible'){document.getElementById("nbnREX2Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnASDropdown").style.visibility==='visible'){document.getElementById("nbnASDropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnASR1Dropdown").style.visibility==='visible'){document.getElementById("nbnASR1Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnASR2Dropdown").style.visibility==='visible'){document.getElementById("nbnASR2Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnASR3Dropdown").style.visibility==='visible'){document.getElementById("nbnASR3Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnMSE1Dropdown").style.visibility==='visible'){document.getElementById("nbnMSE1Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnMSE2Dropdown").style.visibility==='visible'){document.getElementById("nbnMSE2Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnMSE3Dropdown").style.visibility==='visible'){document.getElementById("nbnMSE3Dropdown").style.visibility='hidden'};
					
					document.getElementById("equipValue").value=vnbnNTU1;
            }
    if (selected.id==nbnNTU2) 
	   	  	{
	    	
                document.getElementById("nbnNTU2Dropdown").classList.toggle("show");
                document.getElementById("nbnNTU2Dropdown").style.left = xNBNNTU2+'px';
                document.getElementById("nbnNTU2Dropdown").style.top = yNBNNTU2+100+'px';
                document.getElementById("nbnNTU2Dropdown").style.visibility='visible';

                    if(document.getElementById("nbnNTU1Dropdown").style.visibility==='visible'){document.getElementById("nbnNTU1Dropdown").style.visibility='hidden'};
                    
                    if(document.getElementById("nbnCloudDropdown").style.visibility==='visible'){document.getElementById("nbnCloudDropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnREX1Dropdown").style.visibility==='visible'){document.getElementById("nbnREX1Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnREX2Dropdown").style.visibility==='visible'){document.getElementById("nbnREX2Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnASDropdown").style.visibility==='visible'){document.getElementById("nbnASDropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnASR1Dropdown").style.visibility==='visible'){document.getElementById("nbnASR1Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnASR2Dropdown").style.visibility==='visible'){document.getElementById("nbnASR2Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnASR3Dropdown").style.visibility==='visible'){document.getElementById("nbnASR3Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnMSE1Dropdown").style.visibility==='visible'){document.getElementById("nbnMSE1Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnMSE2Dropdown").style.visibility==='visible'){document.getElementById("nbnMSE2Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnMSE3Dropdown").style.visibility==='visible'){document.getElementById("nbnMSE3Dropdown").style.visibility='hidden'};
					
					document.getElementById("equipValue").value=vnbnNTU2;
			}
    if (selected.id==nbnCloud) 
	   	  	{
	    	
                document.getElementById("nbnCloudDropdown").classList.toggle("show");
                document.getElementById("nbnCloudDropdown").style.left = xNBNCloud+'px';
                document.getElementById("nbnCloudDropdown").style.top = yNBNCloud+100+'px';
                document.getElementById("nbnCloudDropdown").style.visibility='visible';

                    if(document.getElementById("nbnNTU1Dropdown").style.visibility==='visible'){document.getElementById("nbnNTU1Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnNTU2Dropdown").style.visibility==='visible'){document.getElementById("nbnNTU2Dropdown").style.visibility='hidden'};
                    
                    if(document.getElementById("nbnREX1Dropdown").style.visibility==='visible'){document.getElementById("nbnREX1Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnREX2Dropdown").style.visibility==='visible'){document.getElementById("nbnREX2Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnASDropdown").style.visibility==='visible'){document.getElementById("nbnASDropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnASR1Dropdown").style.visibility==='visible'){document.getElementById("nbnASR1Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnASR2Dropdown").style.visibility==='visible'){document.getElementById("nbnASR2Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnASR3Dropdown").style.visibility==='visible'){document.getElementById("nbnASR3Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnMSE1Dropdown").style.visibility==='visible'){document.getElementById("nbnMSE1Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnMSE2Dropdown").style.visibility==='visible'){document.getElementById("nbnMSE2Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnMSE3Dropdown").style.visibility==='visible'){document.getElementById("nbnMSE3Dropdown").style.visibility='hidden'};
                
                    if(document.getElementById("tidNTUDropdown").style.visibility==='visible'){document.getElementById("tidNTUDropdown").style.visibility='hidden'};
					
					document.getElementById("equipValue").value=vnbnCloud;
			}
    if (selected.id==nbnREX1) 
	   	  	{
	    	
                document.getElementById("nbnREX1Dropdown").classList.toggle("show");
                document.getElementById("nbnREX1Dropdown").style.left = xNBNREX1+'px';
                document.getElementById("nbnREX1Dropdown").style.top = yNBNREX1+100+'px';
                document.getElementById("nbnREX1Dropdown").style.visibility='visible';

                    if(document.getElementById("nbnNTU1Dropdown").style.visibility==='visible'){document.getElementById("nbnNTU1Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnNTU2Dropdown").style.visibility==='visible'){document.getElementById("nbnNTU2Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnCloudDropdown").style.visibility==='visible'){document.getElementById("nbnCloudDropdown").style.visibility='hidden'};
                    
                    if(document.getElementById("nbnREX2Dropdown").style.visibility==='visible'){document.getElementById("nbnREX2Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnASDropdown").style.visibility==='visible'){document.getElementById("nbnASDropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnASR1Dropdown").style.visibility==='visible'){document.getElementById("nbnASR1Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnASR2Dropdown").style.visibility==='visible'){document.getElementById("nbnASR2Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnASR3Dropdown").style.visibility==='visible'){document.getElementById("nbnASR3Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnMSE1Dropdown").style.visibility==='visible'){document.getElementById("nbnMSE1Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnMSE2Dropdown").style.visibility==='visible'){document.getElementById("nbnMSE2Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnMSE3Dropdown").style.visibility==='visible'){document.getElementById("nbnMSE3Dropdown").style.visibility='hidden'};
                
                    if(document.getElementById("tidNTUDropdown").style.visibility==='visible'){document.getElementById("tidNTUDropdown").style.visibility='hidden'};
					
					document.getElementById("equipValue").value=vnbnREX1;
			}
    if (selected.id==nbnREX2) 
	   	  	{
	    	
                document.getElementById("nbnREX2Dropdown").classList.toggle("show");
                document.getElementById("nbnREX2Dropdown").style.left = xNBNREX2+'px';
                document.getElementById("nbnREX2Dropdown").style.top = yNBNREX2+100+'px';
                document.getElementById("nbnREX2Dropdown").style.visibility='visible';

                    if(document.getElementById("nbnNTU1Dropdown").style.visibility==='visible'){document.getElementById("nbnNTU1Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnNTU2Dropdown").style.visibility==='visible'){document.getElementById("nbnNTU2Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnCloudDropdown").style.visibility==='visible'){document.getElementById("nbnCloudDropdown").style.visibility='hidden'};
                    
                    if(document.getElementById("nbnREX1Dropdown").style.visibility==='visible'){document.getElementById("nbnREX1Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnASDropdown").style.visibility==='visible'){document.getElementById("nbnASDropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnASR1Dropdown").style.visibility==='visible'){document.getElementById("nbnASR1Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnASR2Dropdown").style.visibility==='visible'){document.getElementById("nbnASR2Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnASR3Dropdown").style.visibility==='visible'){document.getElementById("nbnASR3Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnMSE1Dropdown").style.visibility==='visible'){document.getElementById("nbnMSE1Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnMSE2Dropdown").style.visibility==='visible'){document.getElementById("nbnMSE2Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnMSE3Dropdown").style.visibility==='visible'){document.getElementById("nbnMSE3Dropdown").style.visibility='hidden'};
                
                    if(document.getElementById("tidNTUDropdown").style.visibility==='visible'){document.getElementById("tidNTUDropdown").style.visibility='hidden'};
					document.getElementById("equipValue").value=vnbnREX2;
			
			}
    if (selected.id==nbnMSE1) 
	   	  	{
	    	
                document.getElementById("nbnMSE1Dropdown").classList.toggle("show");
                document.getElementById("nbnMSE1Dropdown").style.left = xNBNMSE1+'px';
                document.getElementById("nbnMSE1Dropdown").style.top = yNBNMSE1+100+'px';
                document.getElementById("nbnMSE1Dropdown").style.visibility='visible';

                    if(document.getElementById("nbnNTU1Dropdown").style.visibility==='visible'){document.getElementById("nbnNTU1Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnNTU2Dropdown").style.visibility==='visible'){document.getElementById("nbnNTU2Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnCloudDropdown").style.visibility==='visible'){document.getElementById("nbnCloudDropdown").style.visibility='hidden'};
                    
                    if(document.getElementById("nbnREX1Dropdown").style.visibility==='visible'){document.getElementById("nbnREX1Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnREX2Dropdown").style.visibility==='visible'){document.getElementById("nbnREX2Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnASDropdown").style.visibility==='visible'){document.getElementById("nbnASDropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnASR1Dropdown").style.visibility==='visible'){document.getElementById("nbnASR1Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnASR2Dropdown").style.visibility==='visible'){document.getElementById("nbnASR2Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnASR3Dropdown").style.visibility==='visible'){document.getElementById("nbnASR3Dropdown").style.visibility='hidden'};
                    
                    if(document.getElementById("nbnMSE2Dropdown").style.visibility==='visible'){document.getElementById("nbnMSE2Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnMSE3Dropdown").style.visibility==='visible'){document.getElementById("nbnMSE3Dropdown").style.visibility='hidden'};
                
                    if(document.getElementById("tidNTUDropdown").style.visibility==='visible'){document.getElementById("tidNTUDropdown").style.visibility='hidden'};
					
					document.getElementById("equipValue").value=vnbnMSE1;
			
			}
    if (selected.id==nbnMSE2) 
	   	  	{
	    	
                document.getElementById("nbnMSE2Dropdown").classList.toggle("show");
                document.getElementById("nbnMSE2Dropdown").style.left = xNBNMSE2+'px';
                document.getElementById("nbnMSE2Dropdown").style.top = yNBNMSE2+100+'px';
                document.getElementById("nbnMSE2Dropdown").style.visibility='visible';

                    if(document.getElementById("nbnNTU1Dropdown").style.visibility==='visible'){document.getElementById("nbnNTU1Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnNTU2Dropdown").style.visibility==='visible'){document.getElementById("nbnNTU2Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnCloudDropdown").style.visibility==='visible'){document.getElementById("nbnCloudDropdown").style.visibility='hidden'};
                    
                    if(document.getElementById("nbnREX1Dropdown").style.visibility==='visible'){document.getElementById("nbnREX1Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnREX2Dropdown").style.visibility==='visible'){document.getElementById("nbnREX2Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnASDropdown").style.visibility==='visible'){document.getElementById("nbnASDropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnASR1Dropdown").style.visibility==='visible'){document.getElementById("nbnASR1Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnASR2Dropdown").style.visibility==='visible'){document.getElementById("nbnASR2Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnASR3Dropdown").style.visibility==='visible'){document.getElementById("nbnASR3Dropdown").style.visibility='hidden'};
                    
                    if(document.getElementById("nbnMSE1Dropdown").style.visibility==='visible'){document.getElementById("nbnMSE1Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnMSE3Dropdown").style.visibility==='visible'){document.getElementById("nbnMSE3Dropdown").style.visibility='hidden'};
                
                    if(document.getElementById("tidNTUDropdown").style.visibility==='visible'){document.getElementById("tidNTUDropdown").style.visibility='hidden'};
					document.getElementById("equipValue").value=vnbnMSE2;
			
			}
    if (selected.id==nbnMSE3) 
	   	  	{
	    	
                document.getElementById("nbnMSE3Dropdown").classList.toggle("show");
                document.getElementById("nbnMSE3Dropdown").style.left = xNBNMSE3+'px';
                document.getElementById("nbnMSE3Dropdown").style.top = yNBNMSE3+100+'px';
                document.getElementById("nbnMSE3Dropdown").style.visibility='visible';

                    if(document.getElementById("nbnNTU1Dropdown").style.visibility==='visible'){document.getElementById("nbnNTU1Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnNTU2Dropdown").style.visibility==='visible'){document.getElementById("nbnNTU2Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnCloudDropdown").style.visibility==='visible'){document.getElementById("nbnCloudDropdown").style.visibility='hidden'};
                    
                    if(document.getElementById("nbnREX1Dropdown").style.visibility==='visible'){document.getElementById("nbnREX1Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnREX2Dropdown").style.visibility==='visible'){document.getElementById("nbnREX2Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnASDropdown").style.visibility==='visible'){document.getElementById("nbnASDropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnASR1Dropdown").style.visibility==='visible'){document.getElementById("nbnASR1Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnASR2Dropdown").style.visibility==='visible'){document.getElementById("nbnASR2Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnASR3Dropdown").style.visibility==='visible'){document.getElementById("nbnASR3Dropdown").style.visibility='hidden'};
                    
                    if(document.getElementById("nbnMSE1Dropdown").style.visibility==='visible'){document.getElementById("nbnMSE1Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnMSE2Dropdown").style.visibility==='visible'){document.getElementById("nbnMSE2Dropdown").style.visibility='hidden'};
					document.getElementById("equipValue").value=vnbnMSE3;
			}
         
       if (selected.id==nbnASR1) 
	   	  	{
	    	
                document.getElementById("nbnASR1Dropdown").classList.toggle("show");
                document.getElementById("nbnASR1Dropdown").style.left = xNBNASR1+'px';
                document.getElementById("nbnASR1Dropdown").style.top = yNBNASR1+100+'px';
                document.getElementById("nbnASR1Dropdown").style.visibility='visible';

                    if(document.getElementById("nbnNTU1Dropdown").style.visibility==='visible'){document.getElementById("nbnNTU1Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnNTU2Dropdown").style.visibility==='visible'){document.getElementById("nbnNTU2Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnCloudDropdown").style.visibility==='visible'){document.getElementById("nbnCloudDropdown").style.visibility='hidden'};
                    
                    if(document.getElementById("nbnREX1Dropdown").style.visibility==='visible'){document.getElementById("nbnREX1Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnREX2Dropdown").style.visibility==='visible'){document.getElementById("nbnREX2Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnASDropdown").style.visibility==='visible'){document.getElementById("nbnASDropdown").style.visibility='hidden'};
                    
                    if(document.getElementById("nbnASR2Dropdown").style.visibility==='visible'){document.getElementById("nbnASR2Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnASR3Dropdown").style.visibility==='visible'){document.getElementById("nbnASR3Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnMSE1Dropdown").style.visibility==='visible'){document.getElementById("nbnMSE1Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnMSE2Dropdown").style.visibility==='visible'){document.getElementById("nbnMSE2Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnMSE3Dropdown").style.visibility==='visible'){document.getElementById("nbnMSE3Dropdown").style.visibility='hidden'};
                
                    if(document.getElementById("tidNTUDropdown").style.visibility==='visible'){document.getElementById("tidNTUDropdown").style.visibility='hidden'};
					
					document.getElementById("equipValue").value=vnbnASR1;
			
			}
    if (selected.id==nbnASR2) 
	   	  	{
	    	
                document.getElementById("nbnASR2Dropdown").classList.toggle("show");
                document.getElementById("nbnASR2Dropdown").style.left = xNBNASR2+'px';
                document.getElementById("nbnASR2Dropdown").style.top = yNBNASR2+100+'px';
                document.getElementById("nbnASR2Dropdown").style.visibility='visible';

                    if(document.getElementById("nbnNTU1Dropdown").style.visibility==='visible'){document.getElementById("nbnNTU1Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnNTU2Dropdown").style.visibility==='visible'){document.getElementById("nbnNTU2Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnCloudDropdown").style.visibility==='visible'){document.getElementById("nbnCloudDropdown").style.visibility='hidden'};
                    
                    if(document.getElementById("nbnREX1Dropdown").style.visibility==='visible'){document.getElementById("nbnREX1Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnREX2Dropdown").style.visibility==='visible'){document.getElementById("nbnREX2Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnASDropdown").style.visibility==='visible'){document.getElementById("nbnASDropdown").style.visibility='hidden'};
                    
                    if(document.getElementById("nbnASR1Dropdown").style.visibility==='visible'){document.getElementById("nbnASR1Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnASR3Dropdown").style.visibility==='visible'){document.getElementById("nbnASR3Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnMSE1Dropdown").style.visibility==='visible'){document.getElementById("nbnMSE1Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnMSE2Dropdown").style.visibility==='visible'){document.getElementById("nbnMSE2Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnMSE3Dropdown").style.visibility==='visible'){document.getElementById("nbnMSE3Dropdown").style.visibility='hidden'};
                
                    if(document.getElementById("tidNTUDropdown").style.visibility==='visible'){document.getElementById("tidNTUDropdown").style.visibility='hidden'};
					document.getElementById("equipValue").value=vnbnASR2;
			}
    if (selected.id==nbnASR3) 
	   	  	{
				
                document.getElementById("nbnASR3Dropdown").classList.toggle("show");
                document.getElementById("nbnASR3Dropdown").style.left = xNBNASR3+'px';
                document.getElementById("nbnASR3Dropdown").style.top = yNBNASR3+100+'px';
                document.getElementById("nbnASR3Dropdown").style.visibility='visible';

                    if(document.getElementById("nbnNTU1Dropdown").style.visibility==='visible'){document.getElementById("nbnNTU1Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnNTU2Dropdown").style.visibility==='visible'){document.getElementById("nbnNTU2Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnCloudDropdown").style.visibility==='visible'){document.getElementById("nbnCloudDropdown").style.visibility='hidden'};
                    
                    if(document.getElementById("nbnREX1Dropdown").style.visibility==='visible'){document.getElementById("nbnREX1Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnREX2Dropdown").style.visibility==='visible'){document.getElementById("nbnREX2Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnASDropdown").style.visibility==='visible'){document.getElementById("nbnASDropdown").style.visibility='hidden'};
                    
                    if(document.getElementById("nbnASR2Dropdown").style.visibility==='visible'){document.getElementById("nbnASR2Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnASR1Dropdown").style.visibility==='visible'){document.getElementById("nbnASR1Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnMSE1Dropdown").style.visibility==='visible'){document.getElementById("nbnMSE1Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnMSE2Dropdown").style.visibility==='visible'){document.getElementById("nbnMSE2Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnMSE3Dropdown").style.visibility==='visible'){document.getElementById("nbnMSE3Dropdown").style.visibility='hidden'};
					
					document.getElementById("equipValue").value=vnbnASR3;
			}
    if (selected.id==nbnAS) 
	   	  	{
	    	
                document.getElementById("nbnASDropdown").classList.toggle("show");
                document.getElementById("nbnASDropdown").style.left = xNBNAS+'px';
                document.getElementById("nbnASDropdown").style.top = yNBNAS+100+'px';
                document.getElementById("nbnASDropdown").style.visibility='visible';

                    if(document.getElementById("nbnNTU1Dropdown").style.visibility==='visible'){document.getElementById("nbnNTU1Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnNTU2Dropdown").style.visibility==='visible'){document.getElementById("nbnNTU2Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnCloudDropdown").style.visibility==='visible'){document.getElementById("nbnCloudDropdown").style.visibility='hidden'};
                    
                    if(document.getElementById("nbnREX1Dropdown").style.visibility==='visible'){document.getElementById("nbnREX1Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnREX2Dropdown").style.visibility==='visible'){document.getElementById("nbnREX2Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnASR1Dropdown").style.visibility==='visible'){document.getElementById("nbnASR1Dropdown").style.visibility='hidden'};
                    
                    if(document.getElementById("nbnASR2Dropdown").style.visibility==='visible'){document.getElementById("nbnASR2Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnASR3Dropdown").style.visibility==='visible'){document.getElementById("nbnASR3Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnMSE1Dropdown").style.visibility==='visible'){document.getElementById("nbnMSE1Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnMSE2Dropdown").style.visibility==='visible'){document.getElementById("nbnMSE2Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnMSE3Dropdown").style.visibility==='visible'){document.getElementById("nbnMSE3Dropdown").style.visibility='hidden'};
					document.getElementById("equipValue").value=vnbnAS;
			
			}
    
          
          if(selected.id==zoomIN.id)
              {        
                                if(currentZoom<=1)
                                    {
                                        $(document).ready(function () {
                                        $('#myholder').animate({ 'zoom': currentZoom += .1 }, 'slow');
                                        });
                                    }
                                
                }
          
          if(selected.id==zoomOUT.id)
              {        
                                if(currentZoom>=0.4)
                                    {
                                       $(document).ready(function () {
                                       $('#myholder').animate({ 'zoom': currentZoom -= .1 }, 'slow');
                                       }); 
                                    }
                                
                }
          
         
    });  
    
    function f()
    {
                    if(document.getElementById("nbnNTU1Dropdown").style.visibility==='visible'){document.getElementById("nbnNTU1Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnNTU2Dropdown").style.visibility==='visible'){document.getElementById("nbnNTU2Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnCloudDropdown").style.visibility==='visible'){document.getElementById("nbnCloudDropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnREX1Dropdown").style.visibility==='visible'){document.getElementById("nbnREX1Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnREX2Dropdown").style.visibility==='visible'){document.getElementById("nbnREX2Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnASDropdown").style.visibility==='visible'){document.getElementById("nbnASDropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnASR1Dropdown").style.visibility==='visible'){document.getElementById("nbnASR1Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnASR2Dropdown").style.visibility==='visible'){document.getElementById("nbnASR2Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnASR3Dropdown").style.visibility==='visible'){document.getElementById("nbnASR3Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnMSE1Dropdown").style.visibility==='visible'){document.getElementById("nbnMSE1Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnMSE2Dropdown").style.visibility==='visible'){document.getElementById("nbnMSE2Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nbnMSE3Dropdown").style.visibility==='visible'){document.getElementById("nbnMSE3Dropdown").style.visibility='hidden'};
                    if(document.getElementById("tidNTUDropdown").style.visibility==='visible'){document.getElementById("tidNTUDropdown").style.visibility='hidden'};
                    if(document.getElementById("nonNBNNTU1Dropdown").style.visibility==='visible'){document.getElementById("nonNBNNTU1Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nonNBNNTU2Dropdown").style.visibility==='visible'){document.getElementById("nonNBNNTU2Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nonNBNASR1Dropdown").style.visibility==='visible'){document.getElementById("nonNBNASR1Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nonNBNASR2Dropdown").style.visibility==='visible'){document.getElementById("nonNBNASR2Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nonNBNAS1Dropdown").style.visibility==='visible'){document.getElementById("nonNBNAS1Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nonNBNAS2Dropdown").style.visibility==='visible'){document.getElementById("nonNBNAS2Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nonNBNMSE1Dropdown").style.visibility==='visible'){document.getElementById("nonNBNMSE1Dropdown").style.visibility='hidden'};
                    if(document.getElementById("nonNBNMSE2Dropdown").style.visibility==='visible'){document.getElementById("nonNBNMSE2Dropdown").style.visibility='hidden'}           
    }
		function ParseXML(val)
		{
	if (window.DOMParser)
	  {
		parser=new DOMParser();
		xmlDoc=parser.parseFromString(val,"text/xml");
	  }
	else // Internet Explorer
	  {
		xmlDoc = new ActiveXObject("Microsoft.XMLDOM"); xmlDoc.loadXML(val);
	  }
return xmlDoc ;
} 


c=1;

if(topologyType.toUpperCase()=="NBNTOPOLOGY"||topologyType.toUpperCase()=="TIDTOPOLOGY")
{
$(document).ready(function () {
   $('#myholder').animate({ 'zoom': c -= 0.62});
   });
}
else
{
$(document).ready(function () {
   $('#myholder').animate({ 'zoom': c -= 0.50});
   });
}
  
</script>
</body>
</html>
