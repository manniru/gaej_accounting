<%@include file="header.jsp"%>	
    
	<div id="site_content">	

      <div class="slideshow">
	    <ul class="slideshow">
          <li class="show"><img width="900" height="250" src="images/home_1.jpg" alt="&quot;Enter your caption here&quot;" /></li>
          <li><img width="900" height="250" src="images/home_2.jpg" alt="&quot;Enter your caption here&quot;" /></li>
        </ul> 
	  </div>	
	
	  <div id="content">
        <div class="content_item">
		  <h1>Welcome To RaddaTech e-Banking System<br>
		  </h1>
		  <form name="form1" method="post" action="">
		    <table width="100%" border="1" cellspacing="0" cellpadding="1">
		      <tr>
		        <th scope="col">ID</th>
		        <th scope="col">Type</th>
		        <th scope="col">Date</th>
		        <th scope="col">Account No</th>
		        <th scope="col">Desciption</th>
		        <th scope="col">Amount</th>
	          </tr>
	          <%
	          Query q = new Query("Transactions");
			    PreparedQuery pq = ds.prepare(q);
			    
	          for (Entity result : pq.asIterable()) {
	        	  String id = result.getKey().getId()+"";
	        	  String type = result.getProperty("type").toString();
	        	  String accountno = result.getProperty("accountno").toString();
	        	  String amount = result.getProperty("amount").toString();
	        	  String description = result.getProperty("description").toString();
	        	  String date = result.getProperty("date").toString();
	        	  //int total_credit = Integer.parseInt(result.getProperty("gender").toString());
	        	  
	        	  //System.out.println(id+"=="+fullname);
	        	  out.println("<tr>");
	        	 out.println("<td>"+id+"</td>");
	        	 out.println("<td>"+type+"</td>");
	        	 out.println("<td>"+date+"</td>");
	        	  out.println("<td>"+accountno+"</td>");
	        	  out.println("<td>"+description+"</td>");
	        	  out.println("<td>"+amount+"</td>");
	        	 
	        	  
	        	  
	        	  out.println("</tr>");
	          }
	          
	          %>
		     
	        </table>
		  </form>
		  <h1>&nbsp; </h1>
          <p>&nbsp;</p><!--close content_imagetext--><!--close content_container--><!--close content_container--><!--close content_container-->	
		  
		</div><!--close content_item-->
      </div><!--close content-->   
	</div><!--close site_content-->  	
  </div><!--close main-->
  
    <footer>
	  
	  System Design & Developed By Radda Tech
    </footer>

  <!-- javascript at the bottom for fast page loading -->
  <script type="text/javascript" src="js/jquery.js"></script>
  <script type="text/javascript" src="js/image_slide.js"></script>
  
</body>
</html>
