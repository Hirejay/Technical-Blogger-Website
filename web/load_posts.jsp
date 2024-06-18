<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.dao.Postdao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<div class="row ">
    <%
        Thread.sleep(500);
        Postdao pd = new Postdao(ConnectionProvider.getConnection());
        int cid = Integer.parseInt(request.getParameter("cid"));
        ArrayList<Post> posts = null;
        if (cid == 0) {
            posts = pd.getallpost();
        } else {
            posts = pd.getpostbycid(cid);
        }

        if (posts.size() == 0) {
            out.println("<h3 class=' text-center'>No Post In This Category</h3>");
            return;
        }

        for (Post p : posts) {


    %>
    <div class="col-lg-4 p-2">
        <div class="card  h-100">
            
            <img src="blogpic/<%=p.getPpic()%>" class="card-img-top" alt="..." height="200px">

            <div class="card-body">
                <h5 class="card-title">
                    <%=p.getPtitle()%>
                </h5>

                    <p class="card-text"><%= p.getPcontent()%></p>
                
            </div>
            <div class="card-footer primary-color text-center">

                <a href="#" class="btn btn-outline-light " ><i class="bi bi-hand-thumbs-up-fill  "></i><span>10</span></i></a>
                <a href="show_blog_page.jsp?post_id=<%= p.getPid()%>" class="btn btn-outline-light" >View Detail</a>
                <a href="#" class="btn btn-outline-light" ><i class="bi bi-chat-dots-fill"></i><span>20</span></a>

            </div>
        </div>
    </div>


    <%    }
    %>
    
</div>