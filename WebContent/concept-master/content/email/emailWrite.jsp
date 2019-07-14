<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <title>이메일 작성</title>
        <div class="dashboard-wrapper">
            <div class="container-fluid">
            <jsp:include page="/concept-master/common/emailLeft.jsp"/>
                <div class="main-content container-fluid p-0">
                    <div class="email-head">
                        <div class="email-head-title">Compose new message<span class="icon mdi mdi-edit"></span></div>
                    </div>
                    <div class="email-compose-fields">
                        <div class="to">
                            <div class="form-group row pt-0">
                                <label class="col-md-1 control-label">To:</label>
                                <div class="col-md-11">
                                    <select class="js-example-basic-multiple" multiple="multiple">
                                        <option value="Yellow" selected="selected">Yellow</option>
                                        <option value="White">White</option>
                                        <option value="Blue" selected="selected">Blue</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="to cc">
                            <div class="form-group row pt-2">
                                <label class="col-md-1 control-label">Cc</label>
                                <div class="col-md-11">
                                    <select class="js-example-basic-multiple" multiple="multiple">
                                        <option value="Alabama">Alabama</option>
                                        <option value="Alaska" selected="selected">Alaska</option>
                                        <option value="Melbourne">Melbourne</option>
                                        <option value="Victoria" selected="selected">Victoria</option>
                                        <option value="Newyork">Newyork</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="subject">
                            <div class="form-group row pt-2">
                                <label class="col-md-1 control-label">Subject</label>
                                <div class="col-md-11">
                                    <input class="form-control" type="text">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="email editor">
                        <div class="col-md-12 p-0">
                            <div class="form-group">
                                <label class="control-label sr-only" for="summernote">Descriptions </label>
                                <textarea class="form-control" id="summernote" name="editordata" rows="6" placeholder="Write Descriptions"></textarea>
                            </div>
                        </div>
                        <div class="email action-send">
                            <div class="col-md-12 ">
                                <div class="form-group">
                                    <button class="btn btn-primary btn-space" type="submit"><i class="icon s7-mail"></i> Send</button>
                                    <button class="btn btn-secondary btn-space" type="button"><i class="icon s7-close"></i> Cancel</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </div>
    <!-- ============================================================== -->
    <!-- end main wrapper -->
    <!-- ============================================================== -->
    <!-- Optional JavaScript -->
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