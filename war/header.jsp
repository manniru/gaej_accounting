<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="javax.servlet.*,
java.awt.EventQueue,
java.awt.event.ActionListener,
java.awt.event.ActionEvent,
java.util.Date,
java.io.*,
java.util.*,
java.net.URL,
java.net.HttpURLConnection,
java.io.BufferedReader,
java.util.Properties,

java.sql.Connection,
java.sql.DriverManager,
java.sql.ResultSet,
java.sql.SQLException,
java.sql.Statement,

com.google.appengine.api.datastore.DatastoreService,
com.google.appengine.api.datastore.DatastoreServiceFactory,
com.google.appengine.api.datastore.Entity,

com.google.appengine.api.datastore.Query,
com.google.appengine.api.datastore.Query.Filter,
com.google.appengine.api.datastore.Query.FilterOperator,
com.google.appengine.api.datastore.Query.FilterPredicate,
com.google.appengine.api.datastore.PreparedQuery,
com.google.appengine.api.datastore.Query.CompositeFilter,
com.google.appengine.api.datastore.Query.CompositeFilterOperator,
com.google.appengine.api.datastore.Key,
com.google.appengine.api.datastore.KeyFactory,
com.google.appengine.api.datastore.FetchOptions

"%>
<%!
public String environment = System.getProperty("com.google.appengine.runtime.environment");
DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
String message = "";
Date cdate = new Date();
%>
<%!

public int count(String entity) {
	int totalCount = 0;
	try {
		com.google.appengine.api.datastore.Query qry = new com.google.appengine.api.datastore.Query(entity);
		com.google.appengine.api.datastore.DatastoreService datastoreService = DatastoreServiceFactory.getDatastoreService();
		totalCount = datastoreService.prepare(qry).countEntities(FetchOptions.Builder.withDefaults());
		//out.println("<br>Total Number of Records: " + totalCount);
		} catch(Exception e) { System.out.println(e); }
	
	return totalCount;
}


/**
Connection cn = DriverManager.getConnection("jdbc:sqlite:database.db");
Statement statement = cn.createStatement();
statement.setQueryTimeout(30); 
*/
%>
<%
/**
if(request.getParameter("q") != null && request.getParameter("q").equals("db")) {
	statement.executeUpdate("drop table if exists person");
    statement.executeUpdate("create table person (id integer, name string)");
    statement.executeUpdate("insert into person values(1, 'leo')");
    statement.executeUpdate("insert into person values(2, 'yui')");
    ResultSet rs = statement.executeQuery("select * from person");
    
}
*/
if(request.getParameter("login") != null) {
	String user1 = request.getParameter("user");
	String pass1 = request.getParameter("pass");
	session.setAttribute("username", user1);
	session.setAttribute("password", pass1);
	session.setAttribute("role", "admin");
	System.out.println(user1+"=="+pass1);
	if(user1.equals("admin") && pass1.equals("admin")) {
		response.setStatus(response.SC_MOVED_TEMPORARILY); 
		response.setHeader("Location", "accounts.jsp");
	}
	else {
		response.setStatus(response.SC_MOVED_TEMPORARILY); 
		response.setHeader("Location", "index.jsp?msg=Invalid Username or Password!");
	}
}

if(request.getParameter("q") != null && request.getParameter("q").equals("logout")) {
	session.setAttribute("username", null);
	session.setAttribute("password", null);
	session.setAttribute("role", null);
	response.setStatus(response.SC_MOVED_TEMPORARILY); 
	response.setHeader("Location", "/");
}


if(request.getParameter("register") != null) {
	String accountno = request.getParameter("accountno");
	String fullname = request.getParameter("fullname");
	String password = request.getParameter("password");
	String mobileno = request.getParameter("mobileno");
	String gender = request.getParameter("gender");
	
	int id = count("Users")+1;
	
	Entity user = new Entity("Users", id);
	user.setProperty("accountno", accountno);
	user.setProperty("fullname", fullname);
	user.setProperty("password", password);
	user.setProperty("fullname", fullname);
	user.setProperty("mobileno", mobileno);
	user.setProperty("gender", gender);
	ds.put(user);
	
	
	response.setStatus(response.SC_MOVED_TEMPORARILY);
	response.setHeader("Location", "accounts.jsp");
}

if(request.getParameter("submit") != null && request.getParameter("submit").equals("Deposit")) {
	String type = request.getParameter("type");
	String accountno = request.getParameter("accountno");
	int amount = Integer.parseInt(request.getParameter("amount").toString());
	String description = request.getParameter("description");
	String date = request.getParameter("date");
	
	Entity trans = new Entity("Transactions", count("Transactions")+1);
	trans.setProperty("type", type);
	trans.setProperty("accountno", accountno);
	trans.setProperty("description", description);
	trans.setProperty("amount", amount);
	
	trans.setProperty("date", date);	
	ds.put(trans);
	response.setStatus(response.SC_MOVED_TEMPORARILY);
	response.setHeader("Location", "transactions.jsp");
}
%>

<!DOCTYPE html> 
<html>

<head>
  <title>Radda e-Banking System</title>
  <meta name="description" content="website description" />
  <meta name="keywords" content="website keywords, website keywords" />
  <meta http-equiv="content-type" content="text/html; charset=windows-1252" />
  <link rel="stylesheet" type="text/css" href="css/style.css" />
  <!-- modernizr enables HTML5 elements and feature detects -->
  <script type="text/javascript" src="js/modernizr-1.5.min.js"></script>
</head>

<body>
  <div id="main">
    <header>
	  <div id="banner">
	    <div id="welcome">
	      <h3>Raddatech e-Banking System</h3>
	    </div><!--close welcome-->
	    <div id="welcome_slogan">
	      <h3>Online Banking Systems hosted on Gloud Computing</h3>
	    </div><!--close welcome_slogan-->			
	  </div><!--close banner-->
    </header>
<% if(session.getAttribute("username")!=null && session.getAttribute("username").equals("admin")) {  %>
	<nav>
	  <div id="menubar">
        <ul id="nav">
          <li class="current"><a href="index.jsp">Home</a></li>
          <li><a href="register.jsp">Register</a></li>
          <li><a href="deposit.jsp">Deposit</a></li>
          <li><a href="withdraw.jsp">Withdraw</a></li>
          <li><a href="accounts.jsp">Accounts</a></li>
          <li><a href="transactions.jsp">Transactions</a></li>
          <li><a href="index.jsp?q=logout">Logout</a></li>
        </ul>
      </div><!--close menubar-->	
    </nav>	
 <% }%>
 <% if(session.getAttribute("username")==null) {  %> 
 <nav>
	  <div id="menubar">
        <ul id="nav">
          <li></li>
        </ul>
      </div><!--close menubar-->	
    </nav>	
 <%} %>
	