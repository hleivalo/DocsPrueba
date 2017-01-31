using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Oracle.ManagedDataAccess.Client;
using v3.Models;
using System.Data;

namespace v3.Utilities
{
    //dataAccess creado para utilizar el ORM Dapper para comunicar los objetos de la BD con .NET
    public class function
    {
        
        

            public static List<NatalidadEntidad> DatosNatalidad(string pCountry, string pYear)
            {
                var p = new OracleDynamicParameters();

                p.Add("P_COD_COUNTRY", pCountry);  //parametro entrada codigo pais
                p.Add("P_YEAR", pYear);  // parametro entrada año yyyy
                p.Add("P_CUR_NAT_PAIS", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);

                var vNatalidad = new List<NatalidadEntidad>();

                try
                {
                    using (Dapper.SqlMapper.GridReader gr = DB.GetMultiGrid("HLEIVA.PKG_DATA_DEMOGRAF.SP_OBT_NAT_PAIS", p))
                    {
                        vNatalidad = gr.Read<NatalidadEntidad>().ToList<NatalidadEntidad>();
                    }
                }
                catch (InvalidCastException e)
                {
                    throw e;
                }
                return vNatalidad;

            }

            public static List<MortalidadEntidad> DatosMortalidad(string pCountry, string pYear)
            {
                var p = new OracleDynamicParameters();

                p.Add("P_COD_COUNTRY", pCountry);  //parametro entrada codigo pais
                p.Add("P_YEAR", pYear);  // parametro entrada año yyyy
                p.Add("P_CUR_MORT_PAIS", dbType: OracleDbType.RefCursor, direction: ParameterDirection.Output);

                var vMortalidad = new List<MortalidadEntidad>();

                try
                {
                    using (Dapper.SqlMapper.GridReader gr = DB.GetMultiGrid("HLEIVA.PKG_DATA_DEMOGRAF.SP_OBT_MORT_PAIS", p))
                    {
                        vMortalidad = gr.Read<MortalidadEntidad>().ToList<MortalidadEntidad>();
                    }
                }
                catch (InvalidCastException e)
                {
                    throw e;
                }
                return vMortalidad;

            }

        }
    
}