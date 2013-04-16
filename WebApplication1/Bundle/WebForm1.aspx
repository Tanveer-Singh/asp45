<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication1.Bundle.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

    <script type="text/javascript">
        $(document).ready(function () {
            $("#test").tooltip({
                show: {
                    effect: "slideDown",
                    delay: 250
                }
            });

            $("#<%=TextBox1.ClientID%>").datepicker();

            $("#testPage").colorbox(
                { iframe: true, current: '', innerWidth: '718px', innerHeight: '413px' });

            $("#<%=Button2.ClientID%>").click(function () {
                $("#dialog").dialog({
                    modal: true,
                    width: 420,
                    resizable: false,
                    draggable: false,
                    show: {
                        effect: "blind",
                        duration: 500
                    }
                });
                return false;
            });

            $('img').adipoli({
                'startEffect': 'normal',
                'hoverEffect': 'popout'
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <asp:TextBox ID="TextBox1" runat="server" title="Age"></asp:TextBox>
    <div id="test" title="Test">
        hello I am testing this link.
    </div>
    <asp:Button ID="Button1" runat="server" Text="Button" />
    <br />
    ------------Using Color Box<br />
    <br />
    <a href="testPage.aspx" id="testPage">MyLink</a>
    <br />
    ------------Using Jquery DialogBox<br />
    <asp:Button ID="Button2" runat="server" Text="Button" />
    <br />
    <div id="dialog" title="Basic dialog" style="display:none">
        <p>This is an animated dialog which is useful for displaying information. The dialog window can be moved, resized and closed with the 'x' icon.</p>
    </div>

    <hr />
    Using AdiPoli Image Hover Effects <br />

        <img src="../Images/GrillaImage/pic1.jpg" alt="pic1" />
        <img src="../Images/GrillaImage/pic2.jpg" alt="pic2" />
        <img src="../Images/GrillaImage/upbg.gif" alt="pic3" />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Button ID="Button3" runat="server" Text="Button" OnClick="Button3_Click" />
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="Button3" EventName="Click" />
        </Triggers>

    </asp:UpdatePanel>

</asp:Content>
