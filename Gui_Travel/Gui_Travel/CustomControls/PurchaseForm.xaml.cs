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
                Pricelbl.Content =  m120Entities.Hotels.Find(HotelNameLbl.Content).TagesPreis * diff ;
            }

            
        }
    }
}
