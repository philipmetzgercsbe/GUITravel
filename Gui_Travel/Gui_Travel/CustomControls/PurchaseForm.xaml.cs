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
    /// Interaction logic for PurchaseForm.xaml
    /// </summary>
    public partial class PurchaseForm : UserControl
    {
        private static M120Entities m120Entities = new M120Entities();
        public PurchaseForm()
        {
            InitializeComponent();
        }

        private void CalculatePrice(object sender, SelectionChangedEventArgs e)
        {
            if (Startdtpck.SelectedDate <= Enddtdtpck.SelectedDate)
            {
                int diff = (Enddtdtpck.SelectedDate.Value - Startdtpck.SelectedDate.Value).Days;
                if (m120Entities.Hotels != null)
                    Pricelbl.Content = m120Entities.Hotels.Find(HotelNameLbl.Content).TagesPreis * diff;
            }

            if (Startdtpck.SelectedDate.Value.AddDays(1) == Enddtdtpck.SelectedDate.Value)
            {
                Pricelbl.Content = m120Entities.Hotels.Find(HotelNameLbl.Content).TagesPreis;
            }

        }

        private void UsedAt(UIElement form)
        {
           
//            if (form.Equals(this.Parent.GetValue(tabControl )))
//            {
//                
//            }
        }

        private void DeleteForm(object sender, RoutedEventArgs e)
        {
            M120Entities m120Entities = new M120Entities();
            if (this.Name.StartsWith("Travel"))
            {
                ReiseRepository reiseRepository = new ReiseRepository();
                Reise reisetodelete = m120Entities.Reises.Find(this.Name);
                reiseRepository.removeTravel(m120Entities.Reises.Find(reisetodelete));

            } else if (this.Name.Contains("Hotel"))
            {
                HotelRepository hotelRepository = new HotelRepository();
                Hotel hoteltodelete = m120Entities.Hotels.Find(HotelNameLbl.Content);
                hotelRepository.deleteHotel(hoteltodelete);
            }
            
        }
    }
}
