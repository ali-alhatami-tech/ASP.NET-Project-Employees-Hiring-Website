<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="search.aspx.cs" Inherits="project.search" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body {
            font-family: Arial, sans-serif;
            font-family: Georgia, 'Times New Roman', Times, serif;
            background-color: #f4f4f4;
        }

        .con {
            background-color: white;
            margin: 20px auto;
            border-radius: 15px;
            width: 95%;
            padding-bottom: 5px;
            text-align: center;
            padding-top: 10px;
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
            border-radius: 6px;
            margin-right: 5px;
        }

        .logo_input, .logo_button {
            border: none;
            padding: 5px;
            border-radius: 5px;
            /* width: 70%; */
            outline: none;
            font-weight: 900;
        }

        .logo_button {
            padding: 2px 15px;
            background-color: transparent;
            border: 2px solid white;
            color: white;
            box-shadow: 3px 3px 0px white;
        }

            .logo_button:hover {
                background-color: #f6f6f6;
                color: #FF9800;
                cursor: pointer;
            }

        .profile {
            display: flex;
        }


        /* Navigation links */
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

        /* start of the shape desgin */

        .con_shape {
            display: grid;
            width: 97%;
            margin: auto;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 18px;
            padding: 5px;
        }

        .shape {
            background-color: white;
            border: 2px solid rgb(172, 172, 172);
            padding: 30px;
            text-align: center;
            border-radius: 10px;
            /* width: 200px; */
            min-height: 330px;
            /* max-height: 360px; */
        }

            .shape:hover {
                box-shadow: 0px 0px 10px #39383864;
            }

            .shape .img {
                border-radius: 50%;
                background-color: lightgrey;
                object-fit: cover;
            }

            .shape .button {
                border: none;
                padding: 10px 20px;
                background-color: blue;
                color: white;
                margin-top: 20px;
                border-radius: 40px;
                cursor: pointer;
                text-transform: capitalize;
            }

                .shape .button:hover {
                    background-color: rgb(47, 47, 255);
                }

            .shape h1 {
                color: blue;
            }

            .shape h1,
            p {
                margin: 10px;
            }

        .desc {
            text-align: start;
            height: 57px;
            width: 220px;
            overflow: hidden;
            text-overflow: ellipsis;
        }

            .desc:before {
                content: "DESC: ";
                color: gray;
            }

        .label-style {
            display: inline-block;
            max-width: 200px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        /* end start of the shape desgin */

        .search_btn_con{
            text-align: start;
    padding-left: 20px;
        }
        .search_btn{
            padding: 5px 20px;
    border: 2px solid;
    color: blue;
    background-color: white;
    border-radius: 15px;
    margin: 5px;
        }
        .search_btn:hover{
            background-color:blue;
            color:white;
            cursor:pointer;
        }
        .no_found{
            padding:50px;
            display:flex;
            text-align:center;
            justify-content:center;
        }
        .footer {
            border-radius: 5px;
            width: 97%;
            margin: 15px auto;
            background-color: black;
            background-image: linear-gradient(90deg, black,rgb(0, 0, 50),rgb(0, 0, 0));
        }
        hr{
            width: 65%;
    margin: auto;
        }
        .footer hr {
            margin-top: 160px;
            width: 65%;
            color: blue;
            border: 0.7px dashed;
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
                        <asp:HyperLink ID="HyperLink2" runat="server" ForeColor="White" Font-Bold="True" Font-Size="Larger" NavigateUrl="~/signup.aspx">Sign Up</asp:HyperLink></li>
                    <li>&nbsp;&nbsp;&nbsp;
                                <asp:Label ID="Label6" runat="server" Text="|" ForeColor="White"></asp:Label></li>
                    <li>&nbsp;&nbsp;&nbsp;<asp:HyperLink ID="HyperLink3" runat="server" ForeColor="White" Font-Bold="True" Font-Size="Larger" NavigateUrl="~/login.aspx">Log In</asp:HyperLink></li>
                </ul>
                <div class="logo">
                    <asp:TextBox ID="TextBox1" CssClass="logo_input" runat="server"></asp:TextBox>
                    <asp:Button ID="Button1" runat="server" CssClass="logo_button" Text="Search" OnClick="Button1_Click" />
                </div>
            </div>
            <br />
            <br />
            <br />
            <hr />
            <h1>--- Search Result ---</h1>
            <hr />
            <br />
            <br />
            <div class="search_btn_con">

            <asp:Button ID="Button2" runat="server"  Text="Programmer" CommandArgument="Programmer" CssClass="search_btn" OnCommand="Button2_Command" />
            <asp:Button ID="Button3" runat="server" Text="Teacher" CommandArgument="Teacher" CssClass="search_btn" OnCommand="Button2_Command"/>
            <asp:Button ID="Button4" runat="server" Text="Designer" CommandArgument="Designer" CssClass="search_btn" OnCommand="Button2_Command"/>
            <asp:Button ID="Button5" runat="server" Text="Photography" CommandArgument="Photography" CssClass="search_btn" OnClick="Button5_Click" OnCommand="Button2_Command"/>
            </div>
            <br />
            <br />
            <div class="con_shape">

                <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                    <ItemTemplate>

                        <div class="shape" id="shape_detials">
                            <p style="text-align: start">
                                <asp:Label ID="shape_country" runat="server" Text='<%# Eval("Country") + ", " + Eval("City") %>'></asp:Label>
                            </p>
                            <asp:Image ID="shape_image" runat="server" Width="100px" Height="100px" CssClass="img" ImageUrl='<%# Eval("image") %>' />
                            <h1>
                                <asp:Label ID="shape_name" runat="server" Text='<%# Eval("Name") %>' MaxLength="5" CssClass="label-style"></asp:Label></h1>
                            <p>
                                <asp:Label ID="shape_job" runat="server" Text='<%# Eval("Job")  %>'></asp:Label>
                            </p>

                            <div class="desc">

                                <asp:Label ID="shape_desc" runat="server" Text='<%# Eval("description") %>'></asp:Label>
                            </div>
                            <asp:Button ID="shape_button" runat="server" Text="See More" CssClass="button" CommandArgument='<%# Eval("Username") %>' OnClick="shape_button_Click" />


                            <br />
                        </div>


                    </ItemTemplate>
                </asp:Repeater>

            </div>
            <br />
            <asp:Label ID="Label3" runat="server" Text="No Searcing Found..." Font-Bold="False" Font-Italic="True" CssClass="no_found" Font-Size="Large" Visible="False"></asp:Label>
            <br />
            <footer>
                <div class="footer">
                    <p style="color: white; text-align: center; padding: 15px; direction: ltr;">Copyright @ 2024 Ali Al-Ahatami.All Rights Reserved++</p>
                </div>
            </footer>
        </div>
    </form>
</body>
</html>
