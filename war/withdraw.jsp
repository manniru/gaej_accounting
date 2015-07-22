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
		  <h1>Withdraw from Account</h1>
		  <form name="form1" method="post" action="">
		    <table width="361" border="0" align="center" cellpadding="1" cellspacing="0">
		      <tr>
		        <td width="159">Account No:</td>
		        <td width="198"><label for="accno"></label>
		          <label for="accountno"></label>
		          <select name="accountno" id="accountno">
		          <%
		          Query q = new Query("Users");
				    PreparedQuery pq = ds.prepare(q);
		        	for (Entity result : pq.asIterable()) {
		        		String accountno = result.getProperty("accountno").toString();
		        		String fullname = result.getProperty("fullname").toString();
		        		
		        		out.println("<option value='"+accountno+"'>"+accountno+"("+fullname+")</option>");
		        	}
		        		  
		        		  
		          
		          %>
		           
                </select></td>
	          </tr>
		      <tr>
		        <td>Amount</td>
		        <td><label for="amount"></label>
	            <input type="text" name="amount" id="amount"></td>
	          </tr>
		      <tr>
		        <td>Description</td>
		        <td><label for="description"></label>
	            <input type="text" name="description" id="description"></td>
	          </tr>
		      <tr>
		        <td>Date</td>
		        <td><label for="date"></label>
	            <input type="text" name="date" id="date" value="<%= cdate %>"><label for="gender"></label></td>
	          </tr>
		      <tr>
		        <td><input name="type" type="hidden" id="type" value="withdraw"></td>
		        <td><input type="submit" name="submit" id="submit" value="Deposit"></td>
	          </tr>
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
