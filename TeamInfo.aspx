﻿<%@ Page Title="Team Information" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TeamInfo.aspx.cs" Inherits="CaseCompetitionApp.TeamInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="center gold"><%: Title %></h2>
    <h3 class="center">
        View Team Information for the CyHawk Case Competition 2020
    </h3>
    <div class="row col-md-12">
        <hr />
    </div>

    <div id="empty" runat="server" class="center">
      <asp:Label ID="lblEmpty" Font-Size="X-Large" runat="server" Text="No Current Competition is available at this time. Please check back later."></asp:Label>
    </div>

    <div class="row" >
    <div class="col-md-7">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="95%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" DataKeyNames="TeamID">
            <Columns>
                <asp:BoundField DataField="TeamName" HeaderText="Team Name" SortExpression="TeamName" >
                    <ControlStyle CssClass="center" />
                <HeaderStyle CssClass="center" />
                <ItemStyle CssClass="center" />
                </asp:BoundField>
                <asp:BoundField DataField="Timeslots" HeaderText="Time Slot" SortExpression="Timeslots" >
                 <ControlStyle CssClass="center" />
                <HeaderStyle CssClass="center" />
                <ItemStyle CssClass="center" />
                    </asp:BoundField>
                <asp:BoundField DataField="RoomNumber" HeaderText="Room Number" SortExpression="RoomNumber" >
                    <ControlStyle CssClass="center" />
                <HeaderStyle CssClass="center" />
                <ItemStyle CssClass="center" />
                    </asp:BoundField>
                <asp:CommandField HeaderText="View Members" SelectText="View Members" ShowSelectButton="True" >
                     <ControlStyle CssClass="center" />
                <HeaderStyle CssClass="center" />
                <ItemStyle CssClass="center" />
                    </asp:CommandField>
            </Columns>
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#FFDF00" Font-Bold="True" ForeColor="Black" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#242121" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT TeamID, TeamName, FORMAT([Timeslots], 'hh:mm tt') AS Timeslots, RoomNumber FROM [TEAM] WHERE CompetitionID IS NULL ORDER BY Timeslots"></asp:SqlDataSource>
    </div>
    <div class="col-md-5">
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="MemberID" DataSourceID="SqlDataSource2" Width="95%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
            <Columns>
                <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" >
                    <ControlStyle CssClass="center" />
                <HeaderStyle CssClass="center" />
                <ItemStyle CssClass="center" />
                </asp:BoundField>
                <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" >
                    <ControlStyle CssClass="center" />
                <HeaderStyle CssClass="center" />
                <ItemStyle CssClass="center" />
                </asp:BoundField>

            </Columns>
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#242121" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Members] WHERE ([TeamID] = @TeamID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="TeamID" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</div>
  
</asp:Content>
