<%@ Page Title="Categories" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Categories.aspx.cs" Inherits="EnvisionedBlog.Web.Categories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SiteMapPath ID="breadcrumbs" runat="server" PathSeparator="»"/>
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
