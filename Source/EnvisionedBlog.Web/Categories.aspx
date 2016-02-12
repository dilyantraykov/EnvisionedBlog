<%@ Page Title="Categories" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Categories.aspx.cs" Inherits="EnvisionedBlog.Web.Categories" %>

<%@ Register Src="~/Controls/Sidebar.ascx" TagPrefix="my" TagName="Sidebar" %>

<asp:Content ID="Title" ContentPlaceHolderID="TitlePlaceholder" runat="server">
    <asp:Label ID="PostTitle" runat="server">All Categories</asp:Label>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div id="breadcrumbs">
            <asp:SiteMapPath ID="BreadCrumbsServer" runat="server" PathSeparator=" » " />
        </div>
        <div id="left-area">
            <asp:ListView runat="server" ID="lvCategories"
                ItemType="EnvisionedBlog.Data.Models.Category"
                SelectMethod="lvCategories_GetData"
                GroupItemCount="3">
                <LayoutTemplate>
                    <div runat="server" id="groupPlaceholder">
                    </div>
                </LayoutTemplate>
                <GroupTemplate>
                    <div class="row category-row">
                        <div runat="server" id="itemPlaceholder"></div>
                    </div>
                </GroupTemplate>
                <ItemTemplate>
                    <div class="one-third column">
                        <h4 class="title"><%#: Item.Name %></h4>
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
        <my:Sidebar runat="server" ID="sidebar"></my:Sidebar>
    </div>
</asp:Content>
