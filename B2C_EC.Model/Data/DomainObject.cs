using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;

namespace B2C_EC.Model.Data
{
    public interface IDomainObject
    {
        //IDomain To();
        //void From(IDomain record);

        //IDomainDTO MapToDTO(Type dtoType);


    }
    public class DomainObject<T> : IDomainObject
    {

    }
}
