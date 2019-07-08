<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeBehind="Default.aspx.cs" Inherits="DXWebApplication1._Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">

    <div class="container">
        <dx:BootstrapGridView ID="gv" KeyFieldName="ID" AutoGenerateColumns="False" runat="server" DataSourceID="ads" OnRowUpdating="gv_RowUpdating">
            <SettingsDataSecurity AllowEdit="True" />
            <Columns>
                <dx:BootstrapGridViewCommandColumn VisibleIndex="0" ShowEditButton="True" ShowDeleteButton="true"></dx:BootstrapGridViewCommandColumn>
                <dx:BootstrapGridViewTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="1">
                    <SettingsEditForm Visible="False" />
                </dx:BootstrapGridViewTextColumn>
                <dx:BootstrapGridViewTextColumn FieldName="Trademark" VisibleIndex="2"></dx:BootstrapGridViewTextColumn>
                <dx:BootstrapGridViewTextColumn FieldName="Model" VisibleIndex="3"></dx:BootstrapGridViewTextColumn>
                <dx:BootstrapGridViewTextColumn FieldName="RtfContent" VisibleIndex="4" Visible="false">
                    <SettingsEditForm Visible="true" ColumnSpan="8" />
                    <EditItemTemplate>
                        <dx:BootstrapRichEdit Width="500" Settings-Views-ViewType="Simple" ID="re" runat="server" OnInit="re_Init" ShowConfirmOnLosingChanges="false"></dx:BootstrapRichEdit>
                    </EditItemTemplate>
                </dx:BootstrapGridViewTextColumn>
            </Columns>
        </dx:BootstrapGridView>
    </div>
    <asp:AccessDataSource ID="ads" runat="server" DataFile="~/App_Data/CarsDB.mdb" SelectCommand="SELECT [ID], [Trademark], [Model], [RtfContent] FROM [Cars]"
        UpdateCommand="UPDATE [Cars] SET [Trademark] = ?, [Model] = ?, [RtfContent] = ? WHERE [ID] = ?" DeleteCommand="DELETE FROM [Cars] WHERE [ID] = ?">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="Trademark" Type="String" />
            <asp:Parameter Name="Model" Type="String" />
            <asp:Parameter Name="RtfContent" Type="String" />
            <asp:Parameter Name="ID" Type="Int32" />
        </UpdateParameters>
    </asp:AccessDataSource>
</asp:Content>
