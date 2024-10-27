<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="project.index1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        * {
            box-sizing: border-box;
            padding: 0;
        }

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
        }


        .min_home {
            width: 100%;
            position: relative;
            background-image: url("image_style/home.jpg");
            background-repeat: no-repeat;
            border-radius: 15px 15px 0px 0px;
            height: fit-content;
            padding-top: 15px;
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


        .search {
            padding: 200px 20px 280px;
        }

        .textbox_search {
            height: 35px;
            width: 460px;
            border-radius: 5px 0px 0px 5px;
            border: none;
            padding-left: 5px;
            margin-left: 3px;
            outline: none;
        }

        .button_search {
            background-color: #FFEB3B;
            border: none;
            height: 35px;
            width: 35px;
            border-radius: 0px 5px 5px 0px;
            margin-left: -5px;
            transform: translate(0px, 13px);
        }

            .button_search:hover {
                background-color: orange;
            }

        .search_button_job {
            background-color: transparent;
            color: white;
            padding: 5px 10px;
            font-weight: 700;
            border: 2px solid white;
            border-radius: 15px;
            margin-right: 5px;
        }

            .search_button_job:hover {
                background-color: white;
                color: orange;
                cursor: pointer;
            }

        .label {
            text-transform: capitalize;
        }

        .about {
            display: flex;
            background-color: #f7f7f7;
        }

            .about .left {
                width: 50%;
            }

        .left .img {
            width: 100%;
            height: 100%;
        }

        .about .right {
            width: 50%;
            padding-top: 20px;
            padding-left: 10px;
            text-transform: capitalize;
        }

        .about p {
            padding-left: 15px;
        }

        .title_text {
            padding: 150px 15px 40px;
            color: blue;
            font-size: 40px;
            text-transform: capitalize;
        }

        .shape_title {
            padding: 180px 20px 20px;
            font-size: 50px;
            color: blue;
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

        .footer {
            border-radius: 5px;
            width: 97%;
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
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="con">


            <div class="min_home">

             
                   
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
                            <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="White" Font-Bold="True" Font-Size="Larger" NavigateUrl="~/profile.aspx">Profile</asp:HyperLink></li>
                        <li>&nbsp;&nbsp;&nbsp;
                                <asp:Label ID="Label5" runat="server" Text="|" ForeColor="White"></asp:Label></li>
                        <li>
                            <asp:HyperLink ID="HyperLink2" runat="server" ForeColor="White" Font-Bold="True" Font-Size="Larger" NavigateUrl="~/signup.aspx">Sign Up</asp:HyperLink></li>
                        <li>&nbsp;&nbsp;&nbsp;
                                <asp:Label ID="Label6" runat="server" Text="|" ForeColor="White"></asp:Label></li>
                        <li>&nbsp;&nbsp;&nbsp;<asp:HyperLink ID="HyperLink3" runat="server" ForeColor="White" Font-Bold="True" Font-Size="Larger" NavigateUrl="~/login.aspx">Log In</asp:HyperLink></li>
                    </ul>
                    <div class="logo">
                        <asp:Image ID="Image3" runat="server" Height="50px" Width="50px" ImageUrl="~/image_style/ali.png" />
                    </div>
                </div>
                    <div class="search">
                        <asp:Label ID="Label3" runat="server" Text="Find the right freelance" Font-Bold="True" Font-Size="XX-Large" ForeColor="White"></asp:Label>
                        <br />
                        <asp:Label ID="Label4" runat="server" Text="service, right away..." Font-Bold="True" Font-Size="XX-Large" ForeColor="White"></asp:Label>
                        <br />
                        <br />
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="textbox_search" placeholder="Search By Name ..."></asp:TextBox>
                        
                       
                        <asp:ImageButton ID="ImageButton1" runat="server"  CssClass="button_search" ImageUrl="~/image_style/search_logo.png" OnClick="ImageButton1_Click" />
                        
                       
                        <br />
                        <br />
                        &nbsp;<asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Size="Larger" ForeColor="White" Text="Popular: "></asp:Label>
                        <asp:Button ID="btn_programmer" runat="server" Text="Programmer" CommandArgument="Programmer" CssClass="search_button_job" OnCommand="btn_teacher_Command" />
                        <asp:Button ID="btn_teacher" runat="server" Text="Teacher" CommandArgument="Teacher" CssClass="search_button_job" OnClick="btn_teacher_Click" OnCommand="btn_teacher_Command" />
                        <asp:Button ID="btn_designer" runat="server" Text="Designer" CommandArgument="Designer" CssClass="search_button_job" OnCommand="btn_teacher_Command" />
                        <asp:Button ID="btn_photography" runat="server" Text="Photography" CommandArgument="Photography" CssClass="search_button_job" OnCommand="btn_teacher_Command" />
                    </div>
                
            </div>

            <h1 class="title_text">About our website:</h1>
            <div class="about">
            <div class="right">
                <h2>The best part? Everything </h2>
                <h3>stick to your budget</h3>
                <p>find the right servic for every price point. No hourly rates. just project-based pricing.</p>
                <h3>Get quality work done quickly</h3>
                <p>Hand your project over to a talented freelancer in minutes. get long-lasting results </p>
                <h3>Pay when you're happy</h3>
                <p>Upfront quotes mean no surprises. Payments only get released when you approve.</p>
                <h3>Count on 24/7 support</h3>
                <p>Our round-the-clock support team is available to help any time, anywhere.</p>
            </div>
            <div class="left">
                
                <asp:Image ID="Image2" CssClass="img"  runat="server" ImageUrl="~/image_style/about.jpg" />
            </div>
        </div>
            <hr />
            <h3 class="shape_title">Popular services:</h3>

            <div class="con_shape">
                
                <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                    <ItemTemplate>
                        <div class="con_shape">
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

                        </div>
                    </ItemTemplate>
                </asp:Repeater>

                
            </div>

            <footer>
            <div class="footer">
            <p style="color: white; text-align:center;padding:15px; direction: ltr;">Copyright @ 2024 Ali Al-Ahatami.All Rights Reserved++</p>
        </div>
        </footer>

        </div>
    </form>
</body>
</html>
