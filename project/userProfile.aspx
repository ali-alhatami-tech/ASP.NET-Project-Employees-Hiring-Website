<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="userProfile.aspx.cs" Inherits="project.userProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        .con {
            background-color: white;
            margin: 20px auto;
            border-radius: 15px;
            width: 95%;
            padding-bottom: 10px;
        }

        .navbar {
            width: 100%;
            height: 50px;
            background-image: url(image_style/userprofile.jpg);
            border-radius: 10px 10px 0px 0px;
            padding-top: 25px;
            text-align: center;
        }

        .link {
            color: white;
            font-size: 30px;
            text-align: center;
            text-decoration: none;
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

        .img {
            border-radius: 5px;
            width: 98%;
            object-fit: cover;
        }

        .aboutMe, .project, .rate, .w_rate {
            background-color: #f5f6fd;
            padding: 5px;
            border-radius: 10px;
            margin-bottom: 20px;
        }

        .input {
            min-width: 95%;
            min-height: 350px;
            max-width: 95%;
            max-height: 350px;
            outline: none;
            border: none;
            border-radius: 5px;
            padding: 5px;
            line-height: 35px;
        }

        .no_res_project {
            margin: 30px;
            padding: 70px;
            display: flex;
            justify-content: center;
            border: 1px dotted;
        }

        .con_project {
            display: grid;
            grid-template-columns: 1fr 1fr 1fr 1fr;
        }

        .show_projcet {
            padding: 20px;
            background: white;
            border-radius: 10px;
            margin: 5px;
            overflow: hidden;
        }
        /* Rate and reviews*/
        .button {
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

            .button:hover {
                cursor: pointer;
                border: none;
                background-image: linear-gradient(-90deg, rgb(0, 229, 255), rgb(30, 255, 0));
            }

        .select {
            padding: 5px 15px;
            border: none;
            border-radius: 5px;
            color: blue;
            background-color: #0000ff0d;
        }














        /* Rate and reviews*/
        .user_detials {
            display: flex;
            margin: 5px;
        }

        .d_left {
            display: flex;
            margin: 5px;
            width: 90%;
        }

        .d_name {
            margin-left: 10px;
        }

        .d_comment {
            min-width: 95%;
            max-width: 95%;
            min-height: 150px;
            max-height: 150px;
            border: none;
            border-radius: 5px;
            outline: none;
            padding: 15px;
        }

        .d_img {
            border-radius: 50%;
            object-fit:cover;
        }

        .footer {
            border-radius: 5px;
            width: 99%;
            margin: 15px auto;
            background-color: black;
            background-image: linear-gradient(90deg, black,rgb(0, 0, 50),rgb(0, 0, 0));
        }

        .footer  hr {
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
                <asp:HyperLink ID="HyperLink1" CssClass="link" runat="server" NavigateUrl="~/index.aspx">Home Page</asp:HyperLink>
            </div>

            <div class="min_con">
                <div class="right">
                    <asp:Image ID="info_image" runat="server" Height="150px" Width="150px" CssClass="img" ForeColor="#CCCCFF" />
                    <br />
                    <asp:Label ID="reviews" runat="server" Text="5.00 (review)"></asp:Label>
                    <br />
                    <asp:Label ID="info_txt_name" runat="server" Text="Ali alhatami" Font-Bold="True" Font-Size="XX-Large" ForeColor="Blue"></asp:Label>
                    <br />
                    <asp:Label ID="C_C_Ph" runat="server" Text="Yemen,sanaa : 772169696" Font-Size="Large"></asp:Label>
                    <br />
                    <asp:Label ID="dateT" runat="server" Text="2024/05/12" Font-Size="Small"></asp:Label>
                    <br />
                    <asp:Label ID="job" runat="server"></asp:Label>
                    <br />
                    <br />
                    <br />
                </div>

                <div class="left">
                    <div class="aboutMe">
                        <h1>--- About Me ---</h1>

                        <asp:TextBox ID="info_desc" runat="server" ReadOnly="True" CssClass="input" TextMode="MultiLine"></asp:TextBox>
                        <br />
                        <br />
                    </div>
                    <div class="project">
                        <h1>--- Recnetly Projects ---</h1>
                        <asp:Label ID="no_res_project" runat="server" Text="No Item found" CssClass="no_res_project" Visible="False"></asp:Label>
                        <br />
                        <div class="con_project">
                            <asp:Repeater ID="repeater1" runat="server" OnItemCommand="info_desc_ItemCommand">
                                <ItemTemplate>

                                    <div class="show_projcet">
                                        <asp:Image ID="Image4" runat="server" ImageUrl='<%# Eval("project_image") %>' CssClass="img" />
                                        <br />
                                        <asp:Label ID="Label16" runat="server" Text="Name: " Font-Bold="True" ForeColor="Blue"></asp:Label>
                                        <asp:Label ID="Label17" runat="server" Text='<%# Eval("project_name") %>'></asp:Label>
                                        <br />
                                        <br />
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                            <br />
                        </div>
                    </div>
                    <div class="w_rate">
                        <h1>--- Write a Comment ---</h1>
                        <br />
                        <asp:TextBox ID="w_rate" runat="server" CssClass="d_comment" MaxLength="200" TextMode="MultiLine" OnTextChanged="w_rate_TextChanged"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label20" runat="server" Font-Size="Small" ForeColor="Red" Text=""></asp:Label>
                        <br />
                        <br />
                        <asp:Button ID="Button1" runat="server" Text="Rating" CssClass="button" OnClick="Button1_Click" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="Label19" runat="server" Text="Rate: " Font-Size="Medium"></asp:Label>
                        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="select" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                        </asp:DropDownList>
                        <br />
                        <br />
                    </div>
                    <div class="rate">
                        <h1>--- Ratings and Reviews ---</h1>
                        <asp:Repeater ID="Repeater2" runat="server">
                            <ItemTemplate>
                                <div class="user_detials">
                                    <div class="d_left">
                                        <asp:Image ID="userImage" runat="server" Height="65px" Width="65px" CssClass="d_img" ImageUrl='<%# Eval("image") %>' />
                                        <div class="d_name">
                                            <asp:Label ID="userName" runat="server" Text='<%# Eval("Name") %>' Font-Bold="True" Font-Size="Medium"></asp:Label>
                                            <br />
                                            <asp:Label ID="userCountry" runat="server" Text='<%# Eval("Country") + ", " + Eval("City") %>' Font-Size="Small"></asp:Label>
                                            <br />
                                            <asp:Label ID="userJob" runat="server" Text='<%# Eval("Job") %>' Font-Size="Small"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="d_right">
                                        <asp:Label ID="profileRateDate" runat="server" Text='<%# Eval("date", "{0:yyyy-MM-dd}") %>' Font-Size="Smaller"></asp:Label>
                                        <br />
                                        <br />
                                        <br />
                                        <asp:Label ID="profileRate" runat="server" Text='<%# "Rate: " + Eval("rate") %>' Font-Bold="True"></asp:Label>
                                    </div>
                                </div>
                                <asp:TextBox ID="profileComment" runat="server" Text='<%# Eval("comment_name") %>' TextMode="MultiLine" CssClass="d_comment" ReadOnly="True"></asp:TextBox>
                            </ItemTemplate>
                        </asp:Repeater>
                        <asp:Label ID="resuilt_rate" runat="server" Text="No Item Found" Visible="False"></asp:Label>
                    </div>
                </div>
            </div>
            <footer>
                <div class="footer">
                    <p style="color: white; text-align: center; padding: 15px; direction: ltr;">Copyright @ 2024 Ali Al-Ahatami.All Rights Reserved</p>
                </div>
            </footer>
        </div>
    </form>
</body>
</html>
