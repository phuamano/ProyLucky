<nav class="navbar navbar-static-top navbar-default navbar-header-full navbar-dark yamm" role="navigation" id="header">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <i class="fa fa-bars"></i>
            </button>
            <a id="ar-brand" class="navbar-brand hidden-lg hidden-md hidden-sm" href="index.jsp">LUCKY <span>SAC</span></a>
        </div> <!-- navbar-header -->

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="dropdown">
                    <a href="index.jsp">Inicio</a>
                </li>
                <%-- <li class="dropdown">
                    <a href="${pageContext.request.contextPath}/a_mantenimiento_producto">PP</a>
                </li> --%>
                <li class="dropdown yamm-fw">
                    <a href="${pageContext.request.contextPath}/a_catalogo">Areas de TI</a>
                    <!--En caso de poner menu desplegable -->
                   	<!--  <a href="Test.jsp" class="dropdown-toggle" data-toggle="dropdown">Catalogo</a> -->
                    <!--  <ul class="dropdown-menu dropdown-menu-left">
                        <li>
                            <div class="yamm-content">
                                <div class="row">
                                    <div class="col-lg-3 col-md-6 col-sm-6 col-megamenu" style="height: 334px;">
                                        <div class="megamenu-block">
                                            <h4 class="megamenu-block-title"><i class="fa fa-css3"></i> CSS</h4>
                                            <ul>
                                                <li><a href="css_typography.html"><i class="fa fa-font"></i> Typography</a></li>
                                                <li><a href="css_headers.html"><i class="fa fa-header"></i> Headers</a></li>
                                                <li><a href="css_dividers.html"><i class="fa fa-arrows-h"></i> Dividers</a></li>
                                                <li><a href="css_blockquotes.html"><i class="fa fa-quote-right"></i> Blockquotes</a></li>
                                                <li><a href="css_forms.html"><i class="fa fa-check-square-o"></i> Forms</a></li>
                                                <li><a href="css_tables.html"><i class="fa fa-table"></i> Tables</a></li>
                                            </ul>
                                        </div>
                                        <div class="megamenu-block">
                                            <h4 class="megamenu-block-title"><i class="fa fa-hand-o-up"></i> Buttons</h4>
                                            <ul>
                                                <li><a href="btn_basic_buttons.html"><i class="fa fa-arrow-circle-right"></i> Basic Buttons</a></li>
                                                <li><a href="btn_library_buttons.html"><i class="fa fa-arrow-circle-right"></i> Buttons Library <span class="label label-info pull-right">Update</span></a></li>
                                                <li><a href="btn_social_buttons.html"><i class="fa fa-arrow-circle-right"></i> Social Buttons</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-6 col-megamenu" style="height: 334px;">
                                        <div class="megamenu-block">
                                            <h4 class="megamenu-block-title"><i class="fa fa-hand-o-up"></i> Icons</h4>
                                            <ul>
                                                <li><a href="icons_artificial_reason.html"><i class="fa fa-font"></i> Artificial Reason Icons</a></li>
                                                <li><a href="icons_glyph.html"><i class="fa fa-arrow-circle-right"></i> Glyphicons Icons</a></li>
                                                <li><a href="icons_awesome.html"><i class="fa fa-flag"></i> Font Awesome</a></li>
                                                <li><a href="icons_social.html"><i class="fa fa-twitter"></i> Social Icons</a></li>
                                            </ul>
                                        </div>
                                        <div class="megamenu-block">
                                            <h4 class="megamenu-block-title"><i class="fa fa-star"></i> New in 1.4</h4>
                                            <ul>
                                                <li><a href="components_cards.html"><i class="fa fa-user"></i> Profile Cards <span class="label label-success pull-right">New</span></a></li>
                                                <li><a href="components_counters.html"><i class="fa fa-sort-numeric-asc"></i> Counters <span class="label label-success pull-right">New</span></a></li>
                                                <li><a href="components_navtabs.html"><i class="fa fa-columns"></i> Navbar Tabs <span class="label label-success pull-right">New</span></a></li>
                                                <li><a href="components_masonry.html"><i class="fa fa-th"></i> Masonry Layer <span class="label label-success pull-right">New</span></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-6 col-megamenu" style="height: 334px;">
                                        <div class="megamenu-block">
                                            <h4 class="megamenu-block-title"><i class="fa fa-list-alt"></i> Components</h4>
                                            <ul>
                                                <li><a href="components_dropdowns.html"><i class="fa fa-arrow-circle-right"></i> Components Dropdowns</a></li>
                                                <li><a href="components_panels.html"><i class="fa fa-columns"></i> Panels</a></li>
                                                <li><a href="components_lists.html"><i class="fa fa-list-ul"></i> Lists</a></li>
                                                <li><a href="components_paginations.html"><i class="fa fa-sort-numeric-asc"></i> Paginations</a></li>
                                                <li><a href="components_labels_badges.html"><i class="fa fa-flag-o"></i> Labels and Badges</a></li>
                                                <li><a href="components_alerts_wells.html"><i class="fa fa-info-circle"></i> Alerts and Wells</a></li>
                                                <li><a href="components_thumbnails.html"><i class="fa fa-picture-o"></i> Thumbnails</a></li>
                                                <li><a href="components_modals.html"><i class="fa fa-square"></i> Modals</a></li>
                                                <li><a href="components_progress_bars.html"><i class="fa fa-bars"></i> Progress Bars</a></li>
                                                <li><a href="components_tooltip_popover.html"><i class="fa fa-bullhorn"></i> Tooltip &amp; Popover</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    
                                    <div class="col-lg-3 col-md-6 col-sm-6 col-megamenu" style="height: 334px;">
                                        <div class="megamenu-block">
                                            <h4 class="megamenu-block-title"><i class="fa fa-flag"></i> Extra Elements</h4>
                                            <ul>
                                                <li><a href="collapses_tabs.html"><i class="fa fa-tasks"></i> Collapses &amp; Tabs</a></li>
                                                <li><a href="components_vertical_tabs.html"><i class="fa fa-tasks"></i> Vertical Tabs <span class="label label-success pull-right">New</span></a></li>
                                                <li><a href="components_switch.html"><i class="fa fa-toggle-on"></i> Switch Controls <span class="label label-success pull-right">New</span></a></li>
                                                <li><a href="content_box.html"><i class="fa fa-list-alt"></i> Contents Box</a></li>
                                                <li><a href="carousels.html"><i class="fa fa-play-circle"></i> Carousels</a></li>
                                                <li><a href="charts.html"><i class="fa fa-tachometer"></i> Charts &amp; CountDowns</a></li>
                                                <li><a href="components_masonry.html"><i class="fa fa-th"></i> Masonry Layer <span class="label label-success pull-right">New</span></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul> -->
                </li>
                <li class="dropdown">
                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown">Conocenos</a>
       			</li>
       		</ul>
       </div><!-- navbar-collapse -->
    </div><!-- container -->
</nav>