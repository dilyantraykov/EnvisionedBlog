<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Sidebar.ascx.cs" Inherits="EnvisionedBlog.Web.Sidebar" %>

<div id="sidebar">
    <h4 class="widget-title">Recent Posts</h4>
    <div class="widget">
        <asp:ListView ID="lastPosts" runat="server" DataKeyNames="Id"
            ItemType="EnvisionedBlog.Data.Models.Post" SelectMethod="lastPosts_GetData">
            <LayoutTemplate>
                <ul>
                    <li id="itemPlaceholder" runat="server"></li>
                </ul>
            </LayoutTemplate>
            <ItemTemplate>
                <li><a href="/PostDetails.aspx?id=<%#: Item.Id %>"><%#: Item.Title %></a></li>
            </ItemTemplate>
        </asp:ListView>
    </div>
    <h4 class="widget-title">About Us</h4>
    <div class="widget">
        <p>Maecenas ac nunc purus, et aliquam urna. Curabitur quis tellus vitae dolor tristique egestas. Fusce metus sem, accumsan vel auctor non, laoreet eget nulla. Donec lacinia elit ac nulla hendrerit at tincidunt justo facilisis. Praesent vel risus ut urna vestibulum fermentum. Pellentesque sollicitudin cursus blandit. In hac habitasse platea dictumst. Maecenas sed nulla sed lacus elementum dapibus. Praesent hendrerit semper tempor.</p>
    </div>
</div>
</div>
