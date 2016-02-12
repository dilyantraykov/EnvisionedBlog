<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="EnvisionedBlog.Web.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="services u-cf">
            <div class="one-third column">
                <img src="/Content/images/basket.png" alt="What We Offer" class="icon">
                <h3 class="title">What We Offer</h3>
                <p>Integer egestas ultricies urna vitae molestie. Donec nec facilisis nisi. Vivamus tempor feugiat velit gravida vehicula. Donec faucibus pellentesque ipsum id varius. Ut rutrum metus sed neque ultricies a dictum ante sagittis. Proin in facilisis diam. Sed placerat imperdiet purus, id sollicitudin magna pretium sit amet.  Vivamus orci dolor, iaculis at volutpat eget.</p>
            </div>
            <div class="one-third column">
                <img src="/Content/images/messages.png" alt="Who We Are" class="icon">
                <h3 class="title">Who We Are</h3>
                <p>Nam commodo dignissim felis vitae ullamcorper. Sed volutpat velit id purus bibendum placerat. Sed porta, nulla ac interdum ullamcorper, mi orci porta eros, nec commodo ligula dolor et arcu. Quisque ullamcorper enim vel tellus rhoncus et fermentum diam congue. Phasellus eu turpis lorem, id gravida nunc. Phasellus convallis dolor sed sem dignissim.</p>
            </div>
            <div class="one-third column">
                <img src="/Content/images/umbrella.png" alt="Our Mission" class="icon">
                <h3 class="title">Our Mission</h3>
                <p>Aliquam eleifend lacus ac tellus volutpat porttitor. Suspendisse imperdiet tortor ut tortor bibendum pulvinar. Nam est mi, accumsan sit amet vestibulum in, cursus vitae orci. Nunc varius adipiscing mi, sit amet condimentum eros fermentum sed. Nulla feugiat metus metus. Ut varius diam eu velit pulvinar semper. Vivamus aliquam malesuada libero mollis varius.</p>
            </div>
        </div>
    </div>
    <div id="quote">
        <div id="quote-inner">
            <div class="container">
                <span id="quote-icon"></span>
                <p>Vivamus id feugiat ligula. Nulla facilisi. Integer lacus justo, elementum eget consequat a, molestie nec sapien. Quisque tincidunt, nunc vitae</p>
                <a href="http://www.elegantthemes.com/preview/Envisioned/portfolio/" class="additional-info"><span>Additional Info</span></a>
            </div>
        </div>
    </div>
    <div class="container">
        <asp:ListView runat="server" ID="lvPost"
            ItemType="EnvisionedBlog.Data.Models.Post"
            SelectMethod="lastPosts_GetData2"
            GroupItemCount="5">
            <GroupTemplate>
                <div class="row">
                    <div id="itemPlaceholder" runat="server"></div>
                </div>
            </GroupTemplate>
            <LayoutTemplate>
                <div id="groupPlaceholder" runat="server"></div>
            </LayoutTemplate>
            <ItemTemplate>
                <a href="<%# Item.ImageUrl %>" rel="posts" class="post-image">
                    <img src="<%# Item.ImageUrl %>" />
                </a>
            </ItemTemplate>
        </asp:ListView>
    </div>
</asp:Content>

<asp:Content ContentPlaceHolderID="SriptsPlaceholder" runat="server">
    <script src="/Content/fancybox/jquery.fancybox.js"></script>
    <script src="/Content/fancybox/jquery.fancybox.pack.js"></script>
    <script>
        $(document).ready(function () {
            $("a.post-image").fancybox({
                'transitionIn': 'elastic',
                'transitionOut': 'elastic',
                'speedIn': 600,
                'speedOut': 200,
                'overlayShow': false
            });
        });
    </script>
</asp:Content>
