using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
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
    }
}
