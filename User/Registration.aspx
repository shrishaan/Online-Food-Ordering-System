<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="Foodie.User.Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script>
        //For Disappering alert message
        window.onload = function () {
            var seconds = 5;
            setTimeout(function () {
                document.getElementById("<%=lblMsg.ClientID %>").style.display = "none";
            }, seconds * 1000);
        };
    </script>
    <script>
        function ImagePreview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=imgUser.ClientID%>').prop('src', e.target.result)
                        .width(200)
                        .height(200);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <section class="book_section layout_padding">
        <div class="container">
            <div class="heading_container">
                <div class="aling-self-end">
                    <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
                </div>
                <asp:Label ID="lblHeaderMsg" runat="server" Text="<h2> User Registration </h2>"></asp:Label>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form_container">

                        <div>
                            <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="Name is required" ControlToValidate="txtName" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revName" runat="server" ErrorMessage="Name must be 7–30 characters, letters only." ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^(?=.{7,30}$)[A-Za-z]+(?:\s[A-Za-z]+)*$" ControlToValidate="txtName">
                            </asp:RegularExpressionValidator>
                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter Full Name" ToolTip="Full Name"></asp:TextBox>
                        </div>

                        <div>
                            <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ErrorMessage="UserName is required" ControlToValidate="txtUsername" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revUsername" runat="server" ErrorMessage="Username must be 5–30 characters (letters and numbers only)." ForeColor="Red" Display="Dynamic" SetFocusOnError="true"
                                ValidationExpression="^[A-Za-z0-9]{5,30}$" ControlToValidate="txtUsername">
                            </asp:RegularExpressionValidator>
                            <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Enter UserName" ToolTip="Username"></asp:TextBox>
                        </div>

                        <div>
                            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Email is required" ControlToValidate="txtEmail" ForeColor="Red" Display="Dynamic" SetFocusOnError="true">
                            </asp:RequiredFieldValidator>

                            <asp:RegularExpressionValidator ID="revEmail" runat="server" ErrorMessage="Enter a valid email address"
                                ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtEmail"
                                ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[A-Za-z]{2,}$">
                            </asp:RegularExpressionValidator>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter Email" ToolTip="Email" TextMode="Email"></asp:TextBox>
                        </div>

                        <div>
                            <asp:RequiredFieldValidator ID="rfvMobile" runat="server" ErrorMessage="Mobile number is required" ControlToValidate="txtMobile"
                                ForeColor="Red" Display="Dynamic" SetFocusOnError="true">
                            </asp:RequiredFieldValidator>

                            <asp:RegularExpressionValidator ID="revMobile" runat="server" ErrorMessage="Enter a valid 10-digit Nepali mobile number (starts with 97 or 98)." ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^(97|98)[0-9]{8}$" ControlToValidate="txtMobile">
                            </asp:RegularExpressionValidator>

                            <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" placeholder="Enter Mobile Number" ToolTip="Mobile Number"
                                TextMode="Number">
                            </asp:TextBox>
                        </div>


                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form_container">

                       <div>
    <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ErrorMessage="Address is required" ControlToValidate="txtAddress" 
        ForeColor="Red" Display="Dynamic" SetFocusOnError="true">
    </asp:RequiredFieldValidator>

    <asp:RegularExpressionValidator ID="revAddress" runat="server" ErrorMessage="Address must contain only letters and spaces." 
        ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[A-Za-z\s\r\n]+$" ControlToValidate="txtAddress">
    </asp:RegularExpressionValidator>

    <asp:TextBox 
        ID="txtAddress" 
        runat="server" 
        CssClass="form-control" 
        placeholder="Enter Address" 
        ToolTip="Address" 
        TextMode="MultiLine">
    </asp:TextBox>
</div>


                        <div>
                            <asp:FileUpload ID="fuUserImage" runat="server" CssClass="form-control" ToolTip="User Image" onchange="ImagePreview(this);" />
                        </div>

                        <div>
                            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="Password is required" ControlToValidate="txtPassword" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Enter Password" ToolTip="Password" TextMode="Password"></asp:TextBox>
                        </div>

                    </div>
                </div>

                <div class="row pl-4">
                    <div class="btn_box">
                        <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-success rounded-pill pl-4 pr-4 text-white" OnClick="btnRegister_Click" />

                        <asp:Label ID="lblAlreadyUser" runat="server" CssClass="pl-3 text-black-100" Text="Already registered? <a href='Login.aspx' class='badge badge-info'>Login here..</a>"></asp:Label>
                    </div>
                </div>

                <div class="row p-5">
                    <div style="align-items: center">
                        <asp:Image ID="imgUser" runat="server" CssClass="img-thumbnail" />
                    </div>
                </div>

            </div>
        </div>
    </section>


</asp:Content>
