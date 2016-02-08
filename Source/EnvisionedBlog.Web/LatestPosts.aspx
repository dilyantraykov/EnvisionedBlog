<%@ Page Title="Latest Posts" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LatestPosts.aspx.cs" Inherits="EnvisionedBlog.Web.LatestPosts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Latest Posts</h2>
    <asp:Repeater runat="server" ID="repeaterPost"
        ItemType="EnvisionedBlog.Data.Models.Post"
        SelectMethod="repeaterPost_GetData1">
        <ItemTemplate>
            <h3>
                <a href="ViewPost.aspx?id=<%# Item.Id %>"><%#: Item.Title %></a>
                <small><%#: Item.Category.Name %></small>
            </h3>
            <p>
                <%#: Item.Content %>
            </p>
            <p>
                Likes: <%# Item.Likes.Count() %>
            </p>
            <p>
                Comments: <%# Item.Comments.Count() %>
            </p>
            <i>by <%#: Item.Author.UserName %> created on: <%# Item.DateCreated %>
            </i>
        </ItemTemplate>
    </asp:Repeater>
</asp:Content>
