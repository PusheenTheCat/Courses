<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Page</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/admin.js"></script>
</head>
<body>

<!DOCTYPE html>
<html>
<head>
    <title>Admin</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/admin.js"></script>
</head>
<body>
<header>
    <div class = "logo">
        <img src="img/logo.png" alt="logo">
    </div>
    <headercount>
        <div class="item"><a href="">Courses</a></div>
        <div class="item"><a href="">About</a></div>
        <div class="item">
            <form >
                <p><input type="search" name="q" placeholder="Search courses">
                    <input type="image" id = "buttonSearch" src="img/search.png" alt="Search">
                </p>
            </form>
        </div>
    </headercount>
    <div class="reg">
        <div id="adminimg"></div>
        <a href="login.jsp"><%out.print(session.getAttribute("name"));%><br>Log Out</a>
    </div>
</header>

<div class="main">
    <div class="title">Admin Name</div>
    <div class=contentt>
        <div id="leftcol">
            <div class="actbuttons">
                <div class="adminbuttons">
                    <div class="butt"><button onclick="showAddForm();" id="addingbuton" type="button" name="button">Create new user</button></div>
                    <div class="butt"><button onclick="showDelForm();" id="delbutton" type="button" name="button">Delete user</button></div>
                    <div class="butt"><button onclick="showEditForm();" id="editbutton" type="button" name="button">Edit user</button></div>
                </div>
            </div>
        </div>

        <div id="rightcol">

            <form class="createuser" id="createuserform">
                <div id="createnewuser">Create new user</div>
                <div class="leftcolform">
                    <div class="textonform1">E-email<input type="text" name="" value="" required></div>
                    <div class="textonform1">Password<input type="text" name="" value="" required></div>
                    <div class="textonform1">Confirm password<input type="text" name="" value="" required></div>
                    <div class="textonform2">Personal info<textarea id="info" name="name" rows="4" cols="33"></textarea></div>
                    <div class="textonform1">Role
                        <div class="radioGroup">
                            <div class="rbutt">
                                <p><input type="radio" id="student"
                                          name="role" value="student">student</p>
                            </div>
                            <div class="rbutt">
                                <p><input type="radio" id="lecturer"
                                          name="role" value="lecturer">lecturer</p>
                            </div>
                        </div>
                    </div>
                </div>
                <button id="butt" type="submit" name="button">Add</button>
            </form>

            <form class="deleteuser" id="deleteuserform">
                <div id="deleteexistuser">Delete user</div>
                <div class="leftcolform">
                    <div><input list="edUserSearch" name = "edUserSearch">
                        <datalist id="edUserSearch">
                            <%
                                Class.forName("com.mysql.jdbc.Driver");

                                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/courses?" + "user=root&password=root");
                                PreparedStatement pst = null;

                                try {
                                    pst = conn.prepareStatement("SELECT login FROM `user`");
                                } catch (SQLException e) {
                                    out.println("SQL querry qreating error");
                                }

                                ResultSet rs = pst.executeQuery();

                                while(rs.next()){
                            %>
                            <option value="<%=rs.getString(1)%>"></option>
                            <%
                                }
                            %>
                        </datalist>
                    </div>
                </div>

                <button id="butt" type="submit" name="button">Delete</button>
            </form>

            <form class="editeuser" id="editeuserform">
                <div id="editexistuser">Edit user</div>
                <div class="leftcolform">
                    <div class="textonform1"> Search </div>
                    <div><select class="userSearch" name="">
                        <option disabled>Search user</option>
                    </select></div>
                    <div class="textonform1">E-email<input list="user" name = "user">
                        <datalist id="user">
                            <%
                                rs.first();
                                while(rs.next()){
                            %>
                            <option value="<%=rs.getString(1)%>"></option>
                            <%
                                }
                            %>
                        </datalist></div>
                    <div class="textonform1">Password<input type="text" name="" value="" required></div>
                    <div class="textonform1">Confirm password<input type="text" name="" value="" required></div>
                    <div class="textonform2">Personal info<textarea id="info" name="name" rows="4" cols="33"></textarea></div>
                    <div class="textonform1">Role
                        <div class="radioGroup">
                            <div class="rbutt">
                                <p><input type="radio" id="student"
                                          name="role" value="student">student</p>
                            </div>
                            <div class="rbutt">
                                <p><input type="radio" id="lecturer"
                                          name="role" value="lecturer">lecturer</p>
                            </div>
                        </div>
                    </div>
                </div>
                <button id="butt" type="submit" name="button">Edit</button>
            </form>
        </div>
    </div>

</body>
<footer class="foot">
    <div class="footcont">
        <div class="contact">
            <p><strong>Contacts:</strong>     maxuaforever@gmail.com</p>
            <div class="copyright">
                <p>&copy 2009 - 2018 All rights reserved</p>
            </div>
        </div>
    </div>
</footer>

</html>

<div class="popupcont" id="popupcont">
    <div class="popup" id="popup">
        <div class="operstatus"><%=request.getAttribute("textMsg")%></div>
        <button class="close" onclick="closePopUp()">OK</button>
    </div>
</div>

<% if (request != null && request.getAttribute("textMsg") != null)
    { %>
        <script type="text/javascript">
            openPopUp();
        </script>
    <% }
%>

<%
    if (request != null && request.getAttribute("flag") != null)
    { %>
        <script type="text/javascript">
            showEditForm();
        </script>
    <%
        request.setAttribute("flag", null);
    }
%>
