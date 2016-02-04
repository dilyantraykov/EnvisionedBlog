﻿<%@ Page Title="News" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="EnvisionedBlog.Web.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>News</h1>
    <h2>Most Popular Posts</h2>
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

    <asp:ListView runat="server" ID="lvCategories"
        ItemType="EnvisionedBlog.Data.Models.Category"
        SelectMethod="lvCategories_GetData">
        <LayoutTemplate>
            <h2>All categories</h2>
            <div runat="server" id="itemPlaceholder"></div>
        </LayoutTemplate>
        <ItemTemplate>
            <div class="col-md-6">
                <h3><%#: Item.Name %></h3>
                <asp:ListView runat="server" ItemType="EnvisionedBlog.Data.Models.Post" DataSource="<%# Item.Posts.OrderByDescending(x => x.DateCreated).Take(3) %>">
                    <LayoutTemplate>
                        <ul runat="server" id="itemPlaceholder">
                        </ul>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <li>
                            <a href="ViewPost.aspx?id=<%# Item.Id %>"><strong><%#: Item.Title %></strong> <i>by <%#: Item.Author.UserName %></i></a>
                        </li>
                    </ItemTemplate>
                    <EmptyDataTemplate>
                        No posts.
                    </EmptyDataTemplate>
                </asp:ListView>
            </div>
        </ItemTemplate>
    </asp:ListView>
</asp:Content>
