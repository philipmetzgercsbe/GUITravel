using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace Gui_Travel.ClassRepository
{
    class HotelRepository
    {
       
        M120Entities m120Entities = new M120Entities();
        public static Hotel Hotel;
        public List<Land> CountryList = new List<Land>();
        private HotelImageRepository hotelImageControl = new HotelImageRepository();
        
       
        public void addHotel(string name, string ort, string land, double rating, string manager, short rooms,
            decimal priceperDay, string phone, string email, string website, HotelBild hotelImage, string description)
        {
            Hotel = new Hotel();
            setAttributes(name, ort, land, manager, rooms, priceperDay, phone, email, website);
            m120Entities.Hotels.Add(Hotel);
            hotelImageControl.addImage(hotelImageControl.ByteArraytoImage(hotelImage.Bild),description);
            m120Entities.SaveChanges();


        }

        private void setAttributes(string name, string ort, string land, string manager, short rooms, decimal priceperDay,
            string phone, string email, string website, Hotel hotel = null)
        {
            if (hotel != null)
            {
                Hotel = hotel;
            }
            Hotel.Name = name;
            Hotel.Ort = ort;
            Hotel.Land = CountryList.Find(x => x.Name == land).LandID;
            Hotel.Manager = manager;
            Hotel.AnzahlZimmer = rooms;
            Hotel.TagesPreis = priceperDay;
            Hotel.Telefon = phone;
            Hotel.Email = email;
            Hotel.Web = website;
        }

        public void deleteHotel(Hotel hotel)
        {
            
            m120Entities.Hotels.Remove(hotel);
            m120Entities.SaveChanges();
            
        }

        public Hotel getHotel(Hotel hotel)
        {
            return m120Entities.Hotels.Find(hotel.Name);
        }

        private void getCountries()
        {
            CountryList = m120Entities.Lands.ToList();
           
        }

        public void editHotel(Hotel hotel,string name, string ort, string land, string manager, short rooms, decimal priceperDay,
            string phone, string email, string website)
        {
            Hotel = getHotel(hotel);
            setAttributes(name, ort,land, manager, rooms, priceperDay, phone, email, website, hotel);
            m120Entities.SaveChanges();
        }

        public void removeAll()
        {
            var Hotels = m120Entities.Hotels.ToList();

            foreach (var h in Hotels)
            {
                m120Entities.Hotels.Remove(h);

            }

        }
       
    }
}
