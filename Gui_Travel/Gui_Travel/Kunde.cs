//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Gui_Travel
{
    using System;
    using System.Collections.Generic;
    
    public partial class Kunde
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Kunde()
        {
            this.Kunde_Reise = new HashSet<Kunde_Reise>();
        }
    
        public long KundeID { get; set; }
        public string Anrede { get; set; }
        public string Vorname { get; set; }
        public string Name { get; set; }
        public string NameZusatz { get; set; }
        public string StrasseNr { get; set; }
        public short PLZ { get; set; }
        public string Ort { get; set; }
        public string Telefon { get; set; }
        public string Mobile { get; set; }
        public string Email { get; set; }
        public string Web { get; set; }
        public System.DateTime Geburtsdatum { get; set; }
        public string PassNr { get; set; }
        public long Nationalitaet { get; set; }
        public long UserFK { get; set; }
    
        public virtual Land Land { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Kunde_Reise> Kunde_Reise { get; set; }
    }
}
