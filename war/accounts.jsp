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
		        <th scope="col">SN</th>
		        <th scope="col">Account No</th>
		        <th scope="col">Fullname</th>
		        <th scope="col">Gender</th>
		        <th scope="col">Mobile No</th>
		        <th scope="col">Total Credit</th>
		        <th scope="col">Total Debit</th>
		        <th scope="col">Current Balance</th>
	          </tr>
	          <%
	          Query q = new Query("Users");
			    PreparedQuery pq = ds.prepare(q);
			    
	          for (Entity result : pq.asIterable()) {
	        	  String id = result.getKey().getId()+"";
	        	  String accountno = result.getProperty("accountno").toString();
	        	  
	        	  Filter f1 = new FilterPredicate("accountno", FilterOperator.EQUAL, accountno);
	        	  Filter f2 = new FilterPredicate("type", FilterOperator.EQUAL, "deposit");
	        	  Filter f3 = new FilterPredicate("type", FilterOperator.EQUAL, "withdraw");
	        	  
	        	  int credits = 0;
	        	  int debits = 0;
	        	  int balance = 0;
	        	  
	        	  	Filter filter1 = CompositeFilterOperator.and(f1, f2);
	        	  	Query q1 = new Query("Transactions").setFilter(filter1);
	      	    	PreparedQuery pq1 = ds.prepare(q1);
	      	    	for (Entity result1 : pq1.asIterable()) {
	      	    		int cr = Integer.parseInt(result1.getProperty("amount").toString());
	      	    		credits = credits + cr;
	      	    	}
	      	    	
	      	    	Filter filter2 = CompositeFilterOperator.and(f1, f3);
	        	  	Query q2 = new Query("Transactions").setFilter(filter2);
	      	    	PreparedQuery pq2 = ds.prepare(q2);
	      	    	for (Entity result2 : pq2.asIterable()) {
	      	    		int dr = Integer.parseInt(result2.getProperty("amount").toString());
	      	    		debits = debits + dr;
	      	    	}
	      	    	
	      	    	balance = credits - debits;
	        	  
	        	  
	        	  
	        	  String fullname = result.getProperty("fullname").toString();
	        	  String mobileno = result.getProperty("mobileno").toString();
	        	  String gender = result.getProperty("gender").toString();
	        	  //int total_credit = Integer.parseInt(result.getProperty("gender").toString());
	        	  
	        	  //System.out.println(id+"=="+fullname);
	        	  out.println("<tr>");
	        	 out.println("<td>"+id+"</td>");
	        	  out.println("<td>"+accountno+"</td>");
	        	  out.println("<td>"+fullname+"</td>");
	        	  out.println("<td>"+gender+"</td>");
	        	  out.println("<td>"+mobileno+"</td>");
	        	  out.println("<td>"+credits+"</td>");
	        	  out.println("<td>"+debits+"</td>");
	        	  out.println("<td>"+balance+"</td>");
	        	  
	        	  
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
