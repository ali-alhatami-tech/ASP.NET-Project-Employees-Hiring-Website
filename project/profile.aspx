<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="project.WebForm1" %>

<!DOCTYPE html>
<script runat="server">

    protected void Button1_Click(object sender, EventArgs e)
    {

    }
</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        /* Navbar container */
        .navbar {
            display: flex;
            align-items: center;
            justify-content: space-between;
            background-image: linear-gradient(90deg, blue, rgb(0, 255, 242));
            padding: 10px;
            border-radius: 10px;
            width: 97%;
            box-shadow: 4px 4px 10px 0px #00a4ff6b;
            margin-left: auto;
            margin-right: auto;
            margin-bottom: 15px;
        }

        /* Logo */
        .logo {
            padding: 5px;
            background-color: #607D8B;
            border-radius: 6px;
            margin-right: 5px;
        }

        .profile {
            display: flex;
            margin-left: 40px;
        }

        .con {
            background-color: white;
            margin: 20px auto;
            border-radius: 15px;
            width: 95%;
            padding: 10px;
        }

        .nav-links {
            list-style: none;
            display: flex;
            align-items: center;
        }

            .nav-links li {
                margin-right: 10px;
            }

            .nav-links a {
                text-decoration: none;
                color: #333;
                padding: 5px;
            }

        /* Profile image */
        .profile-image {
            border-radius: 50%;
            object-fit: cover;
            margin-right: 10px;
        }

        /* Responsive styles 
*/

        @media screen and (max-width: 768px) {
            .navbar {
                flex-direction: column;
                align-items: center;
            }

            .nav-links {
                margin-top: 10px;
            }

                .nav-links li {
                    margin-right: 0;
                    margin-bottom: 5px;
                }
        }

        .min_con {
            display: flex;
        }

            .min_con .right, .left {
                width: 70%;
                margin: 10px;
                background-color: #000fd80a;
                padding: 10px;
                border-radius: 10px;
                text-align: center;
            }

            .min_con .right {
                width: 30%;
            }

            .min_con .left {
                background-color: white;
                margin: 0px;
            }

        .left .information , .left .project {
            background-color: #000fd80a;
            padding: 10px;
            border-radius: 10px;
            margin-bottom:10px;
        }

        .upload_style {
            text-align: center;
            border: none;
            width: 50%;
            background-color: rgb(11 0 255 / 7%);
            margin: 10px;
            border-radius: 15px;
            padding-right: 10px;
        }

        ::-webkit-file-upload-button {
            background-color: blue;
            border: none;
            padding: 10px;
            border-radius: 30px;
            color: white;
            cursor: pointer;
        }

        .info_con {
            display: flex;
            width: 100%;
        }

        .info_right, .info_left {
            width: 50%;
            padding: 10px;
            text-align: start;
        }

        .input {
            border: none;
            outline: none;
            padding: 5px;
            width: 50%;
            border-radius: 15px;
            border-bottom: 1px solid gray;
            padding-left: 10px;
        }

            .input:hover {
                border-bottom: 1px solid blue;
            }

        .select {
            padding: 5px 15px;
            border: none;
            border-radius: 5px;
            color: blue;
            background-color: #0000ff0d;
        }
        .desc{
            width: 90%;
    height: 400px;
    max-height:400px;
    max-width:90%;
    min-height:400px;
    min-width:90%;
    border: none;
    padding:10px;
    background-color: white;
    border-radius: 5px;
    outline: none;
    font-size: 18px;
        }
        .button{
    width: 25%;
    background-color: blue;
    color: white;
    font-size: 16px;
    border-radius: 5px;
    border: none;
    padding: 8px;
    margin-left: 10px;
    background-image: linear-gradient(90deg, rgb(0, 229, 255), blue);
    /* transition: all 4.3s; */
    transition: background-image 3.5s ease;
        }
        .button:hover{
            cursor: pointer;
        border: none;
        background-image: linear-gradient(-90deg, rgb(0, 229, 255), rgb(30, 255, 0));
        }
        .con_project{
            display:grid;
            grid-template-columns: 1fr 1fr 1fr 1fr;
        }
        .add_projcet , .show_projcet{
            padding: 20px;
    background: white;
    border-radius: 10px;
    margin: 5px;
    overflow:hidden;

        }
        .show_projcet .img{
            width:90%;
            border-radius:5px;
        }
        .project_button{
    padding: 5px 25px;
    background-color: white;
    outline: none;
    border: 1px solid blue;
    border-radius: 5px;
    color: blue;
    font-weight: 900;
    margin: 10px;
        }
        .project_button:hover{
            background-color:blue;
            cursor:pointer;
            color:white;
        }
        .project_input{
            min-width: 95%;
    max-width: 95%;
    min-height: 90px;
    max-height: 90px;
        }
        .project_upload{
            margin: 10px;
    background-color: white;
    border-radius: 50px;
    box-shadow: 5px 5px 0px blue;
    width: 90%;
    outline: none;
    border: 2px solid blue;
        }
        .footer {
            border-radius: 5px;
            width: 99%;
            margin: 15px auto;
            background-color: black;
            background-image: linear-gradient(90deg, black,rgb(0, 0, 50),rgb(0, 0, 0));
        }

        hr {
            margin-top: 160px;
            width: 65%;
            color: blue;
            border: 0.7px dashed;
        }

        .delete_btn{
            width: 25%;
    background-color: blue;
    color: white;
    font-size: 16px;
    border-radius: 5px;
    border: none;
    padding: 8px;
    margin-left: 10px;
    background-image: linear-gradient(90deg, rgb(252 255 0), red);
    transition: background-image 3.5s ease;
        }
        .delete_btn:hover{
            cursor:pointer;
            background-image: linear-gradient(-90deg, rgb(252 255 0), red);
        }
        
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="con">
            <div class="navbar">
                <div class="profile">
                    <asp:Image ID="Image1" runat="server" class="profile-image" Height="50px" Width="50px" />
                    <div class="profile_text">
                        <asp:Label ID="Label2" runat="server" Text="Welcome" Font-Bold="True" Font-Size="Larger" ForeColor="White"></asp:Label>
                        <br />
                        <asp:Label ID="Label1" runat="server" Text="profile Name" ForeColor="#EAEAEA" CssClass="label"></asp:Label>
                    </div>
                </div>
                <ul class="nav-links">

                    <li>
                        <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="White" Font-Bold="True" Font-Size="Larger" NavigateUrl="~/index.aspx">Home</asp:HyperLink></li>
                    <li>&nbsp;&nbsp;&nbsp;
                                <asp:Label ID="Label5" runat="server" Text="|" ForeColor="White"></asp:Label></li>
                    <li>
                        <asp:HyperLink ID="HyperLink2" runat="server" ForeColor="White" Font-Bold="True" Font-Size="Larger" NavigateUrl="~/login.aspx">Log In</asp:HyperLink></li>
                    <li>&nbsp;&nbsp;&nbsp;
                                <asp:Label ID="Label6" runat="server" Text="|" ForeColor="White"></asp:Label></li>
                    <li>&nbsp;&nbsp;&nbsp;<asp:HyperLink ID="HyperLink3" runat="server" ForeColor="White" Font-Bold="True" Font-Size="Larger">About</asp:HyperLink></li>
                </ul>
                <div class="logo">
                    <asp:Image ID="Image3" runat="server" Height="50px" Width="50px" ImageUrl="~/image_style/ali.png" />
                </div>
            </div>
            <div class="min_con">
                <div class="right">
                    <asp:Image ID="info_image" runat="server" Height="150px" Width="150px" ForeColor="#CCCCFF"  style="object-fit: cover;"/>
                    <br />
                    <asp:Label ID="reviews" runat="server" Text="0.00 (review)"></asp:Label>
                    <br />
                    <asp:FileUpload ID="FileUpload1" runat="server" CssClass="upload_style" />
                    <br />
                    <asp:Label ID="dateT" runat="server" Text="2024/32/32"></asp:Label>
                    <br />
                    <asp:Label ID="info_txt_name" runat="server" Text="Ali alhatami" Font-Bold="True" Font-Size="20pt" ForeColor="Blue"></asp:Label>
                    <br />
                    <br />
                </div>

                <div class="left">
                    <div class="information">
                        <h1>--- Profile Information ---</h1>
                        <div class="info_con">
                            <div class="info_right">
                                <asp:Label ID="Label11" runat="server" Text="Name: "></asp:Label>
                                <asp:TextBox ID="info_name" runat="server" CssClass="input" MaxLength="90"></asp:TextBox>
                                <br />
                                <br />
                                <br />
                                <asp:Label ID="Label12" runat="server" Text="Phone Number: "></asp:Label>
                                <asp:TextBox ID="info_phone" runat="server" CssClass="input" MaxLength="15"></asp:TextBox>
                                <br />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="info_phone" EnableClientScript="False" ErrorMessage="Please, Write a real phone number" Font-Size="Small" ForeColor="Red" ValidationExpression="^[0-9]{6,15}$"></asp:RegularExpressionValidator>
                                <br />
                                <br />
                                <asp:Label ID="Label4" runat="server" Text="UserName: "></asp:Label>
                                <asp:TextBox ID="info_username" runat="server" CssClass="input" MaxLength="90" OnTextChanged="info_username_TextChanged" ReadOnly="True"></asp:TextBox>


                                <br />


                                <asp:Label ID="checkUsername" runat="server" Font-Size="Small" ForeColor="Red"></asp:Label>


                                <br />
                                <asp:Label ID="Label13" runat="server" Text="PassWord: "></asp:Label>
                                <asp:TextBox ID="info_password" runat="server" CssClass="input" MaxLength="90" OnTextChanged="info_password_TextChanged"></asp:TextBox>


                                <br />
                                <br />


                            </div>
                            <div class="info_left">
                                <asp:Label ID="Label8" runat="server" Text="Gender: "></asp:Label>
                                &nbsp;&nbsp;
                                <asp:RadioButton ID="RadioButton1" runat="server" GroupName="g" Text="Male" />
                                &nbsp;
                                <asp:RadioButton ID="RadioButton2" runat="server" GroupName="g" Text="Famale" />
                                <br />
                                <br />
                                <asp:Label ID="Label9" runat="server" Text="Country: "></asp:Label>
                                <asp:DropDownList ID="DDL_country" runat="server" CssClass="select" AutoPostBack="True" DataTextField="CountryName" DataValueField="CountryId" OnSelectedIndexChanged="DDL_country_SelectedIndexChanged">
                                </asp:DropDownList>
                                <br />
                                <br />
                                <br />
                                <asp:Label ID="Label10" runat="server" Text="City: "></asp:Label>
                                <asp:DropDownList ID="DDL_city" runat="server" CssClass="select" DataTextField="CityName" DataValueField="CityId">
                                </asp:DropDownList>
                                <br />
                                <br />
                                <asp:Label ID="Label21" runat="server" Text="Job: "></asp:Label>
                                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="select">
                                    <asp:ListItem Value="0">Programmer</asp:ListItem>
                                    <asp:ListItem Value="1">Teacher</asp:ListItem>
                                    <asp:ListItem Value="2">Designer</asp:ListItem>
                                    <asp:ListItem Value="3">Photography</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <asp:Label ID="Label14" runat="server" Text="----- Descripton -----"></asp:Label>

                        <br />

                        <asp:TextBox ID="info_desc" runat="server" CssClass="desc" MaxLength="400" placeholder="About Your Self ..." TextMode="MultiLine" OnTextChanged="info_desc_TextChanged"></asp:TextBox>

                        <br />
                        <br />
                        <asp:Button ID="Button1" runat="server" CssClass="button" Text="Update" OnClick="Button1_Click1" />
                        <br />
                        <asp:Label ID="errors" runat="server" ForeColor="Red"></asp:Label>
                        <br />
                        <br />
                        <asp:Button ID="Button4" runat="server" Text="Delete Account" CssClass="delete_btn" OnClick="Button4_Click" />

                        <br />
                        <br />

                    </div>
                    <div class="project">
                        <h1>--- Recent Projects ---</h1>
                        <div class="con_project">
                            <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                                <ItemTemplate>


                                    <div class="show_projcet">
                                        <asp:Image ID="Image4" runat="server" ImageUrl='<%# Eval("project_image") %>' CssClass="img" />
                                        <br />
                                        <asp:Label ID="Label16" runat="server" Text="Name: " Font-Bold="True" ForeColor="Blue"></asp:Label>
                                        <asp:Label ID="Label17" runat="server" Text='<%# Eval("project_name") %>'></asp:Label>
                                        <br />
                                        <br />
                                        <asp:Button ID="Button2" runat="server" Text="Delete" CssClass="project_button" OnClick="shape_button_Click" CommandArgument='<%# Eval("id") %>' />


                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                            <div class="add_projcet">

                                <asp:FileUpload ID="FileUpload2" runat="server" CssClass="project_upload" />
                                <br />
                                <asp:Label ID="Label19" runat="server" Font-Size="Small" ForeColor="Red" Text=""></asp:Label>
                                <br />
                                <br />
                                <asp:Label ID="Label18" runat="server" Text="--- Describe image ---"></asp:Label>
                                <br />
                                <asp:TextBox ID="TextBox2" runat="server" MaxLength="90" CssClass="project_input" TextMode="MultiLine"></asp:TextBox>
                                <br />
                                <asp:Label ID="Label20" runat="server" Font-Size="Small" ForeColor="Red"></asp:Label>
                                <br />
                                <asp:Button ID="Button3" runat="server" Text="Add" CssClass="project_button" OnClick="Button3_Click" />

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <footer>
            <div class="footer">
            <p style="color: white; text-align:center;padding:15px; direction: ltr;">Copyright @ 2024 Ali Al-Ahatami.All Rights Reserved</p>
        </div>
        </footer>
        </div>
    </form>
</body>
</html>
