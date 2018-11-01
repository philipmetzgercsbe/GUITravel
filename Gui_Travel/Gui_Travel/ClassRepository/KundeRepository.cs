using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace Gui_Travel.ClassRepository
{
    class KundeRepository
    {
        public enum Anrede
        {
            Herr,Dame
        }
        // TODO: Change addUser/edituser to reflect new Db structure 
        //TODO: Implement pw hash --> store in Dictionary<GUIUser,Hash>
        public static Kunde kunde; 
        public static M120Entities M120Entities;
        public GUIUserRepository User = new GUIUserRepository();
        private List<Land> CountryList = new List<Land>();

        public void addKunde(Anrede anrede, string firstname, string secondname, string lastname, string streetNr,
            short plz, string place, string phone, string mobile, string email, DateTime birthDate,
            string passNr, string nationality, string username, string password)
        {
            kunde = new Kunde();
            getCountries();
            setAttributes(anrede, firstname, secondname, lastname, streetNr, plz, place, phone, mobile, email, birthDate, passNr, nationality);
            User.addUser(username,password);
            M120Entities.Kundes.Add(kunde);
            M120Entities.SaveChanges();
        }

        private void setAttributes( Anrede anrede, string firstname, string secondname, string lastname, string streetNr,
            short plz, string place, string phone, string mobile, string email, DateTime birthDate, string passNr,
            string nationality, Kunde kunde = null)
        {
            kunde.Anrede = anrede.ToString();
            kunde.Vorname = firstname;
            kunde.NameZusatz = secondname;
            kunde.Name = lastname;
            kunde.StrasseNr = streetNr;
            kunde.PLZ = plz;
            kunde.Ort = place;
            kunde.Telefon = phone;
            kunde.Mobile = mobile;
            kunde.Email = email;
            kunde.Geburtsdatum = birthDate;
            kunde.PassNr = passNr;
            kunde.Nationalitaet = CountryList.Find(x => x.Name == nationality).LandID;
        }


        private void getCountries()
        {
            CountryList = M120Entities.Lands.ToList();

        }

        public void removeKunde(Kunde Kunde)
        {
            M120Entities.Kundes.Remove(Kunde);
        }

        public Kunde GetKunde(Kunde kunde)
        {
           return M120Entities.Kundes.Find(kunde);
        }

        public void editKunde(Kunde kunde,Anrede anrede, string firstname, string secondname, string lastname, string streetNr,
            short plz, string place, string phone, string mobile, string email, DateTime birthDate,
            string passNr, string nationality,string username, string password)
        {
            kunde = M120Entities.Kundes.Find(kunde);
            setAttributes(anrede, firstname, secondname, lastname, streetNr, plz, place, phone, mobile, email, birthDate, passNr, nationality,kunde);
            User.editUser(username,password);
            M120Entities.SaveChanges();

        }
    }
}
