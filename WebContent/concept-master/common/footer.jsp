            <!-- <div class="footer">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                             Copyright © 2018 Concept. All rights reserved. Dashboard by <a href="https://colorlib.com/wp/">Colorlib</a>.
                        </div>
                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                            <div class="text-md-right footer-links d-none d-sm-block">
                                <a href="javascript: void(0);">About</a>
                                <a href="javascript: void(0);">Support</a>
                                <a href="javascript: void(0);">Contact Us</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div> -->
        </div>
    </div>
    <script src="<%= request.getContextPath() %>/concept-master/assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
    <script src="<%= request.getContextPath() %>/concept-master/assets/vendor/slimscroll/jquery.slimscroll.js"></script>
    <script src="<%= request.getContextPath() %>/concept-master/assets/libs/js/main-js.js"></script>
    <script src="<%= request.getContextPath() %>/concept-master/assets/vendor/charts/chartist-bundle/chartist.min.js"></script>
    <script src="<%= request.getContextPath() %>/concept-master/assets/vendor/charts/sparkline/jquery.sparkline.js"></script>
    <script src="<%= request.getContextPath() %>/concept-master/assets/vendor/select2/js/select2.min.js"></script>
    <script src="<%= request.getContextPath() %>/concept-master/assets/vendor/summernote/js/summernote-bs4.js"></script>
    
    <!--  <script src="<%= request.getContextPath() %>/concept-master/assets/vendor/charts/morris-bundle/raphael.min.js"></script>
    <script src="<%= request.getContextPath() %>/concept-master/assets/vendor/charts/morris-bundle/morris.js"></script> 
    <script src="<%= request.getContextPath() %>/concept-master/assets/vendor/charts/c3charts/c3.min.js"></script>
    <script src="<%= request.getContextPath() %>/concept-master/assets/vendor/charts/c3charts/d3-5.4.0.min.js"></script>
    <script src="<%= request.getContextPath() %>/concept-master/assets/vendor/charts/c3charts/C3chartjs.js"></script>
    <script src="<%= request.getContextPath() %>/concept-master/assets/libs/js/dashboard-ecommerce.js"></script>-->
    
     <script>
		    $(document).ready(function() {
		        $('.js-example-basic-multiple').select2({ tags: true });
		    });
		    </script>
		    <script>
		    $(document).ready(function() {
		        $('#summernote').summernote({
		            height: 300
		
		        });
		    });
	</script>
</body>
 
</html>