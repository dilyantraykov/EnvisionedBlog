<%@ Page Title="Post Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PostDetails.aspx.cs" Inherits="EnvisionedBlog.Web.PostDetails" %>

<%@ Register Src="~/Controls/Sidebar.ascx" TagPrefix="my" TagName="Sidebar" %>

<asp:Content ID="Title" ContentPlaceHolderID="TitlePlaceholder" runat="server">
    <asp:Label ID="PostTitle" runat="server"></asp:Label>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div id="breadcrumbs">
            <asp:SiteMapPath ID="BreadCrumbsServer" runat="server" PathSeparator=" » " />
        </div>
        <div id="left-area">
            <asp:ListView runat="server" ID="fvDetails"
                ItemType="EnvisionedBlog.Data.Models.Post"
                SelectMethod="fvDetails_GetItem">
                <LayoutTemplate>
                    <div id="itemPlaceholder" runat="server"></div>
                </LayoutTemplate>
                <ItemTemplate>
                    <div class="post entry u-cf">
                        <p class="meta-info">Posted  by <a href="/ViewAuthor.aspx?id=<%# Item.Author.Id %>" title="Posts by <%# Item.Author.UserName %>" rel="author"><%# Item.Author.UserName %></a> on <%# Item.DateCreated %> in <a href="#" rel="category tag"><%# Item.Category.Name %></a> | <%# Item.Comments.Count %> Comments</p>
                        <div class="post-thumbnail">
                            <a href="#">
                                <img src="<%# Item.ImageUrl %>" class="post-thumb">
                                <span class="post-overlay"></span>
                            </a>
                        </div>

                        <p><%# Item.Content %></p>
                    </div>

                    <div id="comment-wrap">
                        <h3 id="comments"><%# Item.Comments.Count %> Comments</h3>
                        <ol class="commentlist">
                            <asp:Repeater ItemType="EnvisionedBlog.Data.Models.Comment" DataSource="<%# Item.Comments %>" runat="server">
                                <ItemTemplate>
                                    <li class="comment">
                                        <div class="comment-body u-cf">
                                            <div class="avatar-container">
                                                <div class="avatar-box">
                                                    <img alt="<%# Item.Author.UserName %>" src="<%# Item.Author.Avatar %>" srcset="<%# Item.Author.Avatar %>" class="avatar avatar-56 photo" height="56" width="56">
                                                    <span class="avatar-overlay"></span>
                                                </div>
                                                <!-- end .avatar-box -->
                                                <span class="comment-date"><%# Item.PublishDate.ToShortDateString() %></span>
                                            </div>
                                            <div class="comment-container">
                                                <div class="comment-wrap u-cf">
                                                    <div class="comment-meta commentmetadata"><span><%# Item.Author.UserName %></span> says: </div>
                                                    <div class="comment-content">
                                                        <p><%# Item.Message %></p>
                                                    </div>
                                                    <div class="reply-container"><a rel="nofollow" class="comment-reply-link" href="http://www.elegantthemes.com/preview/Envisioned/2008/09/05/ut-sagittis-ultrices-urna-eget-erat-non-purus-varius/?replytocom=268#respond" onclick="return addComment.moveForm( &quot;comment-268&quot;, &quot;268&quot;, &quot;respond&quot;, &quot;141&quot; )" aria-label="Reply to <%# Item.Author.UserName %>">Reply</a></div>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ol>
                    </div>
                </ItemTemplate>
            </asp:ListView>
        </div>
        <my:Sidebar runat="server" ID="sidebar"></my:Sidebar>
    </div>
</asp:Content>
