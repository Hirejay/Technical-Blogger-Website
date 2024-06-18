<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Categories"%>
<%@page import="com.tech.blog.dao.Categoriesdao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<div class="row">

    <% Categoriesdao cd = new Categoriesdao(ConnectionProvider.getConnection());
        ArrayList<Categories> catlist = cd.getallcategories();

        for (Categories c : catlist) {
    %>

    <div class="col-lg-4 p-2">
        <div class="card h-100 " >

            <div class="card-body">
                <h5 class="card-title"><%=c.getCname()%></h5>
                <p class="card-text"><%=c.getCdescription()%></p>
               
            </div>
                <div class="card-footer primary-color "> <a  href="profile.jsp" class="btn  btn-outline-light ">Explore</a></div>
        </div>

    </div>


    <%
        }

    %>


</div>

