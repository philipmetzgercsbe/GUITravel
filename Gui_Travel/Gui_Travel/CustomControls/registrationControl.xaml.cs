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

namespace Gui_Travel
{
    /// <summary>
    /// Interaction logic for registrationControl.xaml
    /// </summary>
    public partial class registrationControl : UserControl
    {
        public registrationControl()
        {
            InitializeComponent();
        }

        private void Register(object sender, RoutedEventArgs e)
        {
            
            KundeRepository kundeRepository = new KundeRepository();
            
            string userSalutation = Enum.GetName(typeof(KundeRepository.Anrede), SalutationComboBox.SelectedValue);

            Enum.TryParse<KundeRepository.Anrede>(userSalutation, out var mySalutation);
            kundeRepository.addKunde(mySalutation,FirstnameTxtbox.Text,SecondnameTxtbox.Text,LastnameTxtbox.Text, SteetNrTxtbox.Text,Convert.ToInt16(ZIPTxtbox.Text),PlaceTxtbox.Text,PhoneTxtbox.Text,MobileTxtbox.Text,EmailTxtbox.Text,(DateTime) BirthdateDtPck.SelectedDate,PassNrTxtbox.Text,NationalitybTxtbox.Text,usnTxtBox.Text, passwordBox.Password);
            MainWindow.Window.DataContext = null;
            loginControl login = new loginControl();
            MainWindow.Window.ContentGrid.Children.Remove(this);
            MainWindow.Window.ContentGrid.Children.Add(login);


        }


        
    }
}
