﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_Security_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="row jumbotron">
        <h1>User and Role Administration</h1>
    </div>

    <div class="row">
        <div class="col-md-12">
            <!-- Nav tabs -->
            <ul class="nav nav-tabs">
                <li class="active"><a href="#users" data-toggle="tab">Users</a></li>
                <li><a href="#roles" data-toggle="tab">Roles</a></li>
                <li><a href="#unregistered" data-toggle="tab">Unregistered Users</a></li>
            </ul>
            <!-- tab content area -->
            <div class="tab-content">
                <!-- user tab-->
                <div class="tab-pane fade in active" id="users">
                    <h1>Users</h1>
                </div> <%--eop--%>
                <!-- role tab-->
                <div class="tab-pane fade" id="roles">
                    <%-- DataKeyNames contains the considered pkey field of the class that is being used in Insert, Update or Delete
                        
                        RefreshAll will call a generic method in my code behind that will cause the ODS sets to re-bind their data --%>

                    <asp:ListView ID="RoleListView" runat="server" 
                        DataSourceID="RoleListViewODS" ItemType="ChinookSystem.Security.RoleProfile" 
                        InsertItemPosition="LastItem" DataKeyNames="RoleId"
                        OnItemInserted="RefreshAll"
                        OnItemDeleted="RefreshAll"
                        >
                        <EmptyDataTemplate>
                            <span>No security roles have been set up.</span>
                        </EmptyDataTemplate>
                        <LayoutTemplate>
                        <div class="row bginfo">
                            <div class="col-sm-3 h4">Action</div>
                            <div class="col-sm-3 h4">RoleName</div>
                            <div class="col-sm-6 h4">Users</div>
                        </div>
                            <div class="row" id="itemPlaceHolder" runat="server">

                            </div>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <div class="row">
                                <div class="col-sm-3">
                                    <asp:LinkButton ID="RemoveRole" runat="server" CommandName="Delete">Remove</asp:LinkButton>
                                </div>
                                <div class="col-sm-3">
                                    <%# Item.RoleName %>
                                </div>
                                <div class="col-sm-6">
                                    <asp:Repeater ID="RoleUsers" runat="server" DataSource="<%#Item.UserNames %>" ItemType="System.String">
                                        <ItemTemplate>
                                            <%# Item %>
                                        </ItemTemplate>
                                        <SeparatorTemplate>, </SeparatorTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>
                        </ItemTemplate>
                        <InsertItemTemplate>
                            <div class="row">
                                <div class="col-sm-3">
                                    <asp:LinkButton ID="InsertRole" runat="server" CommandName="Insert">Insert</asp:LinkButton>
                                    <asp:LinkButton ID="Cancel" runat="server">Cancel</asp:LinkButton>
                                </div>
                                <div class="col-sm-3">
                                    <asp:TextBox ID="RoleName" runat="server" Text='<%# BindItem.RoleName %>' placeholder="Role Name"></asp:TextBox>
                                </div>
                            </div>
                        </InsertItemTemplate>
                    </asp:ListView>
                    <asp:ObjectDataSource ID="RoleListViewODS" runat="server" DataObjectTypeName="ChinookSystem.Security.RoleProfile" DeleteMethod="RemoveRole" InsertMethod="AddRole" OldValuesParameterFormatString="original_{0}" SelectMethod="ListAllRoles" TypeName="ChinookSystem.Security.RoleManager">
                    </asp:ObjectDataSource>
                </div> <%--eop--%>
                <!-- unregistered user tab-->
                <div class="tab-pane fade" id="unregistered">
                    <h1>Unregistered</h1>
                </div> <%--eop--%>
            </div>
        </div>
    </div>
</asp:Content>

