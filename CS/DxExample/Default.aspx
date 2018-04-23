<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="DxExample.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">

        function OnToolbarItemClick(s, e) {
            switch (e.item.name) {
                case "nextPage":
                    s.NextPage();
                    break;
                case "previousPage":
                    s.PrevPage();
                    break;
            }
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <dx:ASPxGridView runat="server" ID="Grid" AutoGenerateColumns="False" ClientInstanceName="grid" KeyFieldName="ProductID"
                 DataSourceID="DataSource"
                 Width="80%">
                <ClientSideEvents ToolbarItemClick="OnToolbarItemClick" />
                <SettingsCustomizationDialog Enabled="true" />
                <SettingsBehavior AllowFocusedRow="true" />
                <SettingsExport EnableClientSideExportAPI="true"></SettingsExport>
                <Toolbars>
                    <dx:GridViewToolbar Name="Edit">
                        <Items>
                            <dx:GridViewToolbarItem Command="New" BeginGroup="true" GroupName="tttt"></dx:GridViewToolbarItem>
                            <dx:GridViewToolbarItem Command="Edit"></dx:GridViewToolbarItem>
                            <dx:GridViewToolbarItem Command="Delete"></dx:GridViewToolbarItem>
                            <dx:GridViewToolbarItem BeginGroup="true" ItemStyle-Width="100%">
                                <Template>
                                </Template>
                            </dx:GridViewToolbarItem>
                            <dx:GridViewToolbarItem Text="Export to" BeginGroup="true">
                                <Image IconID="actions_download_16x16office2013"></Image>
                                <Items>
                                    <dx:GridViewToolbarItem  Command="ExportToPdf" Text="PDF" Image-IconID="export_exporttopdf_16x16office2013" />
                                    <dx:GridViewToolbarItem  Command="ExportToXlsx" Text="XLSX" Image-IconID="export_exporttoxlsx_16x16office2013" />
                                    <dx:GridViewToolbarItem  Command="ExportToXls" Text="XLS" Image-IconID="export_exporttoxls_16x16office2013" />
                                </Items>
                            </dx:GridViewToolbarItem>
                            <dx:GridViewToolbarItem Command="Refresh" BeginGroup="true"></dx:GridViewToolbarItem>
                        </Items>
                    </dx:GridViewToolbar>
                    <dx:GridViewToolbar>
                        <Items>
                            <dx:GridViewToolbarItem BeginGroup="true" Command="Custom" Name="previousPage" ToolTip="Previous Page">
                                <Image IconID="navigation_backward_16x16"></Image>
                            </dx:GridViewToolbarItem>
                            <dx:GridViewToolbarItem Command="Custom" Name="nextPage" ToolTip="Next Page">
                                <Image IconID="navigation_forward_16x16"></Image>
                            </dx:GridViewToolbarItem>
                            <dx:GridViewToolbarItem Command="ShowCustomizationDialog" Text="Show Customization Dialog"></dx:GridViewToolbarItem>
                            <dx:GridViewToolbarItem BeginGroup="true" ItemStyle-Width="100%">
                                <Template>
                                </Template>
                            </dx:GridViewToolbarItem>
                            <dx:GridViewToolbarItem Command="ClearFilter" BeginGroup="true"></dx:GridViewToolbarItem>
                            <dx:GridViewToolbarItem Command="ShowFilterEditor" Text="Add filter"></dx:GridViewToolbarItem>

                            <dx:GridViewToolbarItem Text="Settings">
                                <Items>
                                    <dx:GridViewToolbarItem Command="ShowFilterRow" Text="Show Filter Row"></dx:GridViewToolbarItem>
                                    <dx:GridViewToolbarItem Command="ShowFilterRowMenu" Text="Show Filter Row Menu"></dx:GridViewToolbarItem>
                                    <dx:GridViewToolbarItem Command="ShowFooter" Text="Show Footer"></dx:GridViewToolbarItem>
                                    <dx:GridViewToolbarItem Command="ShowGroupPanel" Checked="false" Text="Show Group Panel"></dx:GridViewToolbarItem>
                                    <dx:GridViewToolbarItem Command="ShowSearchPanel" Text="Show Search Panel"></dx:GridViewToolbarItem>
                                </Items>
                            </dx:GridViewToolbarItem>
                        </Items>
                    </dx:GridViewToolbar>
                </Toolbars>
                <TotalSummary>
                    <dx:ASPxSummaryItem FieldName="UnitsInStock" SummaryType="Sum" />
                </TotalSummary>
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="ProductID" VisibleIndex="0">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="ProductName" VisibleIndex="1">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="QuantityPerUnit" VisibleIndex="3">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="UnitPrice" VisibleIndex="4">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="UnitsInStock" VisibleIndex="5">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataCheckColumn FieldName="Discontinued" VisibleIndex="7">
                    </dx:GridViewDataCheckColumn>
                </Columns>
            </dx:ASPxGridView>
            <dx:ASPxGridViewExporter ID="Exporter" GridViewID="Grid" runat="server" />
            <asp:AccessDataSource runat="server" ID="DataSource" DataFile="~/App_Data/nwind.mdb"
                SelectCommand="SELECT [ProductID], [ProductName], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [Discontinued] FROM [Products]"
                DeleteCommand="DELETE FROM Products WHERE ProductID=@ProductID;"
                UpdateCommand="UPDATE Products SET ProductName = @ProductName, QuantityPerUnit = @QuantityPerUnit, UnitPrice=@UnitPrice, UnitsInStock=@UnitsInStock, Discontinued=@Discontinued 
WHERE ProductID=@ProductID"
                InsertCommand="INSERT INTO Products (ProductName, QuantityPerUnit, UnitPrice, UnitsInStock, Discontinued) VALUES (@ProductName, @QuantityPerUnit, @UnitPrice, @UnitsInStock, @Discontinued)">
                <UpdateParameters>
                    <asp:Parameter Name="ProductName" />
                    <asp:Parameter Name="QuantityPerUnit" />
                    <asp:Parameter Name="UnitPrice" />
                    <asp:Parameter Name="UnitsInStock" />
                    <asp:Parameter Name="Discontinued" />
                    <asp:Parameter Name="ProductID" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="ProductName" />
                    <asp:Parameter Name="QuantityPerUnit" />
                    <asp:Parameter Name="UnitPrice" />
                    <asp:Parameter Name="UnitsInStock" />
                    <asp:Parameter Name="Discontinued" />
                    <asp:Parameter Name="ProductID" />
                </InsertParameters>
                <DeleteParameters>
                    <asp:Parameter Name="ProductID" />
                </DeleteParameters>
            </asp:AccessDataSource>
        </div>
    </form>
</body>
</html>
