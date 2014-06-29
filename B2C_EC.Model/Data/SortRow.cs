using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;
using B2C_EC.Model.Global;

namespace B2C_EC.Model.Data
{
    public class SortRow
    {
        private B2C_ECEntities db = new B2C_ECEntities();

        public void Down(string tableName, string idName, string filterName, int rowId)
        {
            db.SortRow(tableName, idName, filterName, rowId, -1);
        }

        public void Up(string tableName, string idName, string filterName, int rowId)
        {
            db.SortRow(tableName, idName, filterName, rowId, 1);
        }
    }
}
