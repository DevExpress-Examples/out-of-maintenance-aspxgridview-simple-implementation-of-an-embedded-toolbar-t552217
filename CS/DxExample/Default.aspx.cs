using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DxExample {
    public partial class Default : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {

        }

        protected void Grid_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e) {
            switch (e.Item.Name) {
                case "ExportToPDF":
                    Exporter.WritePdfToResponse();
                    break;
                case "ExportToXLS":
                    Exporter.WriteXlsToResponse();
                    break;
                case "ExportToXLSX":
                    Exporter.WriteXlsxToResponse();
                    break;
                default:
                    break;
            }
        }

        protected void Grid_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e) {
            throw new Exception("CRUD opeartions are not supported");
        }

        protected void Grid_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e) {
            throw new Exception("CRUD opeartions are not supported");
        }

        protected void Grid_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e) {
            throw new Exception("CRUD opeartions are not supported");
        }
    }
}