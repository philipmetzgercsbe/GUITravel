using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using System.Windows.Media;
using Gui_Travel.ClassRepository;


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

//        private void AddAdminTools()
//        {
//
//            //if you're the Admin show the Settings button which loads CRUD for travels and Hotel 
//            if ()
//            {
//                //
//                //Hotel --> hotelimage --> imagedesc --> hotelname --> price desc etc
//                //Travels same as above and instead of hotelImage Hotel
//                //
//            }
//        }

        private void LoadUserContent(object sender, MouseButtonEventArgs e)
        {
            UserInformation userInformation = new UserInformation();
            UserInformationGrid.Children.Add(userInformation);
           
        }

        private void LoadHotels(object sender, MouseButtonEventArgs e)
        {
            M120Entities m120Entities = new M120Entities();
            HotelImageRepository HotelImageRepo = new HotelImageRepository();
            List<Hotel> hotels =  m120Entities.Hotels.ToList();

            foreach (var hotel in hotels)
            {
                PurchaseForm purchaseForm = new PurchaseForm();
                purchaseForm.Name = hotel.Name;
                purchaseForm.HotelImage.Source = HotelImageRepo.BitmapImageFromBytes(m120Entities.HotelBilds.Find(hotel)?.Bild);
                purchaseForm.Startdtpck.DisplayDate = DateTime.Now.Date;
                purchaseForm.Enddtdtpck.DisplayDate = DateTime.Now.Date;
                purchaseForm.HotelDescriptiontb.Text = "Email:" + hotel.Email + "Anzahl Zimmer: " + hotel.AnzahlZimmer.ToString("F") +"Manager: " + hotel.Manager + "Telefon: " +
                                                       hotel.Telefon + "Ort: " + hotel.Ort +"Website: "  + hotel.Web;
                HotelStackPanel.Children.Add(purchaseForm);
                //Load Data into CustomControl
                //Load all CustomControls into Panel
            }
           
            
        }

        private void LoadTravels(object sender, MouseButtonEventArgs e)
        {
            M120Entities m120Entities = new M120Entities();
            List<Reise> travels = m120Entities.Reises.ToList();
            ReiseRepository reiseRepository = new ReiseRepository();
            foreach (var travel in travels)
            {
               
                
                PurchaseForm purchaseForm = new PurchaseForm();
                purchaseForm.Enddtdtpck.IsEnabled = false;
                purchaseForm.Startdtpck.SelectedDate = travel.Start;
                purchaseForm.Enddtdtpck.SelectedDate = travel.Ende;
                purchaseForm.HotelNameLbl.Content = reiseRepository.CountriesList.Find(x => x.LandID == travel.Land).Name;
                purchaseForm.Pricelbl.Content = travel.Preis;
                purchaseForm.HotelDescriptiontb.Text = 
                    travel.Leitung?"geleitet":"ungeleitet" + travel.NameLeitung != "" ? travel.NameLeitung : ""; 
                TravelsStackPanel.Children.Add(purchaseForm);
                //Load into same CustomControl as hotels 
                //Do the same step again
            }
        }


        private void changeBackground(object sender, MouseEventArgs e)
        {
            this.Background = new SolidColorBrush(Colors.Blue);
           
        }
    }
}
