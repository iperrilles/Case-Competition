﻿<%@ Page Title="Archive" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Archive.aspx.cs" Inherits="CaseCompetitionApp.Archive" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
      <h2 class=" center gold">
       Competition Archive
     </h2>
    <h3 class="center">
        Access all previous competitions and results
    </h3>

    <hr />
     <asp:LoginView runat="server">     
         <RoleGroups>       
          <asp:RoleGroup Roles="admin">  
                <ContentTemplate>
                    <div class="row center">
                           <div class="col-md-12">
                         <a class="btn btn-default wide grey"  href="../AdminArchive">Edit Archives &raquo;</a>    
                             </div>
                     </div>
                     <hr />
                </ContentTemplate>        
         </asp:RoleGroup>   
         </RoleGroups>
     </asp:LoginView>


    <div class="row">
        <div class="col-md-12">
            <asp:GridView ID="gvCompete" runat="server" AutoGenerateColumns="False" DataSourceID="SqlCompetition" Width="100%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" DataKeyNames="CompetitionID">
                <Columns>
                    <asp:BoundField DataField="CompetitionName" HeaderText="Competition Name" SortExpression="CompetitionName" >
                    <ControlStyle CssClass="padding" />
                    <HeaderStyle CssClass="padding" />
                    <ItemStyle CssClass="padding" />
                    </asp:BoundField>
                    <asp:BoundField DataField="CompetitionDate" HeaderText="Competition Date" SortExpression="CompetitionDate" >
                        <ControlStyle CssClass="padding" />
                    <HeaderStyle CssClass="padding" />
                    <ItemStyle CssClass="padding" />
                    </asp:BoundField>
                    <asp:CommandField SelectText="View Details" ShowSelectButton="True" >
                        <ControlStyle CssClass="padding" />
                    <HeaderStyle CssClass="padding" />
                    <ItemStyle CssClass="padding" />
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
            <asp:SqlDataSource ID="SqlCompetition" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT CompetitionId, CompetitionName, FORMAT([CompetitionDate], 'MM/dd/yy') AS CompetitionDate FROM [Competition]"></asp:SqlDataSource>
        </div>
    </div>
    <br />
     <div class="row">
        <div class="col-md-12">
            <asp:GridView ID="gvJudge" runat="server" AutoGenerateColumns="False" DataSourceID="SqlJudge" Width="100%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black">
                <Columns>
                    <asp:BoundField DataField="JudgeName" HeaderText="Judge Name" SortExpression="JudgeName" >
                    <ControlStyle CssClass="padding" />
                    <HeaderStyle CssClass="padding" />
                    <ItemStyle CssClass="padding" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Company" HeaderText="Company" SortExpression="Company" >
                        <ControlStyle CssClass="padding" />
                    <HeaderStyle CssClass="padding" />
                    <ItemStyle CssClass="padding" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" >
                        <ControlStyle CssClass="padding" />
                    <HeaderStyle CssClass="padding" />
                    <ItemStyle CssClass="padding" />
                    </asp:BoundField>
                    <asp:HyperLinkField runat="server" DataNavigateUrlFields="CompanySite" DataTextField="CompanySite" target="_blank" HeaderText="Company Site" SortExpression="CompanySite" DataNavigateUrlFormatString="http://{0}" >
            <ControlStyle CssClass="padding" />
            <HeaderStyle CssClass="padding" />
            <ItemStyle CssClass="padding" />
            </asp:HyperLinkField>
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
            <asp:SqlDataSource ID="SqlJudge" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT concat([FirstName], ' ', [LastName]) AS JudgeName, [Company], [Email], [CompanySite] FROM [Judges] WHERE ([CompetitionID] = @CompetitionID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="gvCompete" DefaultValue="1" Name="CompetitionID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>
    <br />

    <div class="row">
        <div class="col-md-7"> 
            <asp:GridView ID="gvTeam" runat="server" Width="100%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" AutoGenerateColumns="False" DataSourceID="SqlTeam" DataKeyNames="TeamID">
                <Columns>
                    <asp:BoundField DataField="TeamName" HeaderText="Team Name" SortExpression="TeamName" >
                        <ControlStyle CssClass="padding" />
                    <HeaderStyle CssClass="padding" />
                    <ItemStyle CssClass="padding" />
                    </asp:BoundField>
                    <asp:BoundField DataField="School" HeaderText="School" SortExpression="School" >
                        <ControlStyle CssClass="padding" />
                    <HeaderStyle CssClass="padding" />
                    <ItemStyle CssClass="padding" />
                    </asp:BoundField>
                    <asp:CommandField SelectText="View Members" ShowSelectButton="True" >
                        <ControlStyle CssClass="padding" />
                    <HeaderStyle CssClass="padding" />
                    <ItemStyle CssClass="padding" />
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
            <asp:SqlDataSource ID="SqlTeam" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [TEAM] WHERE ([CompetitionID] = @CompetitionID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="gvCompete" DefaultValue="1" Name="CompetitionID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <div class="col-md-5">
            <asp:GridView ID="gvMembers" runat="server" AutoGenerateColumns="False" Width="100%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" DataSourceID="SQLMembers">
                <Columns>
                    <asp:BoundField DataField="Name" HeaderText="Competitor Name" SortExpression="Name" >
                        <ControlStyle CssClass="padding" />
                    <HeaderStyle CssClass="padding" />
                    <ItemStyle CssClass="padding" />
                    </asp:BoundField>
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
            <asp:SqlDataSource ID="SQLMembers" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT concat([FirstName], ' ', [LastName]) AS Name FROM [Members] WHERE ([TeamID] = @TeamID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="gvTeam" DefaultValue="1" Name="TeamID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        </div>
   

</asp:Content>