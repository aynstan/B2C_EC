using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace B2C_EC.Model.Data
{
    public class ManufacturerRepo
    {
        B2C_ECEntities db = new B2C_ECEntities();
        public List<Manufacturer> GetAllManufacturer()
        {
            return db.Manufacturers.ToList();
        }
    }
}
