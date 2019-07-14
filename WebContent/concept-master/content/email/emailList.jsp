<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <title>이메일 리스트</title>
        <div class="dashboard-wrapper">
            <div class="container-fluid">
                <jsp:include page="/concept-master/common/emailLeft.jsp"/>
                <div class="main-content container-fluid p-0">
                    <div class="email-inbox-header">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="email-title"><span class="icon"><i class="fas fa-inbox"></i></span> Inbox <span class="new-messages">(2 new messages)</span> </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="email-search">
                                    <div class="input-group input-search">
                                        <input class="form-control" type="text" placeholder="Search mail..."><span class="input-group-btn">
                                       <button class="btn btn-secondary" type="button"><i class="fas fa-search"></i></button></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="email-filters">
                        <div class="email-filters-left">
                            <label class="custom-control custom-checkbox be-select-all">
                                <input class="custom-control-input chk_all" type="checkbox" name="chk_all"><span class="custom-control-label"></span>
                            </label>
                            <div class="btn-group">
                                <button class="btn btn-light dropdown-toggle" data-toggle="dropdown" type="button">
                                    With selected <span class="caret"></span></button>
                                <div class="dropdown-menu" role="menu"><a class="dropdown-item" href="#">Mark as rea</a><a class="dropdown-item" href="#">Mark as unread</a><a class="dropdown-item" href="#">Spam</a>
                                    <div class="dropdown-divider"></div><a class="dropdown-item" href="#">Delete</a>
                                </div>
                            </div>
                            <div class="btn-group">
                                <button class="btn btn-light" type="button">Archive</button>
                                <button class="btn btn-light" type="button">Span</button>
                                <button class="btn btn-light" type="button">Delete</button>
                            </div>
                            <div class="btn-group">
                                <button class="btn btn-light dropdown-toggle" data-toggle="dropdown" type="button">Order by <span class="caret"></span></button>
                                <div class="dropdown-menu dropdown-menu-right" role="menu"><a class="dropdown-item" href="#">Date</a><a class="dropdown-item" href="#">From</a><a class="dropdown-item" href="#">Subject</a>
                                    <div class="dropdown-divider"></div><a class="dropdown-item" href="#">Size</a>
                                </div>
                            </div>
                        </div>
                        <div class="email-filters-right"><span class="email-pagination-indicator">1-50 of 253</span>
                            <div class="btn-group email-pagination-nav">
                                <button class="btn btn-light" type="button"><i class="fas fa-angle-left"></i></button>
                                <button class="btn btn-light" type="button"><i class="fas fa-angle-right"></i></button>
                            </div>
                        </div>
                    </div>
                    <div class="email-list">
                        <div class="email-list-item email-list-item--unread">
                            <div class="email-list-actions">
                                <label class="custom-control custom-checkbox">
                                    <input class="custom-control-input checkboxes" type="checkbox" value="1" id="one"><span class="custom-control-label"></span>
                                </label><a class="favorite active" href="#"><span><i class="fas fa-star"></i></span></a>
                            </div>
                            <div class="email-list-detail"><span class="date float-right"><span class="icon"><i class="fas fa-paperclip"></i> </span>28 Jul</span><span class="from">Penelope Thornton</span>
                                <p class="msg">Urgent - You forgot your keys in the class room, please come imediatly!</p>
                            </div>
                        </div>
                        <div class="email-list-item email-list-item--unread">
                            <div class="email-list-actions">
                                <label class="custom-control custom-checkbox">
                                    <input class="custom-control-input checkboxes" type="checkbox" value="2" id="two"><span class="custom-control-label"></span>
                                </label><a class="favorite" href="#"><span><i class="fas fa-star"></i></span></a>
                            </div>
                            <div class="email-list-detail"><span class="date float-right"></span><span class="date float-right"><span class="icon"><i class="fas fa-paperclip"></i></span> 13 Jul</span><span class="from">Benji Harper</span>
                                <p class="msg">Urgent - You forgot your keys in the class room, please come imediatly!</p>
                            </div>
                        </div>
                        <div class="email-list-item">
                            <div class="email-list-actions">
                                <label class="custom-control custom-checkbox">
                                    <input class="custom-control-input checkboxes" type="checkbox" value="3" id="three"><span class="custom-control-label"></span>
                                </label><a class="favorite" href="#"><span><i class="fas fa-star"></i></span></a>
                            </div>
                            <div class="email-list-detail"><span class="date float-right">23 Jun</span><span class="from">Justine Myranda</span>
                                <p class="msg">Urgent - You forgot your keys in the class room, please come imediatly!</p>
                            </div>
                        </div>
                        <div class="email-list-item">
                            <div class="email-list-actions">
                                <label class="custom-control custom-checkbox">
                                    <input class="custom-control-input checkboxes" type="checkbox" value="4" id="four"><span class="custom-control-label"></span>
                                </label><a class="favorite" href="#"><span><i class="fas fa-star"></i></span></a>
                            </div>
                            <div class="email-list-detail"><span class="date float-right">17 May</span><span class="from">John Doe</span>
                                <p class="msg">Urgent - You forgot your keys in the class room, please come imediatly!</p>
                            </div>
                        </div>
                        <div class="email-list-item">
                            <div class="email-list-actions">
                                <label class="custom-control custom-checkbox">
                                    <input class="custom-control-input checkboxes" type="checkbox" value="5" id="five"><span class="custom-control-label"></span>
                                </label><a class="favorite" href="#"><span><i class="fas fa-star"></i></span></a>
                            </div>
                            <div class="email-list-detail"><span class="date float-right">16 May</span><span class="from">Sherwood Clifford</span>
                                <p class="msg">Urgent - You forgot your keys in the class room, please come imediatly!</p>
                            </div>
                        </div>
                        <div class="email-list-item">
                            <div class="email-list-actions">
                                <label class="custom-control custom-checkbox">
                                    <input class="custom-control-input checkboxes" type="checkbox" value="6" id="six"><span class="custom-control-label"></span>
                                </label><a class="favorite" href="#"><span><i class="fas fa-star"></i></span></a>
                            </div>
                            <div class="email-list-detail"><span class="date float-right">12 May</span><span class="from">Kristopher Donny</span>
                                <p class="msg">Urgent - You forgot your keys in the class room, please come imediatly!</p>
                            </div>
                        </div>
                        <div class="email-list-item">
                            <div class="email-list-actions">
                                <label class="custom-control custom-checkbox">
                                    <input class="custom-control-input checkboxes" type="checkbox" value="7" id="seven"><span class="custom-control-label"></span>
                                </label><a class="favorite" href="#"><span><i class="fas fa-star"></i></span></a>
                            </div>
                            <div class="email-list-detail"><span class="date float-right">12 May</span><span class="from">Kristopher Donny</span>
                                <p class="msg">Urgent - You forgot your keys in the class room, please come imediatly!</p>
                            </div>
                        </div>
                        <div class="email-list-item">
                            <div class="email-list-actions">
                                <label class="custom-control custom-checkbox">
                                    <input class="custom-control-input checkboxes" type="checkbox" value="8" id="eight"><span class="custom-control-label"></span>
                                </label><a class="favorite" href="#"><span><i class="fas fa-star"></i></span></a>
                            </div>
                            <div class="email-list-detail"><span class="date float-right">12 May</span><span class="from">Kristopher Donny</span>
                                <p class="msg">Urgent - You forgot your keys in the class room, please come imediatly!</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
             
        </div>
    </div>
    <script>
    $(document).ready(function() {

        // binding the check all box to onClick event
        $(".chk_all").click(function() {

            var checkAll = $(".chk_all").prop('checked');
            if (checkAll) {
                $(".checkboxes").prop("checked", true);
            } else {
                $(".checkboxes").prop("checked", false);
            }

        });

        // if all checkboxes are selected, then checked the main checkbox class and vise versa
        $(".checkboxes").click(function() {

            if ($(".checkboxes").length == $(".subscheked:checked").length) {
                $(".chk_all").attr("checked", "checked");
            } else {
                $(".chk_all").removeAttr("checked");
            }

        });

    });
    </script>
 
