<%-- 
    Document   : Category
    Created on : Mar 17, 2016, 3:36:24 PM
    Author     : Ahmad Moawad <ahmadmoawad3@gmail.com>
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dao.CategoryDAO"%>
<%@page import="pojo.Category"%>
<%@page import="factory.DAOFactory"%>
<%@page import="factory.MysqlFactory"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <jsp:include page="templete/head.jsp"/>

    <body>
        <script src="js/cat.js"></script>
        <jsp:include page="templete/nav.jsp"/>

        <div class="container-fluid">
            <div class="row">
                <jsp:include page="templete/sidebar.jsp"/>

                <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

                    <jsp:include page="templete/dashbordheader.jsp"/>
                    <div class="row placeholders">
                        <ul class="pagination">
                            <li class="active"><a href="#" onclick="toggleDiv('edit')">View</a></li>
                            <li><a href="#" onclick="toggleDiv('add')">Add</a></li>
                        </ul>
                        <div id="addCatDiv" class="well">

                            <div class="alert alert-error infoDiv" style="text-align: center; color:red; background: whitesmoke">
                                <button type="button" class="close" data-dismiss="alert">&times;</button>
                                <h3>
                                    <span class="label label-success infoText"></span>
                                </h3>
                            </div>
                            <form onsubmit="return addCat();">
                                <table class="table table-bordered table-responsive">
                                    <tr>
                                        <td>
                                            <input type="text" id="catName" placeholder="add category name" required="" style="width:100%;"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="file" id="catImg"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="submit" class="btn btn-primary glyphicon glyphicon-plus" value="add"/>

                                        </td>
                                    </tr>
                                </table>
                            </form>        
                        </div>
                        <div id="editCatDiv" class="well">
                            <table class="table table-striped table-responsive">
                                <tr>
                                    <td>
                                        <div class="container">

                                            <div class="row placeholders">
                                                <div class="placeholders">
                                                    <div class="alert alert-error infoDiv" style="text-align: center; color:red; background: whitesmoke">
                                                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                                                        <h3>
                                                            <span class="label label-success infoText"></span>
                                                        </h3>
                                                    </div>
                                                </div>
                                                <div class="placeholders">
                                                    <select id='cats' class='dropdown' style='width:100%;'>
                                                        <c:forEach items="${requestScope.cats}" var="c">
                                                            <option value="${c.getId()}" >  ${c.getName()} </option>
                                                        </c:forEach>
                                                    </select>

                                                </div>
                                                <div class="placeholders">
                                                    <button id="editBtn" class="btn btn-primary glyphicon glyphicon-pencil" style="width:100%;" onclick="enableBtns()">edit</button>
                                                </div>



                                                <div class="placeholders">
                                                    <input type="text" id="newCat" placeholder="select category from dropdown list" readonly="" style="width:100%;"/>
                                                    <input type="file" id="newCatImg" disabled=""/>
                                                </div>
                                                <div class="placeholders" style="float:left;">
                                                    <img src="img/ecommerce.jpg" class="img-circle" width="200"/>
                                                    <a href="#" role="button" class="glyphicon glyphicon-remove">remove</a>
                                                </div>
                                                <div class="placeholders">
                                                    <button id="updateBtn" class="btn btn-warning glyphicon glyphicon-floppy-open" disabled="" onclick="updateCat()">update</button>
                                                    <button id="deleteBtn" class="btn btn-danger  glyphicon glyphicon-remove" disabled="" onclick="deleteCat()">delete</button>

                                                </div>
                                            </div>
                                        </div>

                                    </td>
                                </tr>

                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
