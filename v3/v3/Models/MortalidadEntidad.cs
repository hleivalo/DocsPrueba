using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace v3.Models
{
    public class MortalidadEntidad
    {
       
            [Key]
            public string Countrycode { get; set; }
            public string Longname { get; set; }
            public string Region { get; set; }
            public string Fec_year { get; set; }
            public string Value_tot_pb { get; set; }
            public string Tasa_mortalidad { get; set; }

        
    }
}