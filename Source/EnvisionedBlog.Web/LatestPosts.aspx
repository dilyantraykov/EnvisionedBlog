<%@ Page Title="Latest Posts" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LatestPosts.aspx.cs" Inherits="EnvisionedBlog.Web.LatestPosts" %>

<asp:Content ID="Title" ContentPlaceHolderID="TitlePlaceholder" runat="server">
    <div id="category-name">
        <h1 class="category-title">Latest posts</h1>
    </div>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SiteMapPath ID="breadcrumbs" runat="server" PathSeparator="»"/>
    <asp:Repeater runat="server" ID="repeaterPost"
        ItemType="EnvisionedBlog.Data.Models.Post"
        SelectMethod="repeaterPost_GetData1">
        <ItemTemplate>
            <div class="post entry clearfix">
                <h2 class="title"><a href="ViewPost.aspx?id=<%# Item.Id %>"><%# Item.Title %></a></h2>
                <p class="meta-info">Posted  by <a href="/ViewAuthor.aspx?id=<%# Item.Author.Id %>" title="Posts by <%# Item.Author.UserName %>" rel="author"><%# Item.Author.UserName %></a> on <%# Item.DateCreated %> in <a href="#" rel="category tag"><%# Item.Category.Name %></a></p>

                <div class="post-thumbnail">
                    <a href="#">
                        <img src="<%# Item.ImageUrl %>" class="post-thumb" width="212" height="213">
                        <span class="post-overlay"></span>
                    </a>
                </div>

                <p><%#: Item.Content %></p>
                <a href="ViewPost.aspx?id=<%# Item.Id %>" class="readmore"><span>Read More</span></a>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</asp:Content>
