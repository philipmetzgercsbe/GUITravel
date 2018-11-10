using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using Gui_Travel.ClassRepository;

namespace Gui_Travel.CustomControls
{
    /// <summary>
    /// Interaction logic for adminControl.xaml
    /// </summary>
    public partial class adminControl : UserControl
    {
        public static M120Entities M120Entities = new M120Entities();
        public adminControl()
        {
            InitializeComponent();
        }

        private void loadHotelContent(object sender, MouseButtonEventArgs e)
        {
            this.TabIndex = 1;
            List<Hotel> allHotels = M120Entities.Hotels.ToList();
            HotelImageRepository imageRepository = new HotelImageRepository();
            foreach (var hotel in allHotels)
            {
                PurchaseForm purchaseForm = new PurchaseForm();
                purchaseForm.Name = hotel.Name;
                purchaseForm.HotelImage.Source = imageRepository.BitmapImageFromBytes(M120Entities.HotelBilds.Find(hotel)?.Bild);
                purchaseForm.Startdtpck.DisplayDate = DateTime.Now.Date;
                purchaseForm.Enddtdtpck.DisplayDate = DateTime.Now.Date;
                purchaseForm.HotelDescriptiontb.Text = "Email:" + hotel.Email + "Anzahl Zimmer: " + hotel.AnzahlZimmer.ToString("F") + "Manager: " + hotel.Manager + "Telefon: " +
                                                       hotel.Telefon + "Ort: " + hotel.Ort + "Website: " + hotel.Web;
                
                hotelGrid.Children.Add(purchaseForm);
            }

        }

        private void loadTravelContent(object sender, MouseButtonEventArgs e)
        {
            this.TabIndex = 2;
            List<Reise> Travels = M120Entities.Reises.ToList();
             ReiseRepository reiseRepository = new ReiseRepository();
            foreach (var travel in Travels)
            {
                PurchaseForm purchaseForm = new PurchaseForm();
                purchaseForm.Enddtdtpck.IsEnabled = false;
                purchaseForm.Startdtpck.SelectedDate = travel.Start;
                purchaseForm.Enddtdtpck.SelectedDate = travel.Ende;
                purchaseForm.HotelNameLbl.Content = reiseRepository.CountriesList.Find(x => x.LandID == travel.Land).Name;
                purchaseForm.Pricelbl.Content = travel.Preis;
                purchaseForm.HotelDescriptiontb.Text =
                    travel.Leitung ? "geleitet" : "ungeleitet" + travel.NameLeitung != "" ? travel.NameLeitung : "";
                travelGrid.Children.Add(purchaseForm);
            }
        }

        private void AddObject(object sender, RoutedEventArgs e)
        {
            Page AddPage = new Page();

            if (this.TabIndex == 1)
            {
                //Create AddHotel

                AddPage.Content = new AddHotel();

                
            }else if (this.TabIndex == 2)
            {
                //AddPage.Content = new AddTravel
            }
        }
    }
}
