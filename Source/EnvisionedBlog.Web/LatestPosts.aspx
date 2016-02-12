<%@ Page Title="Latest Posts" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LatestPosts.aspx.cs" Inherits="EnvisionedBlog.Web.LatestPosts" %>

<asp:Content ID="Title" ContentPlaceHolderID="TitlePlaceholder" runat="server">
    Latest posts
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div id="breadcrumbs">
            <asp:SiteMapPath ID="BreadCrumbsServer" runat="server" PathSeparator=" » " />
        </div>
        <asp:Repeater runat="server" ID="repeaterPost"
            ItemType="EnvisionedBlog.Data.Models.Post"
            SelectMethod="repeaterPost_GetData1">
            <ItemTemplate>
                <div class="post entry u-cf">
                    <h2 class="title"><a href="PostDetails.aspx?id=<%# Item.Id %>"><%# Item.Title %></a></h2>
                    <p class="meta-info">Posted by <a href="/ViewAuthor.aspx?id=<%# Item.Author.Id %>" title="Posts by <%# Item.Author.UserName %>" rel="author"><%# Item.Author.UserName %></a> on <%# Item.DateCreated %> in <a href="#" rel="category tag"><%# Item.Category.Name %></a> | <%# Item.Comments.Count %> Comments</p>

                    <div class="post-thumbnail">
                        <a href="#">
                            <img src="<%# Item.ImageUrl %>" class="post-thumb">
                            <span class="post-overlay"></span>
                        </a>
                    </div>

                    <p><%# Item.Content %></p>
                    <a href="PostDetails.aspx?id=<%# Item.Id %>" class="readmore">Read More</a>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
