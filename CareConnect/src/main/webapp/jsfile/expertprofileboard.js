$(document).ready(function() {
   $(".review").click(function() {
      var username = $(this).find(".modaldata").eq(0).val();
      var reviewtext = $(this).find(".modaldata").eq(1).val();
      var url = "ReviewModal.jsp?username=" + encodeURIComponent(username) + "&reviewText=" + encodeURIComponent(reviewtext);
      
      $(".Modal").load(url + " .Modal-container", function() {
         $(this).dialog({
            modal: true,
          
         });
      });
   });
});

	