using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Controls;
using System.Windows.Input;


namespace Gui_Travel.CustomControls
{
    /// <summary>
    /// Interaction logic for tabControl.xaml
    /// </summary>
    public partial class tabControl : UserControl
    {
        public tabControl()
        {
            InitializeComponent();
            
        }

        private void LoadUserContent(object sender, MouseButtonEventArgs e)
        {
            UserInformation userInformation = new UserInformation();
            this.AddChild(userInformation);
           
        }

        private void LoadHotels(object sender, MouseButtonEventArgs e)
        {
            M120Entities m120Entities = new M120Entities();
            List<Hotel> hotels =  m120Entities.Hotels.ToList();

            foreach (var hotel in hotels)
            {
                PurchaseForm purchaseForm = new PurchaseForm();
                purchaseForm.HotelImage = m120Entities.HotelBilds.Find(hotel.HotelID).Bild;
                purchaseForm.Startdtpck.DisplayDate = DateTime.Now.Date;
                purchaseForm.Enddtdtpck.DisplayDate = DateTime.Now.Date;
                purchaseForm.HotelDescriptiontb.Text = hotel.Email + hotel.AnzahlZimmer.ToString("F") + hotel.Manager +
                                                       hotel.Telefon + hotel.Ort + hotel.Web;
                HotelStackPanel.Children.Add(purchaseForm);
                //Load Data into CustomControl
                //Load all CustomControls into Panel
            }
           
            
        }

        private void LoadTravels(object sender, MouseButtonEventArgs e)
        {
            M120Entities m120Entities = new M120Entities();
            List<Reise> travels = m120Entities.Reises.ToList();

            foreach (var travel in travels)
            {
                travel.Start = m120Entities.Reises.Find(travel).Start;
                
                //Load into same CustomControl as hotels 
                //Do the same step again
            }
        }
    }
}
