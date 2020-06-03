<%@page import="uts.isd.model.Device"%>
<%-- 
    Document   : edit
    Created on : Apr 30, 2020, 12:01:31 AM
    Author     : aiswaryarajeev
--%>

<%@page import="uts.isd.model.Customer"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/webpage.css">
        <title>Edit Page</title>
    </head>

    <body>
        <%
            String deviceNameErr = (String) session.getAttribute("deviceNameErr");
            String typeErr = (String) session.getAttribute("typeErr");
            String priceErr = (String) session.getAttribute("priceError");
            String stockErr = (String) session.getAttribute("stockErr");
            String descriptionErr = (String) session.getAttribute("descriptionErr");
            String exceptionErr = (String) session.getAttribute("exceptionErr");
            String updatedMsg = request.getParameter("updatedMsg");

            Device device = (Device) session.getAttribute("device");
        %>
        
        <img src="images/Logo.png" alt="LOGO" style="width:20%; height:10%" class="left" />
        <p class="right"> <a class="button21" href="main.jsp">Main</a> </p>
        <p class="right"> <a class="button21" href="logout.jsp">Logout</a> </p>
        <div class="maincolumn2">
            <div class="card">
                <h1>Edit device <span> <%= (updatedMsg != null) ? updatedMsg : ""%> </span></h1>
                <form method="post" method="get" action="EditDeviceServlet">
                    
                    <table>
                        
                         <tr>
                            <td>Device ID</td>
                            <td><input type="text" value="${device.deviceID}" name="DeviceID"></td>
                        </tr>
                        <tr>
                            <td>Device Name</td>
                            <td><input type="text" value="${device.deviceName}" name="DeviceName"></td>
                        </tr>
                        <tr>
                            <td>Device Type</td>
                            <td><input type="text" value="${device.type}" name="DeviceType">
                            </td>
                        </tr>
                        <tr>
                            <td>Price ($):</td>
                            <td><input type="text" value="${device.cost}" name="DeviceCost">
                            </td>
                        </tr>
                        <tr>
                            <td>Stock Quantity:	</td>
                            <td><input type="text" value="${device.stockQuantity}" name="DeviceStock">
                            </td>
                        </tr>
                        <tr>
                            <td>Description</td>
                            <td><input type="text" value="${device.description}" name="DeviceDescription">
                        </tr>
                         
                    </table>
                       
                    <div>
                        <input class ="button3" type="submit" value="Update"</a>
                    </div>
                </form>
            </div>
        </div>

    </body>

</html>