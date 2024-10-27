<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="project.index" %>

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
        width: 350px;
        height: auto;
        margin: 100px auto;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        text-align: center;
    }
        h1{
            background-color: #ddddff;
    margin: 0px;
    padding: 10px;
    border-radius: 5px;
    color: #0015ff;
    text-transform: uppercase;
    font-weight: 800;
    font-size: 45px;
    margin-bottom: 45px;
        }
        .text{
            padding: 5px;
    margin: 20px 0px;
    border: none;
    border-bottom: 1px solid gray;
    font-size: 17px;
            outline:none;
        }
        .text:hover{
            border-bottom:2px solid blue;
            
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
    margin-bottom: 25px;
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
    .label{
            font-size: small;
    }
    
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="con">
            
            <h1>Log In Page</h1>
            <asp:Label ID="Label1" runat="server" Text="UserName:" CssClass="label"></asp:Label>
        &nbsp;
            <asp:TextBox ID="TextBox1" runat="server" CssClass="text" placeholder="Enter your Username"></asp:TextBox>
            <br />
            <asp:Label ID="Label2" runat="server" Text="PassWord: " CssClass="label"></asp:Label>
&nbsp;
            <asp:TextBox ID="TextBox2" runat="server" CssClass="text" placeholder="Enter your Password"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Font-Overline="False" Font-Size="Small" ForeColor="Red"></asp:Label>
            <br />
            <asp:Button ID="Button1" runat="server" CssClass="sub" Text="Log In" OnClick="Button1_Click" />
            <br />
            <br />
            I don&#39;t have account?
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/signup.aspx" ForeColor="Blue">Sighn Up</asp:HyperLink>
            <br />
            
        </div>
    </form>
</body>
</html>
