using DataObjects.EmployeModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.Controls
{
    public partial class StrongTypes : System.Web.UI.Page
    {
        static List<Emp> obj = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();

            }
        }

        private List<Emp> BindData()
        {
            obj = new List<Emp>() 
            {
                new Emp(){ID="1",Name="Tanveer",Sal=2000},                
                new Emp(){ID="2",Name="Aanveer",Sal=22000},
                new Emp(){ID="3",Name="Ranveer",Sal=20700},
                new Emp(){ID="7",Name="veer",Sal=20000},
            };

            return obj;
            //GridView1.DataSource = obj;
            //GridView1.DataBind();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable<DataObjects.EmployeModel.Emp> GridView1_GetData()
        {
            return obj.AsQueryable();
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void GridView1_UpdateItem(string id)
        {
            Emp item = new Emp();
            item = obj.Find(o => o.ID == id);
            // Load the item here, e.g. item = MyDataLayer.Find(id);
            if (item == null)
            {
                // The item wasn't found
                ModelState.AddModelError("Error", String.Format("Item with id {0} was not found", id));
                return;
            }
            TryUpdateModel(item);
            if (ModelState.IsValid)
            {
                // Save changes here, e.g. MyDataLayer.SaveChanges();

            }
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void GridView1_DeleteItem(String id)
        {
          var removemp=  obj.Find(o => o.ID == id);
          obj.Remove(removemp);
        }


    }
}