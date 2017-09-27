var s = "";
if(navigator.userAgent.indexOf("Chrome")>0 || navigator.userAgent.indexOf("Firefox")>0){
	s = "<object id='WebOffice1' type='application/x-itst-activex' align='baseline' border='0'"
		+ "style='LEFT: 0px; WIDTH: 100%; TOP: 0px; HEIGHT: 680px'"
		+ "clsid='{E77E049B-23FC-4DB8-B756-60529A35FAD5}'"
		+ "event_NotifyCtrlReady='' "
		+ "</object>";
}else {
	s = "<OBJECT id=WebOffice1 align='middle' style='LEFT: 0px; WIDTH: 100%; TOP: 0px; HEIGHT: 680px'"
		+ "classid=clsid:E77E049B-23FC-4DB8-B756-60529A35FAD5 ";
		+ "</OBJECT>";
}
document.write(s)