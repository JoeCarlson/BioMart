<%@ tag import="javax.servlet.http.HttpSession" %>
<%@ tag import="org.biomart.api.factory.MartRegistryFactory" %>
<%@ tag import="org.biomart.api.Portal" %>
<%@ tag import="org.biomart.api.lite.GuiContainer" %>
<%@ tag import="java.util.List" %>
<%@ tag import="java.util.ArrayList" %>
<%@ attribute name="var" rtexprvalue="true" required="true" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<%
    HttpSession s = request.getSession(false);
    String username = null;
    if (s != null) {
      username = (String)s.getAttribute("openid_identifier");
    }
    if (username == null) username = "";
    MartRegistryFactory factory = (MartRegistryFactory)request.getAttribute("registryFactoryObj");
    Portal portal = new Portal(factory, username);
    GuiContainer root  = portal.getRootGuiContainer(null);
    request.setAttribute(var, root);
%>    

