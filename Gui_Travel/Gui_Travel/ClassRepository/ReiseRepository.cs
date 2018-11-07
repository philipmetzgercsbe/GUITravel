using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Gui_Travel.ClassRepository
{
    class ReiseRepository
    {
        public static M120Entities M120Entities = new M120Entities();
        public static Reise Reise;
        public List<Land> CountriesList = new List<Land>();


        public void addTravel(string country, DateTime start, DateTime end, decimal price, bool staffed,
            string nameofstaff = "")
        {
            Reise = new Reise();
            SetAttributes(country, start, end, price, staffed, nameofstaff);
            M120Entities.SaveChanges();

        }

        private List<Land> getCountries()
        {
            return CountriesList = M120Entities.Lands.ToList();
            

        }

        public void editTravel(Reise reise,string country, DateTime start, DateTime end, decimal price, bool staffed,
            string nameofstaff = "")
        {
            Reise = M120Entities.Reises.Find(reise);
            SetAttributes(country, start, end, price, staffed, nameofstaff);
            M120Entities.SaveChanges();

        }

        private void SetAttributes(string country, DateTime start, DateTime end, decimal price, bool staffed,
            string nameofstaff)
        {
            Reise.Land = CountriesList.Find(x => x.Name == country).LandID;
            Reise.Start = start;
            Reise.Ende = end;
            Reise.Preis = price;
            Reise.Leitung = staffed;
            Reise.NameLeitung = nameofstaff;
            M120Entities.SaveChanges();
        }

        private void removeAll()
        {
            var Travels = M120Entities.Reises.ToList();

            foreach (var t in Travels)
            {
                M120Entities.Reises.Remove(t);
                M120Entities.SaveChanges();

            }
        }

        public void removeTravel(Reise travel)
        {
            M120Entities.Reises.Remove(travel);
            M120Entities.SaveChanges();
        }
    }
}
