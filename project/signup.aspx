<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signup.aspx.cs" Inherits="project.signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }

        .con {
            background-color: #ffffff;
            width: fit-content;
            height: auto;
            margin: 50px auto;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        h1 {
            background-color: #f5f6fd;
            margin: 0px;
            padding: 10px;
            border-radius: 5px;
            color: #0015ff;
            text-transform: uppercase;
            font-weight: 800;
            font-size: 45px;
            margin-bottom: 5px;
        }

        .conRL {
            display: flex;
        }

        .right, .left {
            background-color: #000fd80a;
            margin: 5px;
            border-radius: 10px;
            padding: 10px;
        }

        .rightText {
            color: #0b0074;
            font-size: small;
        }


        .rightTextbox {
            background-color: transparent;
            padding: 4px;
            margin: 20px 30px 0px 0px;
            border: none;
            outline: none;
            border-bottom: 1px solid gray;
        }

            .rightTextbox:hover {
                border-bottom: 2px solid blue;
            }

        .image {
            background: #ddddff;
            padding: 10px;
            border-radius: 5px;
        }

            .image::file-selector-button {
                background-color: blue;
                padding: 10px;
                border: none;
                outline: none;
                border-radius: 5px;
                color: white;
                cursor: pointer;
            }

        .droplist {
            padding: 5px;
            margin-bottom: 10px;
            border: none;
            font-weight: 600;
            border-radius: 20px;
            text-align: center;
            width: 60%;
            background-color: #ddddff;
            color: blue;
        }

        .sub {
            width: 50%;
            background-color: blue;
            color: white;
            font-size: 16px;
            border-radius: 5px;
            border: none;
            padding: 8px;
            background-image: linear-gradient(90deg, rgb(0, 229, 255), blue);
            transition: background-image 3.5s ease;
            margin-top: 20px;
            /*  
    margin-bottom: 25px;
    */
        }

            .sub:hover {
                cursor: pointer;
                border: none;
                background-image: linear-gradient(-90deg, rgb(0, 229, 255), blue);
                /* background-image: linear-gradient(-90deg ,  blue, rgb(0, 229, 255)); */
                /* color: blue; */
                /* background-color: white; */
                /* border: 1.2px solid blue; */
            }

        .validator {
            color: red;
            font-size: 12px;
        }

        @media only screen and (max-width: 720px) {
            .conRL {
                display: block;
            }

            .right, .left {
                width: 80%;
            }

            .rightText {
                width: 50%;
            }
        }


        .username {
            background-color: #0000ff1f;
            padding: 10px;
            border-radius: 5px;
            display: flex;
        }

            .username:before {
                content: "Noticed: ";
                color: blue;
                font-weight: 600;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="con">
            <h1>Sign Up Page</h1>
            <div class="conRL">

            <div class="right">
                <asp:Label ID="Label1" runat="server" Text="Full Name:" CssClass="rightText"></asp:Label>
                
                <asp:TextBox ID="fullName" runat="server" CssClass="rightTextbox" placeholder="Enter your Name" MaxLength="30"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="fullName" EnableClientScript="False" ErrorMessage="Required Name" CssClass="validator"></asp:RequiredFieldValidator>
                <br />
                <asp:Label ID="Label2" runat="server" Text="Your Phone Number:" CssClass="rightText"></asp:Label>
                <asp:TextBox ID="phoneNumber" runat="server" CssClass="rightTextbox" placeholder="Enter your Phone Number" OnTextChanged="phoneNumber_TextChanged" AutoPostBack="True" MaxLength="15"></asp:TextBox>
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="phoneNumber" CssClass="validator" EnableClientScript="False" ErrorMessage="Required Phone Number"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="phoneNumber" CssClass="validator" EnableClientScript="False" ErrorMessage="Please, Write a real phone number" ValidationExpression="^[0-9]{6,15}$"></asp:RegularExpressionValidator>
                <br />
                <asp:Label ID="Label4" runat="server" Text="Username:" CssClass="rightText"></asp:Label>
                <asp:TextBox ID="userName" runat="server" CssClass="rightTextbox" placeholder="Enter your Username" MaxLength="50"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="userName" CssClass="validator" EnableClientScript="False" ErrorMessage="Required UserName"></asp:RequiredFieldValidator>
                <asp:Label ID="Label11" runat="server" Text="" CssClass="validator"></asp:Label>
                <br />
                <asp:Label ID="Label13" runat="server" CssClass="username" Font-Size="Small" ForeColor="Gray" Text="  username cannot be modified or changed."></asp:Label>
                <br />
                <asp:Label ID="Label5" runat="server" Text="Password:" CssClass="rightText" ></asp:Label>
                <asp:TextBox ID="passWord" runat="server" CssClass="rightTextbox" placeholder="Enter your Password" MaxLength="50"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="passWord" CssClass="validator" EnableClientScript="False" ErrorMessage="Required PassWord"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="passWord" CssClass="validator" EnableClientScript="False" ErrorMessage="At least 6 character" ValidationExpression="^.{6,}$"></asp:RegularExpressionValidator>
                <br />
                <br />
                <asp:Button ID="Button1" runat="server" Text="Create Account" CssClass="sub" OnClick="Button1_Click" />
                <br />
                <asp:Label ID="Label12" runat="server" Text="" CssClass="validator"></asp:Label>
                <br />
                <br />
                <br />
                <asp:Label ID="Label9" runat="server" Text="I have account! "></asp:Label>
                <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="Blue" NavigateUrl="~/login.aspx">Log In</asp:HyperLink>
                </div>
            <div class="left">


              


              
                <asp:FileUpload ID="FileUpload1" runat="server" CssClass="image" ViewStateMode="Enabled" OnLoad="FileUpload1_Load" OnUnload="FileUpload1_Load" />
                <br />
                <br />
                <asp:Label ID="Label10" runat="server" CssClass="validator"></asp:Label>
                <br />
                <br />
                <br />
                <asp:Label ID="Label7" runat="server" Text="Job Name: " CssClass="rightText"></asp:Label>
                <asp:DropDownList ID="DDLjobName" runat="server" CssClass="droplist">
                    <asp:ListItem>Programmer</asp:ListItem>
                    <asp:ListItem>Teacher</asp:ListItem>
                    <asp:ListItem>Designer</asp:ListItem>
                    <asp:ListItem>Photography</asp:ListItem>
                </asp:DropDownList>
                <br />
                <br />
                <br />
                <asp:Label ID="Label8" runat="server" Text="Gender: " CssClass="rightText"></asp:Label>
                <asp:RadioButton ID="RadioButton1" runat="server" Text="Male" GroupName="g" Checked="True"  />
                
                
                &nbsp;
                
                <asp:RadioButton ID="RadioButton2" runat="server" Text="Famale" GroupName="g" />
                <br />
                <br />
                <br />
                <br />
                <asp:Label ID="Label3" runat="server" Text="Country:" CssClass="rightText"></asp:Label>
                <asp:DropDownList ID="DDLcountry" runat="server" CssClass="droplist" AutoPostBack="True" DataTextField="CountryName" DataValueField="CountryId" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" >
                </asp:DropDownList>
                <br />
                <br />
                <br />
                <asp:Label ID="Label6" runat="server" Text="City:" CssClass="rightText"></asp:Label>
                <asp:DropDownList ID="DDLcity" runat="server" CssClass="droplist" DataTextField="CityName" DataValueField="CityId">
                </asp:DropDownList>
                <br />
                <br />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
