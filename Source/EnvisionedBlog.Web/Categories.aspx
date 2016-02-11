<%@ Page Title="Categories" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Categories.aspx.cs" Inherits="EnvisionedBlog.Web.Categories" %>

<%@ Register Src="~/Controls/Sidebar.ascx" TagPrefix="my" TagName="Sidebar" %>

<asp:Content ID="Title" ContentPlaceHolderID="TitlePlaceholder" runat="server">
    <asp:Label ID="PostTitle" runat="server">All Categories</asp:Label>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div id="breadcrumbs">
        <asp:SiteMapPath ID="BreadCrumbsServer" runat="server" PathSeparator=" » " />
    </div>
    <div id="left-area">
        <asp:ListView runat="server" ID="lvCategories"
            ItemType="EnvisionedBlog.Data.Models.Category"
            SelectMethod="lvCategories_GetData">
            <LayoutTemplate>
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
                                <a href="PostDetails.aspx?id=<%# Item.Id %>"><strong><%#: Item.Title %></strong> <i>by <%#: Item.Author.UserName %></i></a>
                            </li>
                        </ItemTemplate>
                        <EmptyDataTemplate>
                            No posts.
                        </EmptyDataTemplate>
                    </asp:ListView>
                </div>
            </ItemTemplate>
        </asp:ListView>
    </div>
    <my:sidebar runat="server" id="sidebar"></my:sidebar>
</asp:Content>
