<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="POS.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div id="decorative1" style="position:relative">
            <div class="container">            
                <div class="divPanel headerArea">
                    <div class="row-fluid">
                        <div class="span12">  
                            <div id="headerSeparator"></div>
                            <div class="row-fluid">
                                <div class="span6">
                                    <div id="divHeaderText" class="page-content">
                                        <div id="divHeaderLine1">MAF</div><br />
                                        <div id="divHeaderLine2">Welcome to MAF Corporation.</div><br />
                                         <%--<div id="divHeaderLine3"><a class="btn btn-danger" href="#">Read More</a></div>--%>
                                    </div>
                                </div>
                                <div class="span6">
                                    <!--Edit Camera Slider here-->
                                    <div id="camera_wrap">
                                        <div data-src="images/Amber-Tea.jpg" ><div class="camera_caption fadeFromBottom cap1">Amber-Tea</div></div>
                                        <div data-src="images/Azka-(Dry-Plum-400gm).jpg" ><div class="camera_caption fadeFromBottom cap2">Azka-(Dry-Plum-400gm)</div></div>
                                        <div data-src="images/Idea-Chutney-Small.jpg" ><div class="camera_caption fadeFromBottom cap2">Idea-Chutney-Small</div></div>
                                        <div data-src="images/Motu-Patlu.jpg" ><div class="camera_caption fadeFromBottom cap1">Motu-Patlu</div></div>
                                    </div>
						            <!--End Camera Slider here-->
                                </div>
                            </div>
                            <div id="headerSeparator2"></div>        
                        </div>
                    </div>   
                </div>
            </div>
        </div>

        <div class="container">            
            <div class="divPanel page-content">
                <!--Edit Main Content Area here-->
                <div class="row-fluid">
                    <div class="span12" id="divMain">
                        <%--<h1>Welcome</h1>--%>
                       <%-- <p><strong>Lorem ipsum dolor sit amet,</strong> consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat.</p>--%>
                    </div>
                </div>
		        <!--End Main Content Area here-->
                <div id="footerInnerSeparator"></div>
            </div>
        </div>
</asp:Content>
